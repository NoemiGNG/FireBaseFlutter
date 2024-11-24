import 'package:app_firebase2/services/firebase_services.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('App con Firebase'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
        future: getUsuarios(), 
        builder: ((context, snapshot){
          if(snapshot.hasData == false){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: ((context, index){
              return Dismissible(
                onDismissed: (direction) async {
                  await deleteUsuario(snapshot.data?[index]['uid']);
                  snapshot.data?.removeAt(index);
                },
                confirmDismiss: (direction) async{
                   bool result = false;
                  result = await showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content: Text('¿Estás seguro de querer eliminar a ${snapshot.data?[index]['nombre']}?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context, true);
                            },
                            child: const Text('Sí'),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context, false);
                            },
                            child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      );
                    }
                  );
                  return result;
                },
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),

                key: Key(snapshot.data?[index]['uid']),
                child: ListTile(
                  onTap:  () async {
                    await Navigator.pushNamed(context, '/edit', arguments: {
                      'uid': snapshot.data?[index]['uid'],
                      'nombre': snapshot.data?[index]['nombre'],
                      'gmail': snapshot.data?[index]['gmail'],
                      'cuenta': snapshot.data?[index]['cuenta'],
                    });
                     setState(() {});
                  },
                  title: Text(snapshot.data?[index]['nombre']),
                  subtitle: Text(snapshot.data?[index]['cuenta']),
                  leading: CircleAvatar(
                    child: Text(snapshot.data?[index]['nombre'].substring(0, 1)),
                  ),
                ),
              );
            })
          );
          }
        })
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}