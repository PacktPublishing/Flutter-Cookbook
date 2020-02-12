import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MathMate',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MathApp(title: 'Math Mate'),
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
            keyboardType: TextInputType.number,
            inputFormatters: [NumberFormatter()],
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

    int a, b;
    try {
      a = int.parse(controllerA.text);
      b = int.parse(controllerB.text);
    } catch (e) {
      showMessage('Please enter a valid number');
      return;
    }

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

  void showMessage(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

class NumberFormatter implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      final _ = int.parse(newValue.text);
      return newValue;
    } catch (e) {
      return oldValue;
    }
  }
}
