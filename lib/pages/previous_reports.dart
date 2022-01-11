import 'package:flutter/material.dart';

class previous_report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "plantd",
            style: TextStyle(fontFamily: 'Salsa'),
          ),
          backgroundColor: Colors.teal[500],
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.menu),
                onSelected: (value) {
                  if (value == '/previous_reports') {
                    Navigator.pushReplacementNamed(
                        context, '/previous_reports');
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Text("Previous Report"),
                          value: '/previous_reports'),
                      PopupMenuItem(
                        child: Text("Logout"),
                        value: '/login',
                      )
                    ]),
          ],
        ),
        body: Container(
            color: Colors.blueGrey[600],
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    'Previous Reports',
                    style: TextStyle(
                      fontFamily: 'salsa',
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(17.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(
                          0,
                          3,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'DISEASE NAME',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '99/99/9999',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Icon(Icons.info_outline_rounded)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(17.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: const Offset(
                          0,
                          3,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'DISEASE NAME',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '99/99/9999',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Icon(Icons.info_outline_rounded)
                    ],
                  ),
                )
              ],
            )));
  }
}
