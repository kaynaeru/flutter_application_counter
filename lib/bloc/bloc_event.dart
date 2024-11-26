abstract class bloc_event {}

class NumberIncrementEvent extends bloc_event {
  final int number;
  NumberIncrementEvent(this.number);
}

class NumberDecrementEvent extends bloc_event{
  final int number;
  NumberDecrementEvent(this.number);
}
