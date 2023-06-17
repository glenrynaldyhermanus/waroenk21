import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/events/empty_event/empty_event_widget.dart';
import '/pages/events/empty_live_event/empty_live_event_widget.dart';
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: FloatingActionButton.extended(
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
                          if (rowEventsRowList.isEmpty) {
                            return EmptyLiveEventWidget();
                          }
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(rowEventsRowList.length,
                                      (rowIndex) {
                                final rowEventsRow = rowEventsRowList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'EventDetail',
                                        queryParameters: {
                                          'event': serializeParam(
                                            rowEventsRow,
                                            ParamType.SupabaseRow,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 320.0,
                                      height: 188.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x19000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Hero(
                                              tag: rowEventsRow.pictureUrl!,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                                child: Image.network(
                                                  rowEventsRow.pictureUrl!,
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  rowEventsRow.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    rowEventsRow.location,
                                                    'Lokasi',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
                        if (columnEventsRowList.isEmpty) {
                          return Center(
                            child: EmptyEventWidget(),
                          );
                        }
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
            ].divide(SizedBox(
              height: 16.0,
            )),
          ),
        ),
      ),
    );
  }
}
