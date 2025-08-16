package pt.projeto.iot.identity;

public interface CertificateManager {
    String issueCertificate(DeviceIdentity identity);
    void revokeCertificate(String certId, String reason);
}
