package pt.projeto.iot.ota;

public record OTAJob(String jobId, String tenantId, String version, String manifestUri) { }
