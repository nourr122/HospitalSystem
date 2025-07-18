import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/features/cases/presentation/views/addNurse.dart';
import 'package:instant_project/features/cases/presentation/views/medical.dart';
import 'addMedical.dart';
import '../../data/models/caseModel.dart';
import '../../data/models/apiServer.dart';

class CaseDetails extends StatefulWidget {
  const CaseDetails({super.key, required this.title, required this.specialist});
  final String specialist;
  final String title;

  @override
  State<CaseDetails> createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {
  bool isSelected = false;
  String content = 'Case';
  String selectedOption = '';
  bool isVisible = true;
  CaseShow l=CaseShow();
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



  void _changeContent(String newText) {
    setState(() {
      content = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.whiteColor1,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor1,
          title: Text(
            "Cases Details",
            style:
                TextStyle(fontFamily: 'Poppins', fontSize: screenwidth * 0.055),
          ),
          centerTitle: true,
        ),
        body:
          data== null?
          Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
            : Column(
                  children: [
        Padding(
          padding: EdgeInsets.all(screenwidth * 0.015),
          child: Row(
            children: [
              widget.specialist == "doctor" ||
                      widget.specialist == "Nurse" ||
                      widget.specialist == "Analysis" ||
                      widget.specialist == "manger"
                  ? OutlinedButton(
                    onPressed: () {
                      _changeContent("Case");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      side: BorderSide(
                        color: content == "Case"
                            ? AppColors.primaryColor
                            : AppColors.grayColor3,
                        width: 1,
                      ),
                      backgroundColor: content == "Case"
                          ? AppColors.primaryColor
                          : AppColors.whiteColor1,
                    ),
                    child: Text(
                      "Case",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: screenwidth * 0.03,
                          color: content == "Case"
                              ? AppColors.whiteColor1
                              : AppColors.blackColor1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                  : const SizedBox(),
              widget.specialist == "doctor" ||
                      widget.specialist == "Analysis" ||
                      widget.specialist == "manger"
                  ? Padding(
                      padding: EdgeInsets.all(screenwidth * 0.004),
                      child: OutlinedButton(
                        onPressed: () {
                          widget.specialist == "Analysis"
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddMedical(
                                              role:
                                                  widget.specialist)),
                                )
                              : _changeContent("Medical Record");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          side: BorderSide(
                            color: content == "Medical Record"
                                ? AppColors.primaryColor
                                : AppColors.grayColor3,
                            width: 1,
                          ),
                          backgroundColor: content == "Medical Record"
                              ? AppColors.primaryColor
                              : AppColors.whiteColor1,
                        ),
                        child: Text(
                          "Medical Record",
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.03,
                            color: content == "Medical Record"
                                ? AppColors.whiteColor1
                                : AppColors.blackColor1,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  : const SizedBox(),
              widget.specialist == "manger" ||
                      widget.specialist == "doctor" ||
                      widget.specialist == "Nurse"
                  ? OutlinedButton(
                    onPressed: () {
                      widget.specialist == "Nurse"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMedical(
                                      role: widget.specialist)),
                            )
                          : _changeContent("Medical Measurement");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      side: BorderSide(
                        color: content == "Medical Measurement"
                            ? AppColors.primaryColor
                            : AppColors.grayColor3,
                        width: 1,
                      ),
                      backgroundColor:
                          content == "Medical Measurement"
                              ? AppColors.primaryColor
                              : AppColors.whiteColor1,
                    ),
                    child: Text(
                      "Medical Measurement",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: screenwidth * 0.03,
                        color: content == "Medical Measurement"
                            ? AppColors.whiteColor1
                            : AppColors.blackColor1,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                  : const SizedBox()
            ],
          ),
        ),
        widget.specialist == "Nurse" ||
                widget.specialist== "Analysis"
            ? isVisible
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenwidth * 0.01),
                    child: Card(
                        color: AppColors.orangeColor2,
                        child: Padding(
                          padding: EdgeInsets.all(screenwidth * 0.025),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "You have a request",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: screenwidth * 0.035,
                                      color: AppColors.orangeColor1,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: screenwidth * 0.05,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    "You have a new request from the doctor, please follow up and implement the request as soon as possible",
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: screenwidth * 0.03,
                                      color: AppColors.blackColor1,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: screenheight * 0.01,
                              ),
                              Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        side: const BorderSide(
                                            color: AppColors.orangeColor1,
                                            width: 2),
                                        backgroundColor:
                                            AppColors.orangeColor1),
                                    child: Text("Show Details",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: screenwidth * 0.03,
                                          color: AppColors.whiteColor1,
                                        )),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  )
                : const SizedBox()
            : const SizedBox(),
        SizedBox(
          height: screenheight * 0.02,
        ),
        content == 'Case'
            ? Expanded(
                child: Padding(
                padding: EdgeInsets.all(screenwidth * 0.02),
                child: ListView(
                  children: [
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Patient Name",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.grayColor3),
                      ),
                      SizedBox(
                        width: screenwidth * 0.31,
                      ),
                      Text(
                        data!.patientName!,
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.blackColor1),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.grayColor3),
                      ),
                      SizedBox(
                        width: screenwidth * 0.7,
                      ),
                      Text(
                        data!.age!,
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: screenwidth * 0.04,
                          color: AppColors.blackColor1,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text("Phone Number",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: screenwidth * 0.04,
                              color: AppColors.grayColor3)),
                      SizedBox(
                        width: screenwidth * 0.34,
                      ),
                      Text(
                        data!.phone!,
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.blackColor1),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Date",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.grayColor3),
                      ),
                      SizedBox(
                        width: screenwidth * 0.55,
                      ),
                      Text(
                        data!.createdAt!,
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.blackColor1),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Doctor",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.grayColor3),
                      ),
                      SizedBox(
                        width: screenwidth * 0.2,
                      ),
                      Text(
                        data!.doctorId!,
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: screenwidth * 0.04,
                          color: AppColors.blackColor1,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Nurse",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: screenwidth * 0.04,
                          color: AppColors.grayColor3,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.17,
                      ),
                      Text(
                        data!.nurseId!,
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: screenwidth * 0.04,
                          color: AppColors.blackColor1,
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(children: [
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.grayColor3),
                      ),
                      SizedBox(
                        width: screenwidth * 0.5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              data!.status!,
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: screenwidth * 0.04,
                                  color: AppColors.blackColor1)),
                          SizedBox(
                            width: screenwidth * 0.01,
                          ),
                          Image.asset(AppAssets.callstime,
                              width: screenwidth * 0.04,
                              height: screenheight * 0.04),
                        ],
                      ),
                      SizedBox(
                        width: screenwidth * 0.03,
                      ),
                    ]),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenwidth * 0.03,
                        ),
                        Text("Case Description",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: screenwidth * 0.04,
                              color: AppColors.grayColor3,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: screenheight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenwidth * 0.03,
                        ),
                        Expanded(
                            child: Text(
                           data!.description!,
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.04,
                            color: AppColors.blackColor1,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: screenheight * 0.02,
                    ),
                    widget.specialist == "doctor"
                        ? Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectNurse(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2,
                                    ),
                                    backgroundColor: AppColors.primaryColor,
                                    minimumSize: Size(screenwidth * 0.2,
                                        screenheight * 0.05),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: AppColors.whiteColor1,
                                        size: screenheight * 0.04,
                                      ),
                                      Text(
                                        "Add Nurse",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: screenwidth * 0.035,
                                            color: AppColors.whiteColor1),
                                      )
                                    ],
                                  )),
                              OutlinedButton(
                                  onPressed: () {
                                    String? selectedOption;
                                    showModalBottomSheet(
                                      context: context,
                                      showDragHandle: true,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return SizedBox(
                                            height: screenheight * 0.25,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    SizedBox(
                                                      width: screenwidth *
                                                          0.02,
                                                    ),
                                                    Expanded(
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedOption =
                                                                "Medical Record";
                                                          });
                                                        },
                                                        style:
                                                            ElevatedButton
                                                                .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          side: BorderSide(
                                                              color: selectedOption ==
                                                                      'Medical Record'
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .grayColor3,
                                                              width: 2),
                                                          minimumSize: Size(
                                                              screenwidth *
                                                                  0.4,
                                                              screenheight *
                                                                  0.165),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              AppAssets
                                                                  .treatment,
                                                              width:
                                                                  screenwidth *
                                                                      0.2,
                                                              height:
                                                                  screenheight *
                                                                      0.1,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenheight *
                                                                        0.01),
                                                            Text(
                                                              "Medical Record",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      screenwidth *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: selectedOption ==
                                                                          'Medical Record'
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .grayColor3),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: screenwidth *
                                                            0.02),
                                                    Expanded(
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedOption =
                                                                "Medical Measurement";
                                                          });
                                                        },
                                                        style:
                                                            ElevatedButton
                                                                .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          side: BorderSide(
                                                              color: selectedOption ==
                                                                      'Medical Measurement'
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .grayColor3,
                                                              width: 2),
                                                          minimumSize: Size(
                                                              screenwidth *
                                                                  0.4,
                                                              screenheight *
                                                                  0.1),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              AppAssets
                                                                  .dashboard,
                                                              width:
                                                                  screenwidth *
                                                                      0.2,
                                                              height:
                                                                  screenheight *
                                                                      0.1,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenheight *
                                                                        0.01),
                                                            Text(
                                                              "Medical Measurement",
                                                              style:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize:
                                                                    screenwidth *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: selectedOption ==
                                                                        'Medical Measurement'
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : AppColors
                                                                        .grayColor3,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: screenwidth *
                                                          0.02,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: screenheight *
                                                        0.02),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                              screenwidth *
                                                                  0.03),
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Medical(
                                                                  selectedOption:
                                                                      selectedOption!),
                                                        ),
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12),
                                                      ),
                                                      side: const BorderSide(
                                                          color: AppColors
                                                              .primaryColor,
                                                          width: 2),
                                                      backgroundColor:
                                                          AppColors
                                                              .primaryColor,
                                                      minimumSize: Size(
                                                          double.infinity,
                                                          screenheight *
                                                              0.055),
                                                    ),
                                                    child: Text(
                                                      "Request",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Poppins',
                                                        fontSize:
                                                            screenwidth *
                                                                0.035,
                                                        color: AppColors
                                                            .whiteColor1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 2,
                                    ),
                                    backgroundColor: AppColors.primaryColor,
                                    minimumSize: Size(screenwidth * 0.2,
                                        screenheight * 0.05),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: AppColors.whiteColor1,
                                        size: screenheight * 0.04,
                                      ),
                                      Text(
                                        "Requset",
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: screenwidth * 0.035,
                                            color: AppColors.whiteColor1),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ))
            : content == 'Medical Record'
                ? Expanded(
                    child: Padding(
                    padding: EdgeInsets.all(screenwidth * 0.02),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            ListTile(
                                trailing: Text(
                                  data!.createdAt!,
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: screenwidth * 0.03,
                                    color: AppColors.grayColor3,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(AppAssets.Aml),
                                ),
                                title: Text(
                                  data!.doctorId!,
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: AppColors.blackColor1,
                                      fontSize: screenwidth * 0.04),
                                ),
                                subtitle: Text(
                                  data!.analysisId!,
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: AppColors.primaryColor,
                                      fontSize: screenwidth * 0.03),
                                )),
                            SizedBox(
                              height: screenheight * 0.01,
                            ),
                            Text(
                              "Details Note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: screenwidth * 0.04,
                                color: AppColors.blackColor1,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            SizedBox(height: screenheight * 0.02),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Medical Record",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: screenwidth * 0.04,
                                          color: AppColors.blackColor1,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight * 0.02,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.dot),
                                    SizedBox(
                                      width: screenwidth * 0.02,
                                    ),
                                    Text("Blood pressure",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: screenwidth * 0.04,
                                          color: AppColors.blackColor1,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight * 0.01,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.dot),
                                    SizedBox(
                                      width: screenwidth * 0.02,
                                    ),
                                    Text("Sugar analysis",
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: screenwidth * 0.04,
                                          color: AppColors.blackColor1,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: screenheight * 0.01,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.path),
                                    IconButton(
                                      icon: Image.asset(AppAssets.download),
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                : content == "Medical Measurement"
                    ? Expanded(
                        child: Padding(
                        padding: EdgeInsets.all(screenwidth * 0.02),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                ListTile(
                                    trailing: Text(
                                      data!.createdAt!,
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: screenwidth * 0.03,
                                        color: AppColors.grayColor3,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                      child: Image.asset(AppAssets.Aml),
                                    ),
                                    title: Text(
                                      data!.patientName!,
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: AppColors.blackColor1,
                                          fontSize: screenwidth * 0.04),
                                    ),
                                    subtitle: Text(
                                      data!.analysisId!,
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          color: AppColors.primaryColor,
                                          fontSize: screenwidth * 0.03),
                                    )),
                                SizedBox(
                                  height: screenheight * 0.01,
                                ),
                                Text(
                                  "Details Note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ",
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: screenwidth * 0.04,
                                    color: AppColors.blackColor1,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                SizedBox(height: screenheight * 0.02),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Medical Record",
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: screenwidth * 0.04,
                                              color: AppColors.blackColor1,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(AppAssets.dot),
                                        SizedBox(
                                          width: screenwidth * 0.02,
                                        ),
                                        Row(
                                          children: [
                                            Text("Blood pressure",
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize:
                                                      screenwidth * 0.04,
                                                  color:
                                                      AppColors.blackColor1,
                                                )),
                                            SizedBox(
                                              width: screenwidth * 0.42,
                                            ),
                                             Text(data!.bloodPressure!,style: TextStyle(
                                               fontFamily: 'poppins',
                                               fontSize:
                                               screenwidth * 0.04,
                                               color:
                                               AppColors.blackColor1,
                                             ))
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenheight * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(AppAssets.dot),
                                        SizedBox(
                                          width: screenwidth * 0.02,
                                        ),
                                        Row(
                                          children: [
                                            Text("Sugar analysis",
                                                style: TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize:
                                                      screenwidth * 0.04,
                                                  color:
                                                      AppColors.blackColor1,
                                                )),
                                            SizedBox(
                                              width: screenwidth * 0.42,
                                            ),
                                             Text(data!.sugarAnalysis!,style: TextStyle(
                                               fontFamily: 'poppins',
                                               fontSize:
                                               screenwidth * 0.04,
                                               color:
                                               AppColors.blackColor1,
                                             ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    : Container(),
        widget.specialist == "receptionist"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: AppColors.redColor1,
                          width: 2,
                        ),
                        backgroundColor: AppColors.redColor1,
                        minimumSize:
                            Size(screenwidth * 0.96, screenheight * 0.055),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: screenwidth * 0.035,
                            color: AppColors.whiteColor1),
                      ))
                ],
              )
            : widget.specialist== "doctor"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(
                              color: AppColors.redColor1,
                              width: 2,
                            ),
                            backgroundColor: AppColors.redColor1,
                            minimumSize: Size(
                                screenwidth * 0.96, screenheight * 0.055),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "End Case",
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: screenwidth * 0.035,
                                    color: AppColors.whiteColor1),
                              )
                            ],
                          ))
                    ],
                  )
                : widget.specialist== "Nurse"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: const BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                                backgroundColor: AppColors.primaryColor,
                                minimumSize: Size(screenwidth * 0.96,
                                    screenheight * 0.055),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Call Doctor",
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: screenwidth * 0.035,
                                        color: AppColors.whiteColor1),
                                  )
                                ],
                              ))
                        ],
                      )
                    : const SizedBox()
                  ],
                ));
  }
}
