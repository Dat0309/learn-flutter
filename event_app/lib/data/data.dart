import 'package:event_app/models/date_model.dart';
import 'package:event_app/models/event_type_model.dart';
import 'package:event_app/models/events_model.dart';
import 'package:flutter/material.dart';

List<DateModel> getDates() {
  List<DateModel> dates = List<DateModel>.empty(growable: true);
  DateModel dateModel = new DateModel();

  dateModel.date = "10";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "11";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "12";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "13";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "14";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "15";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "16";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "17";
  dateModel.weekDay = "Sun";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "18";
  dateModel.weekDay = "Mon";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "19";
  dateModel.weekDay = "Tue";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "20";
  dateModel.weekDay = "Wed";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "21";
  dateModel.weekDay = "Thu";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "22";
  dateModel.weekDay = "Fri";
  dates.add(dateModel);

  dateModel = new DateModel();

  dateModel.date = "23";
  dateModel.weekDay = "Sat";
  dates.add(dateModel);

  dateModel = new DateModel();

  return dates;
}

List<EventTypeModel> getEventTypes() {
  List<EventTypeModel> events = List<EventTypeModel>.empty(growable: true);
  EventTypeModel eventTypeModel = new EventTypeModel();

  eventTypeModel.imgAssetPath = "assets/images/concert.png";
  eventTypeModel.eventType = "Concert";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  //1
  eventTypeModel.imgAssetPath = "assets/images/sports.png";
  eventTypeModel.eventType = "Sports";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  //1
  eventTypeModel.imgAssetPath = "assets/images/education.png";
  eventTypeModel.eventType = "Education";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  //1
  eventTypeModel.imgAssetPath = "assets/images/education.png";
  eventTypeModel.eventType = "Education";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  //1
  eventTypeModel.imgAssetPath = "assets/images/education.png";
  eventTypeModel.eventType = "Education";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  //1
  eventTypeModel.imgAssetPath = "assets/images/education.png";
  eventTypeModel.eventType = "Education";
  events.add(eventTypeModel);

  eventTypeModel = new EventTypeModel();

  return events;
}

List<EventsModel> getEvents() {
  List<EventsModel> events = List<EventsModel>.empty(growable: true);

  EventsModel eventsModel = new EventsModel();

  eventsModel.imgAssetPath = "assets/images/tileimg.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Sports Meet in Galaxy Field";
  eventsModel.address = "Greenfields, Sector 42, Faridabad";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //2
  eventsModel.imgAssetPath = "assets/images/second.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Art & Meet in Street Plaza";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //3
  eventsModel.imgAssetPath = "assets/images/music_event.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  eventsModel.desc = "Youth Music in Gwalior";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //4
  eventsModel.imgAssetPath = "assets/images/rock.jpg";
  eventsModel.date = "Jan 12, 2022";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  eventsModel.desc = "Rock Music in Gwalior";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  //2
  eventsModel.imgAssetPath = "assets/images/second.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Art & Meet in Street Plaza";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  events.add(eventsModel);

  eventsModel = new EventsModel();
  //2
  eventsModel.imgAssetPath = "assets/images/second.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Art & Meet in Street Plaza";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  events.add(eventsModel);

  eventsModel = new EventsModel();
  //2
  eventsModel.imgAssetPath = "assets/images/second.png";
  eventsModel.date = "Jan 12, 2019";
  eventsModel.desc = "Art & Meet in Street Plaza";
  eventsModel.address = "Galaxyfields, Sector 22, Faridabad";
  events.add(eventsModel);

  eventsModel = new EventsModel();

  return events;
}
