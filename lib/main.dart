import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_counter_bloc/app_events.dart';
import 'package:weather_counter_bloc/app_states.dart';
import 'package:weather_counter_bloc/bloc/counter_bloc.dart';
import 'package:weather_counter_bloc/data_repository.dart';

import 'app_blocs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AppBlocs(RepositoryProvider.of<DataRepository>(context)),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Weather Counter'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: Center(
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BlocBuilder<AppBlocs, AppStates>(
                  builder: (context, state) {
                    if (state is WeatherLoadedState) {
                      return Text(
                        'Weather for ${state.cityWeather.sys?.country}, ${state.cityWeather.name} is ${state.cityWeather.main?.temp?.toStringAsFixed(0)} C',
                        style:
                            const TextStyle(fontSize: 24, color: Colors.purple),
                      );
                    }

                    return const Text(
                      'Press the icon to get your location',
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
                const Text('You have pushed the button this many times'),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, count) {
                    return Text('$count',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.black));
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<AppBlocs>(context)
                          .add(LoadWeatherEvent(DataRepository()));
                    },
                    tooltip: 'Location & Weather',
                    child: const Icon(Icons.location_on),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Increment());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Theme mode',
                    child: const Icon(Icons.dark_mode),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Decrement());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
