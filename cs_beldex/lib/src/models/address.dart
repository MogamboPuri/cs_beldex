/// Represents an address within a specific account and subaddress index.
///
/// In Beldex, each account can have multiple subaddresses, and
/// each subaddress is identified by an index. This class encapsulates the
/// information necessary to identify a unique Beldex address.
class Address {
  /// Creates an [Address] with the given Beldex [value],
  /// [account] index, and [index] within the account. NOTE: No validation
  /// beyond negative [account] or [index] values occurs here!
  ///
  /// [value] is the actual Beldex address string.
  /// [account] is the account index in the Beldex wallet where
  /// this address resides.
  /// [index] is the subaddress index within the specified account.
  Address({
    required this.value,
    required this.account,
    required this.index,
  }) : assert(!account.isNegative && !index.isNegative);

  /// The actual Beldex address string.
  final String value;

  /// The account index in the Beldex wallet where this address is
  /// located.
  final int account;

  /// The subaddress index within the specified account.
  final int index;

  @override
  String toString() {
    return "Address { value: $value, account: $account, index: $index }";
  }
}
