#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>
#include <unistd.h>


int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID, LOG_USER);
    if (argc < 3) {
        syslog(LOG_ERR, "One of the input prameters is missing...");
    }
    closelog();

    int fd = open(argv[1], O_CREAT|O_TRUNC|O_RDWR, 0644);
    if (fd == -1) {
        syslog(LOG_ERR, "Couldn't create a file");
        close(fd);
        return 1;
    }

    ssize_t bytes_written = write(fd, argv[2], strlen(argv[2]));
    if (bytes_written == -1) {
        syslog(LOG_ERR, "Couldn't write to a file");
        close(fd);
        return 1;
    }

    close(fd);

    return 0;
}