import 'package:waktu_solat_malaysia/util/format_masa.dart';

class WaktuSolat {
  /// dalam bahasa inggeris. Contohnya "Tuesday".
  String? hari;

  /// tarikh dalam kalendar hijrah. contoh output: "1445-06-03"
  String? hijrah;

  /// tarikh dalam kalendar masihi. contoh output: "16-Dec-2023"
  String? masihi;

  /// 10 minit sebelum waktu subuh. format asal waktu solat ialah dalam bentuk
  /// AM/PM. Contohnya, "5:38 AM".
  String? imsak;

  /// format asal waktu solat ialah dalam bentuk AM/PM. Contohnya, "5:38 AM".
  String? subuh;

  /// Waktu akhir subuh. format asal waktu solat ialah dalam bentuk AM/PM.
  /// Contohnya, "5:38 AM".
  String? syuruk;

  /// format asal waktu solat ialah dalam bentuk AM/PM. Contohnya, "5:38 AM".
  String? zohor;

  /// format asal waktu solat ialah dalam bentuk AM/PM. Contohnya, "5:38 AM".
  String? asar;

  /// format asal waktu solat ialah dalam bentuk AM/PM. Contohnya, "5:38 AM".
  String? maghrib;

  /// format asal waktu solat ialah dalam bentuk AM/PM. Contohnya, "5:38 AM".
  String? isyak;

  WaktuSolat({
    this.hari,
    this.hijrah,
    this.masihi,
    this.imsak,
    this.subuh,
    this.syuruk,
    this.zohor,
    this.asar,
    this.maghrib,
    this.isyak,
  });

  factory WaktuSolat.fromJson(Map<String, dynamic> data) {
    final hari = data['day'] as String;
    final hijrah = data['hijri'] as String;
    final masihi = data['date'] as String;

    final imsak = formatMasa(data['imsak']);
    final subuh = formatMasa(data['fajr']);
    final syuruk = formatMasa(data['syuruk']);
    final zohor = formatMasa(data['dhuhr']);
    final asar = formatMasa(data['asr']);
    final maghrib = formatMasa(data['maghrib']);
    final isyak = formatMasa(data['isha']);

    return WaktuSolat(
      hari: hari,
      hijrah: hijrah,
      masihi: masihi,
      imsak: imsak,
      subuh: subuh,
      syuruk: syuruk,
      zohor: zohor,
      asar: asar,
      maghrib: maghrib,
      isyak: isyak,
    );
  }
}
