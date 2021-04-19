import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pruebafirebase/pages/secondFormPage_page.dart';

class Lojin extends StatefulWidget {
  Lojin({Key key}) : super(key: key);

  @override
  _Lojin createState() => _Lojin();
}

  
class _Lojin extends State<Lojin> {
  
  FocusNode emaillogFocus;
  FocusNode passwordlogFocus;

  String emaillog;
  String passwordlog;
  

 
        void buscarFirebase(){
        if (formKey.currentState.validate()) {
        formKey.currentState.save();

    final firebaseInstance = FirebaseFirestore.instance;
    firebaseInstance
        .collection('Usuarios')
        .where('usuario', isEqualTo: emaillog)
        .where('password', isEqualTo: passwordlog)
        .snapshots()
        .listen((result) {
      result.docs.forEach((doc) {
        print('estos son los datos:');
        print(doc.data());
      }
      );
    },
    );
        }
        

    print('Estos son los datos del Usuario: ');

   if (emaillog.compareTo(emaillog) == 0 &&
                          passwordlog.compareTo(passwordlog) == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondFormPage()),
                            );
                      } else {
                        print('Datos incorrectos');
                      }
    return;
  }
  
        

final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('LUAN Registrar'),
       backgroundColor: Colors.black,
     ),
     body: SingleChildScrollView(
       
       child: Padding(
         padding: const EdgeInsets.all(25.0),
         child: Form(
          key: formKey,
          child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
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
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'email',
                        hintText: 'Ejemplo@example.com',
                        prefixIcon: Icon(Icons.mail)),
                    //controller: apTextController,
                    onSaved: (value) {
                      emaillog = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                      },
                      focusNode: this.passwordlogFocus,
                    onEditingComplete: () =>
                      requestFocus(context, emaillogFocus),
                      textInputAction: TextInputAction.next,
                    ),
                            
                SizedBox(
                  height: 6.0,
                ),
               
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Ejemplo: ***',
                        prefixIcon: Icon(Icons.lock)),
                    //controller: apTextController,
                    onSaved: (value) {
                      passwordlog = value;
                    },
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                    }),
                     SizedBox(height: 20.0),
       /*  ElevatedButton(
         onPressed: (){
           buscarFirebase();
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondFormPage()),
                  );
         },
         child: Text('Login',
         style: TextStyle(fontSize: 20.0),
         )
         ),*/
         SizedBox(height: 20.0),
       
            
                /*RaisedButton(
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  onPressed: () {
                     buscarFirebase();
                      if (emaillog.compareTo(emaillog) == 0 /*&&
                          password.compareTo('jeje') == 0*/) {
                             Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondFormPage()),
                  );
                            /*
                        Navigator.pushNamed(context, SecondFormPage(),
                            arguments: Argumentos(
                                email: this.email/*,password: this.password*/));*/
                      } else {
                        print('Datos incorrectos');
                      }
                    
                  },
                  child: Text(' login '),
                )*/
                RaisedButton(
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      if (emaillog.compareTo('angel@gmail.com') == 0 &&
                          passwordlog.compareTo('Luna') == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondFormPage()),
                            );
                      } else {
                        print('Datos incorrectos');
                      }
                    }
                  },
                  child: Text(' Iniciar '),
                )
              ],
        


        /* ElevatedButton(
         onPressed: (){
           agregarFirebase();
         },
         child: Text('Agregar',
         style: TextStyle(fontSize: 20.0),
         )
         ),*/


/*
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
         )*/
       
     )
     ),
   ),
   ),
   floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
   ));
  }
  void requestFocus(BuildContext context,FocusNode focusNode){
    FocusScope.of(context).requestFocus();
  }

  @override
  void initState() {
    super.initState();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
    
    emaillogFocus = FocusNode();
    passwordlogFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    //nombreTextController.dispose();
    //apTextController.dispose();
    emaillogFocus.dispose();
    passwordlogFocus.dispose();
  }

}


class Argumentos{
  String emaillog;
  String passwordlog;

  Argumentos({this.emaillog, this.passwordlog});
}