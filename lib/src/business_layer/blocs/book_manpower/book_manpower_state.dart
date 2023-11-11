abstract class BookManpowerState {}

class InitialState extends BookManpowerState {}

class LoadingUserState extends BookManpowerState {}

class HepatoProtectorPageState extends BookManpowerState {
  HepatoProtectorPageState({this.page = 0});

  final int page;
}
