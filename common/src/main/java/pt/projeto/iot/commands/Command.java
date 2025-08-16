package pt.projeto.iot.commands;

import java.time.Duration;
import java.util.Map;
import java.util.UUID;

public record Command(
    UUID id,
    String deviceId,
    String kind,
    Map<String, Object> args,
    Duration ttlSeconds
) { }
