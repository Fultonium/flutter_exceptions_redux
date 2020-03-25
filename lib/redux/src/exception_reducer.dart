import 'package:redux/redux.dart';

import './exception_actions.dart';

import './exception_state.dart';

final exceptionReducers = combineReducers<ExceptionState>([
  TypedReducer<ExceptionState, ExceptionThrownAction>(
      (ExceptionState state, ExceptionThrownAction action) {
    List<Map> newHistory = List.from(state.exceptionHistory);
    newHistory.add({
      "message": action.exception.toString(),
      "type": action.exceptionType.toString(),
      "stacktrace": action.stackTrace.toString(),
    });

    if (newHistory.length > action.exceptionHistorySize) {
      newHistory.removeRange(
          0, newHistory.length - action.exceptionHistorySize);
    }

    return state.copyWith(
      exceptionHistory: newHistory,
    );
  }),
]);
