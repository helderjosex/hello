import 'package:flutter/material.dart';
import 'package:hello/pages/hello_listview.page.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dog.nome,
        ),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
