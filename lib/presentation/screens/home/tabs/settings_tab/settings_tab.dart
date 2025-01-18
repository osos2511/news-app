import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../settings_provider/language_provider.dart';
import '../../../../../settings_provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedTheme;
  String? selectedLang;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedTheme =
    context.read<ThemeProvider>().currentTheme == ThemeMode.light
        ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;
    selectedLang = context.read<LanguageProvider>().currentLang == 'en'
        ? AppLocalizations.of(context)!.english
        : AppLocalizations.of(context)!.arabic;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(15),
            decoration:  BoxDecoration(
              color: Theme.of(context).indicatorColor.withOpacity(0.7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTheme ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<String>(
                  iconEnabledColor: Colors.white,
                  underline: const SizedBox.shrink(),
                  dropdownColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  isExpanded: false,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  items: <String>[
                    AppLocalizations.of(context)!.light,
                    AppLocalizations.of(context)!.dark
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newTheme) {
                    selectedTheme = newTheme;

                    context.read<ThemeProvider>().changeAppTheme(
                        newTheme == AppLocalizations.of(context)!.light
                            ? ThemeMode.light
                            : ThemeMode.dark);
                  },

                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(15),
            decoration:  BoxDecoration(
              color: Theme.of(context).indicatorColor.withOpacity(0.7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLang ?? '',
                    style: TextStyle(color: Colors.white),
                ),
                DropdownButton<String>(
                    iconEnabledColor: Colors.white,
                    underline: SizedBox.shrink(),
                  dropdownColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  isExpanded: false,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  items: <String>[
                    AppLocalizations.of(context)!.english,
                    AppLocalizations.of(context)!.arabic
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newLang) {
                    selectedLang = newLang;
                    context.read<LanguageProvider>().changeAppLang(
                      newLang == AppLocalizations.of(context)!.english
                          ? 'en'
                          : 'ar',
                    );
                  })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
