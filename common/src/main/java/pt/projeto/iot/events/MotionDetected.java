package pt.projeto.iot.events;

import java.time.Instant;

public record MotionDetected(String deviceId, Instant at) implements DeviceEvent { }
