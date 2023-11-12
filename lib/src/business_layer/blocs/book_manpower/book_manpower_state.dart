abstract class BookManpowerState {}

class InitialState extends BookManpowerState {}

class HepatoProtectorPageState extends BookManpowerState {
  HepatoProtectorPageState({this.page = 0});

  final int page;
}

class FaqsExpandedState extends BookManpowerState {
  FaqsExpandedState({this.index = 0});

  final int index;
}
