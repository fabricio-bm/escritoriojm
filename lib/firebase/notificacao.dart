import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> sendNotificationToTopic(
    String topic, String title, String body) async {
  const String key =
      "AAAAA2LZAyc:APA91bFXm8q-IbCbAiUkCLCLiEFaAvgwn506tweZ5V2-SMvpA1ghEdyBYjuBjFo6vhSzXb5ceoipAYU4qVk_pHV7HfsnEqEkmPuo22BYrY83xRiSJ31VVd2KaJOPJPHuqvn-JPzmZb8d";

  String DATA = "{\"notification\": {\"body\": \"$body\","
      "\"title\": \"$title\"}, "
      "\"priority\": \"high\", "
      "\"to\": \"/topics/$topic\"}";
  return await http.post("https://fcm.googleapis.com/fcm/send" as Uri,
      body: DATA,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "key=$key"
      });
}
