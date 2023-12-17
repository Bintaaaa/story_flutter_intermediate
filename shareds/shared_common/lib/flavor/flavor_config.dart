class FlavorConfig {
  final FlavorType flavorType;
  final bool isPremium;

  static FlavorConfig? _instance;

  FlavorConfig({
    this.flavorType = FlavorType.free,
  }) : isPremium = flavorType == FlavorType.free ? false : true {
    _instance = this;
  }

  static FlavorConfig get instance => _instance ?? FlavorConfig();
}

enum FlavorType { free, premium }
