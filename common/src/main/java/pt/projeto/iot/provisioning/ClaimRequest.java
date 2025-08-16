package pt.projeto.iot.provisioning;

public record ClaimRequest(String deviceId, String tenantId, String secret) { }
