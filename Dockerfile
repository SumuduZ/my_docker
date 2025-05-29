# 使用 Miniconda 基础镜像
FROM continuumio/miniconda3

# 创建工作目录
WORKDIR /app

# 拷贝环境配置文件
COPY conda_env.yml /app/conda_env.yml

# 创建 Conda 环境（环境名为 llm4eda）
RUN conda env create -f conda_env.yml

# 显式使用 bash 并初始化 conda（激活环境时必须）
SHELL ["/bin/bash", "-c"]

# 激活环境并安装你可能需要的包（如果有额外操作）
RUN source /opt/conda/etc/profile.d/conda.sh && conda activate llm4eda && echo "Conda environment activated"

# 设置默认使用该环境运行你的应用
CMD ["conda", "run", "--no-capture-output", "-n", "llm4eda", "python", "workspace/main.py"]
