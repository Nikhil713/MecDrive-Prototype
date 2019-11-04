import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/13),
              child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "My Profile",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
      ),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.black.withOpacity(1)),
            clipper: GetClipper(),
          ),
          Positioned(
            width: 350.0,
            left: 5,
            top: MediaQuery.of(context).size.height / 8,
            
            child: Column(
              children: <Widget>[
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/profilepic.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(105.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 9.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 40.0),
                Container(
                  child: Text(
                    'Nikhil Babu',
                    style: TextStyle(
                      fontSize: 35.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  getBranch('CSA'),
                  style: TextStyle(
                    fontSize: 22.0,
                    // fontStyle: FontStyle.it,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  getYear('3'),
                  style: TextStyle(
                    fontSize:22.0,
                    // fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(height: 35),
                Text(
                  'Phone: 9876543210',
                  style: TextStyle(
                    fontSize: 25.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),

                // Column(
                //   children: <Widget>[
                //     SizedBox(height: 25.0),
                //     Container(
                //       height: 40.0,
                //       width: 100.0,
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10.0),
                //         shadowColor: Colors.black,
                //         color: Colors.black.withOpacity(0.8),
                //         elevation: 7.0,
                //         child: GestureDetector(
                //           // onTap: () {},
                //           child: Center(
                //             child: Text('Settings',
                //                 style: TextStyle(color: Colors.white)),
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 10.0),
                //     Container(
                //       height: 40.0,
                //       width: 100.0,
                //       child: Material(
                //         borderRadius: BorderRadius.circular(10.0),
                //         shadowColor: Colors.black,
                //         color: Colors.black.withOpacity(0.8),
                //         elevation: 7.0,
                //         child: GestureDetector(
                //           // onTap: () {},
                //           child: Center(
                //             child: Text('Log Out',
                //                 style: TextStyle(color: Colors.white)),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3.5);
    path.lineTo(size.width + 60500, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

getBranch(String branch)
{
  if(branch=='CSA' || branch =='CSB')
    return 'Computer Science';
  if(branch=='ECA' || branch =='ECB')
    return 'Electronics & Communication';
  if(branch=='EB')
    return 'Electronics & Biomedical';
  if(branch=='EEE')
    return 'Electronics & Electrical';
  return branch;
}

getYear(String year)
{
  if (year == "1")
    return '1st Year';
  if (year == "2")
    return '2nd Year';
  if (year == "3")
    return '3rd Year';
  if (year == "4")
    return '4th Year';
  return year;
}
