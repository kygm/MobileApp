//var db = Db("mongodb+srv://admin:Password1@cluster.qtabs.mongodb.net/test?retryWrites=true&w=majority");

import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  //log into db
  final db = await Db.create(
      'mongodb+srv://admin:Password1@cluster.qtabs.mongodb.net/test?retryWrites=true&w=majority');
  await db.open();
  //specify collection
  final clients = db.collection('clients');
  final transactions = db.collection('transactions');
  //print(await clients.find().toList());

  const port = 1600;
  final app = Sevr();

  final corsPaths = ['/', '/:id'];
  for (var route in corsPaths) {
    app.options(route, [
      (req, res) {
        setCors(req, res);
        return res.status(200);
      }
    ]);
  }

  app.get('/', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final clientList = await clients.find().toList();
      return res.status(200).json({'client': clientList});
    }
  ]);
  app.get('/getTransacts', [
    setCors,
    (ServRequest req, ServResponse res) async{
      final transactsList = await transactions.find().toList();
      return res.status(200).json({'transaction': transactsList});
    }
  ]);

  app.post('/addClient', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await clients.save(req.body);
      print(req.body);
      return res.json(
        await clients.findOne(where.eq('phoneNumber', req.body['phoneNumber'])),
      );
    }
  ]);

  app.delete('/:phoneNumber', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await clients.remove(where.eq(
          '_phoneNumber', ObjectId.fromHexString(req.params['phoneNumber'])));
      return res.status(200); 
    }
  ]);

  // Listen for connections
  app.listen(port, callback: () {
    print('Server listening on port: $port');
  });
}

void setCors(ServRequest req, ServResponse res) {
  res.response.headers.add('Access-Control-Allow-Origin', '*');
  res.response.headers.add('Access-Control-Allow-Methods', 'GET, POST, DELETE');
  res.response.headers
      .add('Access-Control-Allow-Headers', 'Origin, Content-Type');
}
