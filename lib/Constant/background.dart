import 'package:flutter/material.dart';
import 'package:happyheart/utils/image_path.dart';

// ignore: must_be_immutable
class BackgroundSetup extends StatelessWidget {
  Widget child;
  double? width, height;
  BackgroundSetup({required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImagePath.bacgroundImagePath1,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          child
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class YellowBacground extends StatelessWidget {
  Widget child;
  double? width, height;
  YellowBacground({required this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImagePath.yellowBackground,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        child
      ],
    );
  }
}

// ignore: must_be_immutable
class TestContainer extends StatefulWidget {
  Widget child;
  double? width, height;
  TestContainer({Key? key,required this.child,this.width,this.height}) : super(key: key);

  @override
  _TestContainerState createState() => _TestContainerState();
}

class _TestContainerState extends State<TestContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.yellowBackground,),
          fit: BoxFit.cover
        )
      ),
      child: widget.child,
    );
  }
}
