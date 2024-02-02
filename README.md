# Servidor Streaming com Fallback

Um simples servidor para você fazer live e continuar online mesmo quando seu ingest principal ficar offline.
__Esse projeto só funciona com ingests que utilizam o protocolo RTMP__

```
Esse projeto foi desenvolvido utilizando ideias de videos e codigos retirados de @lalizita canal: https://www.youtube.com/channel/UCyebetp5HKvb3vlCCypZq_w  
```

## Requisitos 
- Docker
- [OBS](https://obsproject.com/pt-br/download)

## Tecnologias
- Docker compose
- NGINX

## Protocolos 
- RTMP (Real Time Message Protocol)

## Como executar
- Insira seus dados de streaming no arquivo `.env`
- Defina um video fallback.mp4 no diretorio /usr/share/nginx/html/fallback.mp4
- Vá ao seu canal da twitch e preencha `.env` com a Chave de transmissão e a [URL de transmissão busque nesse endereço aqui](https://help.twitch.tv/s/twitch-ingest-recommendation?language=en_US)
```
TWITCH_URL=rtmp://sao03.contribute.live-video.net/app
TWITCH_STREAM_KEY=1234567890abcdefg
```

Suba o container com a aplicação utilizando docker compose
```
docker-compose up --build
```

Abra o [OBS](https://obsproject.com/pt-br/download) > Configurações > Transmissão > Servidor
```
rtmp://localhost:1935/live
```
Clique em ok e depois clique em **Iniciar transmissão**
