class Invoice {
  String name;
  String invoice_no;
  double price;
  String date;
  int duration;
  String notes;
  String store;
  final String imageURL;

  Invoice({
    required this.name,
    required this.invoice_no,
    required this.duration,
    required this.notes,
    required this.store,
    required this.price,
    required this.date,
    required this.imageURL,
  });

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      imageURL: map['imageURL'],
      price: map['price'],
      date: map['date'],
      duration: map['duration'],
      invoice_no: map['invoice_no'],
      name: map['name'],
      notes: map['notes'],
      store: map['store'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'date': date,
      'duration': duration,
      'invoice_no': invoice_no,
      'notes': notes,
      'store': store,
      'name': name,
      'imageURL': imageURL,
    };
  }
}
