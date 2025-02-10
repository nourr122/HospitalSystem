import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class EmployeesList extends StatefulWidget {
  _EmployeesState createState() => _EmployeesState();
}

var size, height, width;

class _EmployeesState extends State<EmployeesList> {
  List<Map<String, String>> people = [
    {
      "name": "Salma Ahmed",
      "specialty": "Specialist - Doctor",
      "image": "assets/salma.jpg",
      "status": "green"
    },
    {
      "name": "Helmy Fadl",
      "specialty": "Specialist - Doctor",
      "image": "assets/helmy.jpg",
      "status": "green"
    },
    {
      "name": "Shawky Haleem",
      "specialty": "Specialist - Analysis",
      "image": "assets/shawky.jpg",
      "status": "green"
    },
    {
      "name": "Islam Mahmoud",
      "specialty": "Specialist - HR",
      "image": "assets/hr.jpg",
      "status": "green"
    },
    {
      "name": "Ali Ahmed",
      "specialty": "Specialist - Analysis",
      "image": "assets/hr.jpg",
      "status": "orange"
    },
    {
      "name": "Hend Ali",
      "specialty": "Specialist - Doctor",
      "image": "assets/hend.jpg",
      "status": "orange"
    },
    {
      "name": "Ahmed Zain",
      "specialty": "Specialist - Doctor",
      "image": "assets/ahmedzain.jpg",
      "status": "orange"
    },
    {
      "name": "Zeyad Ali",
      "specialty": "Specialist - HR",
      "image": "assets/hr2.jpg",
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
            onPressed: () {},
            icon: Icon(Icons.arrow_back_outlined),
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
                  SizedBox(width: 10),
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
                        child: Text('All', textAlign: TextAlign.center),
                      ),
                      SizedBox(width: 10),
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
                        child: Text('Doctor', textAlign: TextAlign.center),
                      ),
                      SizedBox(width: 10),
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
                        child: Text('Nurse', textAlign: TextAlign.center),
                      ),
                      SizedBox(width: 10),
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
                        child: Text('HR Employee', textAlign: TextAlign.center),
                      ),
                      SizedBox(width: 10),
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
                        child: Text('Analysis Employee',
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child:
            ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                var person = people[index];


                Color statusColor = person["status"] == "green" ? Colors.green : Colors.orange;
                print(statusColor);

                return InkWell(
                  onTap: () {

                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    title: Text(person["name"]!, style: TextStyle(fontSize: 14)),
                    subtitle: Text(person["specialty"]!, style: TextStyle(fontSize: 12)),
                  ),
                );
              },
            )

          )

        ],
      ),
    );
  }
}
