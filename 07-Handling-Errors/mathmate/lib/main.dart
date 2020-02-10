import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MathMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MathApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class MathApp extends StatefulWidget {
  MathApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MathAppState createState() => _MathAppState();
}

enum Operation { add, subtract, multiply, divide }

class _MathAppState extends State<MathApp> {
  var operation = Operation.add;
  final operationSelections = [true, false, false, false];
  final controllerA = TextEditingController();
  final controllerB = TextEditingController();

  num result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        heightFactor: 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter some numbers'),
            buildEquation(),
            if (result != null)
              Text(
                result.toString(),
                style: Theme.of(context).textTheme.title,
              ),
            SizedBox(height: 10),
            Text('Choose mathematic operation'),
            buildOperationToggle(),
          ],
        ),
      ),
    );
  }

  Widget buildEquation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildNumberField(controllerA),
        textForOperation(operation),
        _buildNumberField(controllerB),
        RaisedButton(
          onPressed: solveEquation,
          child: Text('='),
        )
      ],
    );
  }

  Widget _buildNumberField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 20,
          child: TextField(
            controller: controller,
          )),
    );
  }

  Widget buildOperationToggle() {
    return ToggleButtons(
      children: [
        for (Operation operation in Operation.values)
          textForOperation(operation)
      ],
      isSelected: operationSelections,
      onPressed: (index) {
        setState(() {
          operationSelections[operation.index] = false;
          final updated = Operation.values[index];
          operationSelections[index] = true;
          operation = updated;
        });
      },
    );
  }

  Widget textForOperation(Operation operation) {
    switch (operation) {
      case Operation.add:
        return Text('+');
      case Operation.subtract:
        return Text('-');
      case Operation.multiply:
        return Text('×');
      case Operation.divide:
        return Text('÷');
    }

    // Will never get here
    return null;
  }

  void solveEquation() {
    FocusScope.of(context).requestFocus(FocusNode());

    final a = int.parse(controllerA.text);
    final b = int.parse(controllerB.text);

    num result;

    switch (operation) {
      case Operation.add:
        result = a + b;
        break;
      case Operation.subtract:
        result = a - b;
        break;
      case Operation.multiply:
        result = a * b;
        break;
      case Operation.divide:
        result = a / b;
        break;
    }

    setState(() {
      this.result = result;
      controllerA.clear();
      controllerB.clear();
    });
  }

  @override
  void dispose() {
    controllerA.dispose();
    controllerB.dispose();
    super.dispose();
  }
}
