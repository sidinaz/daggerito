import 'package:kohana/kohana.dart';
//import 'package:routex/routex.dart';

class CreateUserInput {
  final Stream<String> username;
  final Stream<Signal> saveUserTap;

  CreateUserInput(CreateUserSink sink)
      : this.username = sink.username,
        this.saveUserTap = sink.saveUserTap;
}

class CreateUserSink extends Sink1<String> with SingleEventSinkMixin {
  Stream<String> get username => item1;

  Stream<Signal> get saveUserTap => event;

  get addUsername => add1;

  get addSaveUserTap => addEvent;

}
