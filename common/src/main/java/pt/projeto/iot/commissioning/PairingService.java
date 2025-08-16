package pt.projeto.iot.commissioning;

public interface PairingService {
    PairingResult pair(String address, String secret);
}
