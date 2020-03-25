// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionState _$ExceptionStateFromJson(Map json) {
  return $checkedNew('ExceptionState', json, () {
    final val = ExceptionState(
      exceptionHistory: $checkedConvert(json, 'exceptionHistory',
          (v) => (v as List)?.map((e) => e as Map)?.toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$ExceptionStateToJson(ExceptionState instance) =>
    <String, dynamic>{
      'exceptionHistory': instance.exceptionHistory,
    };
