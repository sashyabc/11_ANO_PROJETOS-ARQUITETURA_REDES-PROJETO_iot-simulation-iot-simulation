package pt.projeto.iot.events;

public sealed interface DeviceEvent permits ThresholdExceeded, AlarmRaised, MotionDetected, TagSeen, LocationFixEvent { }
