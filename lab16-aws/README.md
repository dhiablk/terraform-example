# TP 16 — Remplacer et supprimer une ressource Terraform (AWS)

Le projet déclare un bucket S3, un rôle IAM, une stratégie IAM, leur attachement et une chaîne aléatoire utilisée pour rendre le nom du bucket unique.

## Prérequis

- Terraform installé
- Des identifiants AWS configurés localement et les permissions nécessaires pour créer et supprimer ces ressources

Toutes les commandes ci-dessous manipulent de vraies ressources AWS. Vérifiez la région et le plan avant de confirmer une application.

## 1. Initialiser et créer les ressources

```powershell
terraform init
terraform plan
terraform apply
```

## 2. Forcer le remplacement du rôle IAM

Le bloc de configuration ne change pas ; `-replace` demande à Terraform de recréer cette instance :

```powershell
terraform plan -replace="aws_iam_role.example"
terraform apply -replace="aws_iam_role.example"
```

## 3. Modifier la configuration du bucket

Le fichier [modified.tfvars](./modified.tfvars) change le préfixe, l'étiquette du bucket et l'environnement. Le changement de préfixe modifie le nom du bucket et entraîne son remplacement.

```powershell
terraform plan -var-file="modified.tfvars"
terraform apply -var-file="modified.tfvars"
```

Conservez le même fichier `-var-file` lors des applications suivantes pour garder cette configuration.

## 4. Retirer l'attachement de la configuration

Commentez temporairement le bloc `aws_iam_role_policy_attachment.example` dans `main.tf`, puis examinez et appliquez le plan :

```powershell
terraform plan -var-file="modified.tfvars"
terraform apply -var-file="modified.tfvars"
```

Terraform supprime alors l'attachement de son état et d'AWS. Laissez le bloc commenté pour l'étape suivante : une stratégie IAM encore attachée ne peut pas être supprimée.

## 5. Détruire une ressource ciblée

Examinez le plan ciblé avant de confirmer la destruction de la stratégie IAM :

```powershell
terraform plan -destroy -target="aws_iam_policy.example" -var-file="modified.tfvars"
terraform destroy -target="aws_iam_policy.example" -var-file="modified.tfvars"
terraform state list
```

Avec l'attachement toujours absent de la configuration, Terraform recrée la stratégie sans recréer l'attachement :

```powershell
terraform plan -var-file="modified.tfvars"
terraform apply -var-file="modified.tfvars"
```

Rétablissez le bloc d'attachement dans `main.tf`, puis appliquez à nouveau pour revenir à la configuration complète :

```powershell
terraform plan -var-file="modified.tfvars"
terraform apply -var-file="modified.tfvars"
```

## 6. Nettoyer

Après vérification du plan de destruction, supprimez les ressources du TP :

```powershell
terraform plan -destroy -var-file="modified.tfvars"
terraform destroy -var-file="modified.tfvars"
```
