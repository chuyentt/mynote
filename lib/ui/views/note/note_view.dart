import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'note_viewmodel.dart';
import 'note_model.dart';

class NoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NoteViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.title)),
        body: ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (BuildContext context, int index) {
            Note item = model.items[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.desc),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            model.addItem();
          },
        ),
      ),
      viewModelBuilder: () => NoteViewModel(),
    );
  }
}
