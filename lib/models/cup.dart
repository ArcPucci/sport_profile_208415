import 'package:flutter/material.dart';

class Cup {
  final Color color;
  final String asset;

  Cup({required this.color, required this.asset});

  Map<String, dynamic> toMap() {
    return {'color': color.toARGB32(), 'asset': asset};
  }

  factory Cup.fromMap(Map<String, dynamic> map) {
    return Cup(
      color: Color(map['color'] as int),
      asset: map['asset'] as String,
    );
  }
}
