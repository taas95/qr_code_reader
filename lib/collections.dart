class Collections {
  String name;
  String type;
  double price;

  Collections({this.name, this.price, this.type});

  static List<Collections> availableCollection() {
    var _listCollection = new List<Collections>();

    _listCollection
        .add(new Collections(name: "Impermeable", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Jean", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "T-Shirt", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Veste", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Pull", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Belt", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Shoes", price: 25000.0, type: "Up"));
    _listCollection
        .add(new Collections(name: "Costard", price: 25000.0, type: "Up"));
    return _listCollection;
  }
}
