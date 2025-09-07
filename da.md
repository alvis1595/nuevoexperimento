sequenceDiagram
    participant A as Ansible
    participant B as Servidor BD
    participant C as Azure DB
    participant D as JFrog
    participant E as Product Owner

    A->>B: Verifica existencia de archivo
    alt No existe
        A->>D: Subir log
        A->>E: Notificación fallo
    else Existe
        A->>B: Descargar archivo
        A->>C: Ejecutar script e ingesta
        alt Éxito
            A->>D: Subir salida
            A->>B: Mover archivo a /procesados
        else Falla
            A->>D: Subir log
            A->>E: Notificación fallo
        end
    end