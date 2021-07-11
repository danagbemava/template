abstract class BaseConfig {
  String get baseUrl => '';
}

class ProdConfig extends BaseConfig {
  @override
  String get baseUrl => 'prodUrl';
}

class DevConfig extends BaseConfig {
  @override
  String get baseUrl => 'devConfig';
}

BaseConfig getConfig() {
  final mode = String.fromEnvironment('mode', defaultValue: 'dev');

  if (mode == 'dev') {
    return DevConfig();
  }

  return ProdConfig();
}
