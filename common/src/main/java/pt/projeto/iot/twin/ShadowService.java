package pt.projeto.iot.twin;

public interface ShadowService {
    DeviceTwin get(String deviceId);
    void updateDesired(DesiredState desired);
    void updateReported(ReportedState reported);
}
