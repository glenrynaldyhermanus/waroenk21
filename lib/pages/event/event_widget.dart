import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_model.dart';
export 'event_model.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  late EventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventModel());

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
            'Event',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Rubik',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Event Kamu',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 16.0,
                            borderWidth: 1.0,
                            buttonSize: 32.0,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.arrow_forward,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 16.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FutureBuilder<List<EventsRow>>(
                        future: EventsTable().queryRows(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<EventsRow> rowEventsRowList = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(rowEventsRowList.length,
                                      (rowIndex) {
                                final rowEventsRow = rowEventsRowList[rowIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.network(
                                    rowEventsRow.pictureUrl!,
                                    width: 320.0,
                                    height: 160.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              })
                                  .divide(SizedBox(
                                    width: 24.0,
                                  ))
                                  .around(SizedBox(
                                    width: 24.0,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Event Selanjutnya',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('CreateEvent');
                            },
                            text: 'Buat Event',
                            options: FFButtonOptions(
                              height: 32.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                      child: FutureBuilder<List<EventsRow>>(
                        future: EventsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'is_active',
                                true,
                              )
                              .order('start_date', ascending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<EventsRow> columnEventsRowList = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(columnEventsRowList.length,
                                (columnIndex) {
                              final columnEventsRow =
                                  columnEventsRowList[columnIndex];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  columnEventsRow.pictureUrl!,
                                  width: 320.0,
                                  height: 160.0,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).divide(SizedBox(
                              height: 16.0,
                            )),
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
    );
  }
}
