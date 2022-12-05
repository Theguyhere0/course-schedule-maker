import 'package:flutter/material.dart';

import 'activity_constraint.dart';
import 'activity_unit.dart';
import 'criterion.dart';
import 'database.dart';
import 'dependency.dart';
import 'time_period.dart';
import 'project_constraint.dart';
import 'property.dart';

/// The top level metadata for a project.
@immutable
class ProjectState {
  /// The name for activity units in this project.
  final String activityUnitName;

  /// The plural variant of the name for activity units in this project.
  final String activityUnitPluralName;

  /// The name for time units in this project.
  final String timeUnitName;

  /// The plural variant of the name for time units in this project.
  final String timeUnitPluralName;

  /// A buffer for modifying a [Property] safely.
  final Property bufferedProperty;

  /// A buffer for modifying a [TimePeriod] safely.
  final TimePeriod bufferedTimePeriod;

  /// A buffer for modifying an [ActivityUnit] safely.
  final ActivityUnit bufferedActivityUnit;

  /// A buffer for modifying an [ActivityConstraint] safely.
  final ActivityConstraint bufferedActivityConstraint;

  /// A buffer for modifying a [Dependency] safely.
  final Dependency bufferedDependency;

  /// A buffer for modifying a [Dependency] safely.
  final ProjectConstraint bufferedProjectConstraint;

  /// A buffer for modifying a [Criterion] safely.
  final Criterion bufferedCriterion;

  /// The [Database] of all [Property]s for the project.
  final Database<Property> properties;

  /// The [Database] for all [TimePeriod]s for the project
  final Database<TimePeriod> timePeriods;

  /// The [Database] for all [ActivityUnit]s for the project
  final Database<ActivityUnit> activityUnits;

  /// The [Database] for all [ProjectConstraint]s for the project
  final Database<ProjectConstraint> projectConstraints;

  /// The [Database] for all [Criterion] for the project
  final Database<Criterion> criteria;

  const ProjectState({
    this.activityUnitName = '',
    this.activityUnitPluralName = '',
    this.timeUnitName = '',
    this.timeUnitPluralName = '',
    required this.bufferedProperty,
    required this.bufferedTimePeriod,
    required this.bufferedActivityUnit,
    required this.bufferedActivityConstraint,
    required this.bufferedDependency,
    required this.bufferedProjectConstraint,
    required this.bufferedCriterion,
    required this.properties,
    required this.timePeriods,
    required this.activityUnits,
    required this.projectConstraints,
    required this.criteria,
  });

  ProjectState copyWith({
    String? activityUnitName,
    String? activityUnitPluralName,
    String? timeUnitName,
    String? timeUnitPluralName,
    Property? bufferedProperty,
    TimePeriod? bufferedTimePeriod,
    ActivityUnit? bufferedActivityUnit,
    ActivityConstraint? bufferedActivityConstraint,
    Dependency? bufferedDependency,
    ProjectConstraint? bufferedProjectConstraint,
    Criterion? bufferedCriterion,
    Database<Property>? properties,
    Database<TimePeriod>? timePeriods,
    Database<ActivityUnit>? activityUnits,
    Database<ProjectConstraint>? projectConstraints,
    Database<Criterion>? criteria,
  }) {
    return ProjectState(
      activityUnitName: activityUnitName ?? this.activityUnitName,
      activityUnitPluralName:
          activityUnitPluralName ?? this.activityUnitPluralName,
      timeUnitName: timeUnitName ?? this.timeUnitName,
      timeUnitPluralName: timeUnitPluralName ?? this.timeUnitPluralName,
      bufferedProperty: bufferedProperty ?? this.bufferedProperty,
      bufferedTimePeriod: bufferedTimePeriod ?? this.bufferedTimePeriod,
      bufferedActivityUnit: bufferedActivityUnit ?? this.bufferedActivityUnit,
      bufferedActivityConstraint:
          bufferedActivityConstraint ?? this.bufferedActivityConstraint,
      bufferedDependency: bufferedDependency ?? this.bufferedDependency,
      bufferedProjectConstraint:
          bufferedProjectConstraint ?? this.bufferedProjectConstraint,
      bufferedCriterion: bufferedCriterion ?? this.bufferedCriterion,
      properties: properties ?? this.properties,
      timePeriods: timePeriods ?? this.timePeriods,
      activityUnits: activityUnits ?? this.activityUnits,
      projectConstraints: projectConstraints ?? this.projectConstraints,
      criteria: criteria ?? this.criteria,
    );
  }

  String get displayActivityUnitName => activityUnitName.trim().isEmpty
      ? 'Activity Unit'
      : activityUnitName.trim();

  String get displayActivityUnitPluralName =>
      activityUnitPluralName.trim().isEmpty
          ? '${displayActivityUnitName}s'
          : activityUnitPluralName.trim();

  String get displayTimeUnitName =>
      timeUnitName.trim().isEmpty ? 'Time Unit' : timeUnitName.trim();

  String get displayTimeUnitPluralName => timeUnitPluralName.trim().isEmpty
      ? '${displayTimeUnitName}s'
      : timeUnitPluralName.trim();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectState &&
        other.activityUnitName == activityUnitName &&
        other.activityUnitPluralName == activityUnitPluralName &&
        other.timeUnitName == timeUnitName &&
        other.timeUnitPluralName == timeUnitPluralName &&
        other.bufferedProperty == bufferedProperty &&
        other.bufferedTimePeriod == bufferedTimePeriod &&
        other.bufferedActivityUnit == bufferedActivityUnit &&
        other.bufferedActivityConstraint == bufferedActivityConstraint &&
        other.bufferedDependency == bufferedDependency &&
        other.bufferedProjectConstraint == bufferedProjectConstraint &&
        other.bufferedCriterion == bufferedCriterion &&
        other.properties == properties &&
        other.timePeriods == timePeriods &&
        other.activityUnits == activityUnits &&
        other.projectConstraints == projectConstraints &&
        other.criteria == criteria;
  }

  @override
  int get hashCode {
    return activityUnitName.hashCode ^
        activityUnitPluralName.hashCode ^
        timeUnitName.hashCode ^
        timeUnitPluralName.hashCode ^
        bufferedProperty.hashCode ^
        bufferedTimePeriod.hashCode ^
        bufferedActivityUnit.hashCode ^
        bufferedActivityConstraint.hashCode ^
        bufferedDependency.hashCode ^
        bufferedProjectConstraint.hashCode ^
        bufferedCriterion.hashCode ^
        properties.hashCode ^
        timePeriods.hashCode ^
        activityUnits.hashCode ^
        projectConstraints.hashCode ^
        criteria.hashCode;
  }
}
