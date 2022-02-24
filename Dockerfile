FROM debian:stable-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

#ADD /engine/ .
#RUN rm -r engine

# If you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
#RUN rm Goi5.1.bin.7z
#RUN wget --no-check-certificate "http://abrok.eu/stockfish/latest/linux/stockfish_x64_modern.zip" -O chess-engine.zip
#RUN wget --no-check-certificate "https://data.stockfishchess.org/nn/nn-938525872610.nnue" -O nn-938525872610.nnue

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN https://tests.stockfishchess.org/api/nn/[stockfish.yml]
RUN chmod +x chess-engine
RUN Engine name is stockfish


CMD python3 run.py
