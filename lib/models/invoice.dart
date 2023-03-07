class Invoice {
  String name;
  String invoice_no;
  double price;
  String date;
  int durationInDays;
  String notes;
  String store;
  String folder;
  String imageURL;
  int daysLeft;

  Invoice({
    required this.name,
    required this.invoice_no,
    required this.durationInDays,
    required this.notes,
    required this.store,
    required this.price,
    required this.date,
    required this.folder,
    required this.imageURL,
    required this.daysLeft,
  });

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      imageURL: map['imageURL'],
      price: map['price'],
      date: map['date'],
      durationInDays: map['durationInDays'],
      invoice_no: map['invoice_no'],
      name: map['name'],
      notes: map['notes'],
      store: map['store'],
      folder: map['folder'],
      daysLeft: map['daysLeft'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'date': date,
      'durationInDays': durationInDays,
      'invoice_no': invoice_no,
      'notes': notes,
      'store': store,
      'name': name,
      'imageURL': imageURL,
      'folder': folder,
      'daysLeft': daysLeft,
    };
  }
}
