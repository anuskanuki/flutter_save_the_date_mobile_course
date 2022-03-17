import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
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
      home: MyHomePage(title: 'Trabalho 3 - Grupo 3'),
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
  File _image;
  final picker = ImagePicker();

  getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    updateSelectedImage(pickedFile);
  }

  useCamera() async {
    print("usecamera");
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    saveImageIntoGallery(pickedFile);
    updateSelectedImage(pickedFile);
  }

  saveImageIntoGallery(pickedFile) {
    // TODO teste
  }

  updateSelectedImage(pickedFile) {
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Nenhuma imagem selecionada.');
      }
    });
  }

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
            _image == null
                ? Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  )
                : Expanded(
                    flex: 1,
                    child: Image.file(_image),
                  ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: RaisedButton(
                        child: Text("Abrir câmera"),
                        onPressed: useCamera,
                      )),
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: RaisedButton(
                        onPressed: () async {
                          await getImage();
                        },
                        child: Text("Acessar galeria"),
                      )),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
