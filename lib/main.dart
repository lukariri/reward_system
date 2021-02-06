import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingpractice1/title.dart';

void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reward System',

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
   }
  }

File _image;
int num_badge = 500;
var badge = 'Explorer';
int upload = 1;
int t_point = ++point;
int point = 15;
var check = false;
var greenColor = Color(0xff32a05f);
var darkGreenColor = Color(0xff279152);
var productImage =
    'https://i.pinimg.com/originals/8f/bf/44/8fbf441fa92b29ebd0f324effbd4e616.png';
var plant1 = 'Fiddle Leaf Fig Topiary';
var plant1_1= 'Ficus Lyrata';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white38,
       /* appBar: AppBar(
          backgroundColor: greenColor,
          title: Text('Florapedia'),
        ),                    */
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(45.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    children: <Widget>[
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8.0),
                          Icon(Icons.arrow_back),
                          SizedBox(height: 8.0),
                          Container(
                            width: 300.0,
                            child: Text(
                              '$plant1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32.0),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            '$plant1_1',
                            style: TextStyle(color: Colors.black45),
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[


                          //print(new Random().nextInt(MAX));
                              SizedBox(width: 4.0),
                              Text('$point points', //points here
                                  style: TextStyle(
                                      color: greenColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Spacer(
                            flex: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen()));
                                },
                                backgroundColor: greenColor,
                                child: Icon(Icons.add), //More Details
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 2.5,
                                width: MediaQuery.of(context).size.width / 2.5,
                                child:
                                  //Image.asset('assets/ficus.png')
                                _image == null ? Image.asset('assets/ficus.png') : Image.file(_image)

                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,             //Progress bar goes here
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 22.0),

                    Text('Total Points', style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white)),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$t_point',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 2.0),
                                  Text(
                                    'points',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: darkGreenColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    '$num_badge',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'points',
                                    style: TextStyle(color: Colors.white54),
                                  )
                                ],
                              ),

                              Text(
                                'for $badge title! ',
                                style: TextStyle(color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),

    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /* Text('Summary',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.1,
                        fontSize: 22.0)),*/
                SizedBox(height: 32.0),
                Container(
                  width: 200.0,
                  child: Text(
                    'You have, $t_point points!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0),
                  ),
                ),
                SizedBox(height: 42.0),
                itemRow(Icons.directions_walk , 'Steps', '3563'), //Number of steps taken
                SizedBox(height: 22.0),
                itemRow(Icons.file_upload, 'Uploads', '$upload'), //Number of photos uploaded

              ],
            ),
          ),
          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: darkGreenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      bottomLeft: Radius.circular(32.0))),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  SizedBox(width: 40.0),
                  Text(
                    'Go To Purchases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: darkGreenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      bottomLeft: Radius.circular(32.0))),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  SizedBox(width: 40.0),
                  Text(
                    'Upload History',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: darkGreenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      bottomLeft: Radius.circular(32.0))),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  SizedBox(width: 40.0),
                  Text(
                    'Share Upload',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 80.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
                Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Color(0xff2c2731),
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(48.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingScreen()));
                          },
                          backgroundColor: greenColor,
                          child: Icon(Icons.add_a_photo, color:Colors.white,), //More Details
                        ),

                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          'Upload Again',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  itemRow(icon, name, title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        Text(title, style: TextStyle(color: Colors.white54, fontSize: 20.0))
      ],
    );
  }
}


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {


  Future _getImage(BuildContext context)async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image= image;
      print('_image: $_image');
      //productImage = image; // show the destination of the file in windows

    });
    Navigator.of(context).pop();
  }


 _openCamera(BuildContext context) async{
    var cam = await ImagePicker.pickImage(source: ImageSource.camera);//purple tag points to device camera
    this.setState(() {
      _image = cam;
    });
    Navigator.of(context).pop(); //to close dialog
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return  showDialog(context:context, builder:(BuildContext context){
       return  AlertDialog(
                  content: SingleChildScrollView(
           child: ListBody(
             children: <Widget>[
               GestureDetector(
                 child:Text("Gallery"),
                 onTap:(){
                   //_openGallery(context);
                   _getImage(context);
                   check = true;

                 }

               ),
            Padding(padding: EdgeInsets.all(8.0))  ,     //Space between Gallery,Camera
            GestureDetector(
               child:Text("Camera"),
                onTap:(){
                  _openCamera(context);
                  check = true;
                }
            ),
      ],
           )

         ),
       );
    } );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click to Upload"),
      ),
          body: Container(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          _image == null ? Icon(Icons.add_circle) : Image.file(_image),
            Text("Select Image"),
          RaisedButton(onPressed:(){

            _showChoiceDialog(context);
            if(check == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()));
             // productImage = _image;
              check = false;
              t_point = t_point + point;
              upload += upload  ;
              plant1 = 'Donkeys Tail';
              plant1_1 = 'Sedum Morganianum';
            }

            print('You are here');
            //Image.file(imageFile,width:250,  height: 250);
           },child:Text("Select Image"),)
          ],
         ),
        ),
       ),
    );
  }
}

