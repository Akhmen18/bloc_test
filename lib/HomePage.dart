import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Employee.dart';
import 'package:bloc_test/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder<List<Employee>>(
            stream: _employeeBloc.employeeListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "${snapshot.data[index].id}",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data[index].name}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  "₹ ${snapshot.data[index].salary}",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                _employeeBloc.employeeSalaryIncrement
                                    .add(snapshot.data[index]);
                              },
                              icon: Icon(
                                Icons.thumb_up_alt_rounded,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                _employeeBloc.employeeSalaryDecrement
                                    .add(snapshot.data[index]);
                              },
                              icon: Icon(
                                Icons.thumb_down_alt_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
