import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nomeProdutoController = TextEditingController();
  final valorProdutoController = TextEditingController();
  final nomePessoaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome produto', icon: Icon(Icons.backpack)),
              controller: nomeProdutoController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Valor produto', icon: Icon(Icons.attach_money)),
              controller: valorProdutoController,
            ),
            ElevatedButton(
                onPressed: (){
                  FirebaseFirestore.instance.collection("products").add({
                    'name': nomeProdutoController.text,
                    'value': valorProdutoController.text
                  });
                },
                child: const Text(
                  'Criar produto',
                  style: TextStyle(fontSize: 18),
                ),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome pessoa', icon: Icon(Icons.person)),
              controller: nomePessoaController,
            ),
            ElevatedButton(
              onPressed: (){
                FirebaseFirestore.instance.collection("person").add({
                  'name': nomePessoaController.text
                });
              },
              child: const Text(
                'Cadastrar pessoa',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
    // Column is also a layout widget. It takes a list of children and
  }
}
