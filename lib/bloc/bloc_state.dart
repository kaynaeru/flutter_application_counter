abstract class bloc_state {}

class InitialState extends bloc_state{}

class UpdateState extends bloc_state{
  final int nilai;
  UpdateState(this.nilai);
}
