# 使用 Miniconda 基础镜像，但不使用 conda 环境
FROM continuumio/miniconda3

# 设置工作目录
WORKDIR /app

# 拷贝项目文件（包括 main.py 和其他代码）
COPY . .

# 使用 conda 安装系统依赖（如 verilator 和 gcc 等）
RUN conda install -y -c vlsida-eda -c conda-forge \
    verilator=5.028 \
    gcc=14.1.0 \
    flex \
    make \
    m4 \
 && conda clean -a -y

# 安装 pip 包
RUN pip install --upgrade pip \
 && pip install \
    openai==1.76.0 \
    zhipuai==2.1.5.20250421

# 设置容器启动时默认命令
CMD ["python", "workspace/main.py"]
