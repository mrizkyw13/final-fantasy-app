import 'package:final_fantasy_app/features/characters/bloc/character_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  CharacterBloc bloc = CharacterBloc();

  @override
  void initState() {
    bloc.add(CharacterInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBloc, CharacterState>(
      bloc: bloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case CharacterLoadingState:
            return const Center(child: CircularProgressIndicator());

          case CharacterEmptyState:
            return const Text('There is no data');

          case CharacterFailFetchState:
            final failState = state as CharacterFailFetchState;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(failState.message),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () {
                          bloc.add(CharacterReloadEvent());
                        },
                        child: const Text('Retry'))
                  ],
                ),
              ),
            );

          case CharacterSuccessFetchState:
            final succesState = state as CharacterSuccessFetchState;
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
                        Text(succesState.character[index].name),
                        const SizedBox(height: 12),
                        // Character Image
                        Center(
                          child: succesState
                                  .character[index].pictures!.isNotEmpty
                              ? Image(
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                  image: NetworkImage(succesState
                                          .character[index].pictures?[0].url ??
                                      ''),
                                )
                              : Container(
                                  height: 72,
                                  width: 72,
                                  decoration: const BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: const Center(
                                    child: Text('??'),
                                  ),
                                ),
                        )
                        // Character Information
                      ],
                    ),
                  );
                });

          default:
            return Container();
        }
      },
    );
  }
}
