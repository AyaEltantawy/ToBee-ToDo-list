import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  // Initialize the coin balance
  int coins = 1150;

  // Function to increase coins
  void _increaseCoins(int amount) {
    setState(() {
      coins += amount;
    });
  }

  // Function to decrease coins
  void _decreaseCoins(int amount) {
    setState(() {
      if (coins - amount >= 0) { // Ensure coins don't go negative
        coins -= amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Rewards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Points collected section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Point collected',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic to decrease coins by 100 when swapping reward
                    _decreaseCoins(100);
                  },
                  child: Text('Swap Now'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // XP Icon or Image
                  Icon(Icons.star, color: Colors.orange, size: 40),
                  SizedBox(width: 20),
                  Text(
                    '$coins', // Display the current coin balance
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // History section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // See All history logic
                  },
                  child: Text('See All'),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  RewardHistoryItem(
                    points: -100,
                    description: 'Swap reward',
                    isNegative: true,
                  ),
                  RewardHistoryItem(
                    points: 100,
                    description: 'Reward from first login',
                    onTap: () {
                      _increaseCoins(100); // Increase coins by 100
                    },
                  ),
                  RewardHistoryItem(
                    points: 120,
                    description: 'Reward from completing task',
                    onTap: () {
                      _increaseCoins(120); // Increase coins by 120
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can add logic here to add a new reward or action
          _increaseCoins(50); // Example: Add 50 coins for a new action
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class RewardHistoryItem extends StatelessWidget {
  final int points;
  final String description;
  final bool isNegative;
  final VoidCallback? onTap; // Callback when the item is tapped to add/subtract points

  RewardHistoryItem({
    required this.points,
    required this.description,
    this.isNegative = false,
    this.onTap, // Optional function to increase/decrease coins when clicked
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the callback on tap
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Text(
            '${isNegative ? '-' : '+'}$points',
            style: TextStyle(
              color: isNegative ? Colors.red : Colors.green,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Text(description),
        ),
      ),
    );
  }
}
