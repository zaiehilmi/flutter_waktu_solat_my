import 'package:waktu_solat_malaysia/model/index.dart';

import '../util/cari_zon_terdekat.dart';

/// Menentukan zon waktu solat yang hanya di Malaysia. Ia berdasarkan jarak
/// terdekat antara titik cerapan dan posisi semasa.
///
/// memerlukan [koordinatSemasa]. Berikan [namaBandar] supaya penentuan
/// zon waktu solat lebih tepat. Bandar di bawah mempunyai satu zon waktu
/// sahaja dan tidak memerlukan kiraan penentuan zon berdasarkan titik cerapan terdekat:
/// - Kuala Lumpur
/// - Putrajaya
/// - Labuan
/// - Melaka
/// - Perlis
/// - Pulau Pinang
ZonWaktuSolat? tentukanZon(
  Koordinat koordinatSemasa, {
  String? namaBandar,
}) =>
    switch (namaBandar) {
      'Kuala Lumpur' || 'Putrajaya' => ZonWaktuSolat.WLY01,
      'Labuan' => ZonWaktuSolat.WLY02,
      'Melaka' => ZonWaktuSolat.MLK01,
      'Perlis' => ZonWaktuSolat.PLS01,
      'Pulau Pinang' => ZonWaktuSolat.PNG01,
      String() => null,
      null => cariZonTerdekat(koordinatSemasa),
    };
