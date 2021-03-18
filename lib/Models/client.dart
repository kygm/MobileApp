class Client {
  final String phoneNumber,
      id,
      fname,
      lname,
      city,
      state,
      address,
      descript,
      dateEntered;

  Client._(this.phoneNumber, this.id, this.fname, this.lname, this.city, this.state,
      this.address, this.descript, this.dateEntered);

  factory Client.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
        final phoneNumber = json['phoneNumber'];
    final fname = json['fname'];
    final lname = json['lname'];
    final city = json['city'];
    final state = json['state'];
    final address = json['address'];
    final descript = json['descript'];
    final dateEntered = json['dateEntered'];
    //print(Client);
    //print(Client);
    return Client._(
        phoneNumber, id, fname, lname, city, state, address, descript, dateEntered);
  }
}
