package pt.projeto.iot.model;

public record VacuumState(String status, VacuumMode mode, Integer batteryPct) { }
