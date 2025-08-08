package pt.projeto.iot;

public abstract class AbstractSensor implements Device {
    private final String id;

    public AbstractSensor(String id) {
        this.id = id;
    }

    @Override
    public String getId() {
        return id;
    }
}