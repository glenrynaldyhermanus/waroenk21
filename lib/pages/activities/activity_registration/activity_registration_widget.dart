import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activity_registration_model.dart';
export 'activity_registration_model.dart';

class ActivityRegistrationWidget extends StatefulWidget {
  const ActivityRegistrationWidget({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final ActivitiesRow? activity;

  @override
  _ActivityRegistrationWidgetState createState() =>
      _ActivityRegistrationWidgetState();
}

class _ActivityRegistrationWidgetState
    extends State<ActivityRegistrationWidget> {
  late ActivityRegistrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityRegistrationModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Pendaftaran Team',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Rubik',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'ActivityBrief',
                              queryParameters: {
                                'activity': serializeParam(
                                  widget.activity,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.list_alt,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Peraturan dan Tata Tertib',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 32.0, 24.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nama Team',
                            labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.name,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Anggota Team',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '1 team = ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.activity?.maxTeamMember
                                                ?.toString(),
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        Text(
                                          ' orang',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (FFAppState().myTeammates.length <
                                    widget.activity!.maxTeamMember)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 24.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'InviteTeamMember',
                                          queryParameters: {
                                            'activity': serializeParam(
                                              widget.activity,
                                              ParamType.SupabaseRow,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Invite',
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 16.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 32.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 16.0, 24.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final teammates =
                                      FFAppState().myTeammates.toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: List.generate(teammates.length,
                                        (teammatesIndex) {
                                      final teammatesItem =
                                          teammates[teammatesIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                functions.getNameAbbrevation(
                                                    teammatesItem.name),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  teammatesItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                                Text(
                                                  teammatesItem.email,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 20.0,
                                            borderWidth: 2.0,
                                            buttonSize: 32.0,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 16.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      );
                                    }).divide(SizedBox(height: 16.0)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    if ((_model.textController.text != null &&
                            _model.textController.text != '') &&
                        (widget.activity?.maxTeamMember ==
                            FFAppState().myTeammates.length)) {
                      _model.isParticipate = await actions.isTeamParticipated(
                        FFAppState().authedProfile.id,
                        widget.activity!,
                      );
                      _shouldSetState = true;
                      if (_model.isParticipate == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Kamu sudah pernah daftar',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      } else {
                        _model.team = await ActivityTeamsTable().insert({
                          'activity_id': widget.activity?.id,
                          'name': _model.textController.text,
                          'team_owner_id': FFAppState().authedProfile.id,
                        });
                        _shouldSetState = true;
                        await actions.insertAllTeammates(
                          FFAppState().myTeammates.toList(),
                          _model.team!,
                          widget.activity!,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pendaftaran berhasil',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                          ),
                        );
                        context.safePop();
                        if (_shouldSetState) setState(() {});
                        return;
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Mohon isi data dengan lengkap',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Daftarkan Team',
                  options: FFButtonOptions(
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
