class Student {
  Student({
   required this.name,
    required  this.sureName,
    required  this.number,
    this.id,});

  Student.fromJson(dynamic json) {
    name = json['name'];
    sureName = json['sureName'];
    number = json['number'];
    id = json['id'];
  }
 late String name;
 late String sureName;
 late String number;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['sureName'] = sureName;
    map['number'] = number;
    map['id'] = id;
    return map;
  }

}