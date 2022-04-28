import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rawr/controllers/client/bindings/client_binding.dart';
import 'package:rawr/services/auth/auth_controller.dart';
import 'package:rawr/services/database/remote_database/remote_database_controller.dart';
import 'package:rawr/views/auth/sign_in/d_sign_in.dart';
import 'package:rawr/views/landing/d_landing.dart';
import 'dart:developer' as dev;

import '../services/database/remote_database/models/remote_user.dart';
import '../themes/lulz_theme.dart';

part './lulz_const.dart';

/// helpers
part './lulz_images.dart';
part './lulz_utils.dart';
part '../rawr.dart';

/// themes
part '../themes/lulz_colors.dart';

/// views
part '../views/home/d_home.dart';
part '../views/splash/d_splash.dart';

/// models
part '../models/lulz_user/lulz_user.dart';
