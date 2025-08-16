package pt.projeto.iot.connectivity;

public interface CoapAdapter {
    void send(String uri, byte[] payload);
}
