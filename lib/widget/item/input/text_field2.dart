import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../style/init_style.dart';





class InputText2 extends StatefulWidget {
  IconData? iconData;
  bool obscureText;
  bool hasPass;
  bool hasLeading;
  String label;
  Function(String)? onChanged;
  Function(String)? validator;
  Function()? onTap;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double width;
  double radius;
  Color colorBg;
  Color borderColor;
  Color colorLabel;
  double verti;
  bool readOnly;
  int maxLine;
  Widget? suffix;
  List<TextInputFormatter>? inputformater;
  InputText2({
    this.obscureText = false,
    required this.label,
    this.keyboardType,
    this.readOnly=false,
    this.controller,
    this.onChanged,
    this.iconData,
    this.hasPass = false,
    this.hasLeading = false,
    this.validator,
    this.radius = 20,
    this.width = double.infinity,
    this.borderColor = ColorApp.main,
    this.colorBg = Colors.white,
    this.onTap,
    this.suffix,
    this.inputformater,this.maxLine=1,

    this.verti=7,
    this.colorLabel=Colors.black26
  });

  @override
  State<InputText2> createState() => _InputText2State();
}

class _InputText2State extends State<InputText2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      child: TextFormField(
        maxLines: widget.maxLine,
        inputFormatters: widget.inputformater,
        readOnly: widget.readOnly,
        onTap:widget.onTap ,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.left,
        style: StyleApp.textStyle400(fontSize: 16),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
              borderSide: BorderSide(color: ColorApp.orangeF2, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide:
              BorderSide(color: Colors.black.withOpacity(0.2), width: 0.5),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              // borderSide:
              // const BorderSide(color: ColorApp.black, width: 1),
            ),
            filled: true,
            fillColor: widget.colorBg,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: widget.verti),
            prefixIcon: widget.hasLeading
                ? Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(widget.iconData,
                  color: ColorApp.black.withOpacity(0.5)),
            )
                : null,

            hintText: widget.label,
            hintStyle: StyleApp.textStyle400(fontSize: 20,color: widget.colorLabel),
            suffixIcon: widget.hasPass
                ? InkWell(
              onTap: () {
                widget.obscureText = !widget.obscureText;
                setState(() {});
              },
              child: Icon(
                  !widget.obscureText
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  color: ColorApp.black.withOpacity(0.5)),
            )
                : widget.suffix,
            errorText: null,errorStyle: TextStyle(color: Colors.red)
        ),
        validator: (val) {
          if (val != null && widget.validator != null) {
            return widget.validator!(val);
          }
          return null;
        },
      ),
    );
  }
}
