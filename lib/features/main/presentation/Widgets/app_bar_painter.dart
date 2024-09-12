import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter{
  double x;
  AppBarPainter(this.x);
  double height=80.0;
  double start=40.0;
  double end=120.0;
  @override
  void paint(Canvas canvas, Size size) {
    var paint=Paint()
        ..color =  Colors.blueAccent.withOpacity(0.12)
        ..style = PaintingStyle.fill;
    var paintRRect=Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill;
    var path=Path();
    path.moveTo(0.0,start);

    path.lineTo((x) < 20.0 ? 20.0 : x,start);
    path.quadraticBezierTo(25.0 + x,start,35.0+x,start+35.0);
    path.quadraticBezierTo(45.0 + x,start+ 60.0,75.0 + x,start+60.0);
    path.quadraticBezierTo(105.0 + x,start+ 60.0,115.0+x,start+35.0);
    path.quadraticBezierTo(125.0 + x,start,
        (145+x) > (size.width - 25.0) ? (size.width -15.0) : 145+x,
        start);

    path.lineTo(size.width - 20.0, start);
    path.quadraticBezierTo(size.width, start, size.width, start+25.0);
    path.lineTo(size.width, end - 25.0);
    path.quadraticBezierTo(size.width,height, size.width,end);
    path.lineTo(25.0, end);
    path.quadraticBezierTo(0.0,end, 0.0,end);
    path.lineTo(0.0,start+25.0);
    path.quadraticBezierTo(0.0,start, 20.0,start);
    path.close();

    canvas.drawPath(path, paint);
    final circleCenter = Offset((70+x),50.0);
    const radius = 35.0;
    final rect = Rect.fromCenter(center: circleCenter, width: radius * 2, height: radius * 2);
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));
    canvas.drawRRect(rRect, paintRRect);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }
  
}