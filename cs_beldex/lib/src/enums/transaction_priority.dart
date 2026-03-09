enum TransactionPriority {
  normal(0),
  flash(5);

  const TransactionPriority(this.value);
  final int value;
}
