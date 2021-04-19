import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class OpeFirebase extends StatefulWidget {
  OpeFirebase({Key key}) : super(key: key);

  @override
  _OpeFirebaseState createState() => _OpeFirebaseState();
}

  
class _OpeFirebaseState extends State<OpeFirebase> {
  FocusNode nombreFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;

  String nombre;
  String email;
  String password;
  final firebaseInstance = FirebaseFirestore.instance;

  void agregarFirebase(){
 if (formKey.currentState.validate()) {
formKey.currentState.save();

        firebaseInstance.collection('logeo').add({
      'Nombre'      :  nombre,
      'Email'       :  email,
      'Password'    :  password
      
    });
  }
  }

 
    void buscarFirebase(){
    firebaseInstance.collection('logeo').where('Email', isEqualTo: email).snapshots().listen((res) {
        res.docs.forEach((element){
        print(element.data());
    });
    });
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
                
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Nombre',
                        hintText: 'Ejemplo: Juan',
                        prefixIcon: Icon(Icons.person)),
                    //controller: nombreTextController,
                    onSaved: (value) {
                      nombre = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                    },
                    focusNode: this.nombreFocus,
                    onEditingComplete: () =>
                      requestFocus(context, emailFocus),
                      textInputAction: TextInputAction.next,
                      
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
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                      },
                      focusNode: this.passwordFocus,
                    onEditingComplete: () =>
                      requestFocus(context, emailFocus),
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
                      password = value;
                    },
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Campo vacio';
                      }
                    }),
                     SizedBox(height: 20.0),
         ElevatedButton(
         onPressed: (){
           agregarFirebase();
         },
         child: Text('Registrar',
         style: TextStyle(fontSize: 20.0),
         )
         ),
                SizedBox(
                  height: 6.0,
                ),

                

                
                SizedBox(height: 20.0),
               /* RaisedButton(
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  onPressed: () {
                   
                      if (nombre.compareTo('angel') == 0 &&
                          email.compareTo('angel@gmail.com') == 0 &&
                          password.compareTo('jeje') == 0) {
                        Navigator.pushNamed(context, 'formulario_dos',
                            arguments: Argumentos(
                                nombre: this.nombre, email: this.email,password: this.password));
                      } else {
                        print('Datos incorrectos');
                      }
                    
                  },
                  child: Text(' login '),
                )*/
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
    nombreFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    //nombreTextController.dispose();
    //apTextController.dispose();
    nombreFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

}

class Argumentos {
  String nombre;
  String email;
  String password;

  Argumentos({this.nombre, this.email, this.password});
}