import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/application/map/map_cubit.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/pages/qr_scanner_page.dart';
import 'package:teker_teker/presentation/widgets/loading_indicator.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is MapLoading) {
          return LoadingIndicator();
        } else {
          state as MapLoaded;
          return SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                  mapType: MapType.terrain,
                  markers: state.markers,
                  onMapCreated: (GoogleMapController controller) {
                    _onMapCreated(controller);
                  },
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 40,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QrScannerPage()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(),
                              Text(
                                'Sürüşe Başla',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.qr_code_rounded,color: Colors.white,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      setState(() {
        _controller.complete(controller);
      });
    }
  }
}
