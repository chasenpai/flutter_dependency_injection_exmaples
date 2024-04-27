import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mask/domain/model/store.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Store> stores,
    @Default(false) bool isLoading,
  }) = _MainState;

  factory MainState.fromJson(Map<String, dynamic> json) => _$MainStateFromJson(json);
}