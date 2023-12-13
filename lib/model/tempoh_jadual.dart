enum TempohJadual {
  harini,
  minggu,
  bulan,
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
