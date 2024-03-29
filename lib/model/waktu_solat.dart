import 'package:waktu_solat_malaysia/util/format_masa.dart';
import 'package:waktu_solat_malaysia/util/masa_ke_datetime.dart';

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

    final imsak = formatMasa(data['imsak']).replaceAll(" ", " ");
    final subuh = formatMasa(data['fajr']).replaceAll(" ", " ");
    final syuruk = formatMasa(data['syuruk']).replaceAll(" ", " ");
    final zohor = formatMasa(data['dhuhr']).replaceAll(" ", " ");
    final asar = formatMasa(data['asr']).replaceAll(" ", " ");
    final maghrib = formatMasa(data['maghrib']).replaceAll(" ", " ");
    final isyak = formatMasa(data['isha']).replaceAll(" ", " ");

    return WaktuSolat(
      hari: hari.dalamBahasaMelayu,
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

  @override
  String toString() => '''
Waktu solat $hari ($masihi/$hijrah)
  
Imsak   : $imsak
Subuh   : $subuh
Syuruk  : $syuruk
Zohor   : $zohor
Asar    : $asar
Maghrib : $maghrib
Isyak   : $isyak
''';
}
