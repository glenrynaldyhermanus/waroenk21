import '../database.dart';

class ActivityParticipantsTable extends SupabaseTable<ActivityParticipantsRow> {
  @override
  String get tableName => 'activity_participants';

  @override
  ActivityParticipantsRow createRow(Map<String, dynamic> data) =>
      ActivityParticipantsRow(data);
}

class ActivityParticipantsRow extends SupabaseDataRow {
  ActivityParticipantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityParticipantsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get activityId => getField<int>('activity_id')!;
  set activityId(int value) => setField<int>('activity_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  bool get isLeader => getField<bool>('is_leader')!;
  set isLeader(bool value) => setField<bool>('is_leader', value);

  int? get teamId => getField<int>('team_id');
  set teamId(int? value) => setField<int>('team_id', value);
}
