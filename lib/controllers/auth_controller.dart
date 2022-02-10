import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'dart:async';
import 'package:universal_platform/universal_platform.dart';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_exception.dart';


class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static AuthController instance = Get.find();
  // Rx<dynamic>? authMode = AuthMode.Login.obs;
  RxBool? isLoading = false.obs;
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _authTimer;
  final _isAuth = false.obs;

  // AnimationController? controller;
  // Animation<Offset>? slideAnimation;
  // Animation<double>? opacityAnimation;
  // late TextEditingController passwordController;
  // final key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // _autoLogin();
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(
    //     milliseconds: 300,
    //   ),
    // );
    // slideAnimation = Tween<Offset>(
    //   begin: const Offset(0, -1.5),
    //   end: const Offset(0, 0),
    // ).animate(
    //   CurvedAnimation(
    //     parent: controller as Animation<double>,
    //     curve: Curves.fastOutSlowIn,
    //   ),
    // );
    // opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: controller as Animation<double>,
    //     curve: Curves.easeIn,
    //   ),
    // );

    // _heightAnimation.addListener(() => setState(() {}));

    // passwordController = TextEditingController();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   // passwordController.dispose();
  // }

  bool get isAuth {
    _isAuth.value = token != null;
    return _isAuth.value;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String? get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {

    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';
    final url = Uri.parse('http://$host:8000/api/$urlSegment');
 
    try {
      final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            'email': email,
            'password': password,

            //'returnSecureToken': true,
          },
        ),
      );
   
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      } else {
        _token = responseData['idToken'];
        _userId = responseData['id'];
        _expiryDate = DateTime.now().add(
          Duration(
            microseconds: responseData['expiresIn'],
          ),
        );
        _isAuth.value = true;

      }
      _autoLogout();
      // update();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);

    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signup');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'login');
  }

  Future<bool> _autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    } else {
      _isAuth.value = true;
    }
    final Map<String, Object> extractedUserData = Map<String, Object>.from(
        json.decode(prefs.getString('userData') as String));
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String;
    _expiryDate = expiryDate;
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
