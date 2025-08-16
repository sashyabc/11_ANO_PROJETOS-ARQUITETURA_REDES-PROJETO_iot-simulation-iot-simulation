package pt.projeto.iot.config;

public interface ConfigService {
    DeviceConfig get(String deviceId);
    void apply(String deviceId, DeviceConfig config);
}
