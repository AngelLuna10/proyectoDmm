import 'package:flutter/material.dart';
import 'package:pruebafirebase/pages/lojin.dart';
import 'package:pruebafirebase/pages/secondFormPage_page.dart';

import 'opeFirebase.dart';

class Logeo extends StatefulWidget {
const Logeo({Key key}) : super(key: key);

  @override
  _logeoState createState() => _logeoState();
}

class _logeoState extends State<Logeo> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(color: Colors.black38),
      child: Scaffold(
        appBar: AppBar(
          title: Text('LUAN'),
          backgroundColor: Colors.black,
          ),
        body: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Container(
                      width: 150.0,
                      height: 150.0,
                      child: Center(
                        child: Image.network(
                            'https://cdn6.f-cdn.com/contestentries/1463854/24749862/5c35de6584dc8_thumb900.jpg'),
                      ),
                    ),
                      SizedBox(
                  height: 6.0,
                ),
                         SizedBox(
                  height: 6.0,
                ),
                         SizedBox(
                  height: 6.0,
                ),
                RaisedButton(
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Lojin()),
                  );
                },
    

                  child: Text('Login'),
                  ),
                    SizedBox(
                  height: 6.0,
                ),
                         SizedBox(
                  height: 6.0,
                ),
                         SizedBox(
                  height: 6.0,
                ),                
                 RaisedButton(
                  color: Colors.blue.shade800,
                  textColor: Colors.white,
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpeFirebase()),
                  );
                },

                    

                  child: Text('Sign in'),),     
              ]
            )),
        ),
      ),
    );
  }
}


