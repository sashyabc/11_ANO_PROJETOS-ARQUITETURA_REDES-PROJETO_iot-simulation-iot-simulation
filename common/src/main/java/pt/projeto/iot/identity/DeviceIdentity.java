package pt.projeto.iot.identity;

public record DeviceIdentity(String deviceId, String tenantId, String subjectDn) { }
