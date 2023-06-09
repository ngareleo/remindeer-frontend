import 'package:flutter/material.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  bool eventIsAllDay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new task'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FilledButton(onPressed: () {}, child: const Text('Save')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DropdownMenu<int>(
                    width: MediaQuery.of(context).size.width,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 0, label: 'Regular'),
                      DropdownMenuEntry(value: 1, label: 'Lecture')
                    ],
                    initialSelection: 0,
                    label: const Text('Choose the event type...'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Label',
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      keyboardType: TextInputType.text,
                      maxLines: 10,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose the time intervals for the task',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            'All day',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Switch(
                              value: eventIsAllDay,
                              onChanged: (bool value) {
                                setState(() => eventIsAllDay = value);
                              })
                        ],
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_rounded,
                                  size: 18,
                                ),
                                Text(
                                  'From',
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.add_rounded,
                                      size: 18,
                                    ),
                                    Text('To')
                                  ]),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(
                        Icons.add_rounded,
                        size: 18,
                      ),
                      Text('Pick date')
                    ]),
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(
                            Icons.link_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                          Text(
                            'Link to unit',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 5),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(
                        Icons.link_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                      Text(
                        'Link to timetable',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(
                        Icons.link_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                      Text(
                        'Link to semester',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
