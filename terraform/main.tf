terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.36.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.0"
    }
  }
}

# Настройка провайдера Kubernetes
provider "kubernetes" {
  config_path = "~/.kube/config"  # Путь к вашему kubeconfig файлу
}

provider "kubectl" {
  config_path = "~/.kube/config"  # путь к вашему kubeconfig
}

# Настройка провайдера Helm
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Путь к вашему kubeconfig файлу
  }
}

# Создание namespace для Argo CD
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "null_resource" "helm_repo_add" {
  provisioner "local-exec" {
    command = "helm repo add argo-cd https://argoproj.github.io/argo-helm && helm repo update"
  }
}

resource "kubernetes_namespace" "metallb_system" {
  metadata {
    name = "metallb-system"
    labels = {
      "pod-security.kubernetes.io/enforce" = "privileged"
      "pod-security.kubernetes.io/audit"  = "privileged"
      "pod-security.kubernetes.io/warn"   = "privileged"
    }
  }
}

# Установка Argo CD с помощью Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  #set {
  #  name  = "server.service.type"
  #  value = "LoadBalancer"
  #}

  depends_on = [kubernetes_namespace.argocd, null_resource.helm_repo_add]
}
