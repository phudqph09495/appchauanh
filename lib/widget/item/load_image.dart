import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../style/init_style.dart';


class LoadImage extends StatefulWidget {
  String url;
  double width;
  double height;
  BoxFit fit;
  Alignment alignment;
  bool ans;
  LoadImage({
    this.ans = true,
    required this.url,
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  _LoadImageState createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InstaImageViewer(
      child: Image.network(
        widget.url,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        alignment: widget.alignment,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: widget.width,
            height: widget.height,
            child: Center(
              child: Platform.isAndroid
                  ? const CircularProgressIndicator(
                      color: ColorApp.main,
                      strokeWidth: 2,
                    )
                  : CupertinoActivityIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return widget.ans
              ? Container(
                  width: widget.width,
                  height: widget.height,
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                     '',
                      width: widget.width,
                      height: widget.height,
                      fit: widget.fit,
                    ),
                  ),
                )
              : SizedBox();
        },
      ),
    );
  }
}
