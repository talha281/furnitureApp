import 'dart:convert';

class Category {
  final String? categoryName;
  final String? categoryId;

  Category(
    this.categoryName,
    this.categoryId,
  );

  Category copyWith({
    String? categoryName,
    String? categoryId,
  }) {
    return Category(
      categoryName ?? this.categoryName,
      categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryId': categoryId,
    };
  }

  factory Category.fromMap(Map<String, dynamic>? map) {
  
    return Category(
      map!['categoryName'],
      map['categoryId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(categoryName: $categoryName, categoryId: $categoryId)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Category &&
      o.categoryName == categoryName &&
      o.categoryId == categoryId;
  }

  @override
  int get hashCode => categoryName.hashCode ^ categoryId.hashCode;
}


