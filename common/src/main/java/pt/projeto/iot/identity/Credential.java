package pt.projeto.iot.identity;

import java.time.Instant;

public record Credential(String id, String type, String materialRef, Instant notBefore, Instant notAfter) { }
