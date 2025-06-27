// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> closeDropdownAfter(BuildContext context) async {
  // Cierra cualquier popup después de 2.5 segundos
  await Future.delayed(Duration(milliseconds: 2500), () {
    // Método 1: Quita el foco (puede funcionar para dropdowns básicos)
    FocusScope.of(context).unfocus();

    // Método 2: Cierra el overlay actual si existe
    OverlayState? overlay = Overlay.of(context);
    if (overlay != null) {
      // Intenta cerrar cualquier overlay activo (como dropdowns)
      FocusManager.instance.primaryFocus?.unfocus();
    }

    // Método 3: Para dropdowns de Material, podemos simular un tap fuera
    GestureDetector? detector;
    detector = GestureDetector(
      onTap: () {
        // Remover el detector después de usarlo
        detector = null;
      },
      behavior: HitTestBehavior.opaque,
    );

    // No usar maybePop() ya que causa problemas de navegación
    // Navigator.of(context).maybePop();
  });

  return;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
