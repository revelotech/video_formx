import 'package:flutter_formx/flutter_formx.dart';
import 'package:formx_video/presentation/checkbox_validator.dart';
import 'package:mobx/mobx.dart';

part 'form_page_view_model.g.dart';

class FormPageViewModel extends _FormPageViewModelBase
    with _$FormPageViewModel {
  FormPageViewModel();
}

abstract class _FormPageViewModelBase with Store, FormX<String> {
  _FormPageViewModelBase();

  @alwaysNotify
  bool showSuccessInfo = false;

  void onViewReady() {
    setupForm({
      'email': FormXField.from(
        value: '',
        validators: [RequiredFieldValidator('This field is required')],
      ),
      'acceptedTerms': FormXField.from(
        value: false,
        validators: [CheckboxValidator()],
      ),
    });
  }

  @action
  void submitForm() {
    if (isFormValid) {
      showSuccessInfo = true;
    }
  }
}
