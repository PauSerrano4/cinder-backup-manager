# Utilitzem una versió lleugera de Python 3.12
FROM python:3.12-slim

# Creem una carpeta de treball dins del contenidor
WORKDIR /app

# Copiem el fitxer de dependències i les instal·lem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiem el nostre codi de l'aplicació
COPY app.py .

# Obrim el port on treballa Streamlit
EXPOSE 8501

# Comanda per defecte quan s'engegui el contenidor
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]