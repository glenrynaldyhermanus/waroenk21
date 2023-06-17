import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://hxxbqyjfpdtimaoysddy.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4eGJxeWpmcGR0aW1hb3lzZGR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODMzODA1NDEsImV4cCI6MTk5ODk1NjU0MX0.JQ_RWjD5YigxMBvi_lyD94etHdSTx1QQJZJ6pB8HbI0';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
