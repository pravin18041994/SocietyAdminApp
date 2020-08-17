import 'package:rxdart/rxdart.dart';

import '../Repositories/Repository.dart';

class EmergencyBloc {
  Repository repository = Repository();
  final title = BehaviorSubject<String>();
  final emergencyNumber = BehaviorSubject<String>();
  final latitude = BehaviorSubject<String>();
  final longitude = BehaviorSubject<String>();

  Function(String) get getTitle => title.sink.add;
  Function(String) get getEmergencyNumber => emergencyNumber.sink.add;
  Function(String) get getLatitude => latitude.sink.add;

  Function(String) get getLongitude => longitude.sink.add;

  addEmergencyDetails() {
    return repository.addEmergencyDetails(
        title.value, emergencyNumber.value, latitude.value, longitude.value);
  }

  getEmergencyDetails() {
    return repository.getEmergencyDetails();
  }

  dispose() {
    title.close();
    emergencyNumber.close();
    latitude.close();
    longitude.close();
  }
}

final emergencyBloc = EmergencyBloc();
