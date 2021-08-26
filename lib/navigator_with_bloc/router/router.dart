import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/router_bloc.dart';

part 'app_route.dart';
part 'app_route_information_parser.dart';
part 'app_router_delegate.dart';
part 'parse_route.dart';

enum AppPages { main, home, unknown, detail, timer, posts }
