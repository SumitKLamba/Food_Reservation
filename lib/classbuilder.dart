import 'dashboard.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<Dashboard>(() => Dashboard());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}