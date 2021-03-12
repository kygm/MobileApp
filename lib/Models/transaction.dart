class Transaction {
  final String fname,
      lname,
      phoneNumber,
      transactName,
      descript,
      transactDate,
      transactTime;
  final double transactPrice, transactCost;
  final DateTime dateEntered;
  const Transaction._(
      this.fname,
      this.lname,
      this.phoneNumber,
      this.transactName,
      this.descript,
      this.transactDate,
      this.transactTime,
      this.transactPrice,
      this.transactCost,
      this.dateEntered);

  factory Transaction.fromJson(Map json) {
    final dateEntered =
        json['dateEntered'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final fname = json['fname'];
    final lname = json['lname'];
    final phoneNumber = json['lname'];
    final transactTime = json['lname'];
    final transactDate = json['lname'];
    final transactPrice = json['lname'];
    final transactCost = json['lname'];
    final descript = json['lname'];
    final transactName = json['lname'];
    return Transaction._(dateEntered, fname, lname, phoneNumber, transactName,
        transactCost, transactPrice, transactDate, transactTime, descript);
  }
}
