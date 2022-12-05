import 'database.dart';
import 'time_period.dart';
import 'property.dart';

/// Important metrics that are being optimized in the project.
class Criterion implements RankedData {
  @override
  int? id;

  @override
  int? rank;

  /// An optional name for this [Criterion].
  String? name;

  /// The property to optimize. If null, represents total time units for the plan.
  Property? property;

  /// Whether the criteria should maximize a particular statistic. Defaults to false.
  bool maximize;

  /// Whether this [Criterion] applies to an entire project or a specific time frame.
  bool global;

  /// A potential time [TimePeriod] to apply the [Criterion] to. If null, the threshold will apply to each [TimeUnit]. Ignored if global is set to true.
  TimePeriod? period;

  Criterion({
    this.rank,
    this.name,
    this.property,
    this.maximize = false,
    this.global = true,
    this.period,
  });

  @override
  String get dataName {
    // Return name if the name is not null
    if (name != null && name!.isNotEmpty) {
      return name!;
    }

    // Return the default name with the criteria parameters
    return '${maximize ? 'Maximize' : 'Minimize'} ${property?.dataName ?? 'Time Units'} for ${global == true || period == null ? 'Plan' : period!.name}';
  }

  @override
  int get uniquenessHash => dataName.hashCode;

  @override
  Criterion get copy => Criterion(
        rank: rank,
        name: name,
        property: property,
        maximize: maximize,
        global: global,
        period: period,
      )..id = id;
}
