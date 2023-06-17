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

Future<ProfileStruct?> getProfile(String userUuid) async {
  final result = await UsersTable().queryRows(
    queryFn: (q) => q.eq(
      'user_uuid',
      userUuid,
    ),
  );

  if (result.isNotEmpty) {
    final user = result[0];
    return ProfileStruct(
        uuid: user.userUuid, name: user.name, pictureUrl: user.pictureUrl);
  }

  return null;
}
