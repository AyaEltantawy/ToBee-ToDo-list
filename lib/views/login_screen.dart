import 'package:flutter/material.dart';
import 'package:tobee_todo_list/views/home.dart';

import 'package:tobee_todo_list/views/sign_up.dart';
import 'package:tobee_todo_list/views/welcome.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFC397),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                    },
                    icon: Icon(Icons.arrow_back),iconSize: 30,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Register",
                      style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ],
              ),
              SizedBox(height: 60,),
              Container(width:430,height:568,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xffFAFAFA)),
          child:Column(
            crossAxisAlignment:  CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
          
          
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(width:390,height:65,
                decoration:BoxDecoration(
           border: Border.all(
          
             color:Color(0xffE0E0E0),width:1,
           ),
              borderRadius: BorderRadius.circular(30)
                ),
                child: TextFormField(
          controller: usernamecontroller,
          decoration:  InputDecoration(
          
              border: InputBorder.none,
          
          
              contentPadding: EdgeInsets.only(top: 10,left:10),
          
              hintText: "  username",
              hintStyle: TextStyle(color: Color(0xff939393)))
                ),
              ),
            ),
            SizedBox(height:5),
            Padding(
              padding: const EdgeInsets.only(top:10,right: 10,left:10),
              child: Container(width:390,height:65,
                decoration:BoxDecoration(
            border: Border.all(
          
              color:Color(0xffE0E0E0),width:1,
            ),
            borderRadius: BorderRadius.circular(30)
                ),
                child: TextFormField(
          controller: passwordcontroller,
          decoration:  InputDecoration(
          
          
              border: InputBorder.none,
          
              contentPadding: EdgeInsets.only(top: 10,left:10),
          
              hintText: "  password",
              hintStyle: TextStyle(color: Color(0xff939393))),
                ),
              )
            ),
          TextButton(onPressed: (){}, child: Text("Forget Password?",style:TextStyle(fontSize: 15,color:Colors.black)
            ,))
          ,SizedBox(height:20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
            width: 295,
            height: 57,
            child: MaterialButton(
          
              color: Color(0xffFE6C00),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(30)),
                  side: BorderSide(
                      width: 2, color: Color(0xffFE6C00))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Home()));
              },
          
              child:
              Text("Sign In",
                  style: TextStyle(
                      fontSize: 15,
                      color:Colors.white
                  )),
          
          
            )),
                SizedBox(
          height:40
                ),
                SizedBox(
            width: 390,
            height:50,
            child: MaterialButton(
          
              color: Color(0xffFFFFFF),
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(30)),
                  side: BorderSide(
                      width: 2, color: Colors.transparent)),
              onPressed: () {
          
              },
          
              child:
                  Row(children:[
              Container(
                  width:50,height:50,
                  child: Image.asset("lib/assets/images/google-logo.jpg",fit: BoxFit.fill)),
          SizedBox(width:10),
              Text("Continue with Google",
                  style: TextStyle(
                      fontSize: 15,
                      color:Colors.black
                  )),
          
          
          
          
          
          
          
          
          
          
          
                  SizedBox(width:90)
                  ,Icon(Icons.arrow_forward_outlined)
          
          
                  ])
          
          
            )),
                SizedBox(
            height:20
                ),
                SizedBox(
            width: 390,
            height:50,
            child: MaterialButton(
          
                color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(
                        width: 2, color: Colors.transparent)),
                onPressed: () {
          
                },
          
                child:
                Row(children:[
                  Container(
                      width:50,height:50,
                      child: Image.asset("lib/assets/images/facebook-logo.jpg",fit: BoxFit.fill)),
                  SizedBox(width:10),
                  Text("Continue with Facebook",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.black
                      )),
          
          
          
          
          
          
          
          
          
          
          
                  SizedBox(width:71)
                  ,Icon(Icons.arrow_forward_outlined)
          
          
                ])
          
          
            )),
          
              ],
            ),
          
          ],
          
          
          
          )
          
          
          
              )
          
          
            ],
          ),
        ));
  }
}
