import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedalhaRecord extends FirestoreRecord {
  MedalhaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  bool hasImagem() => _imagem != null;

  // "custo" field.
  int? _custo;
  int get custo => _custo ?? 0;
  bool hasCusto() => _custo != null;

  // "usuarios" field.
  List<DocumentReference>? _usuarios;
  List<DocumentReference> get usuarios => _usuarios ?? const [];
  bool hasUsuarios() => _usuarios != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _imagem = snapshotData['imagem'] as String?;
    _custo = castToType<int>(snapshotData['custo']);
    _usuarios = getDataList(snapshotData['usuarios']);
    _desc = snapshotData['desc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medalha');

  static Stream<MedalhaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedalhaRecord.fromSnapshot(s));

  static Future<MedalhaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedalhaRecord.fromSnapshot(s));

  static MedalhaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedalhaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedalhaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedalhaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedalhaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedalhaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedalhaRecordData({
  String? nome,
  String? imagem,
  int? custo,
  String? desc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'imagem': imagem,
      'custo': custo,
      'desc': desc,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedalhaRecordDocumentEquality implements Equality<MedalhaRecord> {
  const MedalhaRecordDocumentEquality();

  @override
  bool equals(MedalhaRecord? e1, MedalhaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.imagem == e2?.imagem &&
        e1?.custo == e2?.custo &&
        listEquality.equals(e1?.usuarios, e2?.usuarios) &&
        e1?.desc == e2?.desc;
  }

  @override
  int hash(MedalhaRecord? e) => const ListEquality()
      .hash([e?.nome, e?.imagem, e?.custo, e?.usuarios, e?.desc]);

  @override
  bool isValidKey(Object? o) => o is MedalhaRecord;
}
