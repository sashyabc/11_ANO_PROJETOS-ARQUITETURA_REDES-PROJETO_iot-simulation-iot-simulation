package pt.projeto.iot.identity;

public record Attestation(String deviceId, String format, byte[] evidence) { }
