// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ContainerGradientConst extends StatelessWidget {
  double? topPadding,
      bottomPadding,
      rightPadding,
      leftPadding,
      height,
      width,
      radius;
  Widget? child;
  List<Color>? color;
  BoxBorder? border;

  ContainerGradientConst(
      {this.child,
        this.height,
        this.rightPadding,
        this.leftPadding,
        this.bottomPadding,
        this.topPadding,
        this.width,
        this.color,
        this.radius,
        this.border});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 8,
          left: leftPadding ?? 16,
          right: rightPadding ?? 16,
          bottom: bottomPadding ?? 0),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 10),
              gradient: LinearGradient(
                  colors:
                  color ?? [AppColors.appPrimaryColor, AppColors.hhyellow],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              border:
              border ?? Border.all(width: 2, color: AppColors.appPrimaryColor)),
          child: child),
    );
  }
}

class ContainerGlassConst extends StatelessWidget {
  double? topPadding,
      bottomPadding,
      rightPadding,
      leftPadding,
      height,
      width,
      radius;
  Widget? child;

  ContainerGlassConst(
      {this.child,
        this.height,
        this.rightPadding,
        this.leftPadding,
        this.bottomPadding,
        this.topPadding,
        this.width,
        this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 8,
          left: leftPadding ?? 16,
          right: rightPadding ?? 16,
          bottom: bottomPadding ?? 0),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.hhorange.withOpacity(0.70),
                // AppColors().whiteColorF8.withOpacity(0.71),
                // AppColors().whiteColor.withOpacity(0.59),
                AppColors.appPrimaryColor.withOpacity(0.50)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            backgroundBlendMode: BlendMode.darken,
            boxShadow: [
              BoxShadow(
                color: AppColors.hhblue.withOpacity(0.15),
                offset: const Offset(0.0, 0.0),
                blurStyle: BlurStyle.inner,),
              // BoxShadow(
              //     color: AppColors().shadowColor.withOpacity(0),
              //     offset: const Offset(0.0, 0.0),
              //     blurStyle: BlurStyle.inner,
              //     spreadRadius: 2),
              // BoxShadow(
              //     color: AppColors().shadowColor.withOpacity(0),
              //     offset: const Offset(0.0, 0.0),
              //     blurStyle: BlurStyle.inner,
              //     spreadRadius: 2),
              BoxShadow(
                color: AppColors.hhorange.withOpacity(0.10),
                offset: const Offset(0.0, 0.0),
                blurStyle: BlurStyle.inner,
              ),

            ],
            borderRadius: BorderRadius.circular(radius ?? 25),
          ),
          child: child),
    );
  }
}

class ContainerConst extends StatelessWidget {
  double? topPadding,
      bottomPadding,
      rightPadding,
      leftPadding,
      height,
      width,
      radius;
  Widget? child;
  Color? color, borderColor;

  ContainerConst(
      {this.child,
        this.height,
        this.rightPadding,
        this.leftPadding,
        this.bottomPadding,
        this.topPadding,
        this.width,
        this.color,
        this.borderColor,
        this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 8,
          left: leftPadding ?? 16,
          right: rightPadding ?? 16,
          bottom: bottomPadding ?? 0),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 10),
              color: color ?? AppColors.hhorange,
              border: Border.all(
                  width: 2, color: borderColor ?? AppColors.transhparent)),
          child: child),
    );
  }
}