library polkawallet_plugin_phyken_network;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polkawallet_plugin_phyken_network/common/constants.dart';
import 'package:polkawallet_plugin_phyken_network/pages/launch/launch.dart';
import 'package:polkawallet_plugin_phyken_network/pages/meta_hub/meta_hub_panel.dart';
import 'package:polkawallet_plugin_phyken_network/pages/read_datalog/read_datalog.dart';
import 'package:polkawallet_plugin_phyken_network/pages/write_datalog/write_datalog.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/plugin/homeNavItem.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

class PluginPhykenNetwork extends PolkawalletPlugin {
  PluginPhykenNetwork()
      : basic = PluginBasicData(
          name: 'Phyken Network',
          genesisHash: genesis_hash_phyken_network,
          ss58: 666,
          primaryColor: phyken_black,
          gradientColor: Color.fromARGB(255, 2, 156, 61),
          backgroundImage: AssetImage(
              'packages/polkawallet_plugin_phyken_network/assets/images/public/bg_phyken.png'),
          icon: Image.asset(
              'packages/polkawallet_plugin_phyken_network/assets/images/public/phyken.png'),
          iconDisabled: Image.asset(
              'packages/polkawallet_plugin_phyken_network/assets/images/public/phyken_gray.png'),
          jsCodeVersion: 31501,
          isTestNet: false,
          isXCMSupport: true,
        ),
        recoveryEnabled = true;

  @override
  final PluginBasicData basic;

  @override
  final bool recoveryEnabled;

  @override
  List<NetworkParams> get nodeList {
    return node_list_phyken.map((e) => NetworkParams.fromJson(e)).toList();
  }

  late Keyring keyring;

  @override
  final Map<String, Widget> tokenIcons = {
    'XRT': Image.asset(
        'packages/polkawallet_plugin_phyken_network/assets/images/tokens/XRT.png'),
  };

  @override
  List<HomeNavItem> getNavItems(BuildContext context, Keyring keyring) {
    return [
      HomeNavItem(
        text: basic.name!.toUpperCase(),
        icon: Container(),
        iconActive: Container(),
        isAdapter: true,
        content: MetaHubPanel(this),
      ),
    ];
  }

  @override
  Map<String, WidgetBuilder> getRoutes(Keyring keyring) {
    return {
      LaunchPage.route: (context) => LaunchPage(this),
      ReadDatalogPage.route: (context) => ReadDatalogPage(this),
      WriteDatalogPage.route: (context) => WriteDatalogPage(this),
    };
  }

  @override
  Future<String>? loadJSCode() => null;

  @override
  Future<void> onWillStart(Keyring keyring) async {
    try {
      loadBalances(keyring.current);
      print('phyken plugin cache data loaded');
    } catch (err) {
      print(err);
      print('load phyken cache data failed');
    }
    this.keyring = keyring;
  }
}
