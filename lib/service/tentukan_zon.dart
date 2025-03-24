import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

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
    switch (namaBandar?.toLowerCase()) {
      'kuala lumpur' || 'putrajaya' => ZonWaktuSolat.WLY01,
      'labuan' => ZonWaktuSolat.WLY02,
      'melaka' => ZonWaktuSolat.MLK01,
      'perlis' => ZonWaktuSolat.PLS01,
      'pulau pinang' => ZonWaktuSolat.PNG01,
      String() || null => cariZonTerdekat(koordinatSemasa),
    };
