import 'data.dart';

/// A way to categorize, group, and divide up time units.
class Label implements Data {
  @override
  int? id;

  /// The name for this [Label].
  String name;

  /// How many time units this [Label] spans.
  int duration;

  /// On what time unit this [Label] starts.
  int start;

  /// The time units after the previous instance of this [Label] ends before it repeats, if it does.
  int? period;

  Label({required this.name, this.duration = 1, this.start = 1, this.period});

  Label.init()
      : name = '',
        duration = 1,
        start = 1;

  @override
  String get dataType => 'Label';

  @override
  String get dataName => name;

  @override
  Label get copy =>
      Label(name: name, duration: duration, start: start, period: period)
        ..id = id;
}
