import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';


class Login extends StatelessWidget {
  
  final _registerNoController = TextEditingController(); 
  final _dobController = TextEditingController(); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99baff),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.only(top: 200,left: 30),
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
            
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Sign In To \nYour Account",
            style: TextStyle(
              fontSize: 35 ,
              fontWeight: FontWeight.w900 ,
            )
            )),
          
          
          SizedBox(height: 20,),
          Container( height: 40 , width: 300 , child: 
          TextFormField(
            controller: _registerNoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
                             focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
              hintText: 'RegisterNo.',
              
              contentPadding: EdgeInsets.symmetric(horizontal: 10 )
              

            ),
          )),
          SizedBox(
            height: 20,
          ),
         Container( width: 300 , height: 40 , 
         child:  TextFormField(

            controller: _dobController,

            decoration: InputDecoration(
              border: OutlineInputBorder(),
               focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black87),
      ),
              hintText: 'DOB',
              contentPadding: EdgeInsets.symmetric(horizontal: 10)

          ))),
          SizedBox(height: 40,),
          Padding( padding: EdgeInsets.only(left: 100),
          child:  ElevatedButton(onPressed: () {
            checklogin(context);  }, 
          style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(19, 18, 18, 0.867)),
          child: 
          Text("Submit" , style: TextStyle(
            color: Colors.white
          ),)
          
          )
         
          )


        ],  

      ),
      
    )
    )
    );
  }

 void checklogin(BuildContext ctx)
 {
 final _registerNo = _registerNoController.text ;
 final _dob = _dobController.text ;

 if (_registerNo == _dob )
 {
  Navigator.push(
        ctx,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace with your home page widget
      );
 }
 else 
 {
  ScaffoldMessenger.of(ctx).showSnackBar(
SnackBar(
  content: Text(
    "Unable to Sign In : RegisterNo & DOB is not of the same student",
    style: TextStyle(fontSize: 11),
  ),
)

  );
  
 }
 }


}

