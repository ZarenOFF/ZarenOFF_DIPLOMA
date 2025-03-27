# Создание Application
resource "kubectl_manifest" "argocd_application" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: root
  namespace: argocd
spec:
  destination:
    namespace: argocd
    server: https://kubernetes.default.svc
  project: default
  source:
    path: dev
    repoURL: https://github.com/ZarenOFF/ArgoCD-Study.git
    targetRevision: HEAD
    directory:
        recurse: true
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
YAML
}

# Создание Secret
resource "kubectl_manifest" "apps_secret" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: pgadmin-secret
  namespace: default
type: Opaque
data:
  PGADMIN_DEFAULT_PASSWORD: cGdhZG1pbl9wYXNzd29yZA==
  PGADMIN_DEFAULT_EMAIL: YWRtaW5AYWRtaW4uY29t
YAML
}