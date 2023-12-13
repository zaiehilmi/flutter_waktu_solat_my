import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:waktu_solat_malaysia/model/tempoh_jadual.dart';
import 'package:waktu_solat_malaysia/model/waktu_solat.dart';
import 'package:waktu_solat_malaysia/model/zon_waktu_solat.dart';

const _eSolatEndpoint =
    'https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&';

String _urlPath(String path) {
  if (kDebugMode) print('laluan URL: $_eSolatEndpoint$path');

  return '$_eSolatEndpoint$path';
}

/// untuk mendapatkan waktu solat
///
/// memerlukan [zonWaktuSolat] dan boleh dipilih melalui enum [ZonWaktuSolat] atau melalui
/// method __tentukanZon()__.
/// Untuk [tempohJadual], secara lalai akan menggunakan menunjukkan waktu solat hari ini namun boleh memilih juga
/// untuk tempoh waktu lain yang terdapat di enum [TempohJadual].
/// Untuk [TempohJadual.durasi], pastikan disertakan juga dengan [mula] dan [tamat] dalam jenis [DateTime]
Future<List<WaktuSolat>?> dapatkanJadualWaktuSolat(
  ZonWaktuSolat zonWaktuSolat, {
  TempohJadual tempohJadual = TempohJadual.harini,
  DateTime? mula,
  DateTime? tamat,
}) async {
  return _ambilSenaraiWaktuSolat(
    zonWaktuSolat,
    tempohJadual: tempohJadual,
    tarikhMula: mula,
    tarikhTamat: tamat,
  );
}

Future<List<WaktuSolat>?> _ambilSenaraiWaktuSolat(
  ZonWaktuSolat zonWaktuSolat, {
  TempohJadual tempohJadual = TempohJadual.harini,
  DateTime? tarikhMula,
  DateTime? tarikhTamat,
}) async {
  List<WaktuSolat>? senaraiWaktuSolat = [];
  late final http.Response response;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final Uri url = Uri.parse(
      _urlPath('&zone=${zonWaktuSolat.name}&period=${tempohJadual.nama}'));

  try {
    if (tempohJadual == TempohJadual.durasi) {
      final formatTarikhMula = dateFormat.format(tarikhMula!);
      final formatTarikhTamat = dateFormat.format(tarikhTamat!);

      response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'datestart=$formatTarikhMula&dateend=$formatTarikhTamat',
      );
    } else {
      response = await http.get(url);
    }
    final json = await jsonDecode(response.body);
    if (kDebugMode) print(json);

    for (var items in json["prayerTime"]) {
      var temp = WaktuSolat.fromJson(items);
      senaraiWaktuSolat.add(temp);
    }

    return senaraiWaktuSolat;
  } catch (e) {
    if (tarikhMula == null) throw ('Ralat: tiada nilai pada "tarikhMula"');
    if (tarikhTamat == null) throw ('Ralat: tiada nilai pada "tarikhTamat"');
    if (response.statusCode != 200) {
      throw ('Ralat menghubungi pelayan. Huraian: $e');
    } else {
      throw ('Ralat: $e');
    }
  }
}
