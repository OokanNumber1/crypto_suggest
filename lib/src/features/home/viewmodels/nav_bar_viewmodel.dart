import 'package:flutter_riverpod/flutter_riverpod.dart';

//final navBarViewModel = StateProvider((ref) => )

// class NavBarViewModel extends ChangeNotifier {
//   //NavBarViewModel() : super(0);
//   int _index = 0;
//   int get index => _index;

// void navigate(int index) {
//   print('before navigate is pressed => $_index');
//   _index = index;
//   print('after navigate is pressed =>$_index');
//   notifyListeners();
// }
//}
class NavBarViewModel extends StateNotifier<int> {
  NavBarViewModel() : super(0);

  void navigate(int index) {
    state = index;
  }
}

final navBarProvider =
    StateNotifierProvider<NavBarViewModel, int>((ref) => NavBarViewModel());
