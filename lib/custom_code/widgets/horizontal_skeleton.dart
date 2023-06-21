// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:shimmer/shimmer.dart';

class HorizontalSkeleton extends StatefulWidget {
  const HorizontalSkeleton({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _HorizontalSkeletonState createState() => _HorizontalSkeletonState();
}

class _HorizontalSkeletonState extends State<HorizontalSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height!,
      width: widget.width!,
      color: const Color(0x00000000),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Color.fromRGBO(255, 255, 255, 0.5),
              highlightColor: Color.fromRGBO(255, 255, 255, 0.8),
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.width! ~/ 320,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFFBFAF4),
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 320,
                      height: widget.height,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
