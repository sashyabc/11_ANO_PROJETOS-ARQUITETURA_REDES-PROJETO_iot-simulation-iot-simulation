package pt.projeto.iot.model;

import java.time.Instant;

public record StateReported<T>(String deviceId, T state, Instant at) { }
