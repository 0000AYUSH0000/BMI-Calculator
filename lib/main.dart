import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(


      debugShowCheckedModeBanner: false,

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage>{

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = " ";
  var bgColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR BMI'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI', style: TextStyle(
                  fontSize:35, fontWeight: FontWeight.w700
                ),),

                SizedBox(height: 21),

                TextField(
                  controller: wtController ,
                  decoration: InputDecoration(
                    label: Text('Enter you Weight in Kg'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 13),

                TextField(
                  controller: ftController ,
                  decoration: InputDecoration(
                    label: Text('Enter you Height (in Feet)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 13),

                TextField(
                  controller: inController ,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Inches)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 17),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch =inController.text.toString();

                  if(wt!="" && ft!="" && inch!="")
                    {
                      //bmicalc
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch;
                      var tCm= tInch*2.54;
                      var tM = tCm/100;

                      var bmi= iWt/(tM*tM);
                      var msg = "";

                      if(bmi>30)
                        {
                          msg = "You are Obese";
                          bgColor = Colors.redAccent.shade400;

                        }
                      else if(bmi>25 && bmi<=30)
                        {
                          msg = "You are Overweight";
                          bgColor = Colors.orangeAccent.shade400;
                        }
                      else if(bmi<18)
                        {
                          msg = "You are Underweight";
                          bgColor = Colors.redAccent.shade400;
                        }
                      else
                        {
                          msg= "You are Healthy!";
                          bgColor = Colors.greenAccent.shade400;
                        }

                      setState(() {
                        result= "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });


                    }
                  else
                    {
                      bgColor = Colors.black38;
                      setState((){
                         result="Please fill all the required details!";
                       }) ;
                    }

                }, child: Text('CALCULATE') ),

                SizedBox(height: 12),

                Text(result, style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),

    );
  }
}

