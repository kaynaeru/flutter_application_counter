import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_counter/bloc/bloc_bloc.dart';
import 'package:flutter_application_counter/bloc/bloc_event.dart';
import 'package:flutter_application_counter/bloc/bloc_state.dart';

class Halaman1Page extends StatefulWidget {
  const Halaman1Page({super.key});

  @override
  State<Halaman1Page> createState() => _Halaman1PageState();
}

class _Halaman1PageState extends State<Halaman1Page> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
         backgroundColor: const Color.fromARGB(255, 205, 161, 255),
      ),
      body: BlocBuilder<bloc_bloc, bloc_state>(
        builder: (context, state) {
          int nilai = 0;
          if (state is UpdateState) {
            nilai = state.nilai;
          }
          return _halaman1Page(context, nilai);
        },
      ),
    );
  }

  Widget _halaman1Page(BuildContext context, int nilai) {
    return Padding(
      padding: const EdgeInsets.all(75.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Input number to be calculated:',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 205, 161, 255),
                ),
               onPressed: () {
                final input = _controller.text;
                if (input.isNotEmpty) {
                  final number = int.tryParse(input);
                    if (number != null) {
                     context.read<bloc_bloc>().add(NumberDecrementEvent(number));
                    }
                  _controller.clear();
               }
              },
              child: const Text('Substract', style: TextStyle(color: Colors.black)),
              
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 205, 161, 255),
                ),
               onPressed: () {
                final input = _controller.text;
                if (input.isNotEmpty) {
                  final number = int.tryParse(input);
                    if (number != null) {
                     context.read<bloc_bloc>().add(NumberIncrementEvent(number));
                    }
                  _controller.clear();
               }
              },
              child: const Text('Add', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
  
          const SizedBox(height: 50.0),
          Text(
            '$nilai',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
