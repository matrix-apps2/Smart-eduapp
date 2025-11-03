import '../../../../../core/base/base_states.dart';
import '../../../../../core/presentation/widgets/app_text.dart';
import '../../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../../core/presentation/widgets/dialog/country_picker_dialog.dart';
import '../../../../../modules/location/data/models/country_model.dart';
import '../../../../../modules/location/logic/location_country/country_cubit.dart';
import '../../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuffixCountryPicker extends StatefulWidget {
  final Function(CountryModel?) onSelected;
  final CountryModel? selectedCountry;

  const SuffixCountryPicker(
      {Key? key, required this.onSelected, this.selectedCountry})
      : super(key: key);

  @override
  State<SuffixCountryPicker> createState() => _SuffixCountryPickerState();
}

class _SuffixCountryPickerState extends State<SuffixCountryPicker> {
  CountryModel? selectedCountry;

  @override
  void initState() {
    selectedCountry = widget.selectedCountry;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String countryName = selectedCountry?.name ?? Strings().selectCountry;
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        bool isLoading = state.state == BaseState.loading;
        String search = "";
        Widget child =
            AppText(countryName, ph: 8, pv: 0, size: 12, color: Colors.black87);
        if (isLoading) {
          child = const SizedBox(
              width: 30,
              child: CustomLoadingSpinner(size: 20, circleLoading: true));
        }
        return TextButton(
          onPressed: () async {
            if (state.data.isEmpty) {
              context.read<CountryCubit>().getCountries();
              return;
            }
            await showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => CountryPickerDialog(
                style: PickerDialogStyle(),
                filteredCountries: state.data,
                searchText: search,
                countryList: state.data
                    .where((element) => element.name!.contains(search))
                    .toList(),
                selectedCountry: selectedCountry,
                onCountryChanged: (CountryModel country) {
                  selectedCountry = country;
                  widget.onSelected(country);
                  setState(() {});
                },
              ),
            );
          },
          child: child,
        );
      },
    );
  }

  void onPressed() {}
}
