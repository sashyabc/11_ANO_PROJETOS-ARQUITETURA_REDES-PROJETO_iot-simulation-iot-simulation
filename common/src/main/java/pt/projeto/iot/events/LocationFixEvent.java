package pt.projeto.iot.events;

import java.time.Instant;

public record LocationFixEvent(String deviceId, double lat, double lon, Double altMeters, Double accuracyMeters,
                               Double speedMps, Double courseDeg, Instant at) implements DeviceEvent { }
