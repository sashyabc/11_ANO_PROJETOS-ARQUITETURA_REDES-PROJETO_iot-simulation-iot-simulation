package pt.projeto.iot.events;

import java.time.Instant;

public record TagSeen(String deviceId, String tagId, String antennaId, Double rssi, Instant at) implements DeviceEvent { }
