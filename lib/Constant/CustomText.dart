import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

// ignore: must_be_immutable
class CustomText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  FontWeight? fontWeight;
  TextAlign? align;

  CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.textColor,
      this.align = TextAlign.center,
      this.fontWeight})
      : super(key: key);

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontFamily: "Poppins",
        color: widget.textColor,
        fontWeight: widget.fontWeight,
      ),
      textAlign: widget.align,
    );
  }
}

class CustomTextField extends StatefulWidget {
  final Color color1;
  final Color? color2;
  final TextEditingController? textController;
  final String? hintText;
  final IconData? materialIcon;
  final double? height;
  final double? width;
  final double margin;
  final TextInputType? inputType;
  final bool IsValidate;
  const CustomTextField(
      {Key? key,
      required this.color1,
      this.color2,
      required this.textController,
      required this.hintText,
      this.materialIcon,
      this.height,
      this.width,
      required this.margin,
      this.inputType,
      this.IsValidate = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      height: widget.height,
      width: widget.width,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          validator: widget.IsValidate
              ? MultiValidator([RequiredValidator(errorText: "Required*")])
              : MultiValidator([]),
          controller: widget.textController,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 12,
                ),
                borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(
              widget.materialIcon,
              color: widget.color2,
            ),
          ),
        ),
      ),
    );
  }
}
