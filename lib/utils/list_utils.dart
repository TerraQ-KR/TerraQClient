extension ListUtils<E> on List<E> {
  // prevent the out of range error
  E? safe(int value) => value < length ? this[value] : null;
}
