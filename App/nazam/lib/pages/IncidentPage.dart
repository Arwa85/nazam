import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient_colored_slider/gradient_colored_slider.dart';
import '/components/AppBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class incidentPage extends StatefulWidget {
  //const incidentPage({Key?key}):super(key: key);
  @override
  _incidentPageState createState() => _incidentPageState();
  
}
class _incidentPageState extends State<incidentPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

void addIncident(String incidentType,String location,String date,String time,String riskLevel,String description ,String writtenByName,String writtenIdNumber ) async{
try{
  await firestore.collection('incident').doc().set({
    'incidentType': incidentType,
    'location': location,
    'date': date,
    'time': time,
    'riskLevel': riskLevel,
    'description': description,
    'writtenByName': writtenByName,
    'writtenIdNumber': writtenIdNumber,
  });
}catch(e){

}

   }

final _formKey = GlobalKey<FormState>();
final List<String> incidentTypes = ['سرقة', 'اختراق أمني', 'إصابة طالب', 'تسرب كيميائي','عطل كهربائي','تفعيل إنذار الحريق'];
String? selectedIncidentType;
String? customIncidentType;
TextEditingController otherIncidentTypeController = TextEditingController();
int sliderValue = 1;
static const _TOP_SLIDER_MAX_STEP = 5;
  int _intValue = 0;
  double _topSliderValue = 0.3;


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
 int _rangedSelectedValue(int maxSteps, double value) {
    double stepRange = 1.0 / maxSteps;
    return (value / stepRange + 1).clamp(1, maxSteps).toInt();
  }

  String incidentType="", location="", date="", time="", riskLevel="", description ="", wriiteByName="", writtenIdNumber="";
  TextEditingController locationController=  TextEditingController();
  TextEditingController dateController=  TextEditingController();
  TextEditingController timeController=  TextEditingController();
  TextEditingController riskLevelController=  TextEditingController();
  TextEditingController descriptionController=  TextEditingController();
  TextEditingController writtenByController=  TextEditingController();
  TextEditingController writtenIdController=  TextEditingController();
void getCurrentUser() async{
      try {
      final User? user =await  firebaseAuth.currentUser;
      final uid = await user?.uid.toString();
      print("=========================================");
      print(user!.email.toString());
      print(uid!);
      FirebaseFirestore.instance
          .collection('Users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.id);
          print(element['name']);
         if( element.id== uid){
           setState(() {
             writtenByController.text = element['name'];
             wriiteByName =element['name'];
             writtenIdController.text = uid;
             writtenIdNumber = uid;
           });
         }
        });
      });


      print("=========================================");

    }catch( e){
      print(e);
    }

  }
@override
void dispose() {
  super.dispose();
  otherIncidentTypeController.dispose();
  getCurrentUser();

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
              Container(
  width: 1000,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Color(0xFF00676F), width: 3.0),
  ),
  child: DropdownButton<String>(
    isExpanded: true,
    style: TextStyle(color: Color(0xFF00676F), fontSize: 16),
    value: selectedIncidentType,
    elevation: 16,
    underline: DropdownButtonHideUnderline(
      child: Container(),
    ),
    onChanged: (String? newValue) {
      setState(() {
        if (newValue == 'اخرى') {
          selectedIncidentType = newValue;
          customIncidentType = '';
        } else {
          selectedIncidentType = newValue;
        }
      });
    },
    items: [
      ...incidentTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      DropdownMenuItem<String>(
        value: 'اخرى',
        child: Text('اخرى'),
      ),
    ],
  ),
),
if (selectedIncidentType == 'اخرى')
  TextFormField(
    onChanged: (value) {
      setState(() {
        customIncidentType = value;
      });
    },
    decoration: InputDecoration(
      labelText: 'نوع الحادث الجديد',
    ),
  ),
                          SizedBox(height: 25),
  
TextFormField(
  controller: locationController,
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
                      controller: timeController,
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
                      controller: dateController,
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
          controller: descriptionController,
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
            
              SizedBox(height: 30,),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 220,
              child: GradientColoredSlider(
                value: _topSliderValue,
                barWidth: 8,
                barSpace: 4,
                onChanged: (double value) {
                  setState(() {
                    _topSliderValue = value;
                    _intValue = _rangedSelectedValue(_TOP_SLIDER_MAX_STEP, _topSliderValue);
                  });
                },
              ),
            ),
           SizedBox(width: 10,),
                Expanded(
                   child: Text(' مستوى الخطورة',
                    style: TextStyle(
                      color: Color(0xFF2B656D),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Arial',
                    ),
                    ),
                    ),
                ]
              ),
 
              Row(
                children: [
                  Expanded(
                    child: Text('        1         2         3         4         5',
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
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
              onTap: () {
                //
              },
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 25,
                    color:Color(0xFF2B656D),
                  ),
                
                ],
                
              ),
            ),
                  

                  SizedBox(width: 60,),
                  Expanded(
                    child: ElevatedButton(
                    onPressed: (){
                     showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('هل أنت متأكد من إرسال الحادث؟'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('نعم'),
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Color(0xFF00676F)),
                          ),
                          onPressed: () {
                            
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('لا'),
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Color(0xFF00676F)),
                          ),
                          onPressed: () {
                           
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                    setState(() {
                  location= locationController.text .trim() ;
                  date=dateController.text.trim();
                  time=timeController.text.trim();
                   description=descriptionController.text.trim() ;
                   wriiteByName=writtenByController.text.trim() ;
                   writtenIdNumber=writtenIdController.text.trim() ;
                   riskLevel=_intValue.toString();
                   incidentType =selectedIncidentType.toString();
                });
                
                addIncident(incidentType, location, date, time, riskLevel, description , wriiteByName, writtenIdNumber );
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFF00676F),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),),
                  child:Text("إبلاغ عن الحادث",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    ),
                  )
                  )
                    ),  
                ]
                ),
],
),
),
)
);
}
}




/* Slider(
              value: sliderValue.toDouble(),
              min: 1,
              max: 5,
              onChanged: (value) {
                setState(() {
                  sliderValue = value.toInt();
                  
                });
              },
              divisions: 4,
              label: sliderValue.toString(),
            ),
 */

                       
                          
                          //////////////////////////////////////////////////////////////////////////////
                          /*
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
              */