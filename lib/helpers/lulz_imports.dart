import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rawr/controllers/client/client_controller.dart';
import 'package:rawr/controllers/auth/auth_controller.dart';
import 'package:rawr/controllers/database/remote/remote_database_controller.dart';
import 'package:rawr/views/auth/sign_in/sign_in.dart';
import 'package:rawr/views/landing/landing.dart';
import 'package:rawr/views/viewport/lulz_viewport.dart';
import 'dart:developer' as dev;

import '../models/remote_user.dart';
import '../themes/lulz_theme.dart';

/// helpers
part './lulz_images.dart';
part './lulz_utils.dart';
part '../rawr.dart';
part './lulz_const.dart';

/// themes
part '../themes/lulz_colors.dart';

/// views
part '../views/home/home.dart';
part '../views/splash/splash.dart';

/// models
part '../models/lulz_user.dart';

/// bindings
part '../controllers/client/bindings/client_binding.dart';
