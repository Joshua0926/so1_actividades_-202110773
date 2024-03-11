#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_create(void *arg) {
    printf("Hilo creado\n");
    pthread_exit(NULL);
}

int main() {
    pid_t pid;

    pid = fork();
    if (pid == -1) {
        perror("Error en fork()");
        exit(EXIT_FAILURE);
    }

    if (pid == 0) { /* Proceso hijo */ 
        printf("Proceso hijo creado\n");
        fork();
        pthread_t tid;
        pthread_create(&tid, NULL, thread_create, NULL);
    } else {
        printf("Proceso padre creado\n");
        fork();
    }

    printf("Mensaje después del fork()\n");

    return 0;
}
