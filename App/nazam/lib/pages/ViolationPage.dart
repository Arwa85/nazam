import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/components/AppBar.dart';
 

class ViolationPage extends StatefulWidget {
  @override
  State<ViolationPage> createState() => _ViolationPageState();
}
class _ViolationPageState extends State<ViolationPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

   void addViolation(String name,String idNumber, String violationDate,String violationTime,String violationKind,String description ,String writtenByName,String writtenIdNumber ) async{
try{
  await firestore.collection('violations').doc().set({
    'name': name,
    'idNumber': idNumber,
    'violationDate': violationDate,
    'violationTime': violationTime,
    'violationKind': violationKind,
    'description': description,
    'writtenByName': writtenByName,
    'writtenIdNumber' : writtenIdNumber
  });
}catch(e){

}

   }

   String name="", idNumber="",  violationDate="", violationTime="", violationKind="", description ="", wriiteByName="", writtenIdNumber="";
  TextEditingController nameController=  TextEditingController();
  TextEditingController idNumberController=  TextEditingController();
  TextEditingController dateController=  TextEditingController();
  TextEditingController timeController=  TextEditingController();
  TextEditingController descriptionController=  TextEditingController();
  TextEditingController writtenByController=  TextEditingController();
  TextEditingController writtenIdController=  TextEditingController();
  List<String> options = [
    'تنمر',
    'التخريب',
    'الغش',
    'تجاوز الحدود في الزي',
    'تجاور الحدود في الضوضاء',
    'سلوك غير لائق',
    'انتهاكات السياسات الأكاديمية',
    'السلوك العدواني او التهديد',
  ];
  void getCurrentUser() async{
    final User? user =  firebaseAuth.currentUser;
    final uid = user?.uid.toString();
    print("=========================================");
    print ( user!.email.toString());
    print (  uid!);
    setState(() {
      writtenByController.text= user!.email.toString();
      wriiteByName= user!.email.toString();
      writtenIdController.text=uid!;
      writtenIdNumber=uid!;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(),
      appBar:   CustomAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0), // Add this line
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 200,
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 20),
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
                          label: Text("الاسم",style:   TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color(0xFF00676F)),),
                          //hintText: 'ميعاد العقيل',

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      style: TextStyle(fontSize: 26),
                      controller: idNumberController,
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

                        label: Text("الرقم الجامعي",style:   TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color(0xFF00676F)),),

                        // hintText: '-',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ), SizedBox(
                  height: 20,  //زيادة المسافة هنا
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        style: TextStyle(fontSize: 20),
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

                          label: Text( "تاريخ المخالفة",style:   TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color:Color(0xFF00676F)),),

                          // hintText: '-',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ), SizedBox(
                      height: 40,  // زيادة المسافة هنا
                    ),
                    Flexible(
                      child: TextField(
                        style: TextStyle(fontSize: 26),
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
                          label: Text("وقت المخالفة",style:   TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color(0xFF00676F)),),
                          //hintText: '-',
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 55,  // زيادة المسافة هنا
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(

                      child:TextField(
                        style: TextStyle(fontSize: 20),
                        controller: descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: Text(" الوصف",style:   TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color(0xFF00676F)), ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(color: Color(0xFF00676F), width: 3.0),  // هذا يحدد لون الحدود وسماكتها
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            borderSide: BorderSide(color: Color(0xFF00676F), width: 3.0),  // هذا يحدد لون الحدود وسماكتها
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'نوع المخالفة',
                            labelStyle: TextStyle(color: Color(0xFF00676F),fontSize: 25,fontWeight: FontWeight.bold
                                 ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          child: Container(
                            width: 1000,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              style: TextStyle(color: Color(0xFF00676F),fontSize: 16),
                              value: violationKind.isEmpty ? null : violationKind,
                              elevation: 16,
                              underline: DropdownButtonHideUnderline(
                                child: Container(),
                              ),

                              onChanged: (String? newValue) {
                                setState(() {
                                  violationKind = newValue!;
                                });
                              },
                              items: options
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),  // تعديل المسافة من هنا
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تمت كتابته بواسطة",

                      style: TextStyle(fontSize: 20,color: Color(0xFF00676F), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 144, maxHeight: 80),  // حدد العرض الأقصى هنا
                        child: TextField(
                          controller: writtenByController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "الاسم",
                            // hintText: 'ميعاد العقيل',
                            labelStyle: TextStyle(fontSize: 20),  // تغيير حجم النص هنا
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),  // هنا يمكنك تعديل القيمة حسب الحاجة
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),

                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 140, maxHeight: 80),  // حدد العرض الأقصى هنا
                        child: TextField(
                          controller: writtenIdController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "الرقم الجامعي",
                            // hintText: '441003773',
                            labelStyle: TextStyle(fontSize: 20),  // تغيير حجم النص هنا
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              onPressed: () {


              },
              icon: Icon(Icons.arrow_back),
            ),
            SizedBox(width:50),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('هل أنت متأكد من إرسال المخالفة؟'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('نعم'),
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Color(0xFF00676F)),
                          ),
                          onPressed: () {
                            // هنا يمكنك وضع كود الأكشن الذي يجب أن يحدث عند الضغط على "نعم"
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('لا'),
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Color(0xFF00676F)),
                          ),
                          onPressed: () {
                            // هنا يمكنك وضع كود الأكشن الذي يجب أن يحدث عند الضغط على "لا"
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
//start validation
                setState(() {
                  name= nameController.text .trim() ;
                  idNumber=idNumberController.text.trim();
                  violationDate=dateController.text.trim();
                  violationTime=timeController.text.trim();
                   description=descriptionController.text.trim() ;
                });
                if(name.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error enter name!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                if(idNumber.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error enter id number!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);


                  return;
                }
                if(violationDate.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error enter violation date!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);


                  return;
                }
                if(violationTime.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error enter violation time!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);


                  return;
                }
                if(description.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error enter violation description!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  return;
                }
                if(violationKind.isEmpty){
                  const snackBar = SnackBar(
                    content: Text('Error choose violation kind!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  return;
                }
                print("=====================");

                setState(() {
                  wriiteByName=   writtenByController.text;
                  writtenIdNumber=writtenIdController.text;
                });


      addViolation( name, idNumber,  violationDate, violationTime, violationKind, description , wriiteByName, writtenIdNumber ) ;


              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  "ارسال المخالفة",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00676F),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
