import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizCompletedRecord extends FirestoreRecord {
  QuizCompletedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "resultado" field.
  int? _resultado;
  int get resultado => _resultado ?? 0;
  bool hasResultado() => _resultado != null;

  // "corretas" field.
  List<DocumentReference>? _corretas;
  List<DocumentReference> get corretas => _corretas ?? const [];
  bool hasCorretas() => _corretas != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _resultado = castToType<int>(snapshotData['resultado']);
    _corretas = getDataList(snapshotData['corretas']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quiz_completed')
          : FirebaseFirestore.instance.collectionGroup('quiz_completed');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('quiz_completed').doc(id);

  static Stream<QuizCompletedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizCompletedRecord.fromSnapshot(s));

  static Future<QuizCompletedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizCompletedRecord.fromSnapshot(s));

  static QuizCompletedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizCompletedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizCompletedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizCompletedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizCompletedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizCompletedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizCompletedRecordData({
  DocumentReference? quiz,
  int? resultado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz': quiz,
      'resultado': resultado,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizCompletedRecordDocumentEquality
    implements Equality<QuizCompletedRecord> {
  const QuizCompletedRecordDocumentEquality();

  @override
  bool equals(QuizCompletedRecord? e1, QuizCompletedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quiz == e2?.quiz &&
        e1?.resultado == e2?.resultado &&
        listEquality.equals(e1?.corretas, e2?.corretas);
  }

  @override
  int hash(QuizCompletedRecord? e) =>
      const ListEquality().hash([e?.quiz, e?.resultado, e?.corretas]);

  @override
  bool isValidKey(Object? o) => o is QuizCompletedRecord;
}
