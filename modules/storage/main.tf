resource "aws_s3_bucket" "bucket_test" {
    bucket = "prueba.${var.entorno}.${var.pais}.${var.tipo}"
    acl    = "private"
    force_destroy = true
    tags = {
        Name        = "prueba.${var.entorno}.${var.pais}.${var.tipo}"
        Aplicacion  = var.aplicacion
        Proyecto    = var.proyecto
        Propietario = var.propietario
        Pais        = var.pais
    }
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
             }
        }
    }
    lifecycle_rule {
        enabled = true

        transition {
        days = 180
        storage_class = "STANDARD_IA"
        }

        transition {
        days = 360
        storage_class = "GLACIER"
        }
    }
}
