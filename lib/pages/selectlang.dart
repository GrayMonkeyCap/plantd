import 'package:firstapp/services/localization_service.dart';
import 'package:flutter/material.dart';

class Selectlang extends StatelessWidget {
  final lang = LocalizationService();
  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData('E', 'English'),
      MenuData('ह', 'Hindi'),
      MenuData('म', 'Marathi'),
      MenuData('ਪ', 'Punjabi'),
      MenuData('മ', 'Malayalam'),
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey[600],
            child: Scrollbar(
              thickness: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: menu.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: InkWell(
                              onTap: () {
                                lang.changeLocale(menu[index].title);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(menu[index].text,
                                      style: TextStyle(
                                        fontSize: 40,
                                      )),
                                  SizedBox(height: 20),
                                  Text(
                                    menu[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class MenuData {
  MenuData(this.text, this.title);
  final String text;
  final String title;
}
