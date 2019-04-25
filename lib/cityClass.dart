

class City {
  final String name;
  final String image;
  final String population;
  final String country;

  City({this.name, this.country, this.image, this.population});

  static List<City> allCities() {
    var listOfCities = new List<City>();

    listOfCities.add(new City(
        name: "Lome",
        population: "5 000 000",
        image: "lome.jpg",
        country: "Togo"));

    listOfCities.add(new City(
        name: "Cotonou",
        population: "7 000 000",
        image: "cotonou.jpg",
        country: "Benin"));
    listOfCities.add(new City(
        name: "Accra",
        population: "9 000 000",
        image: "accra.jpg",
        country: "Ghana"));
    listOfCities.add(new City(
        name: "Abuja",
        population: "20 000 000",
        image: "abuja.jpg",
        country: "Nigeria"));
    listOfCities.add(new City(
        name: "Dakar",
        population: "10 000 000",
        image: "dakar.jpg",
        country: "Sénégal"));
    return listOfCities;
  }
}
