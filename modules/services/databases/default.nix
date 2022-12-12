{ ... }:
{
    services.mongodb = {
        enable = true;
    };

    services.redis.servers."mec" = {
        enable = true;
        port = 6379;
    };
}
