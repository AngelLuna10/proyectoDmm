import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class OpFirebase extends StatefulWidget {
  OpFirebase({Key key}) : super(key: key);

  @override
  _OpFirebaseState createState() => _OpFirebaseState();
}

  
class _OpFirebaseState extends State<OpFirebase> {
  final firebaseInstance = FirebaseFirestore.instance;

  void agregarFirebase(){
    firebaseInstance.collection('personas').add({
      'Nombre'  :  'Angel',
      'Edad'    :   '20',
      'Pais'    :   'México',
      'Activo'  :   true
    });
  }

    void agregarIdFirebase(){
    firebaseInstance.collection('personas').doc('id_personalizado').set({
      'Nombre'  :  'Luis',
      'Edad'    :   '20',
      'Pais'    :   'México',
      'Activo'  :   false
    });
  }

    void actualizarFirebase(){
    firebaseInstance.collection('personas').doc('id_personalizado').update({
      'Nombre'  :  'Fernando',

      'Activo'  :   true
    });
  }

     void listarFirebase(){
    firebaseInstance.collection('personas').get().then((resultado){
      resultado.docs.forEach((element) {
        print(element.data());
      });
    });
  }

   void leerPersonalizadoFirebase(){
    firebaseInstance.collection('personas').doc('Id_personalizado').get().then((value){
        print(value.data());
    });
  }

    void buscarFirebase(){
    firebaseInstance.collection('personas').where('Pais', isEqualTo: 'México').snapshots().listen((res) {
        res.docs.forEach((element){
        print(element.data());
    });
    });
  }

  void eliminarFirebase(){
    //firebaseInstance.collection('personas').where('Nombre', isEqualTo: 'Fernando').snapshots()

  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Operaciones en Firestore'),
     ),
     body: Center(
       child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         ElevatedButton(
         onPressed: (){
           agregarFirebase();
         },
         child: Text('Agregar',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           agregarIdFirebase();
         },
         child: Text('Id Personalizado',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           actualizarFirebase();
         },
         child: Text('Actualizar',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           listarFirebase();
         },
         child: Text('Listar',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           leerPersonalizadoFirebase();
         },
         child: Text('Leer Personalizado',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           buscarFirebase();
         },
         child: Text('Buscar',
         style: TextStyle(fontSize: 20.0),
         )
         ),
         SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           eliminarFirebase();
         },
         child: Text('Eliminar',
         style: TextStyle(fontSize: 20.0),
         )
         )
       ],
     )
     ),
   );
  }

}

