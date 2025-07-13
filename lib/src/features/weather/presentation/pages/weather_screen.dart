import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/service_locator/dependency_injection.dart';
import 'package:weather_app/src/core/widgets/custom_text_form_field.dart';
import 'package:weather_app/src/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/src/features/weather/presentation/widgets/custom_weather_card.dart';

import '../../../../core/widgets/custom_button.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final cubit = sl<WeatherCubit>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    hintText: "Search by city",
                    onChanged: (value) => cubit.setCity(value),
                    maxLines: 1,
                    prefixIcon: const Icon(Icons.search),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter City Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  onTapped: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      cubit.fetchWeather();
                    }
                  },
                  text: 'Search',
                  width: 150.w,
                ),
                const SizedBox(height: 20),
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is WeatherSuccess) {
                      return CustomWeatherCard(info: state.weatherResult);
                    } else if (state is WeatherFailure) {
                      return Text(
                        state.failure.message,
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
