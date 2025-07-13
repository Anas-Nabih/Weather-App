import 'package:weather_app/src/features/weather/domain/entities/condition_entity.dart';
 
class ConditionModel extends ConditionEntity {
  const ConditionModel({
    required super.text,
    required super.icon,
    required super.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}
