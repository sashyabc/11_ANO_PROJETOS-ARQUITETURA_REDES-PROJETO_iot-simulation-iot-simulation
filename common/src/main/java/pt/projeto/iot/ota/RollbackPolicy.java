package pt.projeto.iot.ota;

public record RollbackPolicy(boolean enabled, int maxAttempts) { }
