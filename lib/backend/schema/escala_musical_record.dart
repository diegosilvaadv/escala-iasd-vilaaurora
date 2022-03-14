import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_musical_record.g.dart';

abstract class EscalaMusicalRecord
    implements Built<EscalaMusicalRecord, EscalaMusicalRecordBuilder> {
  static Serializer<EscalaMusicalRecord> get serializer =>
      _$escalaMusicalRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DateTime get data;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EscalaMusicalRecordBuilder builder) => builder
    ..nome = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_musical');

  static Stream<EscalaMusicalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaMusicalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaMusicalRecord._();
  factory EscalaMusicalRecord(
          [void Function(EscalaMusicalRecordBuilder) updates]) =
      _$EscalaMusicalRecord;

  static EscalaMusicalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaMusicalRecordData({
  String nome,
  DateTime data,
  String img,
}) =>
    serializers.toFirestore(
        EscalaMusicalRecord.serializer,
        EscalaMusicalRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img));
