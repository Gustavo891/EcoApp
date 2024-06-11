import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSetRecord extends FirestoreRecord {
  QuizSetRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "duracao" field.
  int? _duracao;
  int get duracao => _duracao ?? 0;
  bool hasDuracao() => _duracao != null;

  // "total_questoes" field.
  int? _totalQuestoes;
  int get totalQuestoes => _totalQuestoes ?? 0;
  bool hasTotalQuestoes() => _totalQuestoes != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "recompensa" field.
  int? _recompensa;
  int get recompensa => _recompensa ?? 0;
  bool hasRecompensa() => _recompensa != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _duracao = castToType<int>(snapshotData['duracao']);
    _totalQuestoes = castToType<int>(snapshotData['total_questoes']);
    _desc = snapshotData['desc'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _recompensa = castToType<int>(snapshotData['recompensa']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizSet');

  static Stream<QuizSetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSetRecord.fromSnapshot(s));

  static Future<QuizSetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSetRecord.fromSnapshot(s));

  static QuizSetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizSetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizSetRecordData({
  String? name,
  int? duracao,
  int? totalQuestoes,
  String? desc,
  String? imagem,
  int? recompensa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'duracao': duracao,
      'total_questoes': totalQuestoes,
      'desc': desc,
      'imagem': imagem,
      'recompensa': recompensa,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizSetRecordDocumentEquality implements Equality<QuizSetRecord> {
  const QuizSetRecordDocumentEquality();

  @override
  bool equals(QuizSetRecord? e1, QuizSetRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.duracao == e2?.duracao &&
        e1?.totalQuestoes == e2?.totalQuestoes &&
        e1?.desc == e2?.desc &&
        e1?.imagem == e2?.imagem &&
        e1?.recompensa == e2?.recompensa;
  }

  @override
  int hash(QuizSetRecord? e) => const ListEquality().hash([
        e?.name,
        e?.duracao,
        e?.totalQuestoes,
        e?.desc,
        e?.imagem,
        e?.recompensa
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizSetRecord;
}
