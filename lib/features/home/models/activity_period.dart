enum ActivityPeriod {
  today,
  thisWeek,
  thisMonth,
  all;

  String get label => switch (this) {
    ActivityPeriod.today => 'Hari Ini',
    ActivityPeriod.thisWeek => 'Minggu Ini',
    ActivityPeriod.thisMonth => 'Bulan Ini',
    ActivityPeriod.all => 'Semua',
  };
}
