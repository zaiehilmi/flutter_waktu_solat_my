import 'package:geolocator/geolocator.dart';

import '../model/koordinat.dart';
import '../model/koordinat_zon_waktu_solat.dart';
import '../model/zon_waktu_solat.dart';

ZonWaktuSolat cariZonTerdekat(Koordinat koordinatSemasa) {
  double minDistance = double.infinity;
  // Set an initial nearest zone.
  ZonWaktuSolat nearestZone = ZonWaktuSolat.JHR01;

  for (var state in zonWaktuSolat.data.keys) {
    final zones = zonWaktuSolat.data[state]!.data;

    for (var zone in zones.keys) {
      for (var koordinatZon in zones[zone]!) {
        final distance = Geolocator.distanceBetween(
          koordinatSemasa.latitud,
          koordinatSemasa.longitud,
          koordinatZon.latitud,
          koordinatZon.longitud,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestZone = zone;
        }
      }
    }
  }

  return nearestZone;
}
