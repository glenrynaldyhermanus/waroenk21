import '/backend/supabase/supabase.dart';
import '/components/empties/empty_crew/empty_crew_widget.dart';
import '/components/empties/empty_roles/empty_roles_widget.dart';
import '/components/forms/invite_crew/invite_crew_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crew_list_model.dart';
export 'crew_list_model.dart';

class CrewListWidget extends StatefulWidget {
  const CrewListWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventsRow? event;

  @override
  _CrewListWidgetState createState() => _CrewListWidgetState();
}

class _CrewListWidgetState extends State<CrewListWidget> {
  late CrewListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrewListModel());

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
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_model.unfocusNode),
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: InviteCrewWidget(
                      event: widget.event!,
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          icon: Icon(
            Icons.people_sharp,
            color: FlutterFlowTheme.of(context).tertiary,
            size: 16.0,
          ),
          elevation: 8.0,
          label: Text(
            'Tambah Pengurus',
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
            'Pengurus',
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: FutureBuilder<List<EventRolesRow>>(
                            future: EventRolesTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'event_id',
                                    widget.event?.id,
                                  )
                                  .neq(
                                    'level',
                                    0,
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<EventRolesRow> containerEventRolesRowList =
                                  snapshot.data!;
                              return Container(
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          containerEventRolesRowList.length > 0
                                              ? '${containerEventRolesRowList.length.toString()} role untuk event ini'
                                              : 'Tidak ada role untuk event ini',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'CreateRole',
                                            queryParameters: {
                                              'event': serializeParam(
                                                widget.event,
                                                ParamType.SupabaseRow,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'Organize',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<EventRolesRow>>(
                  future: EventRolesTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'event_id',
                          widget.event?.id,
                        )
                        .gt(
                          'level',
                          0,
                        )
                        .order('level', ascending: true),
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
                    List<EventRolesRow> columnEventRolesRowList =
                        snapshot.data!;
                    if (columnEventRolesRowList.isEmpty) {
                      return EmptyRolesWidget();
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnEventRolesRowList.length,
                          (columnIndex) {
                        final columnEventRolesRow =
                            columnEventRolesRowList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      columnEventRolesRow.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 8.0, 24.0, 0.0),
                                child: FutureBuilder<List<EventCrewsRow>>(
                                  future: EventCrewsTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'event_id',
                                          widget.event?.id,
                                        )
                                        .eq(
                                          'role_id',
                                          columnEventRolesRow.id,
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<EventCrewsRow>
                                        columnEventCrewsRowList =
                                        snapshot.data!;
                                    if (columnEventCrewsRowList.isEmpty) {
                                      return Center(
                                        child: EmptyCrewWidget(
                                          eventRole: columnEventRolesRow,
                                          event: widget.event!,
                                        ),
                                      );
                                    }
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: List.generate(
                                          columnEventCrewsRowList.length,
                                          (columnIndex) {
                                        final columnEventCrewsRow =
                                            columnEventCrewsRowList[
                                                columnIndex];
                                        return FutureBuilder<List<UsersRow>>(
                                          future: UsersTable().querySingleRow(
                                            queryFn: (q) => q.eq(
                                              'id',
                                              columnEventCrewsRow.userId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRow> rowUsersRowList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final rowUsersRow =
                                                rowUsersRowList.isNotEmpty
                                                    ? rowUsersRowList.first
                                                    : null;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    rowUsersRow!.pictureUrl!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      rowUsersRow!.name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.call_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }).divide(SizedBox(height: 16.0)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
