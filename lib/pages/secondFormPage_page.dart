
import 'package:flutter/material.dart';

import 'opeFirebase.dart';

class SecondFormPage extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    //Argumentos parametros = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pagina Login')
        ),
          body: Center(
          child: Text('Bienvenido'),/* ${parametros.apellido} ${parametros.edad}'), */
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
  
}