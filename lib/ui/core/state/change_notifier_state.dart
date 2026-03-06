// Implementação padrão usando ChangeNotifier
import 'package:glorious_tcc/ui/core/state/state_manager.dart';
import 'package:glorious_tcc/ui/core/state/view_state.dart';
import 'package:flutter/material.dart';
// import 'state_manager.dart';

class ChangeNotifierState<T> extends ChangeNotifier implements StateManager<T> {
  T _state;
  ViewState _viewState = ViewState.initial;
  String? _errorMessage;

  ChangeNotifierState(this._state);

  @override
  T get state => _state;
  @override
  ViewState get viewState => _viewState;
  @override
  String? get errorMessage => _errorMessage;

  @override
  void setState(
    T newState, {
    ViewState viewState = ViewState.success,
    String? error,
  }) {
    
    final hasChanged =
        _state != newState || _viewState != viewState || _errorMessage != error;

    if (!hasChanged) return;

    _state = newState;
    _viewState = viewState;
    _errorMessage = error;

    notifyListeners();
  }

  @override
  void setLoading() => setState(
        _state,
        viewState: ViewState.loading,
        error: null,
      );

  @override
  void setFailure(String error) => setState(
        _state,
        viewState: ViewState.failure,
        error: error,
      );

  @override
  void setSuccess(T newState) => setState(
        newState,
        viewState: ViewState.success,
        error: null,
      );
}
