import 'package:dashboarduidesign/Providers/ApiProvider.dart';
import 'package:rxdart/rxdart.dart';

class MessagesBloc 
{
  ApiProvider apiProvider = ApiProvider();
  var subject = BehaviorSubject<String>();
  var message = BehaviorSubject<String>();
  var sendTo = BehaviorSubject<String>();
  var meeting_timing = BehaviorSubject<String>();
  var meeting_place = BehaviorSubject<String>();

  Function(String) get getSubject => subject.sink.add;
  Function(String) get getMessage => message.sink.add;
  Function(String) get getSendTo => sendTo.sink.add;
  Function(String) get getMeetingTiming => meeting_timing.sink.add;
  Function(String) get getMeetingPlace => meeting_place.sink.add;

  sendMessage()
  {
    Future<String> resp;
    resp = apiProvider.sendMessage(subject.value,message.value,sendTo.value);
    return resp;
  }
  scheduleMeeting()
  {
    Future<String> resp;
    resp = apiProvider.scheduleMeeting(meeting_timing.value,meeting_place.value);
    return resp;
  } 
  dispose() 
  {
    subject.close();
    message.close();
    sendTo.close();
    meeting_timing.close();
    meeting_place.close();
  }
}
final messagesBloc = MessagesBloc();