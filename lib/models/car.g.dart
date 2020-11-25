// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    name: json['name'] as String,
    imageSrc: json['imageSrc'] as String,
    category: json['category'] as String,
    drive: json['drive'] as String,
    power: json['power'] as num,
    weight: json['weight'],
    speed: json['speed'],
    acceleration: json['acceleration'],
    cornering: json['cornering'],
    braking: json['braking'],
    stability: json['stability'],
    global: json['global'],
    credit: json['credit'],
  );
}

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'name': instance.name,
      'imageSrc': instance.imageSrc,
      'category': instance.category,
      'drive': instance.drive,
      'power': instance.power,
      'weight': instance.weight,
      'speed': instance.speed,
      'acceleration': instance.acceleration,
      'cornering': instance.cornering,
      'braking': instance.braking,
      'stability': instance.stability,
      'global': instance.global,
      'credit': instance.credit,
    };
