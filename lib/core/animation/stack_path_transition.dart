 import 'dart:ui';

 import 'package:flutter/material.dart';

Path pathGlobal = Path();

class AnimatedPathPainter extends CustomPainter {
  double added = 0;
  double biggestValue = 0;
  final Animation<double> animation;
  final curvedValue;
  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength =
        originalPath //also we can get length like this --> originalPath.computeMetrics().first.length
            .computeMetrics()
            .fold(
                0.0, (double prev, PathMetric metric) => prev + metric.length);
    var currentLength = totalLength * animationPercent;
    //  print(animationPercent);

    return extractPathUntilLength(originalPath, currentLength);
  }

  double percentCompletedCalculator(double current, double total) {
    //print(current/total*100);
    return current / total * 100;
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length, //length with animation
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length; //original path lenght

      double tile = length / 3;

      // print(length);

      if (length > biggestValue) {
        biggestValue = length;
      }
      //  percentCompletedCalculator(length, nextLength);
      //  print(nextLength);
      // print(biggestValue);
      //print(tile);

      final isLastSegment = nextLength > length;
      double comletedPercent = percentCompletedCalculator(length, nextLength);

      if (isLastSegment) {
        var tempTile = tile + added;

        if (percentCompletedCalculator(tempTile, length) > 98 &&
            length > nextLength / 2 &&
            percentCompletedCalculator(tempTile, length) < 100) {
          if (comletedPercent < 96) {
            added = added + (0.35 / 100) * nextLength;
          } else if (comletedPercent < 97) {
            added = added + (0.2 / 100) * nextLength;
          } else if (comletedPercent < 98) {
            added = added + (0.15 / 100) * nextLength;
          } else if (comletedPercent < 99) {
            added = added + (0.15 / 100) * nextLength;
          } else if (comletedPercent < 99.8) {
            added = added + (0.15 / 100) * nextLength;
          } else {
            added = added + (0.1 / 100) * nextLength;

            ///            print("ALOOOOO" * 100);
          }
//tile = length / 2.0;
          //
          //
          //
          //    print(length - tempTile);
        } else {
          if (comletedPercent < 5) {
            added = 0;
          } else if (comletedPercent < 10) {
            added = added + (0.2 / 100) * nextLength;
          } else if (comletedPercent < 15) {
            added = added + (0.2 / 100) * nextLength;
          } else if (comletedPercent < 20) {
            added = added + (0.2 / 100) * nextLength;
          } else if (comletedPercent < 25) {
            added = added + (0.2 / 100) * nextLength;
          } else if (comletedPercent < 30) {
            added = added + (0.3 / 100) * nextLength;
          } else if (comletedPercent < 35) {
            added = added + (0.3 / 100) * nextLength;
          } else if (comletedPercent < 40) {
            added = added + (0.35 / 100) * nextLength;
          } else if (comletedPercent < 45) {
            added = added + (0.4 / 100) * nextLength;
          } else if (comletedPercent < 50) {
            added = added + (0.45 / 100) * nextLength;
          } else if (comletedPercent < 60) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 65) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 70) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 75) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 80) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 85) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 90) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 90) {
            added = added + (0.50 / 100) * nextLength;
          } else if (comletedPercent < 95) {
            added = added + (0.50 / 100) * nextLength;
          } else {
            added = added + (0.45 / 100) * nextLength;
          }
        }

        tile = tile + added;

        //  print("-------" * 10);
        //  print("percent: ${percentCompletedCalculator(length, nextLength)}");
        //  print(
        //      "tile-length percent: ${percentCompletedCalculator(tile, length)}");
        //  print("tile: $tile");
        //  print("added: $added");
//
        //  print("length: $length");
        //  print("length: $added");
//
        //  print("length: $nextLength");
//
        //  print("-------" * 10);
