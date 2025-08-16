package pt.projeto.iot.health;

public interface HealthCheck {
    DeviceStatus status(String deviceId);
}
