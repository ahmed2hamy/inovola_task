part of 'constants.dart';

const Color kPrimaryColor = Color(0xff8F3DA5);

final MaterialColor kPrimarySwatch =
    MaterialColor(kPrimaryColor.hashCode, _primaryColorMap);

Map<int, Color> _primaryColorMap = {
  50: const Color.fromRGBO(143, 61, 165, .1),
  100: const Color.fromRGBO(143, 61, 165, .2),
  200: const Color.fromRGBO(143, 61, 165, .3),
  300: const Color.fromRGBO(143, 61, 165, .4),
  400: const Color.fromRGBO(143, 61, 165, .5),
  500: const Color.fromRGBO(143, 61, 165, .6),
  600: const Color.fromRGBO(143, 61, 165, .7),
  700: const Color.fromRGBO(143, 61, 165, .8),
  800: const Color.fromRGBO(143, 61, 165, .9),
  900: const Color.fromRGBO(143, 61, 165, 1),
};
