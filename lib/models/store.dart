class Store {
  final String name;
  final String contact;
  final String imageUrl;

  Store({
    required this.name,
    required this.contact,
    required this.imageUrl,
  });

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['name'],
      contact: map['contact'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contact': contact,
      'imageUrl': imageUrl,
    };
  }

  static List<Store> providers = [
    Store(
        name: 'جرير',
        contact: '920000089 ',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/ar/thumb/3/3b/Jarir_Bookstore_Logo.svg/1198px-Jarir_Bookstore_Logo.svg.png?20171126210207'),
    Store(
        name: 'ساكو',
        contact: '8003020088',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/SACO_Hardware_Logo.svg/768px-SACO_Hardware_Logo.svg.png?20211128152459'),
    Store(
      name: 'ايكيا',
      contact: '8003040098',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Ikea-logo.png',
    ),
    Store(
      name: 'وست إلم',
      contact: '92000-2482.',
      imageUrl: 'https://i.imgur.com/f4wcb2w.png',
    ),
  ];
}
