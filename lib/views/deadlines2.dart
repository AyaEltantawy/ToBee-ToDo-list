import 'package:flutter/material.dart';

class TaskDeadlinesPage2 extends StatefulWidget {
  @override
  _TaskDeadlinesPageState2 createState() => _TaskDeadlinesPageState2();
}

class _TaskDeadlinesPageState2 extends State<TaskDeadlinesPage2> {
  // Fake data representing tasks with completion status
  Map<int, List<Map<String, dynamic>>> tasks = {
    24: [
      {'title': 'study arabic', 'description': 'for exam', 'completed': false},

      {'title':' do sports in home','description':'for my fitness','completed':false}
      ,

    ],
    26: [
      {'title': 'Lorem ipsum dolor sit ...', 'description': 'Lorem ipsum dolor sit amet magna aliqua', 'completed': false},
      {'title': 'Lorem ipsum dolor sit ...', 'description': 'Lorem ipsum dolor sit amet magna aliqua', 'completed': false},
      {'title': 'Lorem ipsum dolor sit ...', 'description': 'Lorem ipsum dolor sit amet magna aliqua', 'completed': false}
    ],
    28: [
      {'title': 'Lorem ipsum dolor sit ...', 'description': 'Lorem ipsum dolor sit amet magna aliqua', 'completed': false}
    ]
  };

  // Selected date
  int selectedDate = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Task Deadlines',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Column(
        children: [
          // Calendar Selection
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "SEPTEMBER 2024",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDateButton(19, "THU"),
                    _buildDateButton(20, "FRI"),
                    _buildDateButton(21, "SAT"),
                    _buildDateButton(22, "SUN"),
                    _buildDateButton(23, "MON"),
                    _buildDateButton(24, "TUE"),
                    _buildDateButton(25, "WED"),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 2),
          // Task Schedule
          Expanded(
            child: ListView.builder(
              itemCount: tasks[selectedDate]?.length ?? 0,
              itemBuilder: (context, index) {
                var task = tasks[selectedDate]![index];
                return _buildTaskItem(index, task['title']!, task['description']!);
              },
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
    );
  }

  // Date selection buttons
  Widget _buildDateButton(int day, String dayOfWeek) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = day;
        });
      },
      child: Column(
        children: [
          Text(
            dayOfWeek,
            style: TextStyle(
              fontSize: 14,
              color: selectedDate == day ? Colors.orange : Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          CircleAvatar(
            radius: 18,
            backgroundColor: selectedDate == day ? Colors.orange : Colors.grey.shade200,
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 16,
                color: selectedDate == day ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Task item builder with checkbox
  Widget _buildTaskItem(int index, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: tasks[selectedDate]![index]['completed'] ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(description),
          trailing: Checkbox(
            value: tasks[selectedDate]![index]['completed'],
            onChanged: (bool? value) {
              setState(() {
                tasks[selectedDate]![index]['completed'] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
