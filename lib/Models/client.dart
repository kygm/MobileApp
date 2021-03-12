class Client {
  final String fname,
      lname,
      city,
      state,
      address,
      phoneNumber,
      descript,
      dateEntered;

  const Client._(this.fname, this.lname, this.city, this.state, this.address,
      this.phoneNumber, this.descript, this.dateEntered);

  factory Client.fromJson(Map json) {
    final phoneNumber = json['_phoneNumber']
        .replaceAll('ObjectId(\"', '')
        .replaceAll('\")', '');
    final fname = json['fname'];
    final lname = json['lname'];
    final city = json['city'];
    final state = json['state'];
    final address = json['address'];
    final descript = json['descript'];
    final dateEntered = json['dateEntered'];
    return Client._(
        phoneNumber, fname, lname, city, state, address, descript, dateEntered);
  }
}
