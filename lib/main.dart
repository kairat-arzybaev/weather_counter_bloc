import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_counter_bloc/app_events.dart';
import 'package:weather_counter_bloc/app_states.dart';
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
      child: BlocProvider(
        create: (context) =>
            AppBlocs(RepositoryProvider.of<DataRepository>(context)),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BlocBuilder<AppBlocs, AppStates>(
                  builder: (context, state) {
                    if (state is WeatherLoadingState) {
                      const CircularProgressIndicator();
                    }
                    if (state is WeatherLoadedState) {
                      return Text(
                        'Weather for ${state.cityWeather.sys?.country}, ${state.cityWeather.name} is ${state.cityWeather.main?.temp?.toStringAsFixed(0)} C',
                        style: const TextStyle(fontSize: 20),
                      );
                    }

                    return const Text(
                      'Press the icon to get your location',
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
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
                    onPressed: _incrementCounter,
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
                    onPressed: _decrementCounter,
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
