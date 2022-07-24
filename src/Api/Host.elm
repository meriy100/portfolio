module Api.Host exposing (ApiHost, portfolio, unwrap)


type ApiHost
    = ApiHost String


unwrap : ApiHost -> String
unwrap (ApiHost url) =
    url


portfolio : ApiHost
portfolio =
    ApiHost "https://asia-northeast1-portfolio-357112.cloudfunctions.net"
