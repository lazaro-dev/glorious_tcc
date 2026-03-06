class ModelRegistry {
  static final Map<Type, Function> _factories = {};

  static void register<T>(T Function(Map<String, dynamic>) factory) {
    _factories[T] = factory;
  }

  static T create<T>(Map<String, dynamic> json) {
    final factory = _factories[T];

    if (factory == null) {
      throw Exception('Factory não registrada para $T');
    }

    return factory(json) as T;
  }
}
