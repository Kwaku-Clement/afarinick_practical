import 'package:flutter/material.dart';

/// A container that supports inner shadows by painting them over the background
/// but clipped to the border radius.
class InnerShadowContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final List<BoxShadow>? innerShadows;

  const InnerShadowContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.innerShadows,
  });

  @override
  Widget build(BuildContext context) {
    final currentDecoration = decoration as BoxDecoration?;
    final borderRadius = currentDecoration?.borderRadius ?? BorderRadius.zero;
    final shape = currentDecoration?.shape ?? BoxShape.rectangle;

    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: CustomPaint(
        foregroundPainter: innerShadows != null && innerShadows!.isNotEmpty
            ? _InnerShadowPainter(
                shadows: innerShadows!,
                borderRadius: borderRadius is BorderRadius ? borderRadius : BorderRadius.zero,
                shape: shape,
              )
            : null,
        child: child,
      ),
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final List<BoxShadow> shadows;
  final BorderRadius borderRadius;
  final BoxShape shape;

  _InnerShadowPainter({
    required this.shadows,
    required this.borderRadius,
    required this.shape,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final path = shape == BoxShape.circle
        ? (Path()..addOval(rect))
        : (Path()..addRRect(borderRadius.toRRect(rect)));

    canvas.save();
    canvas.clipPath(path);

    for (final shadow in shadows) {
      final paint = Paint()
        ..color = shadow.color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow.blurRadius);

      // Calculate the "hole" path (screen + hole)
      // We want to draw a shape that is EVERYTHING EXCEPT the shadow casting source,
      // but offsetted.
      // Actually, for inner shadow:
      // We imagine a light source casting a shadow *inside* the hole.
      // This is simulated by drawing a large rectangle with a hole (the shape),
      // and drawing the shadow of *that* object.
      
      final shadowSpread = shadow.spreadRadius;
      final shadowOffset = shadow.offset;
      
      // Create a path that is the "outer" world minus the "inner" shape
      // But we need to inflate the inner shape by spreadRadius negatively?
      // No, for inner shadow, spread makes the shadow "choke" the content.
      
      // Correct approach for Inner Shadow:
      // 1. Create a large outer rect (bounds of screen or large enough).
      // 2. Subtract the shape from it.
      // 3. Draw the shadow of *this* resulting path (which is the "surrounding" area).
      // 4. The shadow will fall *inside* the shape because we clipped to the shape.
      
      final outerRect = rect.inflate(shadow.blurRadius + shadowSpread.abs() + 20.0);
      final outerPath = Path()
        ..addRect(outerRect)
        ..fillType = PathFillType.evenOdd;
        
      // If spread is positive, the shadow grows "inwards".
      // This means the "hole" should be smaller.
      // Wait, if I cast a shadow from a wall surrounding a hole:
      // If I move the wall closer (positive spread), the shadow covers more of the hole.
      // So yes, we should deflate the hole by spreadRadius?
      // Actually, BoxShadow spread adds to the size of the casting object.
      // Here the casting object is the "surrounding area".
      // If we expand the surrounding area (positive spread), it encroaches into the hole.
      // So we effectively deflate the hole path by spreadRadius.
      
      final spreadPath = shape == BoxShape.circle
        ? (Path()..addOval(rect.deflate(shadowSpread)))
        : (Path()..addRRect(borderRadius.toRRect(rect).deflate(shadowSpread)));
      
      outerPath.addPath(spreadPath, Offset.zero);
      // Because of evenOdd, the intersection (hole) is empty, so we have a path that is "everything except the hole".
      
      // Now translate this path by shadowOffset
      // And draw it.
      
      canvas.save();
      canvas.translate(shadowOffset.dx, shadowOffset.dy);
      canvas.drawPath(outerPath, paint);
      canvas.restore();
    }
    
    canvas.restore();
  }

  @override
  bool shouldRepaint(_InnerShadowPainter oldDelegate) {
    return oldDelegate.shadows != shadows ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.shape != shape;
  }
}
