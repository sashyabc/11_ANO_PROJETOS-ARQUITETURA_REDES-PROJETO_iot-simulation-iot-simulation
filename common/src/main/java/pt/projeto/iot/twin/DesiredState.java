package pt.projeto.iot.twin;

import java.util.Map;

public record DesiredState(String deviceId, Map<String, Object> desired) { }
