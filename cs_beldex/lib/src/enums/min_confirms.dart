enum MinConfirms {
    beldex(10),
    other(0);

    final int value;
    const MinConfirms(this.value);
}