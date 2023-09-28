import 'package:flutter/material.dart';

class ViewIncidentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Incident Page'),
      ),
      body: Container(
        width: 360,
        height: 632,
        decoration: BoxDecoration(
          color: Color(0xFFEDEDED),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Rectangle 1
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 360,
                height: 26,
                color: Color(0xFFEEEBEB),
              ),
            ),

            // 10:12
            Positioned(
              top: 6,
              left: 5,
              child: Text(
                '10:12',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),

            // Rectangle 2 (hidden)
            Positioned(
              top: 6,
              left: 309,
              child: Visibility(
                visible: false,
                child: Container(
                  width: 22,
                  height: 16,
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),

            // 92%
            Positioned(
              top: 6,
              left: 313,
              child: Text(
                '92%',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),

            // Rectangle 4
            Positioned(
              top: 113,
              left: 0,
              child: Container(
                width: 360,
                height: 516,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Rectangle 13
                    Positioned(
                      top: 291,
                      left: 58,
                      child: Container(
                        width: 84,
                        height: 33,
                        color: Colors.white,
                      ),
                    ),

                    // Rectangle 5
                    Positioned(
                      top: 149,
                      left: 15,
                      child: Container(
                        width: 331,
                        height: 458,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFF518086), width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // Rectangle 37 (with image)
                    Positioned(
                      top: 465,
                      left: 233,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/image.png'), // Replace with your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // 🦆 icon "circle" 1
                    Positioned(
                      top: 337,
                      left: 199,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(0xFFF18536),
                          border: Border.all(
                            color: Color(0xFFF18536),
                            width: 3.37716,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // 🦆 icon "circle" 2
                    Positioned(
                      top: 467,
                      left: 199,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Color(0xFF7DF136),
                          border: Border.all(
                            color: Color(0xFF7DF136),
                            width: 3.37716,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Rectangle 9
                    Positioned(
                      top: 293,
                      left: 34,
                      child: Container(
                        width: 48,
                        height: 27,
                        color: Color(0xFF518086),
                        alignment: Alignment.center,
                        child: Text(
                          'للمزيد',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Rectangle 23
                    Positioned(
                      top: 423,
                      left: 34,
                      child: Container(
                        width: 48,
                        height: 27,
                        color: Color(0xFF518086),
                        alignment: Alignment.center,
                        child: Text(
                          'للمزيد',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Rectangle 24
                    Positioned(
                      top: 547,
                      left: 34,
                      child: Container(
                        width: 48,
                        height: 27,
                        color: Color(0xFF518086),
                        alignment: Alignment.center,
                        child: Text(
                          'للمزيد',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // اليوم: الاحد التاريخ:١٤٤٤/٥/١٣
                    Positioned(
                      top: 237,
                      left: 73,
                      child: Container(
                        alignment: Alignment.centerRight, // Corrected here
                        width: double.infinity,
                        child: Text(
                          'اليوم: الاحد التاريخ:١٤٤٤/٥/١٣',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF2B656D),
                          ),
                        ),
                      ),
                    ),

                    // اليوم: الاحد التاريخ:١٤٤٤/٥/١٣
                    Positioned(
                      top: 237,
                      left: 73,
                      child: Container(
                        alignment: Alignment.centerRight, // Corrected here
                        width: double.infinity,
                        child: Text(
                          'اليوم: الاحد التاريخ:١٤٤٤/٥/١٣',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF2B656D),
                          ),
                        ),
                      ),
                    ),

// اليوم: الثلاثاء التاريخ:١٤٤٤/٨/١٩
                    Positioned(
                      top: 363,
                      left: 67,
                      child: Container(
                        alignment: Alignment.centerRight, // Corrected here
                        width: double.infinity,
                        child: Text(
                          'اليوم: الثلاثاء التاريخ:١٤٤٤/٨/١٩',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF2B656D),
                          ),
                        ),
                      ),
                    ),

// اليوم: الاربعاء التاريخ:١٤٤٤/١٠/٣٠
                    Positioned(
                      top: 497,
                      left: 67,
                      child: Container(
                        alignment: Alignment.centerRight, // Corrected here
                        width: double.infinity,
                        child: Text(
                          'اليوم: الاربعاء التاريخ:١٤٤٤/١٠/٣٠',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF2B656D),
                          ),
                        ),
                      ),
                    ),

                    // حريق:
                    Positioned(
                      top: 207,
                      left: 148,
                      child: Text(
                        'حريق:',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFF13647),
                        ),
                      ),
                    ),

                    // سرقة:
                    Positioned(
                      top: 333,
                      left: 148,
                      child: Text(
                        'سرقة:',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFF18536),
                        ),
                      ),
                    ),

                    // نافذة مكسورة:
                    Positioned(
                      top: 463,
                      left: 82,
                      child: Text(
                        'نافذة مكسورة:',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF7DF136),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // unnamed 3 (with image)
            Positioned(
              top: 6,
              right: 138,
              child: Container(
                width: 89,
                height: 86,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/unnamed.png'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            // 🦆 icon "person"
            Positioned(
              top: 58,
              left: 23,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: Color(0xFF00676F),
                ),
              ),
            ),

            // Component 1 (menu)
            Positioned(
              top: 48,
              left: 299,
              child: Container(
                width: 47,
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 🦆 icon "menu"
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Color(0xFF00676F),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    // Frame 5 (inside Component 1)
                    Container(
                      width: 27,
                      height: 27,
                      child: Column(
                        children: [
                          // Rectangle 20
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/1280950.png'), // Replace with your image path
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                  color: Color(0xFF85A6AA), width: 2),
                            ),
                          ),

                          // Rectangle 21
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/theft-icon-9.png'), // Replace with your image path
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                  color: Color(0xFF85A6AA), width: 2),
                            ),
                          ),

                          // Lines
                          Container(
                            width: 306,
                            height: 1,
                            color: Color(0xFF85A6AA),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
