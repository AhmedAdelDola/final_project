import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String? subValue;
  final String? subLabel;
  final String? label;
  final Color color;
  final IconData icon;
  final Color? iconColor;
  final double percent;
  final Color progressColor;
  final bool showHeartbeat;
  final bool showindicator;
  final bool RowChild;

  const ActivityCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    this.subValue,
    this.subLabel,
    this.label,
    required this.color,
    required this.icon,
    this.iconColor,
    required this.percent,
    required this.progressColor,
    this.showHeartbeat = false,
    this.showindicator = true,
    required this.RowChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color == Colors.white ? Colors.black : Colors.white,
                ),
              ),
              Icon(
                icon,
                color: iconColor ?? Colors.white,
                size: 24,
              ),
            ],
          ),

          SizedBox(
            height: 20.h,
          ),

          // Heartbeat line (only for heart card)
          if (showHeartbeat)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomPaint(
                  size: const Size(double.infinity, 30),
                  painter: HeartbeatPainter(lineColor: Colors.red),
                ),
              ),
            ),

          // Circular Progress Indicator
          if (showindicator)
            Center(
              child: label != null
                  ? Column(
                      children: [
                        Text(
                          label!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 8.0,
                          percent: percent,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: color == Colors.white
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              Text(
                                unit,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: color == Colors.white
                                      ? Colors.grey
                                      : Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          progressColor: progressColor,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ],
                    )
                  : CircularPercentIndicator(
                      radius: 45.0,
                      lineWidth: 8.0,
                      percent: percent,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: color == Colors.white
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            unit,
                            style: TextStyle(
                              fontSize: 12,
                              color: color == Colors.white
                                  ? Colors.grey
                                  : Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      progressColor: progressColor,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
            ),

          // Subvalue if present
          if (subValue != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RowChild
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subValue!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color == Colors.white
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            subLabel ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: color == Colors.white
                                  ? Colors.grey
                                  : Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subValue!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: color == Colors.white
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            subLabel ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: color == Colors.white
                                  ? Colors.grey
                                  : Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
        ],
      ),
    );
  }
}

// Custom Painter for the heartbeat line
class HeartbeatPainter extends CustomPainter {
  final Color lineColor;

  HeartbeatPainter({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();

    // Starting point
    path.moveTo(0, size.height / 2);

    // First small bump
    path.lineTo(size.width * 0.1, size.height / 2);
    path.lineTo(size.width * 0.2, size.height * 0.4);
    path.lineTo(size.width * 0.3, size.height / 2);

    // Big spike
    path.lineTo(size.width * 0.4, size.height / 2);
    path.lineTo(size.width * 0.45, size.height * 0.1);
    path.lineTo(size.width * 0.5, size.height * 0.9);
    path.lineTo(size.width * 0.55, size.height * 0.1);
    path.lineTo(size.width * 0.6, size.height / 2);

    // End with another small bump
    path.lineTo(size.width * 0.7, size.height / 2);
    path.lineTo(size.width * 0.8, size.height * 0.4);
    path.lineTo(size.width * 0.9, size.height / 2);
    path.lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
