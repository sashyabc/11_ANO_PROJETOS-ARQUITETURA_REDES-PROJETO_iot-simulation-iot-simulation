package pt.projeto.iot.twin;

import java.util.Map;

public record ReportedState(String deviceId, Map<String, Object> reported) { }
