import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerJudul = new TextEditingController();
  TextEditingController controllerIsi = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = Uri.parse('http://10.0.2.2/flutter_note/adddata.php');

    http.post(url, body: {
      "JUDUL": controllerJudul.text,
      "ISI": controllerIsi.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: controllerJudul,
                      decoration: new InputDecoration(
                          hintText: "Judul",
                          labelText: "Judul",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      maxLines: 20,
                      controller: controllerIsi,
                      decoration: new InputDecoration(
                          fillColor: Colors.white, filled: true),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  // ignore: deprecated_member_use
                  new RaisedButton(
                    child: new Text("ADD DATA"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      addData();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
