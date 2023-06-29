import '/backend/supabase/supabase.dart';
import '/components/empties/empty_event/empty_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activity_by_group_model.dart';
export 'activity_by_group_model.dart';

class ActivityByGroupWidget extends StatefulWidget {
  const ActivityByGroupWidget({
    Key? key,
    required this.activityGroup,
  }) : super(key: key);

  final ActivityGroupsRow? activityGroup;

  @override
  _ActivityByGroupWidgetState createState() => _ActivityByGroupWidgetState();
}

class _ActivityByGroupWidgetState extends State<ActivityByGroupWidget> {
  late ActivityByGroupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityByGroupModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.activityGroup?.name,
              'Group Name',
            ),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                  child: FutureBuilder<List<ActivitiesRow>>(
                    future: ActivitiesTable().queryRows(
                      queryFn: (q) => q
                          .eq(
                            'group_id',
                            widget.activityGroup?.id,
                          )
                          .order('start_date', ascending: true)
                          .order('name', ascending: true),
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
                      List<ActivitiesRow> columnActivitiesRowList =
                          snapshot.data!;
                      if (columnActivitiesRowList.isEmpty) {
                        return Center(
                          child: EmptyEventWidget(),
                        );
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(columnActivitiesRowList.length,
                            (columnIndex) {
                          final columnActivitiesRow =
                              columnActivitiesRowList[columnIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ActivityDetail',
                                queryParameters: {
                                  'activity': serializeParam(
                                    columnActivitiesRow,
                                    ParamType.SupabaseRow,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Hero(
                                      tag: columnActivitiesRow.pictureUrl!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          columnActivitiesRow.pictureUrl!,
                                          width: 52.0,
                                          height: 64.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          columnActivitiesRow.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              () {
                                                if ((columnActivitiesRow
                                                            .openRegistrationAt !=
                                                        null) &&
                                                    (getCurrentTimestamp <=
                                                        columnActivitiesRow
                                                            .openRegistrationAt!)) {
                                                  return 'Pendaftaran buka : ';
                                                } else if ((columnActivitiesRow
                                                            .closeRegistrationAt !=
                                                        null) &&
                                                    (getCurrentTimestamp <=
                                                        columnActivitiesRow
                                                            .closeRegistrationAt!)) {
                                                  return 'Pendaftaran tutup : ';
                                                } else if (getCurrentTimestamp <=
                                                    columnActivitiesRow
                                                        .startDate) {
                                                  return 'Mulai : ';
                                                } else {
                                                  return 'Berakhir :';
                                                }
                                              }(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            Expanded(
                                              child: Text(
                                                () {
                                                  if ((columnActivitiesRow
                                                              .openRegistrationAt !=
                                                          null) &&
                                                      (getCurrentTimestamp <=
                                                          columnActivitiesRow
                                                              .openRegistrationAt!)) {
                                                    return dateTimeFormat(
                                                      'MMMEd',
                                                      columnActivitiesRow
                                                          .openRegistrationAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  } else if ((columnActivitiesRow
                                                              .closeRegistrationAt !=
                                                          null) &&
                                                      (getCurrentTimestamp <=
                                                          columnActivitiesRow
                                                              .closeRegistrationAt!)) {
                                                    return dateTimeFormat(
                                                      'MMMEd',
                                                      columnActivitiesRow
                                                          .closeRegistrationAt!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  } else if (getCurrentTimestamp <=
                                                      columnActivitiesRow
                                                          .startDate) {
                                                    return dateTimeFormat(
                                                      'MMMEd',
                                                      columnActivitiesRow
                                                          .startDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  } else {
                                                    return dateTimeFormat(
                                                      'MMMEd',
                                                      columnActivitiesRow
                                                          .endDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  }
                                                }(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Text(
                                                    columnActivitiesRow
                                                        .location,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        'ActivityDetail',
                                        queryParameters: {
                                          'activity': serializeParam(
                                            columnActivitiesRow,
                                            ParamType.SupabaseRow,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'View',
                                    options: FFButtonOptions(
                                      height: 32.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).divide(SizedBox(height: 16.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
