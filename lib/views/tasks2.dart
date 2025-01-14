import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tobee_todo_list/models/task_model.dart';
import 'package:tobee_todo_list/views/home.dart';
import'package:http/http.dart'as http;
import 'package:tobee_todo_list/views/home2.dart';
import '../services/provider.dart';

String token ="CfDJ8GG-r7iIb2lFnG7AaB1m-Ks1RtLZtGJJBuIdIhURanaliqvbbklQ0hY73H1sOHQEk1MkvLUrBmf9NltTenK2__3sruQuNjzRj5ODpNZIuakvlgx-pzBy8JUQXxcMbMtTfPzQAnLnToTKPFhC_xKD5V1djCR9H17BRdqJH_pjvJmKczsKtmCCkl4DTykV8oRerLItF34inshZjebsS1UxkjtuSHJsobdiOsAgQPDRaZcRQXpV5eQth66rsLrWAkzn0Of1pSdrOUek2HrpI-GX49XSCwj44_r6nlKXmUtwF0sKawA3cI_4mQ_wXFm_jr--5cH7Xj1FWf0JcUklFmR1slchUa50V3z_obkCOUHGDAl3CaWfYfoeabYw_D4mYOEN9FNdTmLpML3Wv3WCxDhHwPMIJ0uAm2rzdMUuYmpZc3V8ZyVgnnI5Wz3wnpRDsCKCN8f_Dv8m_HNxbpS10yzwMyu64M0ap333PX77aiHfoRd7qMXFuPd26oDb0K0cIKT-EVhbBJGmi3Z-ySVnL6jvPM8bJce_N5_49CxWtavZqMvVunawpP4eDFuzpYnCQvGQpkzrp1IRAHHSoy8oaB5HnYYDKYKe16PSPHTVhhS2gJPbWUntDzljikpRA-8DRHAMfiYG63_FrDohz4ENHBHMsEOiCKq3XjK0eqraSDkLYaR4";
class AddTaskPage2 extends StatefulWidget {
  // Callback for adding a task


  @override
  _AddTaskPageState2 createState() => _AddTaskPageState2();
}

class _AddTaskPageState2 extends State<AddTaskPage2> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedSubject;

  final List<String> _subjects = ['Math', 'Science', 'History', 'Art', 'Music'];

  // Function to show date picker
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _taskDescription = '';
  bool _isCompleted = false;

  /* addTask (String name, String password) async {
    final Dio dio = Dio();

    //  home1.fetch();
    print(name);
    print(password);
    String url = ;
    final body = {
      "username": name,
      "password": password,
    };

    print("body is $body");
    try {
      final response = await dio.post(
        url,
        data: body,
      );
      if (response.statusCode == 200) {
        print('Login successful: ${response.data}');
        //  var  Token =response.data[token];
        var token = response.data["token"];
        print(token);



        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));

        //login success, go to home page
      } else {
        print('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }*/
  String _selectedValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFD3B2),
        title: Text("add tasks", style: TextStyle(color: Color(0xff29221D),
            fontWeight: FontWeight.w600,
            fontSize: 24),),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_circle_left_outlined, color: Colors.orange, size: 40),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(),));
            // Back button functionality
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(width: 430, height: 614,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
              color: Color(0xffFFFFFF)),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
   
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                    // Title input
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 6),
                
                    // Description input
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue!;
                          });
                        },
                        items: <String>['Select', 'Low', 'medium', 'High']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    // Date picker
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text(
                        _selectedDate == null
                            ? 'Start Date'
                            : DateFormat.yMMMd().format(_selectedDate!),
                      ),
                      onTap: _pickDate,
                    ),
                    SizedBox(height: 6),
                
                    // Time picker
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text(
                        _selectedTime == null
                            ? 'Start Time'
                            : _selectedTime!.format(context),
                      ),
                      onTap: _pickTime,
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text(
                        _selectedDate == null
                            ? 'End Date'
                            : DateFormat.yMMMd().format(_selectedDate!),
                      ),
                      onTap: _pickDate,
                    ),
                    SizedBox(height: 16),
                
                    // Time picker
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text(
                        _selectedTime == null
                            ? 'End Time'
                            : _selectedTime!.format(context),
                      ),
                      onTap: _pickTime,
                    ),
                    SizedBox(height: 6),
                    // Subject dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        prefixIcon: Icon(Icons.book),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedSubject,
                      items: _subjects
                          .map((subject) =>
                          DropdownMenuItem<String>(
                            child: Text(subject),
                            value: subject,
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSubject = value;
                        });
                      },
                
                    ),
                   /* Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Container(width: 100, height: 50,
                        child: Center(
                          child: MaterialButton(
                              onPressed: addTask,
                              child: Text("Add", style: TextStyle(
                                  color: Colors.orange, fontSize: 20),)),
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      /* bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home
              },
            ),
            IconButton(
              icon: Icon(Icons.timer),
              onPressed: () {
                // Navigate to timer
              },
            ),
            FloatingActionButton(
              onPressed: () {
                // Add new task
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
            IconButton(
              icon: Icon(Icons.card_giftcard),
              onPressed: () {
                // Navigate to rewards
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navigate to profile
              },
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.black,
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

   Future addTask() async {



    final Dio dio = Dio();
final title =_titleController.text.toString();
    final description =_descriptionController.text.toString();
    print(title);
    print(description);
    String url = 'http://tobee.runasp.net/api/TaskService/daily?date=2023-03-01';
    final body = {
      "taskName": title,
      "taskDescription": description,
      "priorityLevel": "Low",
      "deadline": "2023-10-31T23:59:59Z",
      "status": "Pending",
      "createdAt": "2023-03-01T00:00:00Z",
      "completedAt": null
    }
    ;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print("body is $body");

    final response = await dio.post(
      url,
      data: body,
      queryParameters: headers
    );
    if (response.statusCode == 201) {
      print('success');
      showSuccessMessage('creation success');
      Navigator.push(context, MaterialPageRoute(builder: (context) => TaskListPage2()));
    }
    else {
      print('creation failed');
    }
  }

    Future <void> submitData() async {
      final title = _titleController.text.toString();
      final description = _descriptionController.text.toString();
      final body = {

        "taskName": title,
        "taskDescription": description,

      };
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final url = 'http://tobee.runasp.net/api/TaskService/daily?date=2023-03-01';
      final uri = Uri.parse(url);
      final response = await http.post(uri, body: body, headers: headers);
      if (response.statusCode == 201) {
        print('success');
        showSuccessMessage('creation success');
        Navigator.push(context, MaterialPageRoute(builder: (context) => TaskListPage2()));
      }
      else {
        print('creation failed');
        print(response.body);
      }
    }
  }

