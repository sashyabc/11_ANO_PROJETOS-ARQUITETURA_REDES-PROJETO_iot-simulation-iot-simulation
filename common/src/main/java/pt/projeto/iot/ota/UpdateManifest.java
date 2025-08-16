package pt.projeto.iot.ota;

import java.util.Map;

public record UpdateManifest(String version, String uri, String checksum, Map<String, String> metadata) { }
