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

Future<bool> isParticipated(
  int userId,
  ActivitiesRow activity,
) async {
  final result = await ActivityTeamsTable().queryRows(
    queryFn: (q) => q
        .eq(
          'team_owner_id',
          userId,
        )
        .eq('activity_id', activity.id),
  );

  if (result.isNotEmpty) {
    return true;
  }

  return false;
}
