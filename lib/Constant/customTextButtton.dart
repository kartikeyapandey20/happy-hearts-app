import 'package:flutter/material.dart';
import 'package:happyheart/utils/colors.dart';


// ignore: must_be_immutable
class CustomeTextButton extends StatefulWidget {
  final Color bacgroundColor;
  final double borderWidth;
  final Color borderColor;
  Color? textColor;
  final String text;
  Widget ? onTap;
  double? width;
  double? height;
  EdgeInsets? margin;
  double? fontSize;
  TextAlign? textAlign;
  double? padding;
  FontWeight? fontWeight;
  CustomeTextButton({Key? key,this.padding=5,this.textAlign=TextAlign.center,this.fontSize=22,this.onTap,this.textColor=AppColors.borderColor,this.width,this.height,required this.borderColor,required this.bacgroundColor,required this.text, required this.borderWidth,this.margin,this.fontWeight}) : super(key: key);


  @override
  _CustomeTextButtonState createState() => _CustomeTextButtonState();
}

class _CustomeTextButtonState extends State<CustomeTextButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 30,
      color: Colors.transparent,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,

        decoration: BoxDecoration(
          // ignore: unnecessary_null_comparison
          color: widget.bacgroundColor== null ? Color(0xFFFA4A71): widget.bacgroundColor ,
          borderRadius: BorderRadius.circular(12),
            border: Border.all(
              // ignore: unnecessary_null_comparison
              color: widget.borderColor== null ?Color(0xFFFFFFFF) : widget.borderColor,
              width: widget.borderWidth
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(widget.padding!),
          child: Center(
            child: Text(widget.text,style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.textColor,
              fontWeight: widget.fontWeight,
              fontFamily: "Poppins"
            ),textAlign: widget.textAlign,),
          ),
        ),
      ),
    );
  }
}
