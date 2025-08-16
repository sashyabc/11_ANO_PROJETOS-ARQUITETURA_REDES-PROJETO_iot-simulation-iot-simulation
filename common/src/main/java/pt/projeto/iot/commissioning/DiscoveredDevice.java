package pt.projeto.iot.commissioning;

import java.util.Map;

public record DiscoveredDevice(String type, String address, Map<String, String> attributes) { }
