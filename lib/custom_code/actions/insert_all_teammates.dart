// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future insertAllTeammates(List<TeammateStruct> teammates, ActivityTeamsRow team,
    ActivitiesRow activity) async {
  List<Map<String, dynamic>> participantsRows = [];

  // Add your function code here!
  for (var teammate in teammates) {
    participantsRows.add({
      'user_id': teammate.id,
      'is_leader': teammate.isLeader,
      'activity_id': team.activityId,
      'team_id': team.id,
      'event_id': activity.eventId,
    });
  }
  final response = await SupaFlow.client
      .from('activity_participants')
      .insert(participantsRows)
      .select();
}
