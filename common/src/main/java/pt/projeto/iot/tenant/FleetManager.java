package pt.projeto.iot.tenant;

import java.util.List;

public interface FleetManager {
    void assign(String tenantId, String deviceId, String groupId);
    List<String> listByGroup(String tenantId, String groupId);
}
