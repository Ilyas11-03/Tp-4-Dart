import 'package:enset_app2/bloc/user.bloc.dart';
import 'package:enset_app2/ui/themes/theme.dart';
import 'package:enset_app2/ui/widget/main.drawer.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class gitUsers extends StatelessWidget {
  const gitUsers({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text("Git users"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                          ))),
                )),
                IconButton(
                    onPressed: () {
                      String kw = textEditingController.text;
                      context
                          .read<Usersbloc>()
                          .add(SearchUsersevent(keyword: kw));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
          BlocBuilder(builder: (context, state) {
            if (state is SearchUsersLoadingUsersState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchUserErrorState) {
              return Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: CustomThemes.errorTextStyle,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Retry"))
                ],
              );
            } else if (state is SearchUserSuccessState) {
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          title: Row(
                            children: [
                              Text(state.listUsers.items[index].login)
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 2,
                      );
                    },
                    itemCount: state.listUsers.items.length),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
