package pt.projeto.iot.config;

import java.util.Map;

public record DeviceConfig(String deviceId, Map<String, Object> parameters, String profile) { }
