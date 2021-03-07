
  //var db = Db("mongodb+srv://admin:Password1@cluster.qtabs.mongodb.net/test?retryWrites=true&w=majority");

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
class DBConnection {


  final String _conString = "mongodb+srv://admin:Password1@cluster.qtabs.mongodb.net/test?retryWrites=true&w=majority";
  
  void main() async
  {
    var db = await Db.create(_conString);
    await db.open();

    var coll = db.collection('clients');
    //await coll.find(where.lt("age", 18)).toList();
  }

}
