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

resource "null_resource" "grafana_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add grafana https://grafana.github.io/helm-charts && helm repo update"
  }
}

resource "null_resource" "longhorn_helm_repo" {
  provisioner "local-exec" {
    command = "helm repo add longhorn https://charts.longhorn.io && helm repo update"
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

  values = [
    <<-EOT
    server:
      extraArgs:
        - --insecure
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/infra
                operator: Exists
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 100
            podAffinityTerm:
              labelSelector:
                matchExpressions:
                - key: app.kubernetes.io/name
                  operator: In
                  values:
                  - argocd-server
              topologyKey: kubernetes.io/hostname
      tolerations:
      - key: "node-role"
        operator: "Equal"
        value: "infra"
        effect: "NoSchedule"

    repoServer:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/infra
                operator: Exists
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 100
            podAffinityTerm:
              labelSelector:
                matchExpressions:
                - key: app.kubernetes.io/name
                  operator: In
                  values:
                  - argocd-repo-server
              topologyKey: kubernetes.io/hostname
      tolerations:
      - key: "node-role"
        operator: "Equal"
        value: "infra"
        effect: "NoSchedule"

    applicationSet:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/infra
                operator: Exists
      tolerations:
      - key: "node-role"
        operator: "Equal"
        value: "infra"
        effect: "NoSchedule"

    controller:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/infra
                operator: Exists
      tolerations:
      - key: "node-role"
        operator: "Equal"
        value: "infra"
        effect: "NoSchedule"

    redis:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/infra
                operator: Exists
      tolerations:
      - key: "node-role"
        operator: "Equal"
        value: "infra"
        effect: "NoSchedule"
    EOT
  ]

  depends_on = [
    kubernetes_namespace.argocd, 
    null_resource.helm_repo_add,
    null_resource.helm_repo_add,
    null_resource.longhorn_helm_repo,
    kubernetes_namespace.metallb_system
  ]
}
