let host = "httpbingo.org";

rq get`
    GET https://{host}/get
    Host: {host}
    Connection: close
`[status == 200]

rq post`
    POST https://{host}/post
    Host: {host}
    Accept-Encoding: gzip, deflate
`[status == 200]

rq post`
    POST https://{host}/post
    Host: {host}
    Accept-Encoding: gzip, deflate
`[status == 200]

rq postForm`
    POST https://{host}/post
    Host: {host}
    Content-Type: application/x-www-form-urlencoded

    a: b
`[status == 200]

rq postMultipart`
    POST https://{host}/post
    Host: {host}
    Content-Type: multipart/form-data

    a: b
    f: @folder/text.txt
`[status == 200]

rq postJson`
    POST https://{host}/post
    Host: {host}
    Content-Type: application/json

    {
        "name": "Gauss",
        "age": 6,
        "address": {
            "street": "19 Hear Sea Street",
            "city": "DaLian"
        },
        "phones": [
            "+86 13098767890",
            "+86 15876567890"
        ]
    }
`[status == 200]

test get {
    let response = get->;
    response.status
}

test post {
    let response = post->;
    response.status
}

test postForm {
    let response = postForm->;
    let status = response.status
    println("status: {status}")
}

test postMultipart {
    let response = postMultipart->;
    let body = response.body
    println("body: {body}")
}

test postJson {
    let response = postJson->;
    response.status
}