import 'package:api_calling_bloc/Bloc/phone_bloc.dart';
import 'package:api_calling_bloc/Bloc/phone_event.dart';
import 'package:api_calling_bloc/Bloc/phone_state.dart';
import 'package:api_calling_bloc/Model/phone_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {  
     context.read<phone_bloc>().add(fetching_phone_event());
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 169, 214),
        actions: [
          TextButton(
              onPressed: () {
                context.read<phone_bloc>().add(fetching_phone_event());
              },
              child: Icon(
                Icons.display_settings,
                size: 40,
              ))
        ],
      ),
      body: Column(
        children: [
          Text(
            "Smart Phones",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          BlocConsumer<phone_bloc, phone_state>(
            listener: (context, state) {
              if (state is failure_phone_state) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is loading_phone_state) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              } else if (state is success_phone_state) {
                List<phone_detail_model> details =
                    state.phone_details as List<phone_detail_model>;
                print("Screen Page : Detaisl $details");
                return Expanded(
                  child: ListView.builder(
                      itemCount: details.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(details[index].name ?? "o"),
                            Text(details[index].color ?? "o"),
                            Text(details[index].capacity ?? "o"),
                            SizedBox(height: 20,)
                          ],
                        );
                      }),
                );
              } else {
                print("Else");
                return Column();
              }
            },
          ),
        ],
      ),
    );
  }
}
