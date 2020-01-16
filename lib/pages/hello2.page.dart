import 'package:flutter/material.dart';
import 'package:hello/widgets/button.widget.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Page 2",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: ButtonWidget(
        "Voltar",
        () => _onClickVoltar(context),
        color: Colors.red,
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Tela 2');
  }
}
