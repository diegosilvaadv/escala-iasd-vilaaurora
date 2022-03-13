import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_sonoplastia_record.g.dart';

abstract class EscalaSonoplastiaRecord
    implements Built<EscalaSonoplastiaRecord, EscalaSonoplastiaRecordBuilder> {
  static Serializer<EscalaSonoplastiaRecord> get serializer =>
      _$escalaSonoplastiaRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DateTime get data;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EscalaSonoplastiaRecordBuilder builder) =>
      builder
        ..nome = ''
        ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_sonoplastia');

  static Stream<EscalaSonoplastiaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaSonoplastiaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaSonoplastiaRecord._();
  factory EscalaSonoplastiaRecord(
          [void Function(EscalaSonoplastiaRecordBuilder) updates]) =
      _$EscalaSonoplastiaRecord;

  static EscalaSonoplastiaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaSonoplastiaRecordData({
  String nome,
  DateTime data,
  String img,
}) =>
    serializers.toFirestore(
        EscalaSonoplastiaRecord.serializer,
        EscalaSonoplastiaRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img));
