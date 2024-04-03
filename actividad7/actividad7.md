# Actividad 7

## Completely Fair Scheduler (CFS)


El Completely Fair Scheduler en Linux es un algoritmo de planificación que se introdujo en la versión 2.6.23 del kernel de Linux y se convirtió en el algoritmo de planificación predeterminado. A diferencia de los algoritmos de planificación anteriores, que asignaban prioridades estrictas a los procesos, el CFS asigna una proporción de tiempo de procesamiento de la CPU a cada tarea.

En lugar de asignar valores de prioridad relativos a la longitud de un quantum de tiempo, el CFS asigna una proporción de tiempo de CPU a cada tarea, calculada según el valor "nice" asignado a cada tarea. Los valores "nice" van desde -20 hasta +19, donde un valor "nice" numéricamente menor indica una prioridad relativa más alta. Las tareas con valores "nice" más bajos reciben una proporción mayor de tiempo de CPU que las tareas con valores "nice" más altos. El valor "nice" predeterminado es 0.

El CFS no utiliza valores discretos de cortes de tiempo, sino que identifica una latencia objetivo, que es un intervalo de tiempo durante el cual cada tarea en ejecución debería ejecutarse al menos una vez. Las proporciones de tiempo de CPU se asignan desde el valor de latencia objetivo. Además de tener valores predeterminados y mínimos, la latencia objetivo puede aumentar si el número de tareas activas en el sistema supera un cierto umbral.

El CFS no asigna prioridades directamente, sino que registra cuánto tiempo ha corrido cada tarea manteniendo el tiempo de ejecución virtual de cada tarea mediante la variable por tarea "vruntime". El tiempo de ejecución virtual está asociado con un factor de decaimiento basado en la prioridad de una tarea: las tareas de menor prioridad tienen tasas de decaimiento más altas que las tareas de mayor prioridad. Para las tareas a una prioridad normal (valores "nice" de 0), el tiempo de ejecución virtual es idéntico al tiempo de ejecución física real. Por lo tanto, para decidir qué tarea ejecutar a continuación, el planificador simplemente selecciona la tarea que tiene el valor de "vruntime" más pequeño.