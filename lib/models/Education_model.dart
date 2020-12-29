import 'package:flutter/foundation.dart';

class Education {
  final String id;
  final String degreeTitle;
  final String instituteName;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final double marks;
  final double gpa;

  Education({
   this.id,
   this.degreeTitle,
   this.instituteName,
    this.status,
    this.startDate,
    this.endDate,
    this.marks,
    this.gpa,
  });
}