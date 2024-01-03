Ini ialah pakej Dart untuk mendapatkan waktu solat di Malaysia berdasarkan jadual daripada JAKIM.

## Ciri-ciri 🤔

Pakej ini membolehkan anda:

- Mengambil senarai waktu solat untuk tempoh tertentu dan zon waktu solat yang ditentukan.
- Mendapatkan waktu solat hari ini berdasarkan zon waktu solat yang ditetapkan.
- Menentukan zon waktu solat berdasarkan koordinat yang diberi

## Memulakan 😎

Sebelum memulakan penggunaan pakej ini, pastikan anda memenuhi prasyarat berikut:

1. Tambahkan pakej ini ke dalam fail pubspec.yaml anda:
    ```yaml
    dependencies:
        waktu_solat_malaysia: ^1.0.5
    ```
2. Kemudian, jalankan perintah:
    ```terminal
    flutter pub get
    ```

## Penggunaan 🫵

### 1. Menentukan Zon Waktu Solat

```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() {
  Koordinat koordinatSemasa = Koordinat(3.1390, 101.6869); // Koordinat Kuala Lumpur
  ZonWaktuSolat? zon = tentukanZon(koordinatSemasa, namaBandar: 'Kuala Lumpur');
  print('Zon waktu solat: $zon');
}
```

### 2. Mendapatkan Waktu Solat

terdapat 2 cara untuk mendapatkan waktu solat.

#### Cara 1: `TempohJadual` selain _durasi_

terdapat 5 tempoh yang boleh didapati melalui TempohJadual:

1. `TempohJadual.harini`
2. `TempohJadual.minggu`
3. `TempohJadual.bulan`
4. `TempohJadual.tahun`
5. `TempohJadual.durasi`

`TempohJadual.harini` ialah nilai lalai (default)

```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() async {
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
}
```

#### Cara 2: `TempohJadual` menggunakan _durasi_

```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';


final harini = DateTime.now();

final ws = await dapatkanJadualWaktuSolat(
   ZonWaktuSolat.WLY01,
   tempohJadual: TempohJadual.durasi,
   mula: harini,
   tamat: DateTime(
      harini.year,
      harini.month,
      harini.day + 1 // tarikh esok
));
```

> ## Perhatian! 🐥
> Pelayan tidak dapat memberikan respon jika tarikh yang diberi melibatkan perbezaan tahun.  
> 
> Sebagai contoh, jika tarikh _request_ ialah **31 Disember 2023** dan anda menggunakan `TempohJadual.minggu`, 
> 7 hari berikutnya merupakan tahun berbeza maka pelayan akan memberikan ralat `Ralat pada pelayan: Maaf, tidak dapat memberikan jadual waktu solat jika tahun berbeza`.  
> 
> Hal ini terpakai juga untuk `TempohJadual.durasi` jika tarikh diberikan ialah berbeza tahunnya.

## Senarai kelas, enum dan ciri-cirinya 👀

### `enum ZonWaktuSolat`
senarai penuh berserta nama kawasan kod zon tersebut boleh didapati di laman [E-Solat oleh JAKIM](https://www.e-solat.gov.my/)

### `enum TempohJadual`
- `.harini`
- `.minggu`
- `.bulan`
- `.tahun`
- `.durasi`

### `class Koordinat`

| parameter  | jenis data | nullable |
|------------|------------|:--------:|
| `latitud`  | `double`   |    ❌     |
| `longitud` | `double`   |    ❌     |

### `class WaktuSolat`
| parameter | jenis data | nullable |
|-----------|------------|:--------:|
| `hari`    | `String`   |    ✅     |
| `hijrah`  | `String`   |    ✅     |
| `masihi`  | `String`   |    ✅     |
| `imsak`   | `String`   |    ✅     |
| `subuh`   | `String`   |    ✅     |
| `syuruk`  | `String`   |    ✅     |
| `zohor`   | `String`   |    ✅     |
| `asar`    | `String`   |    ✅     |
| `magrib`  | `String`   |    ✅     |
| `isyak`   | `String`   |    ✅     |
