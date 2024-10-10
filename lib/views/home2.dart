import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobee_todo_list/services/provider.dart';
import 'package:tobee_todo_list/views/recommendation_by_Ai.dart';
import 'package:tobee_todo_list/views/recommendations_view.dart';
import 'package:tobee_todo_list/views/tasks.dart';
import 'package:tobee_todo_list/views/tasks2.dart';
import'package:http/http.dart' as http;


class TaskListPage2 extends StatefulWidget {

  @override
  State<TaskListPage2> createState() => _TaskListPageState2();
}
String token ="CfDJ8GG-r7iIb2lFnG7AaB1m-Ks1RtLZtGJJBuIdIhURanaliqvbbklQ0hY73H1sOHQEk1MkvLUrBmf9NltTenK2__3sruQuNjzRj5ODpNZIuakvlgx-pzBy8JUQXxcMbMtTfPzQAnLnToTKPFhC_xKD5V1djCR9H17BRdqJH_pjvJmKczsKtmCCkl4DTykV8oRerLItF34inshZjebsS1UxkjtuSHJsobdiOsAgQPDRaZcRQXpV5eQth66rsLrWAkzn0Of1pSdrOUek2HrpI-GX49XSCwj44_r6nlKXmUtwF0sKawA3cI_4mQ_wXFm_jr--5cH7Xj1FWf0JcUklFmR1slchUa50V3z_obkCOUHGDAl3CaWfYfoeabYw_D4mYOEN9FNdTmLpML3Wv3WCxDhHwPMIJ0uAm2rzdMUuYmpZc3V8ZyVgnnI5Wz3wnpRDsCKCN8f_Dv8m_HNxbpS10yzwMyu64M0ap333PX77aiHfoRd7qMXFuPd26oDb0K0cIKT-EVhbBJGmi3Z-ySVnL6jvPM8bJce_N5_49CxWtavZqMvVunawpP4eDFuzpYnCQvGQpkzrp1IRAHHSoy8oaB5HnYYDKYKe16PSPHTVhhS2gJPbWUntDzljikpRA-8DRHAMfiYG63_FrDohz4ENHBHMsEOiCKq3XjK0eqraSDkLYaR4";
List items1=  [];
List items2=  [];
class _TaskListPageState2 extends State<TaskListPage2> {
  /* final List<Map<String, String>> dailyTasks = [
    {'title': 'أداء الفروض المنزلية', 'description': 'أداء الواجب المدرسي'},
    {'title': 'Wireframe login', 'description': 'must finish login screen tobee app'},
    {'title': 'أداء صلاة العشاء قبل منتصف الليل', 'description': 'أداء الصلاة في الوقت'}
  ];*/
  final List<Map<String, String>> recommendedTasks = [
    {'title': 'الذهاب للعمل', 'description': 'يجب الذهاب للعمل في الوقت المحدد'},
    {'title': 'go to the gym', 'description': 'must do cardio exercises to lose weight'},
    {'title': 'تعلم بعض من الألمانية', 'description': 'حتى تتمكن من العمل بالخارج'}
  ];

