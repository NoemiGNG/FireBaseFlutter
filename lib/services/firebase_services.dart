import 'package:cloud_firestore/cloud_firestore.dart';
//Creamos la variable db, de tipo FirebaseFirestore
FirebaseFirestore db = FirebaseFirestore.instance;

//Creamos un Future, que nos traerá los registros (Documentos), almacenados en firebase (Firestore Database)
Future<List> getUsuarios () async {
//Creamos la variable usuarios de tipo List, para recibir los registros
List usuarios = [];
//Creamos una variable de tipo CollectionReference, de nombre collectionReferenceUsuarios que apunta a la collection “usuarios”
CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

queryUsuarios.docs.forEach((documento) {
   final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person ={
      "uid": documento.id,
      "nombre": data['nombre'],
      "gmail": data['gmail'],
      "cuenta": data['cuenta'],
    };
  usuarios.add(person);
});

return usuarios;
} 

Future<void> agregarUsuario(String nNombre, String nEmail, String nCuenta) async {
  //CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

  await db.collection('usuarios').add({
    'nombre': nNombre,
    'gmail': nEmail,
    'cuenta': nCuenta,
  });
}
Future<void> editUsuario(String uid, String eNombre, String eMail, String eCuenta) async {
  await db.collection('usuarios').doc(uid).set({"nombre": eNombre, "gmail": eMail, "cuenta": eCuenta});
}

Future<void> deleteUsuario(String uid) async {
  await db.collection('usuarios').doc(uid).delete();
}

