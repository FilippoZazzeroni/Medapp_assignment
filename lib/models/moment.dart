import 'medicine.dart';

class Moment {
  //! init

  Moment({required this.date, required this.medicines, required this.type});

  //! properties

  final List<Medicine> medicines;

  final DateTime date;

  final MomentType type;
}

enum MomentType { breakfast, lunch, atWork, badTime }
