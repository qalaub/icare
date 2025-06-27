import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesRecord extends FirestoreRecord {
  FavoritesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "professionalRef" field.
  DocumentReference? _professionalRef;
  DocumentReference? get professionalRef => _professionalRef;
  bool hasProfessionalRef() => _professionalRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _professionalRef = snapshotData['professionalRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoritesRecord.fromSnapshot(s));

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoritesRecord.fromSnapshot(s));

  static FavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoritesRecordData({
  DocumentReference? userID,
  DocumentReference? professionalRef,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'professionalRef': professionalRef,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoritesRecordDocumentEquality implements Equality<FavoritesRecord> {
  const FavoritesRecordDocumentEquality();

  @override
  bool equals(FavoritesRecord? e1, FavoritesRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.professionalRef == e2?.professionalRef &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FavoritesRecord? e) =>
      const ListEquality().hash([e?.userID, e?.professionalRef, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is FavoritesRecord;
}
