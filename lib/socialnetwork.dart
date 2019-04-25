class SocialNetwork {
  String name;
  String link;
  String basecolor;

  SocialNetwork({this.link, this.name, this.basecolor});

  static List<SocialNetwork> allsocial() {
    var listOfSocial = new List<SocialNetwork>();

    listOfSocial.add(new SocialNetwork(
        name: "Facebook", link: "home/taas", basecolor: "#2196F3"));
    listOfSocial.add(new SocialNetwork(
        name: "Twitter", link: "home/taas", basecolor: "42A5F5"));
    listOfSocial.add(new SocialNetwork(
        name: "Google", link: "home/taas", basecolor: "F44336"));
    listOfSocial.add(new SocialNetwork(
        name: "Telegram", link: "home/taas", basecolor: "90CAF9"));
    return listOfSocial;
  }
}
