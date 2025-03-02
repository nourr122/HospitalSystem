import 'package:flutter/material.dart';
import 'package:instant_project/features/profile/presentation/views/Register.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../data/repositories/service.dart';

class SelectEmploye extends StatefulWidget {
  const SelectEmploye({
    super.key,
    required this.onEmployeeSelected,
  });

  final void Function(dynamic) onEmployeeSelected;

  @override
  State createState() => _EmployeesState();
}

class _EmployeesState extends State<SelectEmploye> {
  final APIService apiService = APIService();
  List<dynamic> employees = [];
  String selectedCategory = "all";
  @override
  void initState() {
    super.initState();
    fetchEmployees(selectedCategory);
  }

  void fetchEmployees(String type) async {
    setState(() {
      employees = [];
      selectedCategory = type;
    });
    if (type == "all") {
      List<dynamic> doctors = await apiService.fetchEmployeesByType("doctor");
      List<dynamic> nurses = await apiService.fetchEmployeesByType("nurse");
      List<dynamic> hrEmployees = await apiService.fetchEmployeesByType("hr");
      List<dynamic> analysts =
          await apiService.fetchEmployeesByType("analysis");

      setState(() {
        employees = [...doctors, ...nurses, ...hrEmployees, ...analysts];
      });
    } else {
      List<dynamic> data = await apiService.fetchEmployeesByType(type);
      setState(() {
        employees = data;
      });
    }
  }

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Select Employee',
            style: TextStyle(color: Color(0xfff343434), fontSize: 25),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
            iconSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.search),
                labelText: 'Search for Employee',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 10),
                  category("all", "All"),
                  category("doctor", "Doctor"),
                  category("nurse", "Nurse"),
                  category("hr", "HR Employee"),
                  category("analysis", "Analysis Employee"),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              var employee = employees[index];

              return InkWell(
                onTap: () {
                  widget.onEmployeeSelected(employee);
                },
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(employee["avatar"]),
                      ),
                    ],
                  ),
                  title: Text(employee["first_name"]!,
                      style: const TextStyle(fontSize: 14)),
                  subtitle: Text("Specialist - ${employee["type"]}",
                      style: const TextStyle(fontSize: 12)),
                ),
              );
            },
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget category(String type, String btn) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: () {
          fetchEmployees(type);
        },
        style: TextButton.styleFrom(
          backgroundColor: selectedCategory == type
              ? AppColors.primaryColor
              : Colors.transparent,
          foregroundColor:
              selectedCategory == type ? Colors.white : Colors.black,
          side: const BorderSide(color: Color(0x50707070), width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(btn, textAlign: TextAlign.center),
      ),
    );
  }
}
