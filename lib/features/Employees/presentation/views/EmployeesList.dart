import 'package:flutter/material.dart';
import 'package:instant_project/features/profile/presentation/views/Register.dart';
import 'package:instant_project/features/profile/presentation/views/Myprofile.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class EmployeesList extends StatefulWidget {
  const EmployeesList({super.key});

  @override
  _EmployeesState createState() => _EmployeesState();
}

var size, height, width;

class _EmployeesState extends State<EmployeesList> {
  List<Map<String, String>> people = [
    {
      "name": "Salma Ahmed",
      "specialty": "Specialist - Doctor",
      "image": "assets/images/salma.jpg",
      "status": "green"
    },
    {
      "name": "Helmy Fadl",
      "specialty": "Specialist - Doctor",
      "image": "assets/images/helmy.jpg",
      "status": "green"
    },
    {
      "name": "Shawky Haleem",
      "specialty": "Specialist - Analysis",
      "image": "assets/images/shawky.jpg",
      "status": "green"
    },
    {
      "name": "Islam Mahmoud",
      "specialty": "Specialist - HR",
      "image": "assets/images/hr.jpg",
      "status": "green"
    },
    {
      "name": "Ali Ahmed",
      "specialty": "Specialist - Analysis",
      "image": "assets/images/hr.jpg",
      "status": "orange"
    },
    {
      "name": "Hend Ali",
      "specialty": "Specialist - Doctor",
      "image": "assets/images/hend.jpg",
      "status": "orange"
    },
    {
      "name": "Ahmed Zain",
      "specialty": "Specialist - Doctor",
      "image": "assets/images/ahmedzain.jpg",
      "status": "orange"
    },
    {
      "name": "Zeyad Ali",
      "specialty": "Specialist - HR",
      "image": "assets/images/hr2.jpg",
      "status": "orange"
    },
  ];

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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          side: const BorderSide(
                              color: Color(0x50707070), width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('All', textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                              color: Color(0x50707070), width: 1.2), // Border
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Rounded edges
                          ),
                        ),
                        child:
                            const Text('Doctor', textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                              color: Color(0x50707070), width: 1.2), // Border
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Rounded edges
                          ),
                        ),
                        child: const Text('Nurse', textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                              color: Color(0x50707070), width: 1.2), // Border
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Rounded edges
                          ),
                        ),
                        child: const Text('HR Employee',
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(
                              color: Color(0x50707070), width: 1.2), // Border
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Rounded edges
                          ),
                        ),
                        child: const Text('Analysis Employee',
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              var person = people[index];

              Color statusColor =
                  person["status"] == "green" ? Colors.green : Colors.orange;
              print(statusColor);

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(id: 88,), //send id of emp
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
                        backgroundImage: AssetImage(person["image"]!),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(person["name"]!,
                      style: const TextStyle(fontSize: 14)),
                  subtitle: Text(person["specialty"]!,
                      style: const TextStyle(fontSize: 12)),
                ),
              );
            },
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Register(

              ),
            ),
          );
        },
      ),
    );
  }
}
