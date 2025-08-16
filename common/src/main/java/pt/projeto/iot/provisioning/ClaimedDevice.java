package pt.projeto.iot.provisioning;

import java.time.Instant;

public record ClaimedDevice(String deviceId, String tenantId, Instant claimedAt) { }
