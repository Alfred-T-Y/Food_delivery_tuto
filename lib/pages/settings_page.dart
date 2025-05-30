import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver/components/settings_tile.dart';
import 'package:food_deliver/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [

          //Dark mode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SettingsTile(
                  text: "Dark Mode", 
                  description: "Switch between light and dark mode", 
                  icon: Icons.dark_mode
                ),
              ),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
                onChanged: (value){
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                ),
              SizedBox(width: 10,),
            ],
          ),

          const Spacer(),
          
          Row(
            children: [
              Expanded(
                child: SettingsTile(
                  text: "Delete account", 
                  description: "All your datas would be lost", 
                  icon: Icons.delete,
                  onTap: () {
                    
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),

        ],
      ),

    );
  }
}