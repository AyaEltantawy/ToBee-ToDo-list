import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tobee_todo_list/views/home.dart';

import 'package:tobee_todo_list/views/login_screen.dart';
import 'package:tobee_todo_list/views/sign_up.dart';
import 'package:tobee_todo_list/views/welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController repasswordcontroller =TextEditingController();
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
                        MaterialPageRoute(builder: (context) =>  Login()));
                  },
                  child: Text("Login",
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
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ],
              ),
              SizedBox(height: 60,),
              SingleChildScrollView(
                child: Container(width:430,height:568,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xffFAFAFA)),
                    child:Column(
                      crossAxisAlignment:  CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
          
          
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
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
          
                                    hintText: "  Username",
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
          
                                    hintText: "  Password",
                                    hintStyle: TextStyle(color: Color(0xff939393))),
                              ),
                            )
                        ),
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
          
                                    hintText: "  Re Password",
                                    hintStyle: TextStyle(color: Color(0xff939393))),
                              ),
                            )
                        )
                    ,SizedBox(height:30),
          
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("----------------------"),
                                Container(
                                  decoration: BoxDecoration(color:Color(0xffEEEEEE),),
                                    width:133,height:43,
                                    alignment: Alignment.center,
          
                                    child:Text("or register with")
          
          
          
          
          
          
                                ),
                                Text("----------------------"),
                              ],
                            ),
          
          
                        SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center
                      ,
          
          
                      children: [
          
                    GestureDetector(onTap:(){},
                      child: Container(width:38,height:38,
                          child: Image.asset("lib/assets/images/google-logo.jpg")),
                    ),
                      SizedBox(width:5),
                      GestureDetector(
                        onTap: (){},
                        child: Container(width:38,height:38,
                            child: Image.asset("lib/assets/images/facebook-logo.jpg")),
                      ),
          
                    ],),
                    SizedBox(height:20),
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
                                  Text("Sign Up",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:Colors.white
                                      )),
          
          
                                )),
          
          
                    ])
          
                      ],
          
          
          
                    )
          
          
          
                ),
              )
          
          
            ],
          ),
        ));
  }
}
