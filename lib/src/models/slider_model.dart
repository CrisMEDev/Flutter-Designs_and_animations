import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{

  double _paginaActual = 0;

  double get paginaActual => this._paginaActual;
         set paginaActual(double pagina) {
           this._paginaActual = pagina;
           notifyListeners();
        }

}
