import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeePage createState() => _EmployeePage();
}

class _EmployeePage extends State<EmployeePage> {
  List<Map<String, dynamic>> employeeList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url =
        'https://raw.githubusercontent.com/rojasdev/json_api/main/notifications.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> employees = data['employee'];

        setState(() {
          employeeList = List<Map<String, dynamic>>.from(employees);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      //print('Error: $e');
    }
  }

  void _openDetailPage(Map<String, dynamic> employee) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmployeeDetailPage(employee: employee),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: employeeList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: employeeList.length,
              itemBuilder: (context, index) {
                final employee = employeeList[index];
                return ListTile(
                  title: Text(employee['emp_name']),
                  subtitle: Text('Employee Number: ${employee['emp_no']}'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(employee['emp_img']),
                  ),
                  onTap: () => _openDetailPage(employee),
                );
              },
            ),
    );
  }
}

class EmployeeDetailPage extends StatelessWidget {
  final Map<String, dynamic> employee;

  const EmployeeDetailPage({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee['emp_name']),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(employee['emp_img']),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text('Employee Number: ${employee['emp_no']}'),
          // Add more details as needed
        ],
      ),
    );
  }
}
