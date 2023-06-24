import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_activity_model.dart';
export 'empty_activity_model.dart';

class EmptyActivityWidget extends StatefulWidget {
  const EmptyActivityWidget({Key? key}) : super(key: key);

  @override
  _EmptyActivityWidgetState createState() => _EmptyActivityWidgetState();
}

class _EmptyActivityWidgetState extends State<EmptyActivityWidget> {
  late EmptyActivityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyActivityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tidak ada aktivitas yang sedang berlangsung',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
