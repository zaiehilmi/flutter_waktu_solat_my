// ignore_for_file: constant_identifier_names

import 'koordinat.dart';
import 'zon_waktu_solat.dart';

enum _Negeri {
  Johor,
  Kedah,
  Kelantan,
  Melaka,
  NegeriSembilan,
  Pahang,
  Perlis,
  Penang,
  Perak,
  Sabah,
  Selangor,
  Sarawak,
  Terengganu,
  Wilayah,
}

class _Zon {
  Map<ZonWaktuSolat, List<Koordinat>> data;

  _Zon(this.data);
}

class _NegeriDanWilayah {
  Map<_Negeri, _Zon> data;

  _NegeriDanWilayah(this.data);
}

final zonWaktuSolat = _NegeriDanWilayah({
  _Negeri.Johor: _Zon({
    ZonWaktuSolat.JHR01: [Koordinat(2.58333, 104.31667)],
    ZonWaktuSolat.JHR02: [Koordinat(1.71667, 103.53333)],
    ZonWaktuSolat.JHR03: [Koordinat(1.65, 103.2)],
    ZonWaktuSolat.JHR04: [Koordinat(2.26667, 102.53333)],
  }),
  _Negeri.Kedah: _Zon({
    ZonWaktuSolat.KDH01: [Koordinat(6.25, 100.19167)],
    ZonWaktuSolat.KDH02: [Koordinat(5.58333, 100.34167)],
    ZonWaktuSolat.KDH03: [Koordinat(6.25833, 100.50833)],
    ZonWaktuSolat.KDH04: [Koordinat(5.55, 100.60833)],
    ZonWaktuSolat.KDH05: [Koordinat(5.13333, 100.49167)],
    ZonWaktuSolat.KDH06: [Koordinat(6.45, 99.63333)],
    ZonWaktuSolat.KDH07: [Koordinat(5.7875, 100.44167)],
  }),
  _Negeri.Kelantan: _Zon({
    ZonWaktuSolat.KTN01: [Koordinat(6.5, 102.25)],
    ZonWaktuSolat.KTN03: [Koordinat(4.95, 101.5)],
  }),
  _Negeri.Melaka: _Zon({
    ZonWaktuSolat.MLK01: [Koordinat(2.38333, 102.18333)],
  }),
  _Negeri.NegeriSembilan: _Zon({
    ZonWaktuSolat.NGS01: [Koordinat(2.58333, 102.18333)],
    ZonWaktuSolat.NGS02: [Koordinat(2.73333, 102.25)],
  }),
  _Negeri.Pahang: _Zon({
    ZonWaktuSolat.PHG01: [Koordinat(2.58333, 104.31667)],
    ZonWaktuSolat.PHG02: [Koordinat(3.46667, 103.41667)],
    ZonWaktuSolat.PHG03: [Koordinat(3.78333, 102.45)],
    ZonWaktuSolat.PHG04: [Koordinat(3.9, 101.88333)],
    ZonWaktuSolat.PHG05: [Koordinat(3.38333, 101.83333)],
    ZonWaktuSolat.PHG06: [Koordinat(4.48333, 101.38333)],
  }),
  _Negeri.Perlis: _Zon({
    ZonWaktuSolat.PLS01: [Koordinat(6.42194, 100.34167)],
  }),
  _Negeri.Penang: _Zon({
    ZonWaktuSolat.PNG01: [Koordinat(5.41667, 100.2)],
  }),
  _Negeri.Perak: _Zon({
    ZonWaktuSolat.PRK01: [
      Koordinat(3.783333, 101.625),
      Koordinat(4.259722, 101.075),
    ],
    ZonWaktuSolat.PRK02: [
      Koordinat(4.891667, 101.445833),
      Koordinat(4.516667, 100.7125),
    ],
    ZonWaktuSolat.PRK03: [
      Koordinat(5.008333, 101.445833),
      Koordinat(5.458333, 100.870833),
    ],
    ZonWaktuSolat.PRK04: [
      Koordinat(5.504167, 101.75),
      Koordinat(5.570833, 101.209722),
    ],
    ZonWaktuSolat.PRK05: [
      Koordinat(3.716667, 101.233333),
      Koordinat(4.2, 100.533333),
    ],
    ZonWaktuSolat.PRK06: [
      Koordinat(5.266667, 100.95),
      Koordinat(5.075, 100.383333),
    ],
    ZonWaktuSolat.PRK07: [Koordinat(4.866667, 100.8)],
  }),
  _Negeri.Sabah: _Zon({
    ZonWaktuSolat.SBH01: [Koordinat(5.5, 117.8)],
    ZonWaktuSolat.SBH02: [Koordinat(5.216667, 116.81667)],
    ZonWaktuSolat.SBH03: [Koordinat(5.01667, 118.33333)],
    ZonWaktuSolat.SBH04: [Koordinat(4.416667, 117.5)],
    ZonWaktuSolat.SBH05: [Koordinat(6.88333, 116.83333)],
    ZonWaktuSolat.SBH06: [Koordinat(6.08333, 116.533333)],
    ZonWaktuSolat.SBH07: [Koordinat(5.733333, 115.933333)],
    ZonWaktuSolat.SBH08: [Koordinat(5.333333, 116.166667)],
    ZonWaktuSolat.SBH09: [Koordinat(5.083333, 115.55)],
  }),
  _Negeri.Selangor: _Zon({
    ZonWaktuSolat.SGR01: [
      Koordinat(3.733333, 101.383333),
      Koordinat(2.637778, 101.616667),
      Koordinat(2.94, 101.911389),
    ],
    ZonWaktuSolat.SGR02: [
      Koordinat(3.933333, 100.7),
      Koordinat(3.2025, 101.488611),
    ],
    ZonWaktuSolat.SGR03: [
      Koordinat(3.01667, 101.25),
      Koordinat(2.802778, 101.655),
    ],
  }),
  _Negeri.Sarawak: _Zon({
    ZonWaktuSolat.SWK01: [Koordinat(4.783333, 114.833333)],
    ZonWaktuSolat.SWK02: [Koordinat(3.583333, 113.716667)],
    ZonWaktuSolat.SWK03: [Koordinat(2.883333, 112.86667)],
    ZonWaktuSolat.SWK04: [Koordinat(2.833333, 111.7)],
    ZonWaktuSolat.SWK05: [Koordinat(2.233333, 111.21667)],
    ZonWaktuSolat.SWK06: [Koordinat(1.783333, 111.116667)],
    ZonWaktuSolat.SWK07: [Koordinat(1.46667, 110.48333)],
    ZonWaktuSolat.SWK08: [Koordinat(1.816667, 109.766667)],
  }),
  _Negeri.Terengganu: _Zon({
    ZonWaktuSolat.TRG01: [Koordinat(5.25, 102.966667)],
    ZonWaktuSolat.TRG02: [Koordinat(5.416667, 102.416667)],
    ZonWaktuSolat.TRG03: [Koordinat(5, 102.53333)],
    ZonWaktuSolat.TRG04: [Koordinat(4.5, 102.866667)],
  }),
  _Negeri.Wilayah: _Zon({
    ZonWaktuSolat.WLY01: [Koordinat(3.733333, 101.383333)],
    ZonWaktuSolat.WLY02: [Koordinat(5.248056, 115.139722)],
  }),
});
