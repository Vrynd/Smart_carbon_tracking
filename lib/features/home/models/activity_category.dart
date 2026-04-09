enum ActivityCategory {
  all,
  transport,
  food,
  shopping,
  energy,
  waste;

  String get label => switch (this) {
    ActivityCategory.all => 'Semua',
    ActivityCategory.transport => 'Transport',
    ActivityCategory.food => 'Food & Drink',
    ActivityCategory.shopping => 'Shopping',
    ActivityCategory.energy => 'Energy',
    ActivityCategory.waste => 'Waste',
  };
}
