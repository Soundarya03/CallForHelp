import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService{
  String number1;
  String number2;

  CallsAndMessagesService(String number){
    this.number1 = '108';
    this.number2 = number;
  }
  void call() => launch("tel:$number1");
  void sendSMS() => launch("sms:$number2");
}

