import 'package:flutter/material.dart';
import 'package:flutter_localization_app_practice/controller/language_change_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Language {english, nepali}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child){
              return PopupMenuButton(
            onSelected: (Language item){
              if(Language.english.name == item.name){
                provider.changeLanguage(const Locale('en'));
              } 
              else{
                provider.changeLanguage(const Locale('ne'));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
            const PopupMenuItem(value: Language.english, child: Text("English")),
            const PopupMenuItem(value: Language.nepali, child: Text("नेपाली")),
          ] );
            }
          )
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.name),
      )
    );
  }
}
