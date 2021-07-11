enum AppState { loading, success, error, notInitialized }

typedef LoadingFunction<T> = T Function();
typedef ErrorFunction<T> = T Function();
typedef SuccessFunction<T> = T Function();
typedef NotInitializedFunction<T> = T Function();

extension WhenModifier<T> on AppState {
  T when({
    required LoadingFunction loading,
    required ErrorFunction error,
    required SuccessFunction success,
    NotInitializedFunction? notInitialized,
  }) {
    switch (this) {
      case AppState.error:
        return error();
      case AppState.loading:
        return loading();
      case AppState.notInitialized:
        return notInitialized!();
      default:
        return success();
    }
  }
}
