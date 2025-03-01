import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/cases/data/models/caseModel.dart';
import 'package:instant_project/features/cases/data/models/apiServer.dart';

class SelectNurse extends StatefulWidget {
  const SelectNurse({super.key});

  @override
  _SelectNurseState createState() => _SelectNurseState();
}

class _SelectNurseState extends State<SelectNurse> {
  String? selectedNurse;
  TextEditingController searchController = TextEditingController();
  CaseModel? data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    print("Fetching data...");

    CaseModel fetchedData = await ApiServer().showCase(state: "all");

    print("Fetched Data: $fetchedData");

    if (fetchedData != null) {
      setState(() {
        data = fetchedData;
      });
    } else {
      print("!No data received!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select Nurse",
          style:
              TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.055),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: data == null
          ? Center(
              child: Text(
                "Don't Have Nurses",
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: screenwidth * 0.055),
              ),
            )
          : // لا يوجد data فى ال api
          //قمت بعمل نفس الشئ ولكن ببيانات caseModel
          ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenheight * 0.02),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search for nurse",
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins', fontSize: screenwidth * 0.04),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(data!.nurseId!),
                  subtitle: Text(data!.analysisId!),
                  trailing: CustomRadioButton(
                    value: data!.nurseId!,
                    groupValue: data!.analysisId!,
                    onChanged: (newValue) {
                      setState(() {
                        selectedNurse = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: MediaQuery.of(context).size.width / 16,
        height: MediaQuery.of(context).size.height / 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 28,
            height: MediaQuery.of(context).size.height / 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
