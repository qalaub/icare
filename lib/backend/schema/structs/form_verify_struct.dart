// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FormVerifyStruct extends FFFirebaseStruct {
  FormVerifyStruct({
    bool? subur,
    bool? date,
    bool? dropdown,
    bool? dropdown2,
    bool? confirm1,
    bool? confirm2,
    bool? same,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subur = subur,
        _date = date,
        _dropdown = dropdown,
        _dropdown2 = dropdown2,
        _confirm1 = confirm1,
        _confirm2 = confirm2,
        _same = same,
        super(firestoreUtilData);

  // "subur" field.
  bool? _subur;
  bool get subur => _subur ?? true;
  set subur(bool? val) => _subur = val;

  bool hasSubur() => _subur != null;

  // "date" field.
  bool? _date;
  bool get date => _date ?? true;
  set date(bool? val) => _date = val;

  bool hasDate() => _date != null;

  // "dropdown" field.
  bool? _dropdown;
  bool get dropdown => _dropdown ?? true;
  set dropdown(bool? val) => _dropdown = val;

  bool hasDropdown() => _dropdown != null;

  // "dropdown2" field.
  bool? _dropdown2;
  bool get dropdown2 => _dropdown2 ?? true;
  set dropdown2(bool? val) => _dropdown2 = val;

  bool hasDropdown2() => _dropdown2 != null;

  // "confirm1" field.
  bool? _confirm1;
  bool get confirm1 => _confirm1 ?? true;
  set confirm1(bool? val) => _confirm1 = val;

  bool hasConfirm1() => _confirm1 != null;

  // "confirm2" field.
  bool? _confirm2;
  bool get confirm2 => _confirm2 ?? true;
  set confirm2(bool? val) => _confirm2 = val;

  bool hasConfirm2() => _confirm2 != null;

  // "same" field.
  bool? _same;
  bool get same => _same ?? true;
  set same(bool? val) => _same = val;

  bool hasSame() => _same != null;

  static FormVerifyStruct fromMap(Map<String, dynamic> data) =>
      FormVerifyStruct(
        subur: data['subur'] as bool?,
        date: data['date'] as bool?,
        dropdown: data['dropdown'] as bool?,
        dropdown2: data['dropdown2'] as bool?,
        confirm1: data['confirm1'] as bool?,
        confirm2: data['confirm2'] as bool?,
        same: data['same'] as bool?,
      );

  static FormVerifyStruct? maybeFromMap(dynamic data) => data is Map
      ? FormVerifyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subur': _subur,
        'date': _date,
        'dropdown': _dropdown,
        'dropdown2': _dropdown2,
        'confirm1': _confirm1,
        'confirm2': _confirm2,
        'same': _same,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subur': serializeParam(
          _subur,
          ParamType.bool,
        ),
        'date': serializeParam(
          _date,
          ParamType.bool,
        ),
        'dropdown': serializeParam(
          _dropdown,
          ParamType.bool,
        ),
        'dropdown2': serializeParam(
          _dropdown2,
          ParamType.bool,
        ),
        'confirm1': serializeParam(
          _confirm1,
          ParamType.bool,
        ),
        'confirm2': serializeParam(
          _confirm2,
          ParamType.bool,
        ),
        'same': serializeParam(
          _same,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FormVerifyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormVerifyStruct(
        subur: deserializeParam(
          data['subur'],
          ParamType.bool,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.bool,
          false,
        ),
        dropdown: deserializeParam(
          data['dropdown'],
          ParamType.bool,
          false,
        ),
        dropdown2: deserializeParam(
          data['dropdown2'],
          ParamType.bool,
          false,
        ),
        confirm1: deserializeParam(
          data['confirm1'],
          ParamType.bool,
          false,
        ),
        confirm2: deserializeParam(
          data['confirm2'],
          ParamType.bool,
          false,
        ),
        same: deserializeParam(
          data['same'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FormVerifyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormVerifyStruct &&
        subur == other.subur &&
        date == other.date &&
        dropdown == other.dropdown &&
        dropdown2 == other.dropdown2 &&
        confirm1 == other.confirm1 &&
        confirm2 == other.confirm2 &&
        same == other.same;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subur, date, dropdown, dropdown2, confirm1, confirm2, same]);
}

FormVerifyStruct createFormVerifyStruct({
  bool? subur,
  bool? date,
  bool? dropdown,
  bool? dropdown2,
  bool? confirm1,
  bool? confirm2,
  bool? same,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormVerifyStruct(
      subur: subur,
      date: date,
      dropdown: dropdown,
      dropdown2: dropdown2,
      confirm1: confirm1,
      confirm2: confirm2,
      same: same,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormVerifyStruct? updateFormVerifyStruct(
  FormVerifyStruct? formVerify, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formVerify
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormVerifyStructData(
  Map<String, dynamic> firestoreData,
  FormVerifyStruct? formVerify,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formVerify == null) {
    return;
  }
  if (formVerify.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formVerify.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formVerifyData = getFormVerifyFirestoreData(formVerify, forFieldValue);
  final nestedData = formVerifyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formVerify.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormVerifyFirestoreData(
  FormVerifyStruct? formVerify, [
  bool forFieldValue = false,
]) {
  if (formVerify == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formVerify.toMap());

  // Add any Firestore field values
  formVerify.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormVerifyListFirestoreData(
  List<FormVerifyStruct>? formVerifys,
) =>
    formVerifys?.map((e) => getFormVerifyFirestoreData(e, true)).toList() ?? [];
