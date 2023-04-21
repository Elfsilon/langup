class EnvironmentNames {
  static const dev = "dev";
  static const prod = "prod";
}

class Environment {
  static const flavor = String.fromEnvironment(
    "APP_FLAVOR",
    defaultValue: EnvironmentNames.dev,
  );

  static bool get isDev => flavor == EnvironmentNames.dev;
  static bool get isProd => flavor == EnvironmentNames.prod;
}
