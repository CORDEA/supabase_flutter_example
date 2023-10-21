import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes.freezed.dart';

@Freezed(copyWith: false)
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes.tops({
    @Default(0) int id,
    required String name,
    required int width,
    required int length,
    required int sleeveLength,
    required int shoulderWidth,
    required String? imageId,
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
        'image_id': e.imageId,
      },
    );
  }

  static Clothes fromMap(Map<String, dynamic> map) {
    if (map['type'] == 0) {
      return Clothes.tops(
        id: map['id'],
        name: map['name'],
        width: map['width'],
        length: map['length'],
        sleeveLength: map['sleeve_length'],
        shoulderWidth: map['shoulder_width'],
        imageId: map['image_id'],
      );
    }
    throw UnimplementedError();
  }
}
