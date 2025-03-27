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
    path: argocd-apps
    repoURL: https://github.com/ZarenOFF/ZarenOFF_DIPLOMA.git
    targetRevision: HEAD
    directory:
        recurse: true
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
YAML
}

