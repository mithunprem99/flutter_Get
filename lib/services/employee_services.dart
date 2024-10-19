import 'dart:convert';

import 'package:api/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeServices {
  String baseUrl = 'https://reqres.in/api/users';

  getAllEmployeeData() async {
    List<Employee> allEmployee = [];
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodeData = jsonDecode(data);
        var employees = decodeData['data'];
        // print(employees);


        for (var employee in employees) {
          Employee newEmployee = Employee.fromJson(employee);
          allEmployee.add(newEmployee);
        }
        return allEmployee;
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
