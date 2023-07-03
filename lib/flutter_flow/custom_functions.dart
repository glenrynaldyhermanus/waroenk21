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

int getLevel(String level) {
  return int.parse(level);
}

String getNameAbbrevation(String name) {
  // Get abbrevation max 2 of string from first letter of each words
  List<String> words = name.split(" ");
  String abbreviation = "";
  for (String word in words) {
    if (word.isNotEmpty) {
      abbreviation += word[0];
      if (abbreviation.length == 2) {
        break;
      }
    }
  }
  return abbreviation.toUpperCase();
}

int countParticipants(
  bool isTeam,
  int teamCounts,
  int individualCounts,
) {
  // if isTeam return teamCounts or else return individualCounts
  if (isTeam) {
    return teamCounts;
  } else {
    return individualCounts;
  }
}
