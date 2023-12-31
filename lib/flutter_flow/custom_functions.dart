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

bool isActivityRegistrationHasSlot(
  int participants,
  int maxPariticpants,
) {
  if (participants < maxPariticpants) {
    return true;
  }
  return false;
}

bool hasParticipated(
  List<ActivityParticipantsRow> participants,
  int userId,
) {
  // return if participants contains userId
  for (final participant in participants) {
    if (participant.userId == userId) {
      return true;
    }
  }
  return false;
}

bool isActivityRegistrationAlreadyClose(
  DateTime openAt,
  DateTime closeAt,
) {
  // return true if now between openAt and closeAt
  final now = DateTime.now();
  return now.isAfter(closeAt);
}

bool isActivityRegistrationOpen(
  DateTime openAt,
  DateTime closeAt,
) {
  // return true if now between openAt and closeAt
  final now = DateTime.now();
  return now.isAfter(openAt) && now.isBefore(closeAt);
}

bool isActivityRegistrationAlreadyOpen(
  DateTime openAt,
  DateTime closeAt,
) {
  // return true if now between openAt and closeAt
  final now = DateTime.now();
  return now.isAfter(openAt);
}

bool isBelowMaximumActivitiesPerEvent(
  int participateCount,
  EventsRow? event,
) {
  if (event == null) {
    return true;
  }

  return participateCount < event.maxActivitiesPerUser;
}

bool isUserAlreadySelected(
  UsersRow user,
  List<TeammateStruct> selectedTeammate,
) {
  // return true if user already in selectedTeammate
  for (TeammateStruct teammate in selectedTeammate) {
    if (teammate.id == user.id) {
      return true;
    }
  }
  return false;
}

String? generateWhatsappUrl(
  String phone,
  String activityName,
) {
  String message = "Halo min, mau tanya tentang acara " + activityName;
  // generate whatsapp url from given phone and add some text
  return "https://wa.me/$phone/?text=${Uri.encodeFull(message)}";
}

DateTime timePlusTimezome(DateTime dateTime) {
  // return date time plus timezone
  final timeZoneOffset = dateTime.timeZoneOffset;
  final timeZoneHours = timeZoneOffset.inHours;
  final timeZoneMinutes = timeZoneOffset.inMinutes % 60;
  final newDateTime =
      dateTime.add(Duration(hours: timeZoneHours, minutes: timeZoneMinutes));
  return newDateTime;
}

DateTime timePlus7(DateTime dateTime) {
  // return date time plus seven hour
  return dateTime.add(Duration(hours: 7));
}

int getIndexOfCart(
  List<CartProductStruct> cart,
  int productId,
) {
  // return index if cart product id equals to productId
  for (int i = 0; i < cart.length; i++) {
    if (productId == cart[i].productId) {
      return i;
    }
  }
  return -1;
}

int getQuantityFromCart(
  List<CartProductStruct> cart,
  int productId,
) {
  // return quantity if cart is productId
  for (var item in cart) {
    if (item.productId == productId) {
      return item.quantity;
    }
  }
  return 0;
}
