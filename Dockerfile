FROM nvidia/cuda:12.0.1-runtime-ubuntu22.04

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    ca-certificates \
    build-essential

# Установка DrPlotter 
RUN wget -O drplotter.deb "https://github.com/Chia-Network/drplotter/releases/download/1.0.3/drplotter_1.0.3_amd64.deb" 
RUN dpkg -i drplotter.deb

# Очистка кэша apt
RUN apt-get clean

# Запуск DrSolver при запуске контейнера
CMD ["drsolver"]