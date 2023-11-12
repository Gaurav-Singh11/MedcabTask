abstract class BookManpowerState {}

class InitialState extends BookManpowerState {}

class HepatoProtectorPageState extends BookManpowerState {
  HepatoProtectorPageState({this.page = 0});

  final int page;
}

class HealthCardBenefitPageState extends BookManpowerState {
  HealthCardBenefitPageState({this.page = 0});

  final int page;
}

class FaqsExpandedState extends BookManpowerState {
  FaqsExpandedState({this.index = -1});

  final int index;
}
