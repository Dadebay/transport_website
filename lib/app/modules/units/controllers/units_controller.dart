import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UnitsController extends GetxController {}

class UnitService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Ölçü birimi ekleme
  Future<void> addUnit(String unit, String valueType) async {
    // Firebase veritabanına yeni ölçü birimi ekleme
    await _db.collection('units').add({
      'unit': unit,
      'valueType': valueType, // Veri türünü belirliyoruz (int, double, string)
    });
  }

  // Ölçü birimini çıkarma
  Future<void> removeUnit(String unitId) async {
    await _db.collection('units').doc(unitId).delete();
  }

  // Tüm ölçü birimlerini alma
  Future<List<Map<String, dynamic>>> getUnits() async {
    QuerySnapshot snapshot = await _db.collection('units').get();
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id, // Her bir ölçü biriminin id'si
        'unit': doc['unit'],
        'valueType': doc['valueType'],
      };
    }).toList();
  }
}
