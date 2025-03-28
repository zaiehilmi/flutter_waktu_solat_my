import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:waktu_solat_malaysia/constant/tempoh_jadual.dart';
import 'package:waktu_solat_malaysia/constant/zon_waktu_solat.dart';
import 'package:waktu_solat_malaysia/model/waktu_solat.dart';

// sumber: https://github.com/acfatah/jakim-esolat-api?tab=readme-ov-file
// todo: tukar guna ni https://api.waktusolat.app/docs
const _eSolatEndpoint =
    'https://www.e-solat.gov.my/index.php?r=esolatApi/takwimsolat&';

String _urlPath(String path) => '$_eSolatEndpoint$path';

/// untuk mendapatkan waktu solat
///
/// memerlukan [zonWaktuSolat] dan boleh dipilih melalui enum [ZonWaktuSolat] atau melalui
/// method __tentukanZon()__.
/// Untuk [tempohJadual], secara lalai akan menggunakan waktu solat hari ini namun boleh memilih juga
/// untuk tempoh waktu lain yang terdapat di enum [TempohJadual].
/// Untuk [TempohJadual.durasi], pastikan disertakan juga dengan [mula] dan [tamat] dalam jenis [DateTime]
Future<List<WaktuSolat>?> dapatkanJadualWaktuSolat(
  ZonWaktuSolat zonWaktuSolat, {
  TempohJadual tempohJadual = TempohJadual.harini,
  DateTime? mula,
  DateTime? tamat,
}) async {
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  List<WaktuSolat>? senaraiWaktuSolat = [];
  late http.Response? response;

  final Uri url = Uri.parse(
      _urlPath('&zone=${zonWaktuSolat.name}&period=${tempohJadual.nama}'));

  try {
    if (tempohJadual == TempohJadual.durasi) {
      final formatTarikhMula = dateFormat.format(mula!);
      final formatTarikhTamat = dateFormat.format(tamat!);

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

    for (var items in json["prayerTime"]) {
      var temp = WaktuSolat.fromJson(items);
      senaraiWaktuSolat.add(temp);
    }

    return senaraiWaktuSolat;
  } on FormatException {
    if (mula?.year != tamat?.year) {
      throw ('Ralat pada pelayan: Maaf, tidak dapat memberikan jadual waktu solat jika tahun berbeza');
    } else if (tempohJadual == TempohJadual.minggu) {
      final harini = DateTime.now();
      final tujuhHariSelepasHarini = harini.add(Duration(days: 7));

      if (harini.year != tujuhHariSelepasHarini.year) {
        throw ('Ralat pada pelayan: Maaf, tidak dapat memberikan jadual waktu solat jika tahun berbeza');
      }
    }
  } catch (e) {
    // tak berikan nilai pada param tarikhMula atau tarikhTamat jika gunakan TempohJadual.durasi
    if (tempohJadual == TempohJadual.durasi) {
      if (mula == null && tamat == null) {
        throw ('Ralat: tiada nilai pada "tarikhMula" & "tarikhTamat"');
      } else if (mula == null) {
        throw ('Ralat: tiada nilai pada "tarikhMula"');
      } else if (tamat == null) {
        throw ('Ralat: tiada nilai pada "tarikhTamat"');
      } else {
        throw ('Ralat: $e');
      }
    }
    if (response?.statusCode != 200) {
      throw ('Ralat menghubungi pelayan. Huraian: $e');
    } else {
      throw ('Ralat: $e');
    }
  }
  return null;
}
