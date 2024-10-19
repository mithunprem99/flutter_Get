import 'package:api/models/employee.dart';
import 'package:api/services/employee_services.dart';
import 'package:flutter/material.dart';

class Employeescreen extends StatelessWidget {
  const Employeescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Data'),
        actions: [
          IconButton(
              onPressed: () {
                print(EmployeeServices().getAllEmployeeData());
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: EmployeeServices().getAllEmployeeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error Fetching Employee Data"),
              );
            }
            if (snapshot.hasData) {
              var data = snapshot.data as List<Employee>;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].avatar!),
                      ),
                      title: Text(
                          "${data[index].firstName} ${data[index].lastName!}"),
                      subtitle: Text(data[index].email!),
                    );
                  },
                  itemCount: data.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
