import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() async {
  // dapatkan zon waktu solat
  final zon = tentukanZon(
    Koordinat(3.1390, 101.6869),
    namaBandar: 'Kuala Lumpur',
  );

  // jadual waktu solat harini
  final harini = await dapatkanJadualWaktuSolat(zon!);

  // jadual waktu solat minggu ini
  final minggu = await dapatkanJadualWaktuSolat(
    zon,
    tempohJadual: TempohJadual.minggu,
  );

  // jadual waktu solat durasi tersuai
  final tarikhHarini = DateTime.now();

  final hariniDanEsok = await dapatkanJadualWaktuSolat(
    zon,
    tempohJadual: TempohJadual.durasi,
    mula: tarikhHarini,
    tamat: DateTime(
      tarikhHarini.year,
      tarikhHarini.month,
      tarikhHarini.day + 1,
    ),
  );
}
