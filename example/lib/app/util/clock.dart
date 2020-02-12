abstract class Clock{
  DateTime currentTime();
}

class SystemClock implements Clock{
  DateTime currentTime() => DateTime.now();
}