/*
 * Copyright 2019 mybytecode
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:shared_preferences/shared_preferences.dart';

class MyShredPreferences {
  enableDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", true);
  }

  disableDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", false);
  }

  Future<bool> checkDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("darkMode");
  }
}
