import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waroenk21/flutter_flow/flutter_flow_theme.dart';
import 'package:waroenk21/flutter_flow/flutter_flow_util.dart';

class HomeEventLoadingWidget extends StatelessWidget {
  const HomeEventLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0x767676),
      highlightColor: Colors.white70,
      child: // Generated code for this Column Widget...
          Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Container(
                  width: 320,
                  height: 188,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Container(
                  width: 320,
                  height: 188,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 24)).around(SizedBox(width: 24)),
          ),
        ),
      ),
    );
  }
}
