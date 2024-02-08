enum Pages {
  singIn,
  info,
  splashScreen,
  homeUser,
  error,
  homeMaster,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.singIn => "/",
      Pages.info => "/information",
      Pages.splashScreen => "/splash_screen",
      Pages.homeUser => "/home_user",
      Pages.error => "/error",
      // TODO: Handle this case.
      Pages.homeMaster => '/home_master',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.singIn => "SINGIN",
      Pages.info => "INFORMATION",
      Pages.splashScreen => "SPLASHSCREEN",
      Pages.homeUser => "HOMEUSER",
      Pages.error => "ERROR",
      Pages.homeMaster => "HOMEMASTER",
    };
  }

  // TODO
  String get screenTitle {
    return switch (this) {
      Pages.singIn => "Login",
      Pages.homeUser => "Home",
      Pages.error => "Error",
      _ => "Home",
    };
  }
}
