import 'package:first_flutter_project/pages/other/msgs.dart';
import 'package:first_flutter_project/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  //Text field Controllers
  final sales_input = TextEditingController();
  final date_input = TextEditingController();

  //service instance
  data_service _data_service = data_service();

  // value feeder
  String this_month_total ='This Month Total';
  String last_month_total = 'Last Month Total';
  String this_month_avg = 'This Month Average';
  String last_month_avg = 'Last Month Averaga';



  void upload_data() {
    DateTime date = DateTime.now();
    date_input.text = DateFormat('yyyy-MM-dd').format(date).toString();
    showDialog(context: context, builder: (context){

      return Dialog(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(flex:9,child: TextField(controller: date_input,decoration: const InputDecoration(helperText: "Date"))),
                          Expanded(flex:1 ,child: IconButton(onPressed: () async {DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate:DateTime(2100));
                          if (newDate == null) return;
                          setState(() => date_input.text = DateFormat('yyyy-MM-dd').format(newDate).toString()); }

                              ,
                              icon: const Icon(Icons.calendar_month)))],
                      ),
                      TextField(decoration: const InputDecoration(helperText: "Sales"),controller: sales_input,),
                      ElevatedButton(onPressed: () {setState(() async {
                          String message = await _data_service.addSales(date_input.text, num.parse(sales_input.text));
                          sales_input.clear();
                          Navigator.pop(context);

                          ToastUtils.showErrorSnackbar(context, message);});}, child: const Text('Submit'))
                    ],
                  ),
                ),
              )
          )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        floatingActionButton: FloatingActionButton(onPressed: () {
          upload_data();
        }, child: const Icon(Icons.add)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Card(
                //elevation: 10.0,
                //color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('This Month',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.grey[800]),textAlign: TextAlign.left,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,8,0,12),
                                  child: Text('Total',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                                ),
                                Text(this_month_total,style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,color: Colors.teal),textAlign: TextAlign.left,)],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0,8,0,12),
                                  child: Text('Average',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                                ),
                                Text(this_month_avg,style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,color: Colors.teal),textAlign: TextAlign.left,)],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
                Card(
                  //elevation: 10.0,
                  //color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Month',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.grey[800]),textAlign: TextAlign.left,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,8,0,12),
                                    child: Text('Total',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                                  ),
                                  Text(last_month_total,style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,color: Colors.teal),textAlign: TextAlign.left,)],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,8,0,12),
                                    child: Text('Average',style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                                  ),
                                  Text(last_month_avg,style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.w400,color: Colors.teal),textAlign: TextAlign.left,)],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                )]
          ),
        )

    );;
  }
}
