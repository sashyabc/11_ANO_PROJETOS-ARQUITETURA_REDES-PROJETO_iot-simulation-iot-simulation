package pt.projeto.iot.commissioning;

import java.util.List;

public interface DiscoveryService {
    List<DiscoveredDevice> scan();
}
