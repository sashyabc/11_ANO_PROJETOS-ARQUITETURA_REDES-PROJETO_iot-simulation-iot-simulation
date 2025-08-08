package pt.projeto.iot;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AbstractSensorTest {

    // Implementação “fake” só para testar a classe abstrata
    static class FakeSensor extends AbstractSensor {
        private boolean started = false;
        private boolean stopped = false;

        public FakeSensor(String id) { super(id); }

        @Override public void start() { started = true; }
        @Override public void stop()  { stopped = true; }

        boolean isStarted() { return started; }
        boolean isStopped() { return stopped; }
    }

    @Test
    void deveManterId() {
        FakeSensor s = new FakeSensor("sensor-1");
        assertEquals("sensor-1", s.getId());
    }

    @Test
    void deveExecutarStartStop() {
        FakeSensor s = new FakeSensor("sensor-2");
        s.start();
        s.stop();
        assertTrue(s.isStarted());
        assertTrue(s.isStopped());
    }
}
