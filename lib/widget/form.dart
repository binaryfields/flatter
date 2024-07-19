import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    Widget? title,
    Widget? secondary,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
  }) : super(
          builder: (state) {
            return CheckboxListTile(
              value: state.value,
              title: title,
              subtitle: state.hasError
                  ? Builder(
                      builder: (context) => Text(
                        state.errorText ?? '',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
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
    super.key,
    Widget? title,
    Widget? secondary,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
  }) : super(
          builder: (state) {
            return SwitchListTile(
              value: state.value ?? false,
              title: title,
              subtitle: state.hasError
                  ? Builder(
                      builder: (context) => Text(
                        state.errorText ?? '',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
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
