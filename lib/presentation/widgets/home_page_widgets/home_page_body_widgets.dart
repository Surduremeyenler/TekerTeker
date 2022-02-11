import 'package:flutter/material.dart';
import 'package:teker_teker/domain/constant_transactions/constant_transactions.dart';

class HomePageBodyWidgets extends StatelessWidget {
  HomePageBodyWidgets({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  final bool _isScrolled = false;
  final List _contractedStoreTransactions = contractedStoreTransactions;
  final List _userTransactions = userTransactions;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
