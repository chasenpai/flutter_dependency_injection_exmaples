import 'package:flutter/material.dart';
import 'package:mask/presentation/component/store_item.dart';
import 'package:mask/presentation/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고가 있는 약국 ${state.stores.length} 곳',),
      ),
      body: state.isLoading
        ? const Center(child: CircularProgressIndicator(),)
        : ListView(
          children: state.stores.map((store) => StoreItem(store: store)).toList(),
        ),
    );
  }
}
