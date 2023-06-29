import '../database.dart';

class ActivityTeamsTable extends SupabaseTable<ActivityTeamsRow> {
  @override
  String get tableName => 'activity_teams';

  @override
  ActivityTeamsRow createRow(Map<String, dynamic> data) =>
      ActivityTeamsRow(data);
}

class ActivityTeamsRow extends SupabaseDataRow {
  ActivityTeamsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityTeamsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get activityId => getField<int>('activity_id')!;
  set activityId(int value) => setField<int>('activity_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get teamOwnerId => getField<int>('team_owner_id')!;
  set teamOwnerId(int value) => setField<int>('team_owner_id', value);
}