//
        final remainingLength = length - currentLength; //currentlength always 0
        final pathSegment = metric.extractPath(tile, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        //never enter this

        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }
 
      currentLength = nextLength; // also this is never work
    }

    return path;
  }

  AnimatedPathPainter({required this.animation, required this.curvedValue})
      : super(repaint: animation);

  Path _createAnyPath(Size size) {
    Path path = Path();
    path.moveTo(0, curvedValue);
    path.lineTo(0, size.height - curvedValue);
    path.quadraticBezierTo(0, size.height, curvedValue, size.height);
    path.lineTo(size.width - curvedValue, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curvedValue);
    path.lineTo(size.width, curvedValue);
    path.quadraticBezierTo(size.width, 0, size.width - curvedValue, 0);

    path.lineTo(curvedValue, 0);
    path.quadraticBezierTo(0, 0, 0, curvedValue);
    path.lineTo(0, size.height - curvedValue);
    path.quadraticBezierTo(0, size.height, curvedValue, size.height);
    path.lineTo(size.width - curvedValue, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curvedValue);
    path.lineTo(size.width, curvedValue);
    path.quadraticBezierTo(size.width, 0, size.width - curvedValue, 0);

    path.lineTo(curvedValue, 0);
    path.quadraticBezierTo(0, 0, 0, curvedValue);

    pathGlobal = path;

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = animation.value;

    // print("Painting + ${animationPercent} - ${size}");

    var path = createAnimatedPath(_createAnyPath(size), animationPercent);
    //final Paint paint = Paint();
    //paint.color = Color.fromARGB(255, 143, 191, 145);
    //paint.style = PaintingStyle.stroke;
    //paint.strokeWidth = 2.0;
    final Paint paint = Paint();
    paint.color = Colors.blue[800]!; //.withAlpha(400);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;
  //  paint.blendMode = BlendMode.lighten;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedPathDemo extends StatefulWidget {
  AnimatedPathDemo({required this.child, required this.curvedValue});
  final Widget child;
  final double curvedValue;
  @override
  _AnimatedPathDemoState createState() => _AnimatedPathDemoState();
}

class _AnimatedPathDemoState extends State<AnimatedPathDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: AnimatedPathPainter(
            animation: _animation, curvedValue: widget.curvedValue),
        child: widget.child,
      ),
    );
  }
 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _animation = CurvedAnimation(
        parent: _controller, curve: Curves.easeOutCubic); //easeOutSine
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 3),
    );
  }

  defaultDispose() {
    _controller.dispose();
  }

  @override
  void dispose() {
    print("dispose");
    _controller.dispose();
    super.dispose();
  }
}
/**
 *     if (isLastSegment) {
        if (tile < 600) {
          added = 0;
          tile = length / 2;
        } else {
          if (added + 0.6 > length - length / 1.5 &&
              added < length - length / 1.5) {
            added = added + 0.1;
          } else if (added + 1.5 > length - length / 1.5 &&
              added < length - length / 1.5) {
            added = added + 0.5;
          } else if (added + 5 > length - length / 1.5 &&
              added < length - length / 1.5) {
            added = added + 1;
          } else if (added < length - length / 1.5) {
            if (tile < tile * .3) {
              added = 3;
            } else if (tile < length * .4) {
              added = added + 4;
            } else if (tile < length * .6) {
              added = added + 8;
            } else if (tile < length * .7) {
              added = added + 4;
            } else if (tile < length * .8) {
              added = added + 4;
            } else if (tile < length * .9) {
              added = added + 1;
            } else if (tile < (length / 1.5 + added) * 0.8) {
              added = added + 1;
            } else if (length / 1.5 + added < 1750) {}
          }

          tile = length / 1.5 + added;
        }
        print("-------" * 10);
        print("percent: ${percentCompletedCalculator(length, nextLength)}");
         print("tile-length percent: ${percentCompletedCalculator(tile, length)}");
        print("tile: $tile");
        print("length: $length");
        print("-------" * 10);

        final remainingLength = length - currentLength; //currentlength always 0
        final pathSegment = metric.extractPath(tile, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      }
 */