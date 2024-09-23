import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controllers/workout_controller.dart';
import '../models/workout.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  late String _type;
  late DateTime _date;
  late int _duration;

  @override
  void initState() {
    super.initState();
    _type = '';
    _date = DateTime.now();
    _duration = 0;
  }

  // Validate the input fields
  bool validateFields() {
    if (_type.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a workout type.'),
          backgroundColor: Colors.orange,
        ),
      );
      return false;
    }

    if (_date == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a workout date.'),
        ),
      );
      return false;
    }

    if (_duration <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid workout duration.'),
          backgroundColor: Colors.orange,
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Add Workout',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _type,
              onChanged: (value) {
                setState(() {
                  _type = value!;
                });
              },
              items: <String>['', 'Walking', 'Lunges', 'Yoga']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.isNotEmpty ? value : 'Select Type'),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Type'),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text('Date: ${_date.toString().substring(0, 10)}'),
                SizedBox(width: 15.w),
                ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        setState(() {
                          _date = pickedDate;
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _duration = int.tryParse(value) ?? 0;
              },
              decoration:
                  const InputDecoration(labelText: 'Duration (minutes)'),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                // Validate fields before saving
                if (validateFields()) {
                  final newWorkout = Workout(
                    title: '',
                    description: 'This is a workout',
                    type: _type,
                    date: _date,
                    duration: _duration,
                  );
                  Provider.of<WorkoutController>(context, listen: false)
                      .addWorkout(newWorkout);

                  // Navigate back to HomeScreen after adding a workout
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 45.0,
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
