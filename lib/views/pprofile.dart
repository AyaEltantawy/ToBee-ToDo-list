import 'package:flutter/material.dart';
import 'package:tobee_todo_list/views/login_screen.dart';
import 'package:tobee_todo_list/views/setting.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
SizedBox(height: 20,),

                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row( children:[SizedBox(width: 5,) ,IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.orange,size:40)),SizedBox(width: 80,) ,Text("Profile", style: TextStyle(color: Colors.orange,fontSize:20)),])
         , CircleAvatar(radius: 70,
            backgroundImage: AssetImage("lib/assets/images/photo.png"),
          ),
          SizedBox(height: 5,) ,
          Text(
              "Yossif Gharep",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:20)),
          Text("Graduated/works as UI/UX", style: TextStyle(color: Color(0xffBDACFF),fontSize:15,fontWeight:FontWeight.bold)),
          Text("designer", style: TextStyle(color: Color(0xffBDACFF),fontSize:15,fontWeight:FontWeight.bold)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(

                width: 153,
                height: 57,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                    ,
                    border: Border.all(width: 1, color: Colors.orange)),
                child: Text(
                  "10 Task left",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              Container(
                width: 153,
                height: 57,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    border: Border.all(width: 1, color: Colors.orange)),
                child: Text(
                  "5 Task done",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ]),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 153,
            height: 47,
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(width: 3, color: Colors.orange)),
            child: Text("Task Report", style: TextStyle(color: Colors.orange)),
          )
                ]),
                
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                    Text("Settings", style: TextStyle(color: Color(0xffAFAFAF))),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: Colors.orange),
                          SizedBox(width: 10,),
                          Text("App Settings",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 17)),
                          SizedBox(
                            width: 112,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Setting()));
                              },
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.orange))
                        ],
                      ),
                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                    Column( crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                    
                        Text("Account", style: TextStyle(color: Color(0xffAFAFAF))),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.orange),
                            SizedBox(width:10),
                            Text("Change account name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17)),
                            SizedBox(
                              width: 37,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.orange))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.vpn_key, color: Colors.orange),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Change account password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 17)),
                            SizedBox(
                              width: 8,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Setting()));
                                },
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: Colors.orange))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.add_a_photo, color: Colors.orange),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Change account image",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize:17)),
                            SizedBox(
                              width: 32,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.orange)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height:10),
                    Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("Uptodo", style: TextStyle(color: Color(0xffAFAFAF))),
                      
                    Row(
                      children: [
                        Icon(Icons.menu, color: Colors.orange),
                        SizedBox(width:10),
                        Text("About US",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17)),
                        SizedBox(
                          width: 136,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.orange))
                      ],
                    ),]
                    ),
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.orange),
                        SizedBox(width:10),
                        Text("FAQ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17)),
                        SizedBox(
                          width: 180,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.orange))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.flash_on, color: Colors.orange),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Help & Feedback",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17)),
                        SizedBox(
                          width: 80,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.orange))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),  SizedBox(
                          width: 10,
                        ),
                        Text("Support US",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 17)),
                        SizedBox(
                          width: 120,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.orange))
                      ],
                    ),  Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(onPressed: (){Navigator.push(context  , MaterialPageRoute(builder:(context )=>Login()));},icon:Icon(Icons.logout, color: Color(0xffFF4949))),
                                        TextButton(child:Text("Log Out",
                                            style: TextStyle(color: Color(0xffFF4949), fontSize: 16)),onPressed: (){Navigator.push(context  , MaterialPageRoute(builder:(context )=>Login()));},)
                                      ],
                                    )
                   , Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){Navigator.push(context  , MaterialPageRoute(builder:(context )=>Login()));},icon:Icon(Icons.logout, color: Color(0xffFF4949))),
                        TextButton(child:Text("Log Out",
                            style: TextStyle(color: Color(0xffFF4949), fontSize: 16)),onPressed: (){Navigator.push(context  , MaterialPageRoute(builder:(context )=>Login()));},)
                      ],
                    )
                                  ],
                                )
                              ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
