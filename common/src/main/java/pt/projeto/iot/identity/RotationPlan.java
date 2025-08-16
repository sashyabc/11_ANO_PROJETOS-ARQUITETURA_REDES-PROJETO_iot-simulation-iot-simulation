package pt.projeto.iot.identity;

import java.time.Instant;

public record RotationPlan(String deviceId, Instant executeAt) { }
