import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:post_app/models/event_model.dart';

import '../../repository/event_repository.dart';
import '../../utils/database_helper.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {

   final DatabaseHelper databaseHelper;
  final EventRepository eventRepository;
 

  EventBloc(this.eventRepository,this.databaseHelper) : super(EventInitial()) {
    on<FetchEventsEvent>(_onFetchEvent);
  }

  Future<void> _onFetchEvent( FetchEventsEvent event,Emitter<EventState> emit ) async {
    emit(EventLoading());
    try {
      
      bool hasConnection = await InternetConnectionChecker().hasConnection;

      if(hasConnection) {
         final response = await eventRepository.fetchEvents(event.page,event.limit);
      // debugPrint(response['data']['events'].toString(), wrapWidth: 1024);

       if (response['data'].containsKey('events') && response['data']['events'] != null) {
        print('Events key exists and is not null');
        final List<Event> events = (response['data']['events'] as List<dynamic>).map((e) {
          // print('Mapping event: $e');
          debugPrint(e.toString(), wrapWidth: 1024);
          return Event.fromMap(e as Map<String, dynamic>);
        }).toList();
        emit(EventLoaded(events: events));
      } else {
        print('Events key is missing or null');
        emit(EventLoaded(events: [])); // Emit an empty list if 'events' is null
      }
      }
      else {
         List<Event> localPosts = await databaseHelper.getEvents();
         if(localPosts.isEmpty)
         {
          emit(EventError(error: "List is Empty"));
         }
         else 
         {
             emit(EventLoaded(events: localPosts));
         }
       
      }
      

     
    }
    catch(e) 
    {
      print(e);
      emit(EventError(error: e.toString()));
    }
  }
}
