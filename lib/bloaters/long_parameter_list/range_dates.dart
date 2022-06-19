class RangeDates {
  DateTime begin;
  DateTime end;

  RangeDates({required this.begin, required this.end});

  set updateBegin(DateTime newBegin) => begin = newBegin;

  set updateEnd(DateTime newEnd) => end = newEnd;
}
