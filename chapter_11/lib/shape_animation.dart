import 'package:flutter/material.dart';

class ShapeAnimation extends StatefulWidget {
  @override
  _ShapeAnimationState createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double posTop = 0;
  double posLeft = 0;
  Animation<double> animationTop;
  Animation<double> animationLeft;
  double maxTop = 0;
  double maxLeft = 0;
  final int ballSize = 100;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    // animationLeft = Tween<double>(begin: 0, end: 200).animate(controller);
    // animationTop = Tween<double>(begin: 0, end: 400).animate(controller)
    //   ..addListener(() {
    //     moveBall();
    //   });

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    animation
      ..addListener(() {
        moveBall();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation Controller'),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       controller.reset();
          //       controller.forward();
          //     },
          //     icon: Icon(Icons.run_circle),
          //   )
          // ],
        ),
        body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            maxLeft = constraints.maxWidth - ballSize;
            maxTop = constraints.maxHeight - ballSize;
            return Stack(children: [
              AnimatedBuilder(
                  animation: controller,
                  child: Positioned(left: posLeft, top: posTop, child: Ball()),
                  builder: (BuildContext context, Widget child) {
                    moveBall();
                    return Positioned(
                        left: posLeft, top: posTop, child: Ball());
                  })
            ]);
          },
        )));
  }

  void moveBall() {
    posTop = animation.value * maxTop ;
    posLeft = animation.value * maxLeft ;
  }
}

class Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    );
  }
}
