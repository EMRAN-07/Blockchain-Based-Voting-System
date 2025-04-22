# 🗳️ Blockchain-Based Voting System

A secure, transparent, and decentralized digital voting platform built using Ethereum-based blockchain (ResilientDB), GraphQL API, and a ReactJS frontend.


### Team Name: 𝐒𝐲𝐬𝐭𝐞𝐦_𝐄𝐧𝐜𝐫𝐲𝐩𝐭𝐞𝐝

- Md. Emran Mhamod -2001011042
- Shakila Sharin Tonima - 2001011027


### Course Name

- Web Engineering Lab Course (CSE-3106)


### Instructor

 - Md. Mynoddin
 - Assistant Professor
 - Department of CSE, RMSTU

---

## 📦 1. Setup Instructions

### ✅ Prerequisites

- [Node.js & npm](https://nodejs.org/)
- Python 3.10
- Git
- [Bazel Build Tool](https://bazel.build/)
- WSL (for Windows users, required for running shell scripts)
- Linux shell (Ubuntu recommended)

---

### 🔧 Backend Setup (ResilientDB + Crow HTTP + GraphQL)

#### a. Clone and Setup ResilientDB

```bash
git clone https://github.com/resilientdb/resilientdb.git
cd resilientdb
chmod +x INSTALL.sh
./INSTALL.sh
./service/tools/kv/server_tools/start_kv_service.sh
```

#### b. Clone and Setup GraphQL & Crow HTTP Server

```bash
git clone https://github.com/Amoolya-Reddy/ResilientDB-GraphQL.git
cd ResilientDB-GraphQL
```

Install system dependencies (in WSL or Linux terminal):

```bash
sudo apt update
sudo apt install build-essential python3.10-dev apt-transport-https curl gnupg
```

Build and start the Crow server:

```bash
bazel build service/http_server:crow_service_main
bazel-bin/service/http_server/crow_service_main service/tools/config/interface/service.config service/http_server/server_config.config
```

Create Python virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
curl https://bootstrap.pypa.io/get-pip.py | python
pip install -r requirements.txt
```

Start the GraphQL server:

```bash
python3 app.py
```

---

### 🖥️ Frontend Setup (BlockChain)

```bash
git clone https://github.com/EMRAN-07/block-chain.git
cd vote-chain
npm install
npm start
```

App will run at: `http://localhost:3000`

---

## 🚀 2. Feature Documentation

### 🔐 Voter Authentication
- Each voter must log in to access the voting dashboard.
- Prevents unauthorized access and duplicate voting.

### 🗳️ One-Person-One-Vote
- System verifies and restricts each user to a single vote.
- Votes are signed and verified before submission.

### ⛓️ Immutable Blockchain Ledger
- Votes are stored on ResilientDB, making them tamper-proof.
- Ensures transparency and traceability of every vote.

### 📊 Real-Time Vote Counting
- Votes are confirmed via consensus and counted live.
- Admin dashboard displays current voting stats instantly.

### 🌐 Decentralized Network
- No single point of failure due to distributed architecture.
- Peer-to-peer nodes ensure high availability.

---

## 📌 Future Enhancements

- Biometric/Face ID login support
- Mobile app deployment
- Offline voting capability with syncing
- Public blockchain explorer for transparency

---

## 📚 References

- [ResilientDB](https://github.com/resilientdb/resilientdb)
- [Block Chain Frontend](https://github.com/EMRAN-07/block-chain)
- [GraphQL Backend](https://github.com/Amoolya-Reddy/ResilientDB-GraphQL)
- [Node.js](https://nodejs.org/)
- [ReactJS](https://reactjs.org/)
- [Bazel](https://bazel.build/)
