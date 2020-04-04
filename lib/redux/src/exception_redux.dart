import 'package:redux/redux.dart';

import 'exception_actions.dart';

class ExceptionRedux<T> {
  Function(dynamic, dynamic) exceptionHandler;
  int exceptionHistorySize;

  ExceptionRedux({
    /// Callback for thrown exceptions
    this.exceptionHandler,

    /// Maximum number of exceptions stored in the ExceptionState
    this.exceptionHistorySize = 5,
  });

  /// Creates the middleware using the current configuration
  List<Middleware<T>> createExceptionMiddleware() {
    return [
      (Store<T> store, dynamic action, NextDispatcher next) {
        try {
          next(action);
        } catch (e, s) {
          store.dispatch(ExceptionThrownAction(
            exception: e,
            exceptionType: e.runtimeType,
            stackTrace: s,
            exceptionHistorySize: this.exceptionHistorySize,
          ));
          exceptionHandler?.call(e, s);
        }
      }
    ];
  }
}
