package pt.projeto.iot.events;

import java.time.Instant;
import pt.projeto.iot.model.Unit;

public record ThresholdExceeded(
    String deviceId, String metric, double value, Unit unit,
    double threshold, Instant at
) implements DeviceEvent { }
