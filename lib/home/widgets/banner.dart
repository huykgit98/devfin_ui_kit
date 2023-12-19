import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String imageUrl;

  const CustomBanner({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 56,
      child: SizedBox(
        width: 343,
        height: 141,
        child: Stack(
          children: [
            Container(
              width: 343,
              height: 141,
              decoration: ShapeDecoration(
                color: const Color(0xFF0063F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x13000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 59),
              width: 284,
              height: 141,
              child: Stack(
                children: [
                  Container(
                    width: 284,
                    height: 141,
                    decoration: ShapeDecoration(
                      color: const Color(
                          0xFF0063F5), // Changed color to 0xFF0063F5
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x13000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 20,
              top: 24,
              child: Text(
                'Welcome Agilan,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 47,
              child: Text(
                'Make your first Investment today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 90,
              child: Container(
                width: 92,
                height: 31,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Color(0xFFF8F9FA),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x13000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Invest Today',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0063F5),
                      fontSize: 12,
                      fontFamily: 'Circular Std',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
