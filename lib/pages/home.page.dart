import 'package:flutter/material.dart';
import 'package:hello/pages/hello2.page.dart';
import 'package:hello/pages/hello3.page.dart';
import 'package:hello/pages/hello_listview.page.dart';
import 'package:hello/utils/nav.dart';
import 'package:hello/widgets/button.widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello/widgets/drawer_list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Tab 1",
              ),
              Tab(
                text: "Tab 2",
              ),
              Tab(
                text: "Tab 3",
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 20,
      ),
      // margin: EdgeInsets.all(20),
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(45.0),
          topRight: const Radius.circular(45.0),
        ),
        child: PageView(
          children: <Widget>[
            _img(
              "assets/images/dog1.png",
            ),
            _img(
              "assets/images/dog2.png",
            ),
            _img(
              "assets/images/dog3.png",
            ),
            _img(
              "assets/images/dog4.png",
            ),
            _img(
              "assets/images/dog5.png",
            ),
          ],
        ),
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonWidget(
                  "ListView",
                  () => _onClickNavigator(context, HelloListView()),
                ),
                ButtonWidget(
                  "Page 2",
                  () => _onClickNavigator(context, HelloPage2()),
                ),
                ButtonWidget(
                  "Page 3",
                  () => _onClickNavigator(context, HelloPage3()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonWidget(
                  "Snack",
                  () => _onClickSnack(context),
                ),
                ButtonWidget(
                  "Dialog",
                  () => _onClickDialog(context),
                ),
                ButtonWidget(
                  "Toast",
                  () => _onClickToast(),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false, // Bloquear menu voltar android
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK !!!");
                  },
                ),
              ],
            ),
          );
        });
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "OK",
        onPressed: () {
          print("OK!");
        },
      ),
    ));
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg: "Flutter é muito legal",
      toastLength: Toast.LENGTH_SHORT, // tempo exbicao android
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 3, // tempo exbicao ios
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }
}
