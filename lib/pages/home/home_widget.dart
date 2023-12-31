import 'package:shimmer/shimmer.dart';
import 'package:waroenk21/components/loadings/home_activity_loading_widget.dart';
import 'package:waroenk21/components/loadings/home_event_loading_widget.dart';
import 'package:waroenk21/components/loadings/home_section_title_loading_widget.dart';

import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empties/empty_event/empty_event_widget.dart';
import '/components/empties/empty_live_event/empty_live_event_widget.dart';
import '/components/menus/home_menu/home_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  double toDouble(DateTime myTime) => myTime.hour + myTime.minute / 60.0 + myTime.second / 3600.0;


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        _model.profile = await actions.getProfile(
          currentUserUid,
        );
        if (_model.profile != null) {
          setState(() {
            FFAppState().authedProfile = _model.profile!;
          });
          return;
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          return;
        }
      } else {
        return;
      }

      context.goNamedAuth('Authentication', context.mounted);
    });

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
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamats datangs',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .titleLarge,
                            ),
                            if (loggedIn)
                              Text(
                                functions.getNameForGreeting(
                                    FFAppState().authedProfile.name),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .titleLarge
                                    .override(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (loggedIn == true) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                        MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 128.0,
                                          child: HomeMenuWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                return;
                              } else {
                                context.pushNamed(
                                  'Authentication',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                      PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );

                                return;
                              }
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  FFAppState().authedProfile.pictureUrl,
                                  'https://i.ibb.co/wMKW8G4/user-placeholder.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<List<AppConfigsRow>>(
                              future: AppConfigsTable().querySingleRow(
                                queryFn: (q) =>
                                    q.eq(
                                      'name',
                                      'can_add_event',
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return HomeSectionTitleLoadingWidget();
                                }
                                List<AppConfigsRow> rowAppConfigsRowList =
                                snapshot.data!;
                                final rowAppConfigsRow =
                                rowAppConfigsRowList.isNotEmpty
                                    ? rowAppConfigsRowList.first
                                    : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Event Berlangsung',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    if (rowAppConfigsRow?.value == true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 24.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'CreateEvent',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                  PageTransitionType
                                                      .bottomToTop,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Event',
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .tertiary,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .primary,
                                            textStyle:
                                            FlutterFlowTheme
                                                .of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Rubik',
                                              color:
                                              FlutterFlowTheme
                                                  .of(
                                                  context)
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
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FutureBuilder<List<EventsRow>>(
                                future: EventsTable().queryRows(
                                  queryFn: (q) =>
                                      q
                                          .gte(
                                        'end_date',
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
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
                                    return HomeEventLoadingWidget();
                                  }
                                  List<EventsRow> rowEventsRowList =
                                  snapshot.data!;
                                  if (rowEventsRowList.isEmpty) {
                                    return EmptyLiveEventWidget();
                                  }
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                      List.generate(rowEventsRowList.length,
                                              (rowIndex) {
                                            final rowEventsRow =
                                            rowEventsRowList[rowIndex];
                                            return Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor: Colors
                                                    .transparent,
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
                                                    color:
                                                    FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color: Color(
                                                            0x19000000),
                                                        offset: Offset(
                                                            0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(16.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize
                                                        .max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Hero(
                                                          tag: rowEventsRow
                                                              .pictureUrl!,
                                                          transitionOnUserGestures:
                                                          true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.only(
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                              topLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                              topRight:
                                                              Radius.circular(
                                                                  16.0),
                                                            ),
                                                            child: Image
                                                                .network(
                                                              rowEventsRow
                                                                  .pictureUrl!,
                                                              width:
                                                              double.infinity,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            16.0,
                                                            16.0,
                                                            16.0,
                                                            16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                          children: [
                                                            Text(
                                                              rowEventsRow.name,
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Rubik',
                                                                color: FlutterFlowTheme
                                                                    .of(
                                                                    context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowEventsRow
                                                                    .location,
                                                                'Lokasi',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                fontFamily:
                                                                'Rubik',
                                                                color: FlutterFlowTheme
                                                                    .of(
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
                                          .divide(SizedBox(width: 24.0))
                                          .around(SizedBox(width: 24.0)),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FutureBuilder<List<AnnouncementsRow>>(
                              future: AnnouncementsTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'is_active',
                                  true,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AnnouncementsRow>
                                columnAnnouncementsRowList = snapshot.data!;
                                if (columnAnnouncementsRowList.isEmpty) {
                                  return EmptyLiveEventWidget();
                                }
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      columnAnnouncementsRowList.length,
                                          (columnIndex) {
                                        final columnAnnouncementsRow =
                                        columnAnnouncementsRowList[columnIndex];
                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0ACAC),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x19000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 24.0, 24.0, 24.0),
                                              child: Text(
                                                columnAnnouncementsRow.text!,
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<List<AppConfigsRow>>(
                              future: AppConfigsTable().querySingleRow(
                                queryFn: (q) =>
                                    q.eq(
                                      'name',
                                      'can_add_activity',
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return HomeSectionTitleLoadingWidget();
                                }
                                List<AppConfigsRow> rowAppConfigsRowList =
                                snapshot.data!;
                                final rowAppConfigsRow =
                                rowAppConfigsRowList.isNotEmpty
                                    ? rowAppConfigsRowList.first
                                    : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Aktivitas',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    if (rowAppConfigsRow?.value == true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 24.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'CreateActivity',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                  PageTransitionType
                                                      .bottomToTop,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Aktivitas',
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .tertiary,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .primary,
                                            textStyle:
                                            FlutterFlowTheme
                                                .of(context)
                                                .labelMedium
                                                .override(
                                              fontFamily: 'Rubik',
                                              color:
                                              FlutterFlowTheme
                                                  .of(
                                                  context)
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
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 24.0, 0.0),
                              child: FutureBuilder<List<ActivitiesRow>>(
                                future: ActivitiesTable().queryRows(
                                  queryFn: (q) =>
                                      q
                                          .gte(
                                        'end_date',
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      )
                                          .order('start_date', ascending: true)
                                          .order('name', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return HomeActivityLoadingWidget();
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: List.generate(
                                        columnActivitiesRowList.length,
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
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Hero(
                                                      tag: columnActivitiesRow
                                                          .pictureUrl!,
                                                      transitionOnUserGestures:
                                                      true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                        child: Image.network(
                                                          columnActivitiesRow
                                                              .pictureUrl!,
                                                          width: 52.0,
                                                          height: 64.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    if ((getCurrentTimestamp >=
                                                        columnActivitiesRow
                                                            .startDate) &&
                                                        (getCurrentTimestamp <=
                                                            columnActivitiesRow
                                                                .endDate) &&
                                                        (columnActivitiesRow
                                                            .startTime !=
                                                            null
                                                            ? (getCurrentTimestamp >=
                                                            columnActivitiesRow
                                                                .startTime!.time!)
                                                            : true) &&
                                                        (columnActivitiesRow
                                                            .endTime !=
                                                            null
                                                            ? (getCurrentTimestamp <=
                                                            columnActivitiesRow
                                                                .endTime!.time!)
                                                            : true))
                                                      Stack(
                                                        children: [
                                                          Shimmer.fromColors(
                                                            baseColor:
                                                            FlutterFlowTheme
                                                                .of(
                                                                context)
                                                                .primary,
                                                            highlightColor:
                                                            FlutterFlowTheme
                                                                .of(
                                                                context)
                                                                .tertiary,
                                                            child: Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme
                                                                    .of(context)
                                                                    .primary,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    4.0),
                                                                child: Text(
                                                                  'Live',
                                                                  style: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .bodySmall
                                                                      .override(
                                                                    fontFamily:
                                                                    'Rubik',
                                                                    color: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .tertiary,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                              child: Text(
                                                                'Live',
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodySmall
                                                                    .override(
                                                                  fontFamily:
                                                                  'Rubik',
                                                                  color: FlutterFlowTheme
                                                                      .of(
                                                                      context)
                                                                      .tertiary,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          columnActivitiesRow
                                                              .name,
                                                          style:
                                                          FlutterFlowTheme
                                                              .of(
                                                              context)
                                                              .bodyLarge,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                } else
                                                                if ((columnActivitiesRow
                                                                    .closeRegistrationAt !=
                                                                    null) &&
                                                                    (getCurrentTimestamp <=
                                                                        columnActivitiesRow
                                                                            .closeRegistrationAt!)) {
                                                                  return 'Pendaftaran tutup : ';
                                                                } else
                                                                if (getCurrentTimestamp <=
                                                                    columnActivitiesRow
                                                                        .startDate) {
                                                                  return 'Mulai : ';
                                                                } else {
                                                                  return 'Berakhir :';
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                      locale: FFLocalizations.of(
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
                                                                      locale: FFLocalizations.of(
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
                                                                      locale: FFLocalizations.of(
                                                                          context)
                                                                          .languageCode,
                                                                    );
                                                                  } else {
                                                                    return dateTimeFormat(
                                                                      'MMMEd',
                                                                      columnActivitiesRow
                                                                          .endDate,
                                                                      locale: FFLocalizations.of(
                                                                          context)
                                                                          .languageCode,
                                                                    );
                                                                  }
                                                                }(),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ].divide(
                                                              SizedBox(
                                                                  width: 2.0)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0.0,
                                                              12.0,
                                                              0.0,
                                                              0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on_outlined,
                                                                color: FlutterFlowTheme
                                                                    .of(context)
                                                                    .primary,
                                                                size: 16.0,
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      1.0),
                                                                  child: Text(
                                                                    columnActivitiesRow
                                                                        .location,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme
                                                                        .of(
                                                                        context)
                                                                        .bodySmall,
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 64.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme
                                                        .of(context)
                                                        .primaryBackground,
                                                  ),
                                                  alignment: AlignmentDirectional(
                                                      0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'ActivityDetail',
                                                        queryParameters: {
                                                          'activity':
                                                          serializeParam(
                                                            columnActivitiesRow,
                                                            ParamType
                                                                .SupabaseRow,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: 'View',
                                                    options: FFButtonOptions(
                                                      height: 32.0,
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                      iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                          0.0, 0.0),
                                                      color: FlutterFlowTheme
                                                          .of(
                                                          context)
                                                          .primaryBackground,
                                                      textStyle: FlutterFlowTheme
                                                          .of(context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                        FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .primary,
                                                      ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                            .of(
                                                            context)
                                                            .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                        child: Text(
                                          '17an Kurang Seru Tanpa Cemilan!',
                                          style: FlutterFlowTheme.of(context).titleMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                        child: Text(
                                          'Yuk Pre-Order!',
                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                      ),
                                      child: FutureBuilder<List<PreOrdersRow>>(
                                        future: PreOrdersTable().queryRows(
                                          queryFn: (q) => q,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<PreOrdersRow> listViewPreOrdersRowList = snapshot.data!;
                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(horizontal: 24),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: listViewPreOrdersRowList.length,
                                            separatorBuilder: (_, __) => SizedBox(width: 24),
                                            itemBuilder: (context, listViewIndex) {
                                              final listViewPreOrdersRow =
                                              listViewPreOrdersRowList[listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                child: Container(
                                                  width: 270,
                                                  height: 88,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme.of(context).secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 8,
                                                        color: Color(0x230F1113),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color:
                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(0),
                                                          bottomRight: Radius.circular(0),
                                                          topLeft: Radius.circular(12),
                                                          topRight: Radius.circular(12),
                                                        ),
                                                        child: Image.network(
                                                          listViewPreOrdersRow.pictureUrl!,
                                                          width: double.infinity,
                                                          height: 110,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                            16, 12, 16, 12),
                                                        child: FutureBuilder<List<UserStoresRow>>(
                                                          future: UserStoresTable().querySingleRow(
                                                            queryFn: (q) => q.eq(
                                                              'id',
                                                              listViewPreOrdersRow.storeId,
                                                            ),
                                                          ),
                                                          builder: (context, snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot.hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child: CircularProgressIndicator(
                                                                    valueColor:
                                                                    AlwaysStoppedAnimation<Color>(
                                                                      FlutterFlowTheme.of(context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<UserStoresRow> rowUserStoresRowList =
                                                            snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!.isEmpty) {
                                                              return Container();
                                                            }
                                                            final rowUserStoresRow =
                                                            rowUserStoresRowList.isNotEmpty
                                                                ? rowUserStoresRowList.first
                                                                : null;
                                                            return Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        listViewPreOrdersRow.name!,
                                                                        maxLines: 1,
                                                                        style:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLarge,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            rowUserStoresRow!.name!,
                                                                            maxLines: 1,
                                                                            style: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodySmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    context.pushNamed(
                                                                      'PreOrderDetail',
                                                                      queryParameters: {
                                                                        'preorder': serializeParam(
                                                                          listViewPreOrdersRow,
                                                                          ParamType.SupabaseRow,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    height: 32,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(16),
                                                                      border: Border.all(
                                                                        color:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width: 2,
                                                                      ),
                                                                    ),
                                                                    alignment: AlignmentDirectional(0, 0),
                                                                    child: Padding(
                                                                      padding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          8, 0, 8, 0),
                                                                      child: Text(
                                                                        'Pre-Order',
                                                                        style:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: 'Rubik',
                                                                          color:
                                                                          FlutterFlowTheme.of(
                                                                              context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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