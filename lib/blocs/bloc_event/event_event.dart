part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}


class FetchEventsEvent extends EventEvent {
  final int page;
  final int limit; 

  FetchEventsEvent(this.page,this.limit);

  @override 
  List<Object> get props => [page,limit];
}

class SearchEvent extends EventEvent {
  final String query;
  final int page;
  final int limit;

  SearchEvent(this.query,this.page,this.limit);

  @override 
  List<Object> get props => [query,page,limit];
}