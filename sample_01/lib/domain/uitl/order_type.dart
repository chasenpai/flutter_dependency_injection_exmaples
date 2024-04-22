import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type.freezed.dart';

@freezed
sealed class OrderType with _$OrderType {
  const factory OrderType.asc() = Asc;
  const factory OrderType.desc() = Desc;
}