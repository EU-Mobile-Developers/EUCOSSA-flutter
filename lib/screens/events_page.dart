import 'package:eu_mobile/screens/navbar.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        centerTitle: true,
      ),
      drawer: drawerNav(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                // elevation: 50,
                shadowColor: Colors.black,
                color: Colors.white,
                child: SizedBox(
                  // width: 300,
                  // height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        Image.network(
                          'https://pbs.twimg.com/profile_images/2375441919/vecuofxmffv5j3mrkis0_400x400.png',
                          fit: BoxFit.cover,
                          height: 200,
                          width: 350,
                        ),
                        //CircleAvatar
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'EUCOSSA TECH FRIDAY',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ),
                          ],
                        ), //Text
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        const Text(
                          'Welcome to EUCOSSA TechFriday with us at GO15.GDSC and Microsoft Student Clubs ',
                          style: TextStyle(
                            // fontSize: 15,
                            color: Colors.black,
                          ), //Textstyle
                        ), //Text
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        const SizedBox(
                          // width: 100,
                          child: ListTile(
                            trailing: Icon(Icons.share),
                            leading: Icon(Icons.thumb_up),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.people), label: "Communities"),
          NavigationDestination(icon: Icon(Icons.event), label: "Events")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
