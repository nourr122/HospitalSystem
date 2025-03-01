import 'package:flutter/material.dart';
import 'package:instant_project/features/profile/presentation/views/Register.dart';
import 'package:instant_project/features/profile/presentation/views/Myprofile.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../data/repositories/service.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  _EmployeesState createState() => _EmployeesState();
}

var size, height, width;

class _EmployeesState extends State<EmployeesList> {
  final APIService apiService = APIService();
  List<dynamic> employees = [];
  final String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDZiNjZkZDhkOWY2NGYzMjEzYzY4OGMyOGEzMTQ4OTAyMGJjM2U3MDcxMGI2NTUyNjVhZmJkZjI1Mjk2OGFiNmMwNjNhY2YwZTY2MjVkNjAiLCJpYXQiOjE3NDAxNzQ5NjQuODI1ODM1LCJuYmYiOjE3NDAxNzQ5NjQuODI1ODM2LCJleHAiOjE3NzE3MTA5NjQuODI0OTMxLCJzdWIiOiIxNyIsInNjb3BlcyI6W119.ExHcpHRqAoeKwG4RPARSy9dhLGSg0jgyRF_vKbzfYJjOnhvcqQmLWmQqgJlVJpxWN4zZ--0eZqAuQ_Ev0Hp0FSQ0tJNnT2tLcHQAefwggiaCzbs8RZoNfYUgDzZWEtjhSzbRfjv_w167WOYW3piLJ2ZjpCLAUHO2IGisXsZ_43C6H1E7wJof9uhwU2gxbzdQ_UfEvb1OFjVvEmKPNrLfyfDmaGj2F-kW2L_8Y5G6JdfoKKnSTqmYgN4NcfGQIvIijk0rmmarrGIGa4l4Q29QiAtBPa9fvkEwq2WHbCocaQdmfGYk-dq0UVtcFH578rYAC7SjXkcjy50_pmhWSdKITXJIzZUNXuWFQTKIQ171oTstIns5sSZFi_-kb18sEcBq-Po7oE39OokBrRT4wHtYIUZUSGryBHz-5rjna-UR2ZWItDvyhXv7WI8WGkVykDMD1q3SeJQcfLRJavE4iNm0Mn32THyPrc6L3JZ6679PvXYgXwPyxBye-Tl_rr97-Pgi5QmTQ0LmcMmRntlwmGlrWSt0ARTB30H1kv6qv7zZzHhuCEYmAVxVRfMUE63tEi-RGIm7ri47pni4X6ZXC4BPnl9vj6X4XQG4_PqWuh1rAqErsApGfEuqajG9o1e01rLIhs3oUALCbOJ0xilszQGbNajNfFyB_uTBYO_poVU46Bw";
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
      List<dynamic> doctors = await apiService.fetchEmployeesByType("doctor", token);
      List<dynamic> nurses = await apiService.fetchEmployeesByType("nurse", token);
      List<dynamic> hrEmployees = await apiService.fetchEmployeesByType("hr", token);
      List<dynamic> analysts = await apiService.fetchEmployeesByType("analysis", token);

      setState(() {
        employees = [...doctors, ...nurses, ...hrEmployees, ...analysts];
      });
    } else {
      List<dynamic> data = await apiService.fetchEmployeesByType(type, token);
      setState(() {
        employees = data;
      });
    }
  }
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Employee',
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
              height: height / 25,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  UserProfile(
                        id: employee["id"],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:  NetworkImage(employee["avatar"]),
                      ),
                    ],
                  ),
                  title: Text(employee["first_name"]!,
                      style: const TextStyle(fontSize: 14)),
                  subtitle: Text("Specialist - ${employee["type"]}"!,
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
              builder: (context) => const Register(

              ),
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
          backgroundColor:
          selectedCategory == type ? AppColors.primaryColor : Colors.transparent,
          foregroundColor: selectedCategory == type ? Colors.white : Colors.black,
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

