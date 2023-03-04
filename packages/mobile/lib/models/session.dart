import 'dart:convert';

class Session {
  String id;
  int durationInMinutes;
  String dietType;
  int calories;
  List<String> tags;
  // List<Ingredients> ingredients;

  Session({
    required this.id,
    this.durationInMinutes = 0,
    this.dietType = '',
    this.calories = 0,
    this.tags = const [],
    // this.ingredients = const []
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'durationInMinutes': durationInMinutes,
    'dietType': dietType,
    'calories': calories,
    'tags': tags
  };

  String toString() {
    return jsonEncode(toJson());
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    // final ingredients = <Ingredients>[];

    if (json['ingredients'] != null) {
      // json['ingredients'].forEach((v) {
        // ingredients.add(Ingredients.fromJson(v));
      // });
    }

    return Session(
      id: json['id'] ?? '',
      durationInMinutes: json['durationInMinutes'] ?? 0,
      dietType: json['dietType'] ?? '',
      calories: json['calories'] ?? 0,
      tags: json['tags'].cast<String>() ?? [],
      // ingredients: ingredients,
    );
  }
}
