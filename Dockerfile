# 使用 Miniconda 基础镜像
FROM continuumio/miniconda3

# 创建工作目录
WORKDIR /app

# 创建和激活环境
COPY conda_env.yml /app/conda_env.yml
RUN conda env create -f conda_env.yml

# # 切换到非 root 用户（增强安全性）
# RUN useradd -m ojuser
# USER ojuser

# 设置默认 shell 为 Conda 环境中的 Bash
SHELL ["conda", "run", "-n", "llm4eda", "/bin/bash", "-c"]

# 容器启动时的默认命令
# CMD ["python", "workspace/main.py"]