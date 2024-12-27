class Client {
  String name;
  final String number;
  final String address;
  final String date; // Bu alanı da dahil ettim
  int orderCount;
  String docID;
  String tmtPaid;
  String tmtUnpaid;
  String usdPaid;
  String usdUnpaid;

  Client({
    required this.name,
    required this.docID,
    required this.number,
    required this.address,
    required this.date,
    required this.orderCount,
    required this.tmtPaid,
    required this.tmtUnpaid,
    required this.usdPaid,
    required this.usdUnpaid,
  });

  // Client'ı bir Map gibi davranacak şekilde tanımlayalım
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'address': address,
      'order_count': orderCount,
      'tmt_paid': tmtPaid,
      'tmt_unpaid': tmtUnpaid,
      'usd_paid': usdPaid,
      'usd_unpaid': usdUnpaid,
      'date': date,
      'doc_id': docID,
    };
  }
}
