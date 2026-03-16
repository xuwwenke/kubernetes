# 使用支持多架构的 Python 基础镜像
FROM python:3.10-slim

# 安装系统依赖（编译 psycopg2 需要，但使用二进制包可免编译，此处仅为预防）
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 安装 MLflow 和 PostgreSQL 驱动
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple \
    mlflow \
    psycopg2-binary \
    boto3  # 用于 S3/MinIO 等对象存储

# 设置工作目录（可选）
WORKDIR /mlflow

# 暴露 MLflow 默认端口
EXPOSE 5000

# 设置默认命令（可通过 docker run 覆盖）
ENTRYPOINT ["mlflow"]
CMD ["server", "--host", "0.0.0.0", "--port", "5000"]