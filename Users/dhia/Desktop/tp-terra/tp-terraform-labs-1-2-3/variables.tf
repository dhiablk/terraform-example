variable "aws_region" {
  description = "Région AWS utilisée"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "tp-terraform"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "L'environnement doit être dev, test ou prod."
  }
}

variable "student_name" {
  description = "Nom et prénom de l'étudiant"
  type        = string

  validation {
    condition     = length(trimspace(var.student_name)) >= 3
    error_message = "Le nom doit contenir au moins trois caractères."
  }
}

variable "instance_type" {
  description = "Type de l'instance EC2"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Le type doit être t2.micro, t3.micro ou t3.small."
  }
}

variable "allowed_ssh_cidr" {
  description = "Adresse réseau autorisée pour SSH"
  type        = string
  default     = "0.0.0.0/0"
}

# ADAPTATION (rôle Academy : ec2:DescribeImages refusé par policy voc-cancel-cred,
# donc le bloc data "aws_ami" ne peut pas s'exécuter avec ces credentials).
# L'ID ci-dessous est l'AMI officielle Canonical Noble 24.04 amd64 gp3 pour eu-west-3
# (source : cloud-images.ubuntu.com/locator/ec2/releasesTable, release 20260904).
variable "ami_id" {
  description = "ID AMI Ubuntu 24.04 officielle (eu-west-3) — remplace data.aws_ami.ubuntu.id"
  type        = string
  default     = "ami-0d15c1984ab81de8f"
}
