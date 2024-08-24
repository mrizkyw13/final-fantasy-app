import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../games/bloc/games_bloc.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  GamesBloc bloc = GamesBloc();

  @override
  void initState() {
    bloc.add(GamesInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GamesBloc, GamesState>(
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

            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
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
                          image: NetworkImage(successState.game[index].picture),
                        ))
                        // Character Information
                      ],
                    ),
                  );
                });

          default:
            return const SizedBox();
        }
      },
    );
  }
}
