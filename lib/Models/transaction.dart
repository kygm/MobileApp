class Transaction {
  final String id;
  final String name;
  final String initials;

  const Transaction._(this.id, this.name, this.initials);

  factory Transaction.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final name = json['name'];
    final names = name.split(' ');
    final initials = names[0].substring(0, 1) + names[1].substring(0, 1);
    return Transaction._(id, name, initials);
  }
}
