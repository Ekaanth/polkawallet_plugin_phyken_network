import 'package:flutter/material.dart';

const int SECONDS_OF_DAY = 24 * 60 * 60; // seconds of one day
const int SECONDS_OF_YEAR = 365 * 24 * 60 * 60; // seconds of one year

const node_list_phyken = [
  {
    'name': 'Phyken Network',
    'ss58': 666,
    'endpoint': 'wss://rpc.testnet.metaquity.xyz',
  },
];

const MaterialColor phyken_black = const MaterialColor(
  0xFF222222,
  const <int, Color>{
    50: const Color(0xFF555555),
    100: const Color(0xFF444444),
    200: const Color(0xFF444444),
    300: const Color(0xFF333333),
    400: const Color(0xFF333333),
    500: const Color(0xFF222222),
    600: const Color(0xFF111111),
    700: const Color(0xFF111111),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

const String genesis_hash_phyken = '0x1072ec50040d7d42226e34d1ce90d9401ed9506a0ae16390ce6e18df99a1c4e4';
