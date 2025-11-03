import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../utils/resources/resources.dart';
import '../../../../widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButton(
                onTap: () {},
                title: "AppButton",
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    FToast fToast = FToast();
                    fToast.init(context);
                    Widget toast = Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black87,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 12.0),
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8.0),
                          const AppText("This is a Custom Toast", pv: 10, ph: 8)
                              .white(),
                          const SizedBox(width: 12.0),
                        ],
                      ),
                    );
                    // Custom Toast Position
                    fToast.showToast(
                        child: toast,
                        toastDuration: const Duration(seconds: 3),
                        positionedToastBuilder: (context, child , gravity) {
                          return Positioned(
                            top: 16.0,
                            left: 0,
                            right: 0,
                            child: child,
                          );
                        });
                  },
                  icon: const Icon(Icons.mail),
                  label: const Text('TOAST')),
              const Chip(label: Text('Chip')),
              const Card(
                margin: EdgeInsets.all(12),
                child: AppText(
                    'CARD Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor'),
              ),
              FilterChip(
                label: const Text('High false'),
                selected: false,
                onSelected: (bool value) {},
              ),
              AppElevatedButton(
                onTap: () {},
                width: deviceWidth / 2,
                title: "AppElevatedButton",
              )
                  .noShadow()
                  .radius(4)
                  .color(Colors.blue.shade100)
                  .textColor(Colors.blue.shade500),
              const SizedBox(height: 100),
              const TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search), hintText: "Search"),
              ),
            ],
          ),
        ));
  }
}
