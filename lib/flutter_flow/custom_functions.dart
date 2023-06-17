import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double getLatitude(LatLng latLng) {
  return latLng.latitude;
}

double getLongitude(LatLng latLng) {
  return latLng.longitude;
}

String getNameForGreeting(String name) {
  return name.split(" ").first;
}
