FROM tensorflow/serving:2.14.1

COPY ./output/serving_model /models/news-topic-classification-model
COPY ./config/prometheus.config /model_config/prometheus.config

ENV MODEL_NAME=news-topic-classification-model
ENV MODEL_BASE_PATH=/models
ENV PORT=8501
ENV MONITORING_CONFIG=/model_config/prometheus.config

ENTRYPOINT tensorflow_model_server \
--port=8500 \
--rest_api_port=$PORT \
--rest_api_addr=0.0.0.0 \
--model_name=$MODEL_NAME \
--model_base_path=$MODEL_BASE_PATH/$MODEL_NAME \
--monitoring_config_file=$MONITORING_CONFIG