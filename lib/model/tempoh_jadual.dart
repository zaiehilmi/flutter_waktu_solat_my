enum TempohJadual {
  harini,

  /// memberi respon untuk harini dan 7 hari berikutnya (jumlah respon ialah 8 hari). Terdapat pengecualian
  /// di mana jika tempoh minggu itu akan bertukar tahun, pelayan akan mengeluarkan ralat
  minggu,

  /// akan memberi respon untuk bulan semasa. Contohnya hari ini ialah 31 Disember 2023,
  /// maka julat respon waktu solat ialah 1 Disember 2023 hingga 31 Disember 2023.
  bulan,

  /// akan memberi respon untuk tahun semasa. Contohnya hari ini ialah 31 Disember 2023,
  /// maka julat respon waktu solat ialah 1 Januari 2023 hingga 31 Disember 2023.
  tahun,
  durasi;
}

extension Durasi on TempohJadual {
  String get nama => switch (this) {
        TempohJadual.harini => 'today',
        TempohJadual.minggu => 'week',
        TempohJadual.bulan => 'month',
        TempohJadual.tahun => 'year',
        TempohJadual.durasi => 'duration',
      };
}
