import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v2/cubit_state.dart';

import 'cubit.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CubitApiExample>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cubit Api Call')),

      body: Column(
        children: [
          BlocBuilder<CubitApiExample, Mystate>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(child: SpinKitCircle(color: Colors.indigo));
              } else if (state is LoadedState) {
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          state.data[index]['thumbnail'],
                        ),
                      ),
                      title: Text(state.data[index]['title']),
                      subtitle: Text(state.data[index]['description']),
                    );
                  },
                );
              } else if (state is ErrorState) {
                return Center(child: Text("error occured"));
              } else {
                return Container();
              }
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CubitApiExample>(context).getData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
