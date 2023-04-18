class UniversityData {
  String? stateProvince;
  List<String>? webPages;
  String? country;
  String? name;
  String? alphaTwoCode;
  List<String>? domains;

  UniversityData(
      {this.stateProvince,
      this.webPages,
      this.country,
      this.name,
      this.alphaTwoCode,
      this.domains});

  UniversityData.fromJson(Map<String, dynamic> json) {
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
    country = json['country'];
    name = json['name'];
    alphaTwoCode = json['alpha_two_code'];
    domains = json['domains'].cast<String>();
  }
}
