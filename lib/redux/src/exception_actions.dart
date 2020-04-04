class ExceptionThrownAction {
  dynamic exception;
  Type exceptionType;
  StackTrace stackTrace;
  int exceptionHistorySize;
  ExceptionThrownAction({
    this.exception,
    this.exceptionType,
    this.stackTrace,
    this.exceptionHistorySize,
  });
}
