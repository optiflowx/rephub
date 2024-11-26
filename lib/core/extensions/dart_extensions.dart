
extension DartExtensions<T> on Iterable<T> {
  Iterable<T> whereNotNull() {
    return where((element) => element != null);
  }

  Iterable<R> mapNotNull<R>(R Function(T) f) {
    return map(f).whereNotNull();
  }

  Iterable<T> whereNot(bool Function(T) test) {
    return where((element) => !test(element));
  }

  Iterable<T> separatedBy(T separator) sync* {
    final iterator = this.iterator;

    if (!iterator.moveNext()) return;

    yield iterator.current;

    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }

  Iterable<T> separatedByWidget(T separator) {
    return fold(<T>[], (prevData, element) {
      if (prevData.isEmpty) {
        return [element];
      } else {
        return [...prevData, separator, element];
      }
    });
  }
}
