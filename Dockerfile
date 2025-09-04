FROM python:3.12-slim

WORKDIR /app

# 빌드 시 주입할 Git SHA (이미지 내부에서 /healthz 로 확인)
ARG GIT_SHA=dev
ENV GIT_SHA=${GIT_SHA}
ENV PORT=80

# 필요 패키지만 설치
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 앱 소스
COPY backend/ .

EXPOSE 80

# 경량 WSGI 서버(gunicorn)로 실행 (PORT 환경변수 사용)
CMD ["python", "-m", "gunicorn", "-w", "2", "-b", "0.0.0.0:80", "main:app"]
