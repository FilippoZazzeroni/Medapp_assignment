import 'package:medapp_assignment/models/medicine.dart';
import 'package:medapp_assignment/models/moment.dart';

class ApplicationManager {
  //! init

  ApplicationManager._internal();

  //! properties

  static final instance = ApplicationManager._internal();

  final List<Moment> moments = [
    Moment(date: DateTime(2021, 1, 1), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 2), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.badTime),
    Moment(date: DateTime(2021, 1, 3), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.lunch),
    Moment(date: DateTime(2021, 1, 3), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.atWork),
    Moment(date: DateTime(2021, 1, 4), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
    Moment(date: DateTime(2021, 1, 4), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
    Moment(date: DateTime(2021, 1, 7), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.atWork),
    Moment(date: DateTime(2021, 1, 7), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
    Moment(date: DateTime(2021, 1, 7), medicines: [Medicine(name: "Efferalgan", description: "2 packs, 30 g"), Medicine(name: "Buscofan", description: "2 packs, 30 g")], type: MomentType.breakfast),
  ];

  //! methods

  List<Moment> getMomentsFrom(DateTime date) {
    return moments.where((moment) => moment.date == date && moment.medicines[0].isTaken).toList();
  }
}
