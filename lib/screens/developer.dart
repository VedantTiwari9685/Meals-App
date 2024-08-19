import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Developer"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.0),
            Text(
              'This app is developed by Vedant Tiwari, a Software Engineer currently pursuing a B.Tech in Computer Science and Engineering (2022-2026). The idea for this app came from my own struggle with deciding what to cook whenever I feel hungry. I often find it challenging to remember all the dishes I can prepare and, even if I do, I\'m unsure about the ingredients, cooking methods, and overall cost. This app aims to simplify that process and make meal planning easier.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
            ),
            SizedBox(height: 16.0),
            Text(
              'You can learn more about me and reach out through my portfolio: https://vedanttiwariportfolio.netlify.app',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Special thanks to my mentor, Maximilian Schwarzmuller, for his excellent Flutter teachings on Udemy. I also want to express my gratitude to my older brother, Varun Tiwari, for providing valuable recipe details, including ingredients and cooking steps.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
