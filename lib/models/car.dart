import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  String name;
  String imageSrc;
  String category;
  String drive;
  num power;
  dynamic weight;
  dynamic speed;
  dynamic acceleration;
  dynamic cornering;
  dynamic braking;
  dynamic stability;
  dynamic global;
  dynamic credit;
  
  Car({this.name,
      String imageSrc,
      this.category,
      this.drive,
      this.power,
      this.weight,
      this.speed,
      this.acceleration,
      this.cornering,
      this.braking,
      this.stability,
      this.global,
      this.credit}) {
    assert(name != null);
    assert(category != null);
    assert(drive != null);

    this.imageSrc = imageSrc != null ? 'https://www.kudosprime.com/gts/${imageSrc.replaceAll('side', 'big')}' : "";
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    assert(json != null);
    return _$CarFromJson(json);
  }
}
