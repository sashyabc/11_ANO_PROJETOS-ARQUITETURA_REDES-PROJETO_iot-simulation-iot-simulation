package pt.projeto.iot.connectivity;

public interface BleAdapter {
    void write(String deviceAddress, String characteristic, byte[] value);
}
