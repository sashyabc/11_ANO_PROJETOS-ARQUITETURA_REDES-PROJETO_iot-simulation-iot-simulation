package pt.projeto.iot.media;

public record MediaDescriptor(
        StreamType type, String codec, int width, int height, double fps, String uri
) { }
