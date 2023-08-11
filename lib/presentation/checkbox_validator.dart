import 'package:flutter_formx/flutter_formx.dart';

class CheckboxValidator extends Validator<bool?> {
  @override
  Future<ValidatorResult> validate(value) async {
    if (value == null || !value) {
      return const ValidatorResult(
        isValid: false,
        errorMessage: 'This field is required',
      );
    }
    return ValidatorResult.success();
  }
}
