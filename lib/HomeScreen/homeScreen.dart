import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Destination
  String destination = "";

  // Bottom navigation bar 
  int _currentIndex = 0;

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.phone_android),
                text: "Find Ride",
              ),
              Tab(
                icon: Icon(Icons.local_taxi),
                text: "Offer Ride",
              )
            ],
          ),
          title: Text("MEC Uber"),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0,20.0,15.0,10.0),
                height: 350.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0
                    ),
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Starting Location
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(
                          "Model Engineering College",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        subtitle: Text("Thrikkakara"),
                      ),
                    ),
                    // Destination
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: ListTile(
                        leading: Icon(Icons.location_on),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: "Destination"
                          ),
                          onChanged: (String val){
                            setState(() {
                              destination = val;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Offer Ride
            Center(
              child: RaisedButton(
                onPressed: (){},
                child: Text("hello"),
              ),
            )
          ],
        ),
        // Bottom Navigation
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike),
              title: Text("My Rides")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Account")
            ),
          ],
        ),
      ),
    );
  }
}
