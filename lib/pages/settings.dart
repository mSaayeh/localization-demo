import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/app_localizations.dart';
import 'package:localization/cubit/locale_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".translate(context)),
      ),
      body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return ListTile(
            title: Text(
              "language".translate(context),
              style: const TextStyle(fontSize: 20),
            ),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: state.locale.languageCode,
              items: ['ar', 'en']
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item.translate(context)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<LocaleCubit>().changeLanguage(value);
                }
              },
            ),
          );
        },
        listener: (BuildContext context, ChangeLocaleState state) async {
          ScaffoldMessenger.of(context).clearSnackBars();
          await Future.delayed(const Duration(milliseconds: 100));
          if (!context.mounted) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("change_msg".translate(context)),
            ),
          );
        },
      ),
    );
  }
}
