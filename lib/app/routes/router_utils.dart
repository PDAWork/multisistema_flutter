enum Pages {
  singIn,
  info,
  splashScreen,
  home,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.singIn => "/",
      Pages.info => "/information",
      Pages.splashScreen => "/splash_screen",
      Pages.home => "/home",
      Pages.error => "/error",
      _ => "/"
    };
  }

  String get screenName {
    return switch (this) {
      Pages.singIn => "SINGIN",
      Pages.info => "INFORMATION",
      Pages.splashScreen => "SPLASHSCREEN",
      Pages.home => "HOME",
      Pages.error => "ERROR",
      _ => "HOME"
    };
  }

  // TODO
  String get screenTitle {
    return switch (this) {
      Pages.singIn => "Login",
      Pages.home => "Home",
      Pages.error => "Error",
      _ => "Home",
    };
  }
}
