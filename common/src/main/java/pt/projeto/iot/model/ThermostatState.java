package pt.projeto.iot.model;

public record ThermostatState(Double targetC, Double currentC, String mode) { }
