<p align="center">
  <a href="https://pub.dev/packages/cs_beldex">
    <img src="https://img.shields.io/pub/v/cs_beldex?label=pub.dev&labelColor=333940&logo=dart">
  </a>
  <a href="https://github.com/invertase/melos">
    <img src="https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square">
  </a>
</p>

# About
- A simplified Flutter/Dart Beldex wallet library.
- Uses https://github.com/MogamboPuri/monero_c/ for the compiled native libs.
- If you do not trust the binaries hosted on https://pub.dev you can build from
  source. Refer to [`cs_beldex/README.md`](https://github.com/MogamboPuri/cs_beldex/tree/main/cs_beldex/README.md).

## Quickstart
1. Add to pubspec.yaml
    ```yaml
    dependencies:
      cs_beldex: 1.0.0
      cs_beldex_flutter_libs: 1.0.0 # Contains native libs required by cs_beldex.
    ```
2. Create a wallet
   ```dart
   final wallet = await BeldexWallet.create(
     path: "somePath", // Path to wallet files will be saved,
     password: "SomeSecurePassword", // Your wallet files are only as secure as this password.  This cannot be recovered if lost!
     language: "English", // Seed language.
     seedType: BeldexSeedType.sixteen, // 16 word polyseed or BeldexSeedType.twentyFive for legacy seed format.
     networkType: 0, // Mainnet.
   );

    // Init a connection
    await wallet.connect(
      daemonAddress: "daemonAddress",
      trusted: true,
    );
    
    // get main wallet address for account 0
    final address = wallet.getAddress();
    
    // create a tx
    final pendingTx = await wallet.createTx(
      output: Recipient(
        address: "address",
        amount: BigInt.from(100000000),
      ),
      priority: TransactionPriority.normal,
      accountIndex: 0,
    );
    
    // broadcast/commit tx to network
    await wallet.commitTx(pendingTx);
   ```

## Known Limitations
- No iOS simulator support
- No Android i686 support