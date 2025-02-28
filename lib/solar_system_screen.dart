import 'package:flutter_animation_staggered/asteroid_belt.dart';
import 'package:flutter_animation_staggered/glowing_effect.dart';
import 'package:flutter_animation_staggered/moon.dart';
import 'package:flutter_animation_staggered/planet.dart';
import 'package:flutter_animation_staggered/ring_painter.dart';
import 'package:flutter_animation_staggered/star_painter.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class SolarSystemScreen extends StatefulWidget {
  const SolarSystemScreen({Key? key}) : super(key: key);

  @override
  State<SolarSystemScreen> createState() => _SolarSystemScreenState();
}

class _SolarSystemScreenState extends State<SolarSystemScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  double _zoom = 1.0;

  final List<Planet> _planets = [
    Planet(
      name: 'Mercury',
      distanceFromSun: 58,
      size: 12,
      color: Colors.grey,
      orbitalPeriod: 88,
      rotationSpeed: 58.6,
    ),
    Planet(
      name: 'Venus',
      distanceFromSun: 108,
      size: 18,
      color: Color(0xFFE39E1C),
      orbitalPeriod: 225,
      rotationSpeed: 243,
    ),
    Planet(
      name: 'Earth',
      distanceFromSun: 150,
      size: 20,
      color: Colors.blue,
      orbitalPeriod: 365,
      rotationSpeed: 5,
      moons: [
        Moon(
          name: 'Moon',
          distanceFromPlanet: 30,
          size: 10,
          color: Colors.grey,
          orbitalPeriod: 27.3,
        ),
      ],
    ),
    Planet(
      name: 'Mars',
      distanceFromSun: 208,
      size: 16,
      color: Colors.red.shade800,
      orbitalPeriod: 687,
      rotationSpeed: 3.03,
    ),
    // Planet(
    //   name: 'Ceres',
    //   distanceFromSun: 414,
    //   size: 15,
    //   color: Colors.grey.shade400,
    //   orbitalPeriod: 1682,
    //   rotationSpeed: 0.38,
    //   isDwarf: true,
    // ),
    Planet(
      name: 'Jupiter',
      distanceFromSun: 258,
      size: 40,
      color: Color(0xFFE8B77D),
      orbitalPeriod: 3333,
      rotationSpeed: 1.41,
      hasRings: true,
      ringColor: Colors.amber.withOpacity(0.3),
    ),
    Planet(
      name: 'Saturn',
      distanceFromSun: 307,
      size: 36,
      color: Color(0xFFEFD9A7),
      orbitalPeriod: 8759,
      rotationSpeed: 1.34,
      hasRings: true,
      ringColor: Colors.amber.withOpacity(0.5),
    ),
    Planet(
      name: 'Uranus',
      distanceFromSun: 351,
      size: 30,
      color: Color(0xFFB5E3E3),
      orbitalPeriod: 28687,
      rotationSpeed: 2.72,
      hasRings: true,
      ringColor: Colors.lightBlue.withOpacity(0.2),
    ),
    Planet(
      name: 'Neptune',
      distanceFromSun: 408,
      size: 28,
      color: Colors.blue.shade900,
      orbitalPeriod: 55190,
      rotationSpeed: 2.67,
      hasRings: true,
      ringColor: Colors.indigo.withOpacity(0.2),
      moons: [
        Moon(
          name: 'Triton',
          distanceFromPlanet: 45,
          size: 5,
          color: Colors.pink.shade100,
          orbitalPeriod: 5.9,
        ),
      ],
    ),
    Planet(
      name: 'Pluto',
      distanceFromSun: 456,
      size: 16,
      color: Colors.brown.shade300,
      orbitalPeriod: 85560,
      rotationSpeed: 6.39,
      isDwarf: true,
      moons: [
        Moon(
          name: 'Charon',
          distanceFromPlanet: 20,
          size: 3,
          color: Colors.grey.shade500,
          orbitalPeriod: 6.4,
        ),
      ],
    ),
    // Planet(
    //   name: 'Haumea',
    //   distanceFromSun: 6452,
    //   size: 14,
    //   color: Colors.white,
    //   orbitalPeriod: 104025,
    //   rotationSpeed: 0.16,
    //   isDwarf: true,
    // ),
    // Planet(
    //   name: 'Makemake',
    //   distanceFromSun: 6850,
    //   size: 15,
    //   color: Colors.brown.shade200,
    //   orbitalPeriod: 111900,
    //   rotationSpeed: 0.95,
    //   isDwarf: true,
    // ),
    // Planet(
    //   name: 'Eris',
    //   distanceFromSun: 10125,
    //   size: 16,
    //   color: Colors.white,
    //   orbitalPeriod: 204600,
    //   rotationSpeed: 1.08,
    //   isDwarf: true,
    // ),
    // Planet(
    //   name: 'Sedna',
    //   distanceFromSun: 12800,
    //   size: 14,
    //   color: Colors.red.shade700,
    //   orbitalPeriod: 4200000,
    //   rotationSpeed: 10.0,
    //   isDwarf: true,
    // ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, size.height),
            painter: StarsPainter(),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _zoom = math.min(2.0, _zoom + 0.1);
                    });
                  },
                ),
                Text('${(_zoom * 100).toInt()}%'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _zoom = math.max(0.5, _zoom - 0.1);
                    });
                  },
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return GestureDetector(
                onScaleUpdate: (details) {
                  setState(() {
                    _zoom = math.max(0.5, math.min(2.0, details.scale));
                  });
                },
                child: Stack(
                  children: [
                    ..._planets.map((planet) {
                      return Center(
                        child: Container(
                          width: planet.distanceFromSun * 2 * _zoom,
                          height: planet.distanceFromSun * 2 * _zoom,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    }),
                    Center(
                      child: CustomPaint(
                        size: Size(
                          520 * _zoom,
                          520 * _zoom,
                        ),
                        painter: AsteroidBeltPainter(),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: GlowingEffect(color: Colors.yellow),
                      ),
                    ),
                    ..._planets.map((planet) {
                      final angle = 2 *
                          math.pi *
                          (_controller.value / (planet.orbitalPeriod / 365));
                      final planetX = centerX +
                          math.cos(angle) * planet.distanceFromSun * _zoom;
                      final planetY = centerY +
                          math.sin(angle) * planet.distanceFromSun * _zoom;

                      final planetWidgets = <Widget>[];

                      planetWidgets.add(
                        Positioned(
                          left: planetX - (planet.size * _zoom / 2),
                          top: planetY - (planet.size * _zoom / 2),
                          child: Column(
                            children: [
                              SizedBox(
                                width: planet.size * _zoom,
                                height: planet.size * _zoom,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: planet.size * _zoom,
                                      height: planet.size * _zoom,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: planet.color,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                planet.color.withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (planet.hasRings)
                                      Positioned.fill(
                                        child: CustomPaint(
                                          painter: RingsPainter(
                                            color: planet.ringColor!,
                                            inner: 0.8,
                                            outer: 1.5,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (_zoom > 0.8)
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(top: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    planet.isDwarf
                                        ? '${planet.name} (Dwarf)'
                                        : planet.name,
                                    style: TextStyle(
                                      fontSize: 10 * _zoom,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );

                      if (planet.moons != null) {
                        for (var moon in planet.moons!) {
                          final moonAngle = 2 *
                              math.pi *
                              (_controller.value * 10 / moon.orbitalPeriod);
                          final moonX = planetX +
                              math.cos(moonAngle) *
                                  moon.distanceFromPlanet *
                                  _zoom;
                          final moonY = planetY +
                              math.sin(moonAngle) *
                                  moon.distanceFromPlanet *
                                  _zoom;

                          planetWidgets.add(
                            Positioned(
                              left: moonX - (moon.size * _zoom / 2),
                              top: moonY - (moon.size * _zoom / 2),
                              child: Column(
                                children: [
                                  Container(
                                    width: moon.size * _zoom,
                                    height: moon.size * _zoom,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: moon.color,
                                    ),
                                  ),
                                  if (_zoom > 1.3)
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      margin: const EdgeInsets.only(top: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        moon.name,
                                        style: TextStyle(
                                          fontSize: 8 * _zoom,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }
                      }

                      return Stack(children: planetWidgets);
                    }),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
