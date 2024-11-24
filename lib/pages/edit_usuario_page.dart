import 'package:app_firebase2/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditUsuario extends StatefulWidget {
  const EditUsuario({super.key});

  @override
  State<EditUsuario> createState() => _EditUsuarioState();
}

class _EditUsuarioState extends State<EditUsuario> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nocuentaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nombreController.text = arguments['nombre'];
    emailController.text = arguments['gmail'];
    nocuentaController.text = arguments['cuenta'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar usuario'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nocuentaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'No. cuenta',
              ),
            ),
            const SizedBox(height: 20),
           ElevatedButton(
              onPressed: () async {
                await editUsuario(arguments['uid'],
                nombreController.text,
                emailController.text,
                nocuentaController.text
              ).then(
              (_){
          Navigator.pop(context);
       }
    );
},
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
