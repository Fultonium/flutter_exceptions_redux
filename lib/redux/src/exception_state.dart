import 'package:json_annotation/json_annotation.dart';

part 'exception_state.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true, checked: true)
class ExceptionState {
  List<Map> exceptionHistory;

  ExceptionState({
    this.exceptionHistory,
  });

  /// Copies the [ExceptionState] with specified properties overwritten
  ExceptionState copyWith({
    List<Map> exceptionHistory,
  }) {
    return ExceptionState(
      exceptionHistory: exceptionHistory ?? this.exceptionHistory,
    );
  }

  /// Returns a copy of the [ExceptionState] with specified initial default values applied
  ExceptionState validate() {
    return this.copyWith(exceptionHistory: []);
  }

  /// Returns a default initialization of [ExceptionState]
  factory ExceptionState.initial() {
    return ExceptionState(
      exceptionHistory: [],
    );
  }

  factory ExceptionState.fromJson(Map<String, dynamic> json) =>
      _$ExceptionStateFromJson(json);
  Map<String, dynamic> toJson() => _$ExceptionStateToJson(this);
}
