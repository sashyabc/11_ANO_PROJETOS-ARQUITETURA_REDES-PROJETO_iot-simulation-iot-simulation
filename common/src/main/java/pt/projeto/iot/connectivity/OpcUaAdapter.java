package pt.projeto.iot.connectivity;

public interface OpcUaAdapter {
    void writeNode(String nodeId, Object value);
}
