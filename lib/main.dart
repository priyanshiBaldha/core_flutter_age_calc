import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  DateTime todayDate = DateTime.now();
  TextEditingController DateController = TextEditingController();
  TextEditingController MonthController = TextEditingController();
  TextEditingController YearController = TextEditingController();
  String PresentDay = "00";
  String PresentMonth = "00";
  String PresentYear = "00";
  String NextMonth = "00";
  String NextDay = "00";
  String? BirthDay;
  String? BirthMonth;
  String? BirthYear;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Age Calculator",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff203A43),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Today's Date",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade500),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabled: false,
                        hintText: (todayDate.day > 9)
                            ? DateFormat(" ${todayDate.day} MMM, y").format(todayDate)
                            : DateFormat(" 0${todayDate.day} MMM, y").format(todayDate),
                        hintStyle: const TextStyle(
                          color: Color(0xff1C003E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Date Of Birth",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          BirthDay = val;
                        });
                      },
                      controller: DateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: " DD",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          BirthMonth = val;
                        });
                      },
                      controller: MonthController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: " MM",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          BirthYear = val;
                        });
                      },
                      controller: YearController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: " YYYY",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        DateController.clear();
                        MonthController.clear();
                        YearController.clear();
                      });
                    },
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xff13547A),
                          ),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              spreadRadius: 0.2,
                              offset: Offset(2,3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        PresentYear =
                            (todayDate.year - int.parse(BirthYear!)).toString();
                        if (todayDate.month < int.parse(BirthMonth!)) {
                          PresentYear = (int.parse(PresentYear) + 1).toString();
                        }
                        if (todayDate.month > int.parse(BirthMonth!)) {
                          PresentMonth =
                              (todayDate.month - int.parse(BirthMonth!))
                                  .toString();
                        } else {
                          PresentMonth =
                              (int.parse(BirthMonth!) - todayDate.month)
                                  .toString();
                          PresentMonth =
                              (12 - int.parse(PresentMonth)).toString();
                        }
                        if (todayDate.day >= int.parse(BirthDay!)) {
                          PresentDay =
                              (todayDate.day - int.parse(BirthDay!)).toString();
                        } else {
                          PresentDay =
                              (int.parse(BirthDay!) - todayDate.day).toString();
                          PresentDay = (30 - int.parse(PresentDay)).toString();
                        }
                        if (todayDate.day < int.parse(BirthDay!)) {
                          PresentMonth =
                              (int.parse(PresentMonth) - 1).toString();
                        }
                        if (todayDate.month == int.parse(BirthMonth!)) {
                          PresentMonth = (0).toString();
                        } else if (todayDate.month < int.parse(BirthMonth!)) {
                          PresentYear = (int.parse(PresentYear) - 2).toString();
                        }
                        if (todayDate.year == int.parse(BirthYear!)) {
                          PresentYear = ("00").toString();
                          if (todayDate.month < int.parse(BirthMonth!)) {
                            PresentMonth = ("00").toString();
                            if (todayDate.day < int.parse(BirthDay!)) {
                              PresentDay = ("00").toString();
                            }
                          }
                        }
                        if(todayDate.month<int.parse(BirthMonth!))
                        {
                          NextMonth = (12 - int.parse(PresentMonth)-1).toString();
                        }
                        else {
                          NextMonth = (12 - int.parse(PresentMonth)).toString();
                        }
                        NextDay = (30 - int.parse(PresentDay)).toString();
                      });
                    },
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff13547A),
                          border: Border.all(
                            color: const Color(0xff13547A),
                          ),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              spreadRadius: 0.2,
                              offset: Offset(2,3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Present Age",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xff13547A),
                              Color(0xff203A43),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  PresentYear,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "Year",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  PresentMonth,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "MM",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  PresentDay,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "DD",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Next Birthday",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xff006ACB),
                              Color(0xff6BBED9),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  NextMonth,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "MM",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  NextDay,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "DD",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}