part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();
  
  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventLoaded extends EventState {

  final List<Event> events;

  EventLoaded({required this.events});

  @override 
  List<Object> get props => [events];

}

class EventError extends EventState {
  final String error;

  EventError( {required this.error});

  @override 
  List<Object> get props => [error];

}
