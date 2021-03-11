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
  //print(await clients.find().toList());

  const port = 8081;
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
      final contacts = await clients.find().toList();
      return res.status(200).json({'contacts': contacts});
    }
  ]);

  app.post('/', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await clients.save(req.body);
      return res.json(
        await clients.findOne(where.eq('fname', req.body['name'])),
      );
    }
  ]);

  app.delete('/:id', [
    setCors,
    (ServRequest req, ServResponse res) async {
      await clients
          .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
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
