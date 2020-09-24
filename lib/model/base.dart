abstract class Base<T>{
  final int count;
  final String next, previous;
  final T results;

  Base(this.count, this.next, this.previous, this.results);
}