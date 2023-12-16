# Contoh penggunaan dan hasil

## 1. Menentukan zon waktu solat

```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() {
  Koordinat koordinatSemasa = Koordinat(3.1390, 101.6869); // Koordinat Kuala Lumpur
  ZonWaktuSolat? zon = tentukanZon(koordinatSemasa, namaBandar: 'Kuala Lumpur');
  print(zon);   // output: WLY01
}
```

## 2. Mendapatkan jadual waktu solat
### menggunakan selain _durasi_
```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

List<WaktuSolat>? senaraiWaktuSolat = await dapatkanJadualWaktuSolat(
  ZonWaktuSolat.WLY01,
  tempohJadual: TempohJadual.minggu
);

if (senaraiWaktuSolat != null) {
  for (var waktuSolat in senaraiWaktuSolat) {
    print('Hari ${waktuSolat.hari}: subuh ${waktuSolat.subuh}');
  }
} else {
  print('Gagal mendapatkan senarai waktu solat.');
}

// output: 
// Hari Saturday: subuh 5:58 AM
// Hari Sunday: subuh 5:59 AM
// Hari Monday: subuh 5:59 AM
// Hari Tuesday: subuh 6:00 AM
// Hari Wednesday: subuh 6:00 AM
// Hari Thursday: subuh 6:01 AM
// Hari Friday: subuh 6:01 AM
// Hari Saturday: subuh 6:02 AM
```
### Menggunakan durasi
```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

final harini = DateTime.now();

final waktuSolat = await dapatkanJadualWaktuSolat(
   ZonWaktuSolat.WLY01,
   tempohJadual: TempohJadual.durasi,
   mula: harini,
   tamat: DateTime(
      harini.year,
      harini.month,
      harini.day + 1 // tarikh esok
));

for (var lala in waktuSolat!) {
  print('tahun: ${lala.hijrah}, asar: ${lala.asar}');
}

// output:
// tahun: 1445-06-03, asar: 4:34 PM
// tahun: 1445-06-04, asar: 4:34 PM
```

## 3. Contoh menggunakan semuanya
