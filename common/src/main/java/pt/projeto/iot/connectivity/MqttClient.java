package pt.projeto.iot.connectivity;

public interface MqttClient {
    void publish(String topic, byte[] payload, int qos, boolean retained);
    void subscribe(String topicFilter);
}
