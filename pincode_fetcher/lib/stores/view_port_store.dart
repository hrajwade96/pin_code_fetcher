import 'package:mobx/mobx.dart';
enum FormFactor {
  mobile,
  desktop,
}

class ViewportStore {
  final _currentFormFactor = Observable(FormFactor.mobile);

  FormFactor get current => _currentFormFactor.value;

  void updateFormFactor(final double width) {
    final updatedFormFactor = width > 1024
        ? FormFactor.desktop
        : FormFactor.mobile;

    if (current != updatedFormFactor) {
      runInAction(
        () => _currentFormFactor.value =
            width > 1024
                ? FormFactor.desktop
                : FormFactor.mobile,
      );
    }
  }
}