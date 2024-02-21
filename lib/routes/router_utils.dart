enum Pages {
  singIn,
  info,
  splashScreen,
  homeUser,
  pay,
  tariff,
  tariffObject,
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
      Pages.pay => 'pay',
      Pages.tariff => 'tariff/:objectId',
      Pages.tariffObject => 'object_tariff',
      Pages.homeMaster => '/home_master',
      // TODO: Handle this case.
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
      Pages.pay => "PAY",
      Pages.tariff => 'TARIFF',
      Pages.tariffObject => 'OBJECTTARIFF',
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
