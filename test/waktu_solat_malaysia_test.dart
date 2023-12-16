import 'package:test/test.dart';
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() {
  test('jumlah result dalam seminggu', () async {
    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.JHR02,
      tempohJadual: TempohJadual.harini,
    );
    expect(1, ws?.length);
  });

  test('jadual waktu solat berdurasi', () async {
    final harini = DateTime.now();

    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.WLY01,
      tempohJadual: TempohJadual.durasi,
      mula: harini,
      tamat: DateTime(
        harini.year,
        harini.month,
        harini.day + 1,
      ), // dapatkan tarikh esok
    );
    expect(2, ws?.length);
  });

  test('tentukan zon', () {
    Koordinat koordinatSemasa =
        Koordinat(3.1390, 101.6869); // Koordinat Kuala Lumpur
    ZonWaktuSolat? zon =
        tentukanZon(koordinatSemasa, namaBandar: 'Kuala Lumpur');
    print('Zon waktu solat: $zon');
  });
}
