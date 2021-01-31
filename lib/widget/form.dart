import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Widget? title,
    Widget? secondary,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
  }) : super(
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          builder: (state) {
            return CheckboxListTile(
              value: state.value,
              title: title,
              subtitle: state.hasError
                  ? Builder(
                      builder: (context) => Text(
                        state.errorText ?? '',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
              dense: state.hasError,
              secondary: secondary,
              onChanged: state.didChange,
            );
          },
        );
}

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
    Widget? title,
    Widget? secondary,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
  }) : super(
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          builder: (state) {
            return SwitchListTile(
              value: state.value ?? false,
              title: title,
              subtitle: state.hasError
                  ? Builder(
                      builder: (context) => Text(
                        state.errorText ?? '',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
              dense: state.hasError,
              secondary: secondary,
              onChanged: state.didChange,
            );
          },
        );
}
