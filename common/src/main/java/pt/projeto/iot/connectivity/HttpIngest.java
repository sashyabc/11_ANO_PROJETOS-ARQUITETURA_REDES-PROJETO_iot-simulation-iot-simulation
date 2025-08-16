package pt.projeto.iot.connectivity;

public interface HttpIngest {
    void post(String path, byte[] payload, String contentType);
}
