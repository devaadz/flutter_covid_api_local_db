import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse('http://10.0.2.2/flutter_note/deleteData.php');
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['judul']}'"),
      actions: <Widget>[
        // ignore: deprecated_member_use
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Note(),
            ));
          },
        ),
        // ignore: deprecated_member_use
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("${widget.list[widget.index]['judul']}")),
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: 900.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: ListView(
              children: [
                new Column(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    new Text(
                      widget.list[widget.index]['judul'],
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Text(
                      widget.list[widget.index]['isi'],
                      style: new TextStyle(fontSize: 18.0),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ignore: deprecated_member_use
                        new RaisedButton(
                          child: new Text("DELETE"),
                          color: Colors.red,
                          onPressed: () => confirm(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
