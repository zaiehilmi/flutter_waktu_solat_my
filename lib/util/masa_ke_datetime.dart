import 'package:intl/intl.dart';

extension UtilitiJam on String {
  DateTime get keDateTime => DateFormat("h:mm aa").parse(this);

  String get keFormat24Jam {
    final DateTime masa = this.keDateTime;
    final lala = DateFormat("HH:mm").format(masa);
    return lala;
  }

  String get dalamBahasaMelayu => switch (this) {
        'Sunday' => 'Ahad',
        'Monday' => 'Isnin',
        'Tuesday' => 'Selasa',
        'Wednesday' => 'Rabu',
        'Thursday' => 'Khamis',
        'Friday' => 'Jumaat',
        'Saturday' => 'Sabtu',
        String() => "hari apa ni?"
      };
}
