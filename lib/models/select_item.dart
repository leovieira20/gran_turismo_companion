class SelectItem<T> {
  String label;
  T value;

  SelectItem(this.label, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SelectItem && runtimeType == other.runtimeType && label == other.label && value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}