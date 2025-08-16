package pt.projeto.iot.policy;

import java.util.List;

public record Policy(String id, List<String> roles, List<String> scopes) { }
