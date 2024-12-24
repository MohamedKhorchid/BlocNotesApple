import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteRecord extends FirestoreRecord {
  NoteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "contenu" field.
  String? _contenu;
  String get contenu => _contenu ?? '';
  bool hasContenu() => _contenu != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _contenu = snapshotData['contenu'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('note');

  static Stream<NoteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NoteRecord.fromSnapshot(s));

  static Future<NoteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NoteRecord.fromSnapshot(s));

  static NoteRecord fromSnapshot(DocumentSnapshot snapshot) => NoteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NoteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NoteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NoteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NoteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNoteRecordData({
  String? titre,
  String? contenu,
  DateTime? date,
  String? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'contenu': contenu,
      'date': date,
      'userID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class NoteRecordDocumentEquality implements Equality<NoteRecord> {
  const NoteRecordDocumentEquality();

  @override
  bool equals(NoteRecord? e1, NoteRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.contenu == e2?.contenu &&
        e1?.date == e2?.date &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(NoteRecord? e) =>
      const ListEquality().hash([e?.titre, e?.contenu, e?.date, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is NoteRecord;
}
