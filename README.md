Ini ialah pakej untuk mendapatkan waktu solat di Malaysia berdasarkan jadual daripada JAKIM.

## Ciri-ciri
Pakej ini membolehkan anda:

- Mengambil senarai waktu solat untuk tempoh tertentu dan zon waktu solat yang ditentukan.
- Mendapatkan waktu solat hari ini berdasarkan zon waktu solat yang ditetapkan.
- Menentukan zon waktu solat berdasarkan koordinat yang diberi

## Memulakan

Sebelum memulakan penggunaan pakej ini, pastikan anda memenuhi prasyarat berikut:

1. Tambahkan pakej ini ke dalam fail pubspec.yaml anda:
    ```yaml
    dependencies:
        waktu_solat_malaysia: ^1.0.0
    ```
2. Kemudian, jalankan perintah:
    ```terminal
    flutter pub get
    ```
## Penggunaan

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

#### Cara 1: `TempohJadual` selain _duration_
terdapat 5 tempoh yang boleh didapati melalui TempohJadual:
1. `TempohJadual.today`
2. `TempohJadual.week`
3. `TempohJadual.month`
4. `TempohJadual.year`

`TempohJadual.today` ialah nilai lalai

```dart
import 'package:waktu_solat_malaysia/waktu_solat_malaysia.dart';

void main() async {
  List<WaktuSolat>? senaraiWaktuSolat = await waktuSolatBertempoh(ZonWaktuSolat.WLY01, tempohJadual: TempohJadual.week);

  if (senaraiWaktuSolat != null) {
    for (var waktuSolat in senaraiWaktuSolat) {
      print('Hari ${waktuSolat.hari}: waktu ${waktuSolat.subuh}');
    }
  } else {
    print('Gagal mendapatkan senarai waktu solat.');
  }
}
```

#### Cara 2: `TempohJadual` menggunakan _duration_


## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
