package pt.projeto.iot.provisioning;

import java.time.Instant;
import java.util.Map;

public record RegisteredDevice(
        String deviceId,
        String tenantId,
        String model,
        Map<String, String> attributes,
        Instant registeredAt
) { }
