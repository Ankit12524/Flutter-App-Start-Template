
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/services/data_model.dart';
import 'package:firebase_database/firebase_database.dart';


class data_service {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;



  Future<String> addSales(String date, sales) async {
    try {
      await _database.ref().child('users/${_auth.currentUser!.uid}/sales').update(
          {date:sales});

      await    _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({
        'Sales.$date': sales,

      });
      return 'Date Succesfully Updated';
    } catch (error) {
      return error.toString();
    }


}
  Stream<Map<String, dynamic>> getMonthlySalesStream() {
    String userId = _auth.currentUser!.uid;
    return _firestore.collection('users').doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data()!['Sales'] ?? {};
      } else {
        return {};
      }
    });
  }

  Stream<List<SalesData>> getDailySalesStream(String month) {
    String userId = _auth.currentUser!.uid;
    return _firestore.collection('users').doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> salesData = snapshot.data()!['Sales'] ?? {};
        List<SalesData> salesList = salesData.entries
            .where((entry) => entry.key.startsWith(month))
            .map((entry) => SalesData(date: entry.key, sales: entry.value))
            .toList();

        // Sort the salesList in descending order by date
        salesList.sort((a, b) => b.date.compareTo(a.date));
        return salesList;
      } else {
        return [];
      }
    });
  }
}