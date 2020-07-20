import 'package:tmi/tmidart.dart' as tmi;

void main() {
  var client = tmi.Client(
    channels: "channel_name",
    secure: true,
  );
  client.connect();

  client.on("message", (channel, userstate, message, self) {
    print("${channel}| ${userstate['display-name']}: ${message}");
  });
  client.on("join", (channel, username, self) {
    if (!self) {
      print("${channel}> ${username} join");
    }
  });
}
