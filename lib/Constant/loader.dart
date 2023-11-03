import 'package:flutter/material.dart';
import 'package:happyheart/utils/image_path.dart';

class HeartLoader extends StatefulWidget {
  HeartLoader({Key? key}) : super(key: key);

  @override
  _HeartLoaderState createState() => _HeartLoaderState();
}

class _HeartLoaderState extends State<HeartLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFFFFFFFF).withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                // Background color of the container
                borderRadius: BorderRadius.circular(
                    12.0), // Set border radius for the container
              ),
              padding:
                  EdgeInsets.all(8.0), // Optional padding for the container
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Image.asset(
                      ImagePath.smallhhlogo,
                      fit: BoxFit.none,
                      // height: MediaQuery.of(context).size.height / 8,
                      // width: MediaQuery.of(context).size.width / 15,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowLoader {
  static showLoader(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: HeartLoader(),
          ),
        );
      },
    );
  }

  static hideLoader(BuildContext context) {
    // Future.delayed(const Duration(seconds: 2),() {
    Navigator.pop(context);
    // });
  }
}
