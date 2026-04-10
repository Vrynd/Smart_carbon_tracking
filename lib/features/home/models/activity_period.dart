enum ActivityPeriod {
  today,
  thisWeek,
  thisMonth,
  all;

  String get label => switch (this) {
    ActivityPeriod.today => 'Today',
    ActivityPeriod.thisWeek => 'Week',
    ActivityPeriod.thisMonth => 'Month',
    ActivityPeriod.all => 'Year',
  };
}
