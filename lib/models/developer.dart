import 'dart:convert';

import 'package:hive_super_peer/models/model_mixins/coder.dart';
import 'package:hive_super_peer/models/person.dart';

class Developer extends Person with Coder {
  Developer({
    required super.name,
    required super.height,
    required super.weight,
  });

  factory Developer.initial() {
    return Developer.fromMap({});
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'weight': weight,
    };
  }

  factory Developer.fromMap(Map<String, dynamic> map) {
    return Developer(
      name: map['name'] ?? '',
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Developer.fromJson(String source) =>
      Developer.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Developer &&
        other.name == name &&
        other.height == height &&
        other.weight == weight;
  }

  @override
  int get hashCode => name.hashCode ^ height.hashCode ^ weight.hashCode;
}
