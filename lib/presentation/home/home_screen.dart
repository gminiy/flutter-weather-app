import 'package:flutter/material.dart';
import 'package:flutter_weather_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      viewModel.fetchHourlyWeatherFromNow();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64.0),
          child: Column(
            children: [
              Container(
                child: const Column(
                  children: [
                    Text(
                      '24 \u00B0',
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '습도 70%',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '바람 6.6km/h',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '기압 1014.3hPa',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.grey,
                  child: Table(
                    defaultColumnWidth: const FixedColumnWidth(62.0),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(
                        bottom: BorderSide(),
                        verticalInside: BorderSide(color: Colors.black12)),
                    children: [
                      TableRow(
                        children: _buildRowWidgets(
                            ['오늘', ...viewModel.state.timeList]),
                      ),
                      TableRow(
                        children: _buildRowWidgets([
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '온도',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                              Text(
                                '(${viewModel.state.temperatureUnit})',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          ...viewModel.state.temperatureList
                        ]),
                      ),
                      TableRow(
                        children: _buildRowWidgets([
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '바람',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                              Text(
                                '(${viewModel.state.windSpeedUnit})',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          ...viewModel.state.windSpeedList
                        ]),
                      ),
                      TableRow(
                        children: _buildRowWidgets([
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '습도',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '(${viewModel.state.humidityUnit})',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          ...viewModel.state.humidityList
                        ]),
                      ),
                      TableRow(
                        children: _buildRowWidgets([
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '기압',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                              Text(
                                '(${viewModel.state.pressureUnit})',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          ...viewModel.state.pressureList
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildRowWidgets<T>(List<T> children) {
  if (children[0] == '오늘') {
    return children.map((e) {
      if (children.indexOf(e) == 0) {
        return Container(
          height: 40,
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            height: 18,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: Text(
              '$e',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        );
      }

      final dateTime = e as DateTime;
      Widget? childWidget;

      final today = DateTime.now().day;
      final weatherDate = dateTime.copyWith().day;
      final weatherHour = dateTime.copyWith().hour;

      if (weatherHour == 0) {
        if (weatherDate == today + 4) {
          childWidget = Container(
            alignment: Alignment.center,
            height: 18,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: const Text(
              '그글피',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          );
        }
        if (weatherDate == today + 3) {
          childWidget = Container(
            alignment: Alignment.center,
            height: 18,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: const Text(
              '글피',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          );
        }
        if (weatherDate == today + 2) {
          childWidget = Container(
            alignment: Alignment.center,
            height: 18,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: const Text(
              '모레',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          );
        }
        if (weatherDate == today + 1) {
          childWidget = Container(
            alignment: Alignment.center,
            height: 18,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(32))),
            child: const Text(
              '내일',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          );
        }
      }

      return Container(
        height: 58,
        alignment: Alignment.center,
        child: childWidget ??
            Text(
              '${dateTime.toLocal().hour} 시',
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
            ),
      );
    }).toList();
  }

  return children.map((e) {
    if (children.indexOf(e) == 0) {
      return Container(
        height: 58,
        alignment: Alignment.center,
        child: e as Widget,
      );
    }
    return Container(
      height: 58,
      alignment: Alignment.center,
      child: Text(
        '$e',
        style:
            const TextStyle(color: Colors.indigoAccent, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }).toList();
}
