
# 🐍 Flask Web App with CI/CD Pipeline on AWS

This project demonstrates a complete DevOps workflow: deploying a containerized Flask web application on AWS EC2 using Terraform, Ansible, Docker, and Jenkins. It follows Infrastructure as Code (IaC) principles and implements continuous integration and continuous deployment (CI/CD).

---

## 📌 Project Objectives

- Provision AWS EC2 instance and networking using **Terraform**
- Automate server configuration using **Ansible**
- Containerize a **Flask** application using **Docker**
- Build and deploy via **Jenkins Pipeline** from **GitHub**
- Host the app on an accessible public IP

---

## 🧱 Tech Stack

- **Cloud**: AWS EC2  
- **IaC**: Terraform  
- **Provisioning**: Ansible  
- **CI/CD**: Jenkins  
- **App**: Flask (Python)  
- **Containerization**: Docker  
- **VCS**: Git + GitHub  

---

## 📁 Project Structure

```
mini_project/
├── terraform/             # Terraform configuration files
├── ansible/               # Ansible playbooks
├── flask_app/             # Flask app source code
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── README.md
```

---

## 🚀 Setup & Execution

### 1. Clone the Repository

```bash
git clone https://github.com/bjwilson1996/mini_project.git
cd mini_project
```

### 2. Provision Infrastructure (Terraform)

```bash
cd terraform
terraform init
terraform apply
```

> This launches an EC2 instance and configures security groups.

### 3. Configure EC2 Instance (Ansible)

```bash
cd ../ansible
ansible-playbook -i inventory install_docker.yml
```

> Installs Docker, copies the Flask app and Dockerfile, and builds the image.

### 4. Access the Application

```bash
http://<your-ec2-public-ip>:5000
```

---

## 🛠️ Jenkins CI/CD Pipeline

- Jenkins is installed on the EC2 instance
- On every GitHub push, Jenkins:
  1. Pulls latest code
  2. Builds Docker image
  3. Deploys container on the EC2 host

Example `Jenkinsfile` used:

```groovy
pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/bjwilson1996/mini_project.git'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t flask-app ./flask_app'
            }
        }
        stage('Run Container') {
            steps {
                sh '''
                docker rm -f flask-container || true
                docker run -d -p 5000:5000 --name flask-container flask-app
                '''
            }
        }
    }
}
```

---

## 🧪 App Output

Once deployed, navigate to:

```
http://<your-ec2-ip>:5000
```

You should see:

```
Hello from Docker + Flask on AWS!
```

---

## 🔗 GitHub Repository

[github.com/bjwilson1996/mini_project](https://github.com/bjwilson1996/mini_project)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Author

**John Wilson Bolleddu**  
MSc Advanced Computer Science  
University of Hertfordshire
