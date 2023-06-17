import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            context.pushNamed('CreateEvent');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          icon: Icon(
            Icons.event_note,
            color: FlutterFlowTheme.of(context).tertiary,
            size: 16.0,
          ),
          elevation: 8.0,
          label: Text(
            'Buat Event',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Rubik',
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
          ),
        ),
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
                            'Sedang Berlangsung',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: FutureBuilder<List<EventsRow>>(
                        future: EventsTable().queryRows(
                          queryFn: (q) => q
                              .lte(
                                'start_date',
                                supaSerialize<DateTime>(getCurrentTimestamp),
                              )
                              .gte(
                                'end_date',
                                supaSerialize<DateTime>(getCurrentTimestamp),
                              )
                              .eq(
                                'is_active',
                                true,
                              )
                              .order('end_date', ascending: true),
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
                                return Container(
                                  width: 320.0,
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        rowEventsRow.pictureUrl!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rowEventsRow.name,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            rowEventsRow.location,
                                            'Lokasi',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                        ),
                                      ],
                                    ),
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
                              .gt(
                                'start_date',
                                supaSerialize<DateTime>(getCurrentTimestamp),
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
