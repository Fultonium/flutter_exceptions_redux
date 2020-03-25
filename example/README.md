To instantiate and add middleware
```dart
ExceptionRedux<AppState> exceptionRedux = ExceptionRedux(
    exceptionHandler: (e) => print(e),
    exceptionHistorySize: 10,
store = Store<AppState>(
    middleware: exceptionRedux.createExceptionMiddleware()
      ..addAll(appMiddleware()),
  );
```

To add to app state:
```dart
class AppState {
  ...
  ExceptionState exceptionState;
  ...

  AppState(
    ...
    this.exceptionState,
    ...
  );

  AppState copyWith({
    ...
    ExceptionState exceptionState,
    ...
  }){
    return AppState(
      ...
      exceptionState: exceptionState ?? this.exceptionState,
      ...
    );
  }

  factory AppState.initial(){
    return AppState(
      ...
      exceptionState: ExceptionState.initial(),
      ...
    );
  }
}
```
To add the reducer:
```dart
AppState appReducer(AppState state, action) {
  return AppState(
    ...
    exceptionState: exceptionReducers(state.exceptionState, action),
    ...
  );
}
```