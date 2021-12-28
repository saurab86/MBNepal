import 'package:flutter/material.dart';
import 'package:mbnepal/dbhelper.dart';

class MaritalStatusSpinner extends StatefulWidget {

  @override
  _MaritalStatusSpinnerState createState() => _MaritalStatusSpinnerState();
}

class _MaritalStatusSpinnerState extends State<MaritalStatusSpinner> {
    final dbhelper = DataBaseHelper.instance;  
  @override
  Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('List Of Employees'),
              ),
              body: FutureBuilder<List>(
                future: dbhelper.selectoption(),
                // ignore: deprecated_member_use
                initialData: List(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, int position) {
                            // ignore: unused_local_variable
                            final item = snapshot.data[position];
                            //get your item data here ...
                            return Card(
                              child: ListTile(
                                title: Text(
                                    "Name: " + snapshot.data[position].row[0]),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            );
          }
}