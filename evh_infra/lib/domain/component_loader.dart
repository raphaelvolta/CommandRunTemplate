import 'dart:convert';

import 'default_component.dart';

class ComponentLoader{
  final List<DefaultComponent> components;

  const ComponentLoader({
    required this.components,
  });

  factory ComponentLoader.fromJson(Map<String, dynamic> json){
    var list = json['components'] as List;
    List<DefaultComponent> components = list.map((i) => DefaultComponent.fromJson(i)).toList();
    return ComponentLoader(components: components);
  }
}