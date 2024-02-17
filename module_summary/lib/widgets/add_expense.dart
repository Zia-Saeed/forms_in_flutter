import 'package:flutter/material.dart';
import 'package:module_summary/models/expense.dart';
import 'package:flutter/cupertino.dart';

// final List<Expense> _registeredExpensesList = [];

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});
  final void Function(Expense expense) addExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = "";

  // void _saveTitleInput(String inputValue) {
  //   // input value will store the value inside the inputfeild in flutter.
  //   _enteredTitle = inputValue;
  // }
  //alternative approach
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    //function for showing date picker
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //will be null or gets value when the date is picked

    final pickedDate = await showDatePicker(
      //also want context and inital date and final date // showdatepicker return value in future which will be executed immedately if the value is passed it will return value else return null
      context:
          context, // more convinient method is to use async method with presentDatePicker method
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    // this line will be executed when the value is get above.
    setState(() {
      _selectedDate = pickedDate;
    });
    // print("Value get successfully");
    // ).then((value) => )// this function will be executed when the value is future or when value is passed in showdatetime;
  }

  void _submitExpenseData() {
    // print("this is first amount : $_amountController");
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // double .tryparse will return null if string is not me able to convert into double
    // print('this is entered amoount $enteredAmount');
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      // print("This condition runs");

      showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure a valid title,amount,date and category was entered"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx); // ctx that is used in builder method.
                    },
                    child: const Text("Okay"))
              ], //to close the dialog use actions
            )),
      );
      return; //show dialog will show the pop up
    }
    widget.addExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date:
              _selectedDate!, // use exclamation mark to tell dart that this won't be null and value will be provided at runtime
          category: _selectedCategory),
    );
    Navigator.pop(
        context); // making sure after adding new expense the overlay should close.
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    // preventing keyboard from overlapping getting the amount of space taken up by overlapping widget like keyboard from bottom
    // this object contains the information about the UI elements that are overlaping to eachother

    return LayoutBuilder(
      builder: (ctx, contraints) {
        final width = contraints.maxWidth; //

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, keyboardSpace + 16),
              margin: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            // onChanged:_saveTitleInput, // input paramter will automatically be passed by onChanged function
                            maxLength: 50,
                            decoration:
                                const InputDecoration(label: Text("Title")),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            // onChanged:_saveTitleInput, // input paramter will automatically be passed by onChanged function
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text("Amount"),
                              prefixText: "\$",
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      // onChanged:_saveTitleInput, // input paramter will automatically be passed by onChanged function
                      maxLength: 50,
                      decoration: const InputDecoration(label: Text("Title")),
                    ),
                  if (width >= 600)
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value:
                                        e, // this will store the selected values
                                    child: Text(e
                                        .name // enum has a specific name method and name method and name method also have .toString() method
                                        .toUpperCase()), //iterating through each value and converting it to list as DropdownMenuItem expects only list of string
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                        const Spacer(),
                        Text(
                          _selectedDate == null
                              ? "No date selected"
                              : formatter.format(_selectedDate!),
                          //this exclamation mark force dart to assume that this datetime won't be null
                        ),
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            // onChanged:_saveTitleInput, // input paramter will automatically be passed by onChanged function
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text("Amount"),
                              prefixText: "\$",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Spacer(),
                              Text(
                                _selectedDate == null
                                    ? "No date selected"
                                    : formatter.format(_selectedDate!),
                                //this exclamation mark force dart to assume that this datetime won't be null
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  Row(
                    children: [
                      if (width < 600)
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value:
                                        e, // this will store the selected values
                                    child: Text(e
                                        .name // enum has a specific name method and name method and name method also have .toString() method
                                        .toUpperCase()), //iterating through each value and converting it to list as DropdownMenuItem expects only list of string
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = value;
                              });
                            }),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                              context); // it will remove the current screen the context here is current popup screen that is referenced to the build(context).
                        }, // closing the popup or model manually.
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text("Save Expense"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    //using layoutBuilder for responsive screen
  }
}
