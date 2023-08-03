resource "tls_private_key" "ssh" {
  algorithm   = var.algorithm
  ecdsa_curve = var.algorithm == "ECDSA" ? var.ecdsa_curve : null
  rsa_bits    = var.algorithm == "RSA" ? var.rsa_bits : null
}

resource "local_sensitive_file" "private_key" {
  content              = tls_private_key.ssh.private_key_pem
  filename             = var.private_key_filename
  file_permission      = var.file_permission
  directory_permission = var.directory_permission
}
