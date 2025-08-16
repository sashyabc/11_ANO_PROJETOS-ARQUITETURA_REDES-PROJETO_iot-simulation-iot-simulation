package pt.projeto.iot.provisioning;

import java.util.Map;

public record Enrollment(
        String deviceId,
        String tenantId,
        String model,
        Map<String, String> attributes
) { }
