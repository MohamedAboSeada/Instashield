enum PasswordLevel { none, weak, fair, strong, good }

int mapLevelToIndex(PasswordLevel level) {
  return switch (level) {
    .none => -1,
    .weak => 0,
    .fair => 1,
    .good => 2,
    .strong => 3,
  };
}

String? mapLevelToValue(PasswordLevel level) {
  return switch (level) {
    .none => null,
    .weak => "Weak",
    .fair => "Fair",
    .good => "Good",
    .strong => "Strong",
  };
}
