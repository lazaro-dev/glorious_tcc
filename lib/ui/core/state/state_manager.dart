import 'package:glorious_tcc/ui/core/state/change_notifier_state.dart';
import 'package:glorious_tcc/ui/core/state/view_state.dart';

abstract class StateManager<T> {
  T get state;
  ViewState get viewState;
  String? get errorMessage;

  void setState(T newState, {ViewState viewState, String? error});
  void setLoading();
  void setFailure(String error);
  void setSuccess(T newState);

  /// Factory para criação dinâmica do gerenciador de estados
  factory StateManager(T initialState) => ChangeNotifierState(initialState);
}

