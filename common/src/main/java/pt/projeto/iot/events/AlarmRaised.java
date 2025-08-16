package pt.projeto.iot.events;

import java.time.Instant;

public record AlarmRaised(String deviceId, String code, String message, Instant at) implements DeviceEvent { }
