import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_event_model.dart';
export 'empty_event_model.dart';

class EmptyEventWidget extends StatefulWidget {
  const EmptyEventWidget({Key? key}) : super(key: key);

  @override
  _EmptyEventWidgetState createState() => _EmptyEventWidgetState();
}

class _EmptyEventWidgetState extends State<EmptyEventWidget> {
  late EmptyEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyEventModel());

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
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy_rounded,
              color: Color(0x4D736A6A),
              size: 120.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Tidak ada aktivitas yang bisa kamu ikuti.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Rubik',
                        color: Color(0xBE342F2F),
                      ),
                ),
                Text(
                  'Ada acara makan-makan? Futsal mingguan atau olahraga lainnya?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Rubik',
                        color: Color(0x80342F2F),
                      ),
                ),
                Text(
                  'Buat aktivitas kamu sekarang!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Rubik',
                        color: Color(0xBE342F2F),
                      ),
                ),
              ].divide(SizedBox(
                height: 4.0,
              )),
            ),
          ].divide(SizedBox(
            height: 16.0,
          )),
        ),
      ),
    );
  }
}
