package pt.projeto.iot.tenant;

import java.util.Map;

public record Tagging(String deviceId, Map<String, String> tags) { }
