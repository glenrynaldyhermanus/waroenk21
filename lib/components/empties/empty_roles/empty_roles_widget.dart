import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_roles_model.dart';
export 'empty_roles_model.dart';

class EmptyRolesWidget extends StatefulWidget {
  const EmptyRolesWidget({Key? key}) : super(key: key);

  @override
  _EmptyRolesWidgetState createState() => _EmptyRolesWidgetState();
}

class _EmptyRolesWidgetState extends State<EmptyRolesWidget> {
  late EmptyRolesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyRolesModel());

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
              Icons.people_outlined,
              color: Color(0x4D736A6A),
              size: 120.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Tidak ada pengurus',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Rubik',
                        color: Color(0xBE342F2F),
                      ),
                ),
                Text(
                  'Buat struktur organisasi event ini dan invite tim kamu sebagai pengurus.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Rubik',
                        color: Color(0x80342F2F),
                      ),
                ),
                Text(
                  'Invite teman sekarang!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Rubik',
                        color: Color(0xBE342F2F),
                      ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
