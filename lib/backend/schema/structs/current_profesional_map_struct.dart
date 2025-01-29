// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CurrentProfesionalMapStruct extends FFFirebaseStruct {
  CurrentProfesionalMapStruct({
    LatLng? sub,
    DocumentReference? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sub = sub,
        _id = id,
        super(firestoreUtilData);

  // "sub" field.
  LatLng? _sub;
  LatLng? get sub => _sub;
  set sub(LatLng? val) => _sub = val;

  bool hasSub() => _sub != null;

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;

  bool hasId() => _id != null;

  static CurrentProfesionalMapStruct fromMap(Map<String, dynamic> data) =>
      CurrentProfesionalMapStruct(
        sub: data['sub'] as LatLng?,
        id: data['id'] as DocumentReference?,
      );

  static CurrentProfesionalMapStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentProfesionalMapStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sub': _sub,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub': serializeParam(
          _sub,
          ParamType.LatLng,
        ),
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CurrentProfesionalMapStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CurrentProfesionalMapStruct(
        sub: deserializeParam(
          data['sub'],
          ParamType.LatLng,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'CurrentProfesionalMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentProfesionalMapStruct &&
        sub == other.sub &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([sub, id]);
}

CurrentProfesionalMapStruct createCurrentProfesionalMapStruct({
  LatLng? sub,
  DocumentReference? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentProfesionalMapStruct(
      sub: sub,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentProfesionalMapStruct? updateCurrentProfesionalMapStruct(
  CurrentProfesionalMapStruct? currentProfesionalMap, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentProfesionalMap
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentProfesionalMapStructData(
  Map<String, dynamic> firestoreData,
  CurrentProfesionalMapStruct? currentProfesionalMap,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentProfesionalMap == null) {
    return;
  }
  if (currentProfesionalMap.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      currentProfesionalMap.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentProfesionalMapData = getCurrentProfesionalMapFirestoreData(
      currentProfesionalMap, forFieldValue);
  final nestedData =
      currentProfesionalMapData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      currentProfesionalMap.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentProfesionalMapFirestoreData(
  CurrentProfesionalMapStruct? currentProfesionalMap, [
  bool forFieldValue = false,
]) {
  if (currentProfesionalMap == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentProfesionalMap.toMap());

  // Add any Firestore field values
  currentProfesionalMap.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentProfesionalMapListFirestoreData(
  List<CurrentProfesionalMapStruct>? currentProfesionalMaps,
) =>
    currentProfesionalMaps
        ?.map((e) => getCurrentProfesionalMapFirestoreData(e, true))
        .toList() ??
    [];
