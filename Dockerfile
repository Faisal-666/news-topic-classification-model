FROM tensorflow/serving:latest

COPY ./output/serving_model /models/news-topic-classification-model
COPY ./config/prometheus.config /config/prometheus.config

ENV MODEL_NAME=news-topic-classification-model
ENV PORT=8501

CMD ["sh", "-c", "tensorflow_model_server \
--port=8500 \
--rest_api_port=$PORT \
--monitoring_config_file=/config/prometheus.config \
--model_name=$MODEL_NAME \
--model_base_path=/models/$MODEL_NAME"]