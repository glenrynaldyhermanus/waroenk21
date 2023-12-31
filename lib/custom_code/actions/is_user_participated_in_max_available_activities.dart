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

Future<bool> isUserParticipatedInMaxAvailableActivities(
  EventsRow? event,
  UsersRow user,
) async {
  // Add your function code here!

  if (event == null) {
    return false;
  }

  final result = await ActivityParticipantsTable().queryRows(
    queryFn: (q) => q
        .eq(
          'user_id',
          user.id,
        )
        .eq('event_id', event.id),
  );

  return result.length >= event.maxActivitiesPerUser;
}
