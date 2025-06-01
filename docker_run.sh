sudo docker run -it -d \
  --gpus all \
  -v $(pwd):/workspace \
  -v /media/hscc4090/extra/yue/streammind/dataset/:/workspace/dataset \
  --runtime=nvidia \
  -w /workspace \
  --name streammind-dev \
  streammind
