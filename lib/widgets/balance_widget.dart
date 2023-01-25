import 'package:flutter/material.dart';
import '../services/balance_service.dart';
import 'package:provider/provider.dart';

final balanceService = BalanceService();

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceService>(
      builder: (context, balanceService, _) {
        return GestureDetector(
          onTap: () => balanceService.getUserInfo(),
          child: Text('Rp ${balanceService.balance}',
          style: 
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),        
          ),
        );
      },
    );
  }
}