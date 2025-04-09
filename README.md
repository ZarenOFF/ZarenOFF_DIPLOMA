# Проектная работа по теме "Инфраструктурная Managed k8s платформа для онлайн-магазина"

## Выбор технологий в рамках проектной работы
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

## Развертывание кластера

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

Далее выкачиваем конфигурацию Kubespray из репозитория
```sh
curl -o kubernetes_installation/kubespray/inventory/mycluster/inventory.ini https://raw.githubusercontent.com/ZarenOFF/ZarenOFF_DIPLOMA/refs/heads/main/kubespray/inventory.ini
curl -o kubernetes_installation/kubespray/inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml https://raw.githubusercontent.com/ZarenOFF/ZarenOFF_DIPLOMA/refs/heads/main/kubespray/k8s-cluster.yml
curl -o kubernetes_installation/kubespray/inventory/mycluster/group_vars/k8s_cluster/addons.yml https://raw.githubusercontent.com/ZarenOFF/ZarenOFF_DIPLOMA/refs/heads/main/kubespray/addons.yml
```

Создаем VENV для Kubespray и начинаем установку
```sh
VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
python3 -m venv $VENVDIR
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
pip install -U -r requirements.txt
ansible-playbook -i inventory/mycluster/inventory.ini cluster.yml --become
```

## Начальная настройка кластера
```sh
cd terraform
terraform init
terraform apply
```
Terraform'ом будет установлен ArgoCD в кластер, который в свою очередь подхватит все манифесты приложений и развернет их в кластере.

[argocd](https://raw.githubusercontent.com/ZarenOFF/ZarenOFF_DIPLOMA/refs/heads/main/screenshots/argocd_main.png "argocd")
## 