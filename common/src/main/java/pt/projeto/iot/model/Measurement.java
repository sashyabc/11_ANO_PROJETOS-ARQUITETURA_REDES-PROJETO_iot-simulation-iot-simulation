package pt.projeto.iot.model;

import java.time.Instant;

public record Measurement<T>(
    String deviceId,
    String metric,
    T value,
    Unit unit,
    Instant timestamp,
    Quality quality
) { } 

public enum Quality {
    GOOD, SUSPECT, BAD
}
