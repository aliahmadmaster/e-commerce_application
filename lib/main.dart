import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/ecommerce_app.dart';

void main() {
  runApp(ProviderScope(child: (EcommerceApp())));
}
