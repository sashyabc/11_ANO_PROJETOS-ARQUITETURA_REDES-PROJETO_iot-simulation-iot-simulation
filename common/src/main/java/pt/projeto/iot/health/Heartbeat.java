package pt.projeto.iot.health;

import java.time.Instant;

public record Heartbeat(String deviceId, Instant at) { }
