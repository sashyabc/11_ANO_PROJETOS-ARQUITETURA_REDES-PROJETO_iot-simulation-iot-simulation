package pt.projeto.iot.ota;

import java.time.Instant;

public record FirmwareUpdate(String deviceId, String version, String uri, String checksum, Instant scheduledAt) { }
