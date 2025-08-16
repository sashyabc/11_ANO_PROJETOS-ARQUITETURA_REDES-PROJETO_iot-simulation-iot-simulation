package pt.projeto.iot.twin;

import java.util.Map;
import java.time.Instant;

public record DeviceTwin(String deviceId, Map<String, Object> desired, Map<String, Object> reported, Instant updatedAt) { }
