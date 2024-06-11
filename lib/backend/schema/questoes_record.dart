import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestoesRecord extends FirestoreRecord {
  QuestoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  bool hasPergunta() => _pergunta != null;

  // "opcao1" field.
  String? _opcao1;
  String get opcao1 => _opcao1 ?? '';
  bool hasOpcao1() => _opcao1 != null;

  // "opcao2" field.
  String? _opcao2;
  String get opcao2 => _opcao2 ?? '';
  bool hasOpcao2() => _opcao2 != null;

  // "opcao3" field.
  String? _opcao3;
  String get opcao3 => _opcao3 ?? '';
  bool hasOpcao3() => _opcao3 != null;

  // "opcao4" field.
  String? _opcao4;
  String get opcao4 => _opcao4 ?? '';
  bool hasOpcao4() => _opcao4 != null;

  // "resposta" field.
  int? _resposta;
  int get resposta => _resposta ?? 0;
  bool hasResposta() => _resposta != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _pergunta = snapshotData['pergunta'] as String?;
    _opcao1 = snapshotData['opcao1'] as String?;
    _opcao2 = snapshotData['opcao2'] as String?;
    _opcao3 = snapshotData['opcao3'] as String?;
    _opcao4 = snapshotData['opcao4'] as String?;
    _resposta = castToType<int>(snapshotData['resposta']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('questoes')
          : FirebaseFirestore.instance.collectionGroup('questoes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('questoes').doc(id);

  static Stream<QuestoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestoesRecord.fromSnapshot(s));

  static Future<QuestoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestoesRecord.fromSnapshot(s));

  static QuestoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestoesRecordData({
  String? pergunta,
  String? opcao1,
  String? opcao2,
  String? opcao3,
  String? opcao4,
  int? resposta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pergunta': pergunta,
      'opcao1': opcao1,
      'opcao2': opcao2,
      'opcao3': opcao3,
      'opcao4': opcao4,
      'resposta': resposta,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestoesRecordDocumentEquality implements Equality<QuestoesRecord> {
  const QuestoesRecordDocumentEquality();

  @override
  bool equals(QuestoesRecord? e1, QuestoesRecord? e2) {
    return e1?.pergunta == e2?.pergunta &&
        e1?.opcao1 == e2?.opcao1 &&
        e1?.opcao2 == e2?.opcao2 &&
        e1?.opcao3 == e2?.opcao3 &&
        e1?.opcao4 == e2?.opcao4 &&
        e1?.resposta == e2?.resposta;
  }

  @override
  int hash(QuestoesRecord? e) => const ListEquality().hash(
      [e?.pergunta, e?.opcao1, e?.opcao2, e?.opcao3, e?.opcao4, e?.resposta]);

  @override
  bool isValidKey(Object? o) => o is QuestoesRecord;
}
