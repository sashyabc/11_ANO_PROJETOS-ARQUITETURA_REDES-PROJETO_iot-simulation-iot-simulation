package pt.projeto.iot.provisioning;

import java.util.Optional;

public interface DeviceRegistry {
    Optional<RegisteredDevice> findById(String deviceId);
    RegisteredDevice register(Enrollment enrollment);
    void update(RegisteredDevice device);
}
