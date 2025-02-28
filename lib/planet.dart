import 'package:flutter/material.dart';
import 'package:flutter_animation_staggered/moon.dart';

class Planet {
  final String name;
  final double distanceFromSun;
  final double size;
  final Color color;
  final double orbitalPeriod;
  final double rotationSpeed;
  final List<Moon>? moons;
  final bool hasRings;
  final Color? ringColor;
  final bool isDwarf;

  Planet({
    required this.name,
    required this.distanceFromSun,
    required this.size,
    required this.color,
    required this.orbitalPeriod,
    required this.rotationSpeed,
    this.moons,
    this.hasRings = false,
    this.ringColor,
    this.isDwarf = false,
  });
}
