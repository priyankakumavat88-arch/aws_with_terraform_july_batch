
param(
    [Parameter(Position = 0)]
    [ValidateSet("apply", "destroy")]
    [string]$Action
)

$ErrorActionPreference = "Stop"

#################################################
# APPLY
#################################################

function Apply-Terraform {

    Write-Host "=================================="
    Write-Host "Terraform Init"
    Write-Host "=================================="

    terraform init
    if ($LASTEXITCODE -ne 0) {
        throw "Terraform init failed."
    }

    Write-Host "=================================="
    Write-Host "Terraform Validate"
    Write-Host "=================================="

    terraform validate
    if ($LASTEXITCODE -ne 0) {
        throw "Terraform validate failed."
    }

    Write-Host "=================================="
    Write-Host "Terraform Plan"
    Write-Host "=================================="

    terraform plan -var-file="terraform.tfvars"
    if ($LASTEXITCODE -ne 0) {
        throw "Terraform plan failed."
    }

    Write-Host "=================================="
    Write-Host "Terraform Apply"
    Write-Host "=================================="

    terraform apply -var-file="terraform.tfvars" -auto-approve
    if ($LASTEXITCODE -ne 0) {
        throw "Terraform apply failed."
    }

    Write-Host "Terraform apply completed successfully."
}

#################################################
# DESTROY
#################################################

function Destroy-Terraform {

    Write-Host "=================================="
    Write-Host "Terraform Destroy"
    Write-Host "=================================="

    terraform destroy -var-file="terraform.tfvars" -auto-approve
    if ($LASTEXITCODE -ne 0) {
        throw "Terraform destroy failed."
    }

    Write-Host "Terraform destroy completed successfully."
}

#################################################
# MAIN
#################################################

switch ($Action) {

    "apply" {
        Apply-Terraform
    }

    "destroy" {
        Destroy-Terraform
    }

    default {
        Write-Host ""
        Write-Host "Usage:"
        Write-Host ".\deploy.ps1 apply"
        Write-Host ".\deploy.ps1 destroy"
        Write-Host ""
        exit 1
    }
}
