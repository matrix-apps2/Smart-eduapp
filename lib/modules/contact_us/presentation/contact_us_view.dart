import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppText("Get in touch", size: 22).bold(),
          const SizedBox(height: 8),
          const AppText(
              "We’d love to hear from you. Please fill out this form."),
          const SizedBox(height: 16),
          //*Form Fields
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First Name
              const AppText("First Name").header().bold(),
              EditText(hint: Strings().firstName, value: '', label: false)
                  .borderDecoration(false),
              const SizedBox(height: 8),
              //Last Name
              const AppText("Last Name").header().bold(),
              EditText(hint: Strings().lastName, value: '', label: false)
                  .borderDecoration(false),

              const SizedBox(height: 8),
              //Email
              const AppText("Email").header().bold(),
              EditText(
                      hint: Strings().email,
                      value: '',
                      type: TextInputType.emailAddress,
                      label: false)
                  .borderDecoration(false),

              const SizedBox(height: 8),
              //Phone
              const AppText("Phone").header().bold(),
              EditText(
                      hint: Strings().phone,
                      value: '',
                      type: TextInputType.phone,
                      label: false)
                  .borderDecoration(false),

              const SizedBox(height: 8),
              //Message
              const AppText("Message").header().bold(),
              EditText(
                hint: Strings().message,
                value: '',
                type: TextInputType.multiline,
                label: false,
              ).borderDecoration(false).linesMx(2),
            ],
          )
        ],
      ),
    );
  }
}
