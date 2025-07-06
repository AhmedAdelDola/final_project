import 'package:autism_app/Core/Utils/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class VideoTrackingScreen extends StatefulWidget {
  const VideoTrackingScreen({Key? key}) : super(key: key);

  @override
  State<VideoTrackingScreen> createState() => _VideoTrackingScreenState();
}

class _VideoTrackingScreenState extends State<VideoTrackingScreen> {
  bool _hasVideos = false; // Toggle between the two screens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CustomBackButton(),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Video tracking',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button
                ],
              ),
            ),

            // Upload and Record Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.upload_outlined,
                          color: _hasVideos ? Colors.blue : Colors.black54,
                        ),
                        label: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 18,
                            color: _hasVideos ? Colors.blue : Colors.black54,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _hasVideos = true;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.videocam_outlined,
                          color: _hasVideos ? Colors.black54 : Colors.blue,
                        ),
                        label: Text(
                          'Record',
                          style: TextStyle(
                            fontSize: 18,
                            color: _hasVideos ? Colors.black54 : Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _hasVideos = false;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Main Content Area - Changes based on the state
            Expanded(
              child: _hasVideos ? _buildNoVideosView() : _buildRecordingView(),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(
                    _hasVideos ? 'Upload video' : 'Save',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // View for the "No videos currently" state with illustration
  Widget _buildNoVideosView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 220,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade300, width: 2),
          ),
          child: CustomPaint(
            painter: PersonWaitingPainter(),
            size: const Size(200, 180),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'No videos currently',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  // View for the "Wait for the scan results" state with recording option
  Widget _buildRecordingView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade300),
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.shade50,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.videocam, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                const Text(
                  'record live video for your child',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Wait for the scan results!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Custom painter to draw the waiting person illustration
class PersonWaitingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // This is a simplified representation
    // In a real app, you would use an actual image or SVG

    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Draw a simple figure (just a representative placeholder)
    // Head
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3),
      size.width * 0.1,
      paint,
    );

    // Body
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.4,
        size.height * 0.4,
        size.width * 0.2,
        size.height * 0.3,
      ),
      paint,
    );

    // For a real implementation, you should use an image asset instead
    // of this simplified drawing
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
