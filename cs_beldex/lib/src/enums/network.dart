enum Network {
    mainnet(0),
    testnet(1),
    devnet(2);

    final int value;
    const Network(this.value);
}