package pt.projeto.iot.commands;

import java.util.UUID;

public record CommandResult(UUID id, CommandStatus status, String message) { }
