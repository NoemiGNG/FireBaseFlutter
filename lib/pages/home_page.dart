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
              return ListTile(
                title: Text(snapshot.data?[index]['nombre']),
                subtitle: Text(snapshot.data?[index]['cuenta']),
                leading: CircleAvatar(
                  child: Text(snapshot.data?[index]['nombre'].substring(0, 1)),
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