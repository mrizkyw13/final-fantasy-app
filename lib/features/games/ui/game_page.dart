import 'package:final_fantasy_app/features/games/bloc/games_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  GamesBloc bloc = GamesBloc();

  @override
  void initState() {
    bloc.add(GamesInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games Page'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search games...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              bloc.add(GamesSearchEvent(query: query));
            },
          ),
          BlocConsumer<GamesBloc, GamesState>(
            bloc: bloc,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case GamesLoadingState:
                  return const Center(child: CircularProgressIndicator());

                case GamesFailFetchState:
                  final failState = state as GamesFailFetchState;

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(failState.message),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () {
                                bloc.add(GamesReloadEvent());
                              },
                              child: const Text('Retry'))
                        ],
                      ),
                    ),
                  );

                case GamesSuccessFetchState:
                  final successState = state as GamesSuccessFetchState;

                  return Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: successState.game.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Column(
                              children: [
                                //Character Name
                                Text(successState.game[index].title),
                                const SizedBox(height: 12),
                                // Character Image
                                Center(
                                    child: Image(
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                  image: NetworkImage(
                                      successState.game[index].picture),
                                ))
                                // Character Information
                              ],
                            ),
                          );
                        }),
                  );

                default:
                  return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
