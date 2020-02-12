
import 'package:kohana/kohana.dart';

class Sink extends Sink1<String>{
  get addNavigationSelection => add1;
  get selectedMenu => item1;
  Sink({String seed1}):super(seed1: seed1);
}