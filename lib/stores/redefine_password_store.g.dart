// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redefine_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RedefinePasswordStore on _RedefinePasswordStoreBase, Store {
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_RedefinePasswordStoreBase.emailError'))
          .value;

  late final _$emailAtom =
      Atom(name: '_RedefinePasswordStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
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
  String toString() {
    return '''
email: ${email},
emailError: ${emailError}
    ''';
  }
}
