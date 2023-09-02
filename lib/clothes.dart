import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes.freezed.dart';

@Freezed(copyWith: false)
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes.tops({
    required String name,
    required int width,
    required int length,
    required int sleeveLength,
    required int shoulderWidth,
  }) = _Tops;

  Map<String, dynamic> toMap() {
    return map(
      tops: (e) => {
        'type': 0,
        'name': e.name,
        'width': e.width,
        'length': e.length,
        'sleeve_length': e.sleeveLength,
        'shoulder_width': e.shoulderWidth,
      },
    );
  }
}
