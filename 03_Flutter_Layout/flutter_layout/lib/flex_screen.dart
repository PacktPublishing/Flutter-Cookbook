import 'package:flutter/material.dart';

class FlexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible and Expanded'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ..._header(context, 'Expanded'),
          _buildExpanded(context),
          ..._header(context, 'Flexible'),
          _buildFlexible(context),
          Expanded(
            child: Container(),
          ),
          _buildFooter(context)
        ],
      ),
    );
  }

  Iterable<Widget> _header(BuildContext context, String text) {
    return [
      SizedBox(height: 20),
      Text(
        text,
        style: Theme.of(context).textTheme.headline,
      ),
    ];
  }

  Widget _buildExpanded(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          LabeledContainer(
            width: 100,
            height: double.infinity,
            color: Colors.green,
            text: '100',
          ),
          Expanded(
            child: LabeledContainer(
              color: Colors.purple,
              text: 'The Remainder',
              textColor: Colors.white,
            ),
          ),
          LabeledContainer(
            width: 40,
            height: double.infinity,
            color: Colors.green,
            text: '40',
          )
        ],
      ),
    );
  }

  Widget _buildFlexible(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.orange,
              text: '25%',
            ),
          ),
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.deepOrange,
              text: '25%',
            ),
          ),
          Flexible(
            flex: 2,
            child: LabeledContainer(
              color: Colors.blue,
              text: '50%',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30,
            ),
            child: Text(
              'Pinned to the Bottom',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
      ),
    );
  }
}

class LabeledContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;
  final Color textColor;

  const LabeledContainer({
    Key key,
    this.width,
    this.height = double.infinity,
    this.color,
    @required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
