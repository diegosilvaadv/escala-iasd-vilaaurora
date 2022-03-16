import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_limpeza_record.g.dart';

abstract class EscalaLimpezaRecord
    implements Built<EscalaLimpezaRecord, EscalaLimpezaRecordBuilder> {
  static Serializer<EscalaLimpezaRecord> get serializer =>
      _$escalaLimpezaRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DateTime get data;

  @nullable
  String get img;

  @nullable
  bool get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EscalaLimpezaRecordBuilder builder) => builder
    ..nome = ''
    ..img = ''
    ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_limpeza');

  static Stream<EscalaLimpezaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaLimpezaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaLimpezaRecord._();
  factory EscalaLimpezaRecord(
          [void Function(EscalaLimpezaRecordBuilder) updates]) =
      _$EscalaLimpezaRecord;

  static EscalaLimpezaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaLimpezaRecordData({
  String nome,
  DateTime data,
  String img,
  bool status,
}) =>
    serializers.toFirestore(
        EscalaLimpezaRecord.serializer,
        EscalaLimpezaRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img
          ..status = status));
