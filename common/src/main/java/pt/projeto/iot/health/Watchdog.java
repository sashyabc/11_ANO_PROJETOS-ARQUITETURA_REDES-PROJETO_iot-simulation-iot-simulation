package pt.projeto.iot.health;

public interface Watchdog {
    void expect(String deviceId, long intervalSeconds);
}
