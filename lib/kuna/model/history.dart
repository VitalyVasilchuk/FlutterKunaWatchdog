import 'dart:convert';

class History {
  static History historyFromJson(String str) => History.fromJson(json.decode(str));

  static String historyToJson(History data) => json.encode(data.toJson());

  List<double> t;
  List<double> h;
  List<double> l;
  List<double> o;
  List<double> c;
  List<double> v;
  String s;

  History({
    required this.t,
    required this.h,
    required this.l,
    required this.o,
    required this.c,
    required this.v,
    required this.s,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        t: List<double>.from(json["t"].map((x) => x.toDouble())),
        h: List<double>.from(json["h"].map((x) => x.toDouble())),
        l: List<double>.from(json["l"].map((x) => x.toDouble())),
        o: List<double>.from(json["o"].map((x) => x.toDouble())),
        c: List<double>.from(json["c"].map((x) => x.toDouble())),
        v: List<double>.from(json["v"].map((x) => x.toDouble())),
        s: json["s"],
      );

  Map<String, dynamic> toJson() => {
        "t": List<dynamic>.from(t.map((x) => x)),
        "h": List<dynamic>.from(h.map((x) => x)),
        "l": List<dynamic>.from(l.map((x) => x)),
        "o": List<dynamic>.from(o.map((x) => x)),
        "c": List<dynamic>.from(c.map((x) => x)),
        "v": List<dynamic>.from(v.map((x) => x)),
        "s": s,
      };
}
