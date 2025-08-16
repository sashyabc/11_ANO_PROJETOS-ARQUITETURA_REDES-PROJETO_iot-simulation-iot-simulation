package pt.projeto.iot.provisioning;

public interface ProvisioningService {
    RegisteredDevice onboard(Enrollment enrollment);
    ClaimedDevice claim(ClaimRequest request);
}
