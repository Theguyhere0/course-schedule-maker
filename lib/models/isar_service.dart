import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'activity_constraint.dart';
import 'activity_instance.dart';
import 'activity_unit.dart';
import 'criteria.dart';
import 'label.dart';
import 'project_constraint.dart';
import 'property_data.dart';
import 'property_definition.dart';

final isarServiceProvider = Provider<IsarService>(((ref) => IsarService()));

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = Isar.open(
      schemas: [
        ActivityConstraintSchema,
        ActivityInstanceSchema,
        ActivityUnitSchema,
        CriteriaSchema,
        LabelSchema,
        ProjectConstraintSchema,
        PropertyDataSchema,
        PropertyDefinitionSchema,
      ],
      // inspector: true,
    );
  }

  Future<void> saveActivityConstraint(
      ActivityConstraint newActivityConstraint) async {
    final isar = await db;
    isar.writeTxn((isar) async =>
        await isar.activityConstraints.put(newActivityConstraint));
  }

  Future<List<ActivityConstraint>> getAllActivityConstraints() async {
    final isar = await db;
    return isar.activityConstraints.where().findAll();
  }

  Stream<List<ActivityConstraint>> listenToActivityConstraints() async* {
    final isar = await db;
    yield* isar.activityConstraints.where().watch(initialReturn: true);
  }

  Future<void> saveActivityInstance(
      ActivityInstance newActivityInstance) async {
    final isar = await db;
    isar.writeTxn(
        (isar) async => await isar.activityInstances.put(newActivityInstance));
  }

  Future<List<ActivityInstance>> getAllActivityInstances() async {
    final isar = await db;
    return isar.activityInstances.where().findAll();
  }

  Future<void> saveActivityUnit(ActivityUnit newActivityUnit) async {
    final isar = await db;
    isar.writeTxn(
        (isar) async => await isar.activityUnits.put(newActivityUnit));
  }

  Future<List<ActivityUnit>> getAllActivityUnits() async {
    final isar = await db;
    return isar.activityUnits.where().findAll();
  }

  Future<void> saveCriteria(Criteria newCriteria) async {
    final isar = await db;
    isar.writeTxn((isar) async => await isar.criterias.put(newCriteria));
  }

  Future<List<Criteria>> getAllCriteria() async {
    final isar = await db;
    return isar.criterias.where().findAll();
  }

  Future<void> saveLabel(Label newLabel) async {
    final isar = await db;
    isar.writeTxn((isar) async => await isar.labels.put(newLabel));
  }

  Future<List<Label>> getAllLabels() async {
    final isar = await db;
    return isar.labels.where().findAll();
  }

  Future<void> saveProjectConstraint(
      ProjectConstraint newProjectConstraint) async {
    final isar = await db;
    isar.writeTxn((isar) async =>
        await isar.projectConstraints.put(newProjectConstraint));
  }

  Future<List<ProjectConstraint>> getAllProjectConstraints() async {
    final isar = await db;
    return isar.projectConstraints.where().findAll();
  }

  Future<void> savePropertyData(PropertyData newPropertyData) async {
    final isar = await db;
    isar.writeTxn(
        (isar) async => await isar.propertyDatas.put(newPropertyData));
  }

  Future<List<PropertyData>> getAllPropertyData() async {
    final isar = await db;
    return isar.propertyDatas.where().findAll();
  }

  Future<void> savePropertyDefinition(
      PropertyDefinition newPropertyDefinition) async {
    final isar = await db;
    isar.writeTxn((isar) async =>
        await isar.propertyDefinitions.put(newPropertyDefinition));
  }

  Future<List<PropertyDefinition>> getAllPropertyDefinitions() async {
    final isar = await db;
    return isar.propertyDefinitions.where().findAll();
  }

  Future<void> clean() async {
    final isar = await db;
    await isar.writeTxn((isar) => isar.clear());
  }
}
