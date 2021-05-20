import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';

class PizzaDetail extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;
  PizzaDetail(this.pizza, this.isNew);
  @override
  _PizzaDetailState createState() => _PizzaDetailState();
}

class _PizzaDetailState extends State<PizzaDetail> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String postResult = '';

  @override
  void initState() {
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pizza Detail'),
        ),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  postResult,
                  style: TextStyle(
                      backgroundColor: Colors.green[200], color: Colors.black),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtId,
                  decoration: InputDecoration(hintText: 'Insert ID'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(hintText: 'Insert Pizza Name'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: 'Insert Description'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtPrice,
                  decoration: InputDecoration(hintText: 'Insert Price'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtImageUrl,
                  decoration: InputDecoration(hintText: 'Insert Image Url'),
                ),
                SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                    child: Text('Send Post'),
                    onPressed: () {
                      savePizza();
                    })
              ]),
            )));
  }

  Future savePizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text);
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text);
    pizza.imageUrl = txtImageUrl.text;
   String result = '';
    if (widget.isNew) {
      result = await helper.postPizza(pizza);
    } else {
      result = await helper.putPizza(pizza);
    }
    setState(() {
      postResult = result;
    });
    return result;
  }


}
