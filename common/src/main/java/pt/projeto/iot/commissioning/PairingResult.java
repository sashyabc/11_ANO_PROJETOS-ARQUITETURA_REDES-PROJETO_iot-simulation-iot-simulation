package pt.projeto.iot.commissioning;

public record PairingResult(String deviceId, boolean success, String message) { }
