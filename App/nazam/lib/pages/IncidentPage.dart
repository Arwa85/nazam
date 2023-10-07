import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_colored_slider/gradient_colored_slider.dart';
import '/components/AppBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class incidentPage extends StatefulWidget {
  const incidentPage({Key?key}):super(key: key);
  @override
  _incidentPageState createState() => _incidentPageState();
  
}
class _incidentPageState extends State<incidentPage> {
  final _formKey = GlobalKey<FormState>();
final List<String> incidentTypes = ['سرقة', 'اختراق أمني', 'إصابة طالب', 'تسرب كيميائي','عطل كهربائي','تفعيل إنذار الحريق'];
String? selectedincidentType;
TextEditingController otherIncidentTypeController = TextEditingController();
double sliderValue = 0.5;

File? image ;
File? videoFile;

List<File> videos = [];
List<File> images = [];


Future<void> getVideoFile() async {
final video = await ImagePicker().pickVideo(source: ImageSource.camera);
if (video == null) return;
final videoTemporary = File(video.path);
setState(() {
videoFile = videoTemporary;
});
}


  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    setState(() {
      images.add(File(pickedImage.path));
    });
  }

@override
void dispose() {
otherIncidentTypeController.dispose();
super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(),
      appBar:  CustomAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: selectedincidentType,
                onChanged: (newValue) {
                  setState(() {
                    selectedincidentType = newValue;
                  });},
                items: [
                  ...incidentTypes.map((type) => DropdownMenuItem<String>(
                        alignment: Alignment.centerRight,
                        value: type,
                        child: Text(type),
                      )),
                  DropdownMenuItem<String>(
                     alignment: Alignment.centerRight,
                    value: 'Other',
                    child: Text('أخرى'),
                  ),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text(" نوع الحادث"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى اختيار نوع الحادث';
                  }
                  if (value == 'Other' && otherIncidentTypeController.text.isEmpty) {
                    return 'يرجى إدخال نوع الحادث الجديد';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              if (selectedincidentType == 'Other')
                TextFormField(
                  controller: otherIncidentTypeController,
                  decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text(" نوع الحادث"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال نوع الحادث الجديد';
                    }
                    return null;
                  },
                ),
              if (selectedincidentType == 'Other')  
                SizedBox(height: 25),
              if (selectedincidentType != 'Other')
                SizedBox(height: 0),
              
TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text(" موقع الحادث"),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال موقع الحادث';
    }
    return null;
  },
),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                     decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text(" وقت الحادث"),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                  Expanded(
                    child: TextFormField(
             decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text("تاريخ الحادث"),
                    ),
                  ),
                ),
                ],
              ),
              SizedBox(height: 25),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Color(0xFF2B656D)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              
            GestureDetector(
              onTap: () {
                pickImages();
              },
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 25,
                    color: Color.fromARGB(255, 96, 96, 96),
                  ),
                  Text('التقط صور'),
                ],
                
              ),
            ),
            if(images.isNotEmpty)
Container(
width: 170,
height: 50,
decoration: BoxDecoration(
border: Border(
      bottom: BorderSide( //                   <--- left side
        color: Color.fromARGB(205, 238, 238, 238),
        width: 3.0,
      ),),

shape: BoxShape.rectangle,
),
child: ListView(
                scrollDirection: Axis.horizontal,
                children: images.map((image) {
                  return Container(
                    width: 50,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(3),
                      shape: BoxShape.rectangle,
                    ),
                    child: Image.file(
                      image,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
              
),
            GestureDetector(
              onTap: () {
                getVideoFile();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_camera_front,
                    size: 25,
                    color: Color.fromARGB(255, 96, 96, 96),
                  ),
                  Text('سجل مقاطع فيديو'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(width: 15),
    Expanded(
      child: Container(
        height: 220,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 3, color: Color(0xFF00676F)),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "وصف الحادث",
          ),
          maxLines: null,
          expands: true,
        ),
      ),
    ),
  ],
),

              SizedBox(height: 50,),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 210,
                  child:GradientColoredSlider(
                  value: sliderValue,
                  onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
             ),
                ),
                Expanded(
                   child: Text(' مستوى الخطورة',
                    style: TextStyle(
                      color: Color(0xFF2B656D),
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                    fontFamily: 'Arial',
                    ),
                    ),
                    ),
                ]
              ),
 
              Row(
                children: [
                  Expanded(
                    child: Text('     1         2         3         4         5',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    fontFamily: 'Arial',
                    ),
                    ),
                    ),
                ]
                ),
              SizedBox(height: 90),
              Row(
                children: [
                 ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 255, 255)),
                  child:Text("<",
                  style: TextStyle(
                    color: Color(0xFF2B656D),
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    ),
                  )
                  )
                ],
              ),
],
),
),
)
);
}
}
