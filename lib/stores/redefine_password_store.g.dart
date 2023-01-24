// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redefine_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RedefinePasswordStore on _RedefinePasswordStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_RedefinePasswordStoreBase.emailValid'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_RedefinePasswordStoreBase.emailError'))
          .value;

  late final _$emailAtom =
      Atom(name: '_RedefinePasswordStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_RedefinePasswordStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$timeLeftAtom =
      Atom(name: '_RedefinePasswordStoreBase.timeLeft', context: context);

  @override
  int get timeLeft {
    _$timeLeftAtom.reportRead();
    return super.timeLeft;
  }

  @override
  set timeLeft(int value) {
    _$timeLeftAtom.reportWrite(value, super.timeLeft, () {
      super.timeLeft = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_RedefinePasswordStoreBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_RedefinePasswordStoreBase.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$sendEmailPressedAsyncAction = AsyncAction(
      '_RedefinePasswordStoreBase.sendEmailPressed',
      context: context);

  @override
  Future<void> sendEmailPressed() {
    return _$sendEmailPressedAsyncAction.run(() => super.sendEmailPressed());
  }

  late final _$_RedefinePasswordStoreBaseActionController =
      ActionController(name: '_RedefinePasswordStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RedefinePasswordStoreBaseActionController
        .startAction(name: '_RedefinePasswordStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RedefinePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void timer() {
    final _$actionInfo = _$_RedefinePasswordStoreBaseActionController
        .startAction(name: '_RedefinePasswordStoreBase.timer');
    try {
      return super.timer();
    } finally {
      _$_RedefinePasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
showErrors: ${showErrors},
timeLeft: ${timeLeft},
message: ${message},
error: ${error},
emailValid: ${emailValid},
emailError: ${emailError}
    ''';
  }
}
