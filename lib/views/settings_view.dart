import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Dark mode: '),
          Switch(
            value: theme.isDarkMode,
            onChanged: (value) => theme.toggleTheme(),
          ),
        ],
      ),
    );
  }
}
