enum Environment { staging, prod, qa, dev }

class AppConfig {
  static Environment environment = Environment.staging; // Change this as needed

  static String get baseUrl {
    switch (environment) {
      case Environment.staging:
        return 'https://staging.backend.live/';
      case Environment.prod:
        return 'https://api..sa/';
      case Environment.qa:
        return 'https://qa.backend.live/';
      case Environment.dev:
        return 'https://dev.backend.live/';
    }
  }

  static String get baseFrontendUrl {
    switch (environment) {
      case Environment.staging:
        return 'https://staging.frontend.live/';
      case Environment.prod:
        return 'https://shefa.sa/';
      case Environment.qa:
        return 'https://qa.frontend.live/';
      case Environment.dev:
        return 'https://dev.frontend.live/';
    }
  }

  static String get keyClockBaseUrl {
    switch (environment) {
      case Environment.staging:
        return 'https://staging.keycloak.shefa.live/';
      case Environment.prod:
        return 'https://keycloak.shefa.sa/';
      case Environment.qa:
        return 'https://qa.keycloak.shefa.live/';
      case Environment.dev:
        return 'https://dev.keycloak.shefa.live/';

    }
  }

}
