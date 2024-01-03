import 'package:test/test.dart';
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() {
  test('jumlah result dalam harini', () async {
    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.WLY01,
      // tempohJadual: TempohJadual.harini,
    );
    print(ws?[0].toString());
    expect(1, ws?.length);
  });

  test('jumlah result dalam seminggu', () async {
    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.JHR02,
      tempohJadual: TempohJadual.minggu,
    );
    print(ws?[0].toString());
    expect(8, ws?.length);
  });

  test('jumlah result dalam bulan', () async {
    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.JHR02,
      tempohJadual: TempohJadual.bulan,
    );
    print(ws?[30].toString());
    expect(31, ws?.length);
  });

  test('jumlah result dalam 1 tahun', () async {
    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.JHR02,
      tempohJadual: TempohJadual.tahun,
    );
    print(ws?[0].toString());
    expect(366, ws?.length);
  });

  test('jadual waktu solat berdurasi', () async {
    final harini = DateTime.now();

    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.WLY01,
      tempohJadual: TempohJadual.durasi,
      mula: harini,
      tamat: harini.add(Duration(days: 1)), // dapatkan tarikh esok
    );
    expect(2, ws?.length);
  });

  test('jadual waktu solat berdurasi tetapi hanya harini', () async {
    final harini = DateTime.now();

    final ws = await dapatkanJadualWaktuSolat(
      ZonWaktuSolat.WLY01,
      tempohJadual: TempohJadual.durasi,
      mula: harini,
      tamat: null,
    );
    expect(1, ws?.length);
  });

  test('tentukan zon', () {
    Koordinat koordinatSemasa =
        Koordinat(3.1390, 101.6869); // Koordinat Kuala Lumpur
    ZonWaktuSolat? zon = tentukanZon(koordinatSemasa, namaBandar: 'kuantan');
    print('Zon waktu solat: $zon');
  });

  test('dari kod sampel README', () async {
    List<WaktuSolat>? senaraiWaktuSolat = await dapatkanJadualWaktuSolat(
        ZonWaktuSolat.WLY01,
        tempohJadual: TempohJadual.minggu);

    if (senaraiWaktuSolat != null) {
      for (var waktuSolat in senaraiWaktuSolat) {
        print('Hari ${waktuSolat.hari}: imsak ${waktuSolat.imsak}');
        print('Hari ${waktuSolat.hari}: subuh ${waktuSolat.subuh}');
        print('Hari ${waktuSolat.hari}: syuruk ${waktuSolat.syuruk}');
        break;
      }
    } else {
      print('Gagal mendapatkan senarai waktu solat.');
    }
  });
}
