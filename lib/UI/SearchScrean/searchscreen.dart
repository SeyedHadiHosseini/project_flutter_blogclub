import 'package:flutter/material.dart';
import 'package:project_two_blogclub/UI/SearchScrean/logic/provider.dart';
import 'package:provider/provider.dart';

int selectedNumber = 1;

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 6. Use Consumer to rebuild specific parts of the widget tree
          Consumer<MyProvider>(
            builder: (context, myProvider, child) {
              return Text(
                'Search Screen : Number ${myProvider.counter}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              );
            },
          ),

          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onBackground)),
            onPressed: () {
              myProvider.increment();
              // selectedNumber++;
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const SimpleScreen(),
              //   ),
              // );
            },
            child: Text(
              'Click To Add',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Theme.of(context).colorScheme.surface),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onBackground)),
            onPressed: () {
              myProvider.decrement();
              // selectedNumber--;
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const SimpleScreen(),
              //   ),
              // );
            },
            child: Text(
              'Click To Remove',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Theme.of(context).colorScheme.surface),
            ),
          ),
        ],
      ),
    );
  }
}
