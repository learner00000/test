const rootRoute = "/";

const homeScreenDisplayName = "Home";
const homeScreenRoute = "/home";

const adminsScreenDisplayName = "Admins";
const adminsScreenRoute = "/admins";

const usersScreenDisplayName = "users";
const usersScreenRoute = "/users";

const authenticationScreenDisplayName = "Log out";
const authenticationScreenRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(homeScreenDisplayName, homeScreenRoute),
  MenuItem(adminsScreenDisplayName, adminsScreenRoute),
  MenuItem(usersScreenDisplayName, usersScreenRoute),
  MenuItem(authenticationScreenDisplayName, authenticationScreenRoute),
];
