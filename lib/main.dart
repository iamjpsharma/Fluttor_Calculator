import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculater',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
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

  String output = "0";
  String _output ="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonpressed(String buttonText){
    print(buttonText);

    if(buttonText == "CLEAR"){
      output = "0";
      _output ="0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    }else if(buttonText =="+"||buttonText =="-"||buttonText =="/"||buttonText =="X"){

      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";


    }else if(buttonText.contains(".")){
      if(_output.contains(".")){
        print("Already contains a decimals");
      }else{
        _output = _output+buttonText;
      }
    } else if(buttonText =="="){
      num2 = double.parse(output);

      if(operand =="+"){
        _output = (num1+num2).toString();
      }

      if(operand =="-"){
        _output = (num1-num2).toString();
      }

      if(operand =="/"){
        _output = (num1/num2).toString();
      }

      if(operand =="X"){
        _output = (num1*num2).toString();
      }


      operand ="";
      num1 = 0.0;
      num2 = 0.0;
    } else{
      _output = _output+buttonText;
    }
    print(_output);
    setState(() {
      output  = double.parse(_output).toStringAsFixed(2);
    });
  }


  Widget buildButtons(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          //  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {
          buttonpressed(buttonText),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[
              new Container(
                child: new Text(output,
                  style: new TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                ),
                padding: new EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0
                ),
                alignment: Alignment.centerRight,
              ),
              new Expanded(child: new Divider()),
              new Column(
                children: [
                  new Row(
                    children: [
                      buildButtons("7"),
                      buildButtons("8"),
                      buildButtons("9"),
                      buildButtons("/"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButtons("4"),
                      buildButtons("5"),
                      buildButtons("6"),
                      buildButtons("X"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButtons("1"),
                      buildButtons("2"),
                      buildButtons("3"),
                      buildButtons("-"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButtons("."),
                      buildButtons("0"),
                      buildButtons("00"),
                      buildButtons("+"),
                    ],
                  ),
                  new Row(
                    children: [
                      buildButtons("CLEAR"),
                      buildButtons("="),
                    ],
                  )
                ],
              )
            ])));
  }
}
