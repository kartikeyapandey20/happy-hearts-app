import 'package:flutter/material.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';
// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final bool IsValidate;
   double? width;
   double? textSize;
  CustomTextFormField({Key? key,required this.hintText,this.textSize, this.inputType, this.textController, this.IsValidate=false, this.width}) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
      width:widget.width,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          validator: widget.IsValidate?  MultiValidator(
              [
                RequiredValidator(errorText: "Required*")
              ]
          ): MultiValidator(
              [

              ]
          ),
          controller: widget.textController,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            labelText: widget.hintText,
            filled: true,
            fillColor: AppColors.borderColor,
            focusColor: AppColors.textFieldBorderColor,
            labelStyle: TextStyle(
                fontFamily: "Fresca",
              fontSize: widget.textSize
            ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23,),
                borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor
                ),

              ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23,),
                  borderSide: BorderSide(
                    color: AppColors.textFieldBorderColor
                  )

            )
          ),

        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class CustomTextFormFieldWithLabel extends StatefulWidget {
  final String lablelText;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final bool IsValidate;
  double? height;
  double? width;
  int? minline;
  int? maxline;
  CustomTextFormFieldWithLabel({Key? key,this.minline,this.maxline,this.height,this.width, required this.lablelText, this.inputType, this.textController, required this.IsValidate}) : super(key: key);

  @override
  _CustomTextFormFieldWithLabelState createState() => _CustomTextFormFieldWithLabelState();
}

class _CustomTextFormFieldWithLabelState extends State<CustomTextFormFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          minLines: widget.minline,
          maxLines: widget.maxline,
          validator: widget.IsValidate?  MultiValidator(
              [
                RequiredValidator(errorText: "Required*")
              ]
          ): MultiValidator(
              [

              ]
          ),
          controller: widget.textController,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
              labelText: widget.lablelText,
              filled: true,
              fillColor: AppColors.borderColor,
              focusColor: AppColors.textFieldBorderColor,
              labelStyle: TextStyle(
                fontFamily: "Fresca",
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23,),
                  borderSide: BorderSide(
                      color: AppColors.textFieldBorderColor
                  ),
              ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23,),
              borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}

