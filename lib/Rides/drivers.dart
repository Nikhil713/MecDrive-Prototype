import 'package:flutter/material.dart';

class Drivers extends StatelessWidget {

  Widget _cardBuilder(BuildContext context){
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.redAccent,
                child: Center(
                  child: CircleAvatar(
                    radius: 40.0,
                    child: Image(
                      image: AssetImage("assets/carpool.jpg"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.green,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text("User Name"),
                      subtitle: Row(
                        children: <Widget>[
                          Text("Branch:CSA"),
                          SizedBox(width: 7.0),
                          Text("Year:3")
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Center(
                        child: Text(
                          "Cusat Junction",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Drivers requests"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context,int index) => _cardBuilder(context),
          itemCount: 3,
        ),
      ),
    );
  }
}