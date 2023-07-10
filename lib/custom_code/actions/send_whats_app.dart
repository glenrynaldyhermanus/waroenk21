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

import 'package:url_launcher/url_launcher.dart';

Future sendWhatsApp(String phone, String activityName) async {
  // open whatsapp via url using given phone number with some text
  String message = "Halo min, mau tanya tentang acara " + activityName;
  String url = "https://wa.me/$phone/?text=${Uri.encodeFull(message)}";
  await launchUrl(Uri.parse(url));
}
