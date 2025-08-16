package pt.projeto.iot.connectivity;

public interface ModbusAdapter {
    void writeRegister(int unitId, int register, int value);
}
