export 'package:vector_math/vector_math_64.dart' show Vector2;

import 'dart:math';
import 'dart:ui';

import 'package:vector_math/vector_math_64.dart';

extension Vector2Extension on Vector2 {
  /// Creates an [Offset] from the [Vector2]
  Offset toOffset() => Offset(x, y);

  /// Creates a [Size] from the [Vector2]
  Size toSize() => Size(x, y);

  /// Creates a [Point] from the [Vector2]
  Point toPoint() => Point(x, y);

  /// Creates a [Rect] starting from [x, y] and having size [to].
  Rect toRect(Vector2 to) => Rect.fromLTWH(x, y, to.x, to.y);

  /// Creates a [Rect] starting in origin and having size [to].
  Rect toOriginRect() => Rect.fromLTWH(0, 0, x, y);

  /// Linearly interpolate towards another Vector2
  void lerp(Vector2 to, double t) {
    setFrom(this + (to - this) * t);
  }

  /// Rotates the [Vector2] with [angle] in radians
  void rotate(double angle) {
    setValues(
      x * cos(angle) - y * sin(angle),
      x * sin(angle) + y * cos(angle),
    );
  }

  /// Changes the [length] of the vector to the length provided, without changing direction.
  ///
  /// If you try to scale the zero (empty) vector, it will remain unchanged, and no error will be thrown.
  void scaleTo(double newLength) {
    final l = length;
    if (l != 0) {
      scale(newLength.abs() / l);
    }
  }
}