  /*final List<Map<String, String>> allTasks = [
    {'title': 'Wireframe login', 'description': 'must finish login screen tobee app'},
    {'title': 'Finish UI 3 screen', 'description': 'must finish login & sign up and home screen tobee app'},
    {'title': 'Learn javascript', 'description': 'Master the language powering the modern web'},
    {'title': 'go to the gym', 'description': 'must do cardio exercises to lose weight'},
    {'title': 'تعلم بعض من الألمانية', 'description': 'حتى تتمكن من العمل بالخارج'},
    {'title': 'مراجعة جزء من القران', 'description': 'الجزء رقم 30'},
    {'title': 'أداء صلاة العشاء قبل منتصف الليل', 'description': 'أداء الصلاة في الوقت'}
  ];*/
void initState(){
  super.initState();
  fetchTodo1();
  fetchTodo2();
 // fetchTodo1();

}
  @override
  Widget build(BuildContext context) {final taskProvider = Provider.of<TaskProvider>(context,listen: false);
  return Scaffold(

    backgroundColor: Color(0xffFFFfFF),



    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container( width:430,height:130,
            color: Color(0xffFFD3B2),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[

                    SizedBox(width:100),
                    Container(
                        width: 130.32,
                        height: 103.04,
                        child: Image.asset("lib/assets/images/Group305.png",fit:BoxFit.fill)),

                    SizedBox(width:28.5),
                    GestureDetector(onTap: (){},
                      child: Container(width:39,height:39,
                        child: Image.asset
                          ("lib/assets/images/mdi_bell-notification.png"),
                      ),
                    ),
                    SizedBox(width: 30,)
                  ]








              ),
            ),
          ),
          // Daily Tasks
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Daily tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 150, // Adjust height based on the number of tasks to display at a time
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                final item1 = items1[index] as Map;
                return _buildTaskCard(

                  Text(item1['title']) as String,
                Text(item1['description']) as String
                );
              },
            ),
          )

          // Recommended Tasks
          , Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Recommended tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              MaterialButton(
                onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>RecommendedTasksPageAI(token: '',)) );},
                minWidth: 153,
                height: 47,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(width: 3, color: Colors.orange)),
                child: Text("Recommands", style: TextStyle(color: Colors.orange)),
              )
            ],
          ),
          _buildTaskList(recommendedTasks),

          // All Tasks Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 153,
                  height: 47,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(width: 3, color: Colors.orange)),
                  child: Text("deadlines", style: TextStyle(color: Colors.orange)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: Text('Filter'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: Text('Important'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: Text('Nearest'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: Column(
                    children: [
                      Text('Daily'),
                      Text('Routine')
                    ],
                  ),
                  onSelected: (bool selected) {},
                ),
              ],
            ),
          ), Padding(
            padding: const EdgeInsets.only(top:10,left:220),
            child: MaterialButton(
              onPressed: ()  {
                // Navigate to AddTaskPage and wait for the result
Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskPage2()));


              },
              minWidth: 130,
              height: 47,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 3, color: Colors.orange)),
              child: Text("Add", style: TextStyle(color: Colors.orange)),
            ),
          ),
          SizedBox(
            height: 500, // Adjust height based on the number of tasks to display at a time
            child
                : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                final item2 = items2[index] as Map;
                return _buildTaskCard(

                    Text(item2['title']) as String,
                    Text(item2['description']) as String
                );
              },
            ),
          ),

        ],
      ),
    ),

    /* floatingActionButton: FloatingActionButton(onPressed: () async {
        // Navigate to AddTaskPage and wait for the result

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTaskPage(),
          ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,

    )*/);

  }
  void navigateToAddPage(){final route =MaterialPageRoute(builder: (context) => AddTaskPage2());
  Navigator.push(context, route);


  }
  Future<void> fetchTodo1()async{
    final url = 'http://tobee.runasp.net/api/TaskService/daily?date=2023-03-01';
final uri = Uri. parse(url);
final response = await http.get(uri,headers: {
   'Content-Type': 'application/json',
  'Authorization': 'Bearer $token',
});
if (response.statusCode == 200){final json = jsonDecode(response.body) as Map;
final result = json as List;

setState(() {

  items1 = result;

});

}
    print(response.body);

  }
  Future<void> fetchTodo2()async{
    final url = 'http://tobee.runasp.net/api/TaskService';
    final uri = Uri. parse(url);
    final response = await http.get(uri,headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200){final json = jsonDecode(response.body) as Map;
    final result = json as List;

    setState(() {

      items2 = result;

    });

    }
    print(response.body);

  }
 /* getSuggestedPlants() async {
    print(token);
    var response = await http.get(Uri.parse(linkGetSuggestedPlants), headers: {
      //  'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = jsonDecode(response.body);
    List<> suggestedplants = [];
    for (var u in jsonData) {
      SuggestedPlantsModel suggestedplantsmodel = SuggestedPlantsModel(
          name: u["name"], image: u["image"], description: u["description"]);
      suggestedplants.add(suggestedplantsmodel);
    }

    print(suggestedplants.length);
    return suggestedplants;
  }*/

  // Method to build each task section
  Widget _buildTaskList(List<Map<String, String>> tasks) {
    return SizedBox(
      height: 150, // Adjust height based on the number of tasks to display at a time
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return _buildTaskCard1(tasks[index]['title']!, tasks[index]['description']!);
        },
      ),
    );
  }

/*Widget _buildMyTaskList(List<Map<String, String>> tasks) {
    return SizedBox(
      height: 150, // Adjust height based on the number of tasks to display at a time
      child
          : ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(taskProvider.tasks[index].title),
              subtitle: Text(taskProvider.tasks[index].description));
        },
      ),
    );
  }*/

  // Method to build individual task cards
  Widget _buildTaskCard(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,

        decoration: BoxDecoration(
          border: Border.all(width:3,color: Colors.orange,),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Edit task functionality
                    },
                  ),IconButton(
                    icon: Icon(
                      Icons.check_circle_outline,

                    ),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
Widget _buildTaskCard1(String title, String description) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 200,

      decoration: BoxDecoration(
        border: Border.all(width:3,color: Colors.orange,),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.check_circle_outline),
                  onPressed: () {
                    // Mark task as complete
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Edit task functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {

                  },)
                // Delete task functionality


              ],
            ),
          ],
        ),
      ),
    ),
  );
}
