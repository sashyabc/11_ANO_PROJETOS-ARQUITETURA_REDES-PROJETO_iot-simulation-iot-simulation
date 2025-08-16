package pt.projeto.iot.identity;

public interface KeyRotation {
    RotationPlan plan(String deviceId);
    void rotate(RotationPlan plan);
}
