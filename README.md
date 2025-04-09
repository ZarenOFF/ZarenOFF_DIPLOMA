# Проектная работа по теме "Инфраструктурная Managed k8s платформа для онлайн-магазина"

## Выбор технологий в рамках проектной работы:
- Развертывание **Baremetal** кластера Kubernetes: **Kubespray**
- Начальная настройка кластера: **Terraform**
- CI: **Github Actions**
- CD: **ArgoCD**
- Ingress: **Ingress Nginx**
- Load Balancer: **MetalLB**
- Storage: **Longhorn**
- Logging: **Loki**, **Promtail**, **Grafana**
- Monitoring: **Kube Prometheus Stack**
- Application: **Online Boutique by Google**

При работе над проектной работой преследовалась задача максимально следовать GitOps-подходу для достижения следующих целей:
- Максимальная автоматизация всех задач
- Наглядность состояния и состава кластера Kubernetes
- Воспроизводимость всех действий и состояния кластера

## Развертывание кластера:

```sh
mkdir kubernetes_installation
cd kubernetes_installation
git clone https://github.com/kubernetes-sigs/kubespray.git --branch release-2.27
cd kubespray
cp -rfp inventory/sample inventory/mycluster
```
В процессе развертывания было обнаружено, что хэш-сумма *Calico* отличается от указанной в **Kubespray**, поэтому изменяем ее:
```sh
sed -i 's/0734dbd02ceb1899dd67128fdb32255a7b79680e3af0cca6dfcee9639c760992/1866b407213b6191627c0ce7be5a0d7c14a016823b3bbc2a6898c57be6c59917/' kubernetes_installation/kubespray/roles/kubespray-defaults/defaults/main/checksums.yml
```