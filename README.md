<img src="assets/logo-3.png" alt="">

[![Project status](https://img.shields.io/badge/version-v1.0.0-orange.svg)](https://github.com/tech4works/gopen-gateway-playground/releases/tag/v1.0.0)
[![GitHub](https://badgen.net/badge/icon/base?icon=github&label)](https://github.com/tech4works/gopen-gateway-base)
[![GitHub](https://badgen.net/badge/icon/main?icon=github&label)](https://github.com/tech4works/gopen-gateway)
[![Docker](https://badgen.net/badge/icon/docker?icon=docker&label)](https://hub.docker.com/r/tech4works/gopen-gateway)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftech4works%2Fgopen-gateway.svg?type=small)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftech4works%2Fgopen-gateway?ref=badge_small)

O Gopen API Gateway playground é um repositório de demonstração, aonde abordamos todos os recursos desse projeto open
source fantástico, desde a instalação, execução via docker, até casos de uso complexos que podem ser utilizados no
dia a dia.

# Usabilidade

Para iniciarmos o playground, precisamos fazer primeiro a instalação das depêndencias, vamos lá:

### Docker

Instale o mesmo seguindo os passos abaixo relacionado ao seu sistema operacional:

#### Linux

Abra o terminal, atualize os pacotes existentes:

```
sudo apt-get update
```

Instale a última versão do Docker:

```
sudo apt-get install docker-ce
```

Verifique se o Docker foi instalado corretamente:

```
sudo docker run hello-world
```

Baixe a versão estável atual do Docker Compose:

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o
/usr/local/bin/docker-compose
```

Aplicar permissões executáveis ao binário:

```
sudo chmod +x /usr/local/bin/docker-compose
```

#### MacOS

Instale [Docker para macOS](https://docs.docker.com/docker-for-mac/install/). Lembrando que o Docker-Compose já será
instalado junto nesse pacote.

#### Windows

Instale [Docker para Windows](https://docs.docker.com/docker-for-windows/install/). Lembrando que o Docker-Compose já
será instalado junto nesse pacote.

### Clone

Depois do docker instalado, execute o comando abaixo para clonar o projeto playground:

```text
git clone https://github.com/tech4works/gopen-gateway-playground.git
```

### Execução

Na pasta do seu projeto playground execute o comando:

```
docker-compose up
```

Isso deve iniciar o GOPEN API Gateway em um container docker chamado `gopen-gateway-playground` como na imagem abaixo:

<img src="assets/docker-container.png" alt="container docker">

Agora basta fazer um teste para verificar se a API Gateway está sendo executada corretamente você pode utiliza a
requisição abaixo:

```
curl --location 'localhost:8080/ping'
```

# Documentação

Para entender todos os exemplos configurados e aplicados no projeto playground no arquivo
[/.gopen/dev/.json]() listamos e explicamos abaixo cada um, veja:

### Caso 1

Backend único + Transformação básica de resposta do endpoint.

```text
curl --location 'localhost:8080/case/1/git/GabrielHCataldo'
```

Nesse exemplo utilizamos a customização de dados de resposta do endpoint, alterando a nomenclatura de snake case que é
padrão nos retornos dos endpoints do Github para lower camel case, removemos a codificação gzip e limpamos os campos
vazios, veja a diferença:

**Antes**

```json
{
  "login": "GabrielHCataldo",
  "id": 141183601,
  "node_id": "U_kgDOCGpKcQ",
  "avatar_url": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/GabrielHCataldo",
  "html_url": "https://github.com/GabrielHCataldo",
  "followers_url": "https://api.github.com/users/GabrielHCataldo/followers",
  "following_url": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
  "gists_url": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/GabrielHCataldo/subscriptions",
  "organizations_url": "https://api.github.com/users/GabrielHCataldo/orgs",
  "repos_url": "https://api.github.com/users/GabrielHCataldo/repos",
  "events_url": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
  "received_events_url": "https://api.github.com/users/GabrielHCataldo/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Gabriel Cataldo",
  "company": "Petz",
  "blog": "",
  "location": "Blumenau, Santa Catarina ",
  "email": null,
  "hireable": true,
  "bio": null,
  "twitter_username": null,
  "public_repos": 8,
  "public_gists": 0,
  "followers": 5,
  "following": 4,
  "created_at": "2023-08-01T20:28:28Z",
  "updated_at": "2024-08-08T19:54:17Z"
}
```

**Depois**

```json
{
  "login": "GabrielHCataldo",
  "id": 141183601,
  "nodeId": "U_kgDOCGpKcQ",
  "avatarUrl": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "url": "https://api.github.com/users/GabrielHCataldo",
  "htmlUrl": "https://github.com/GabrielHCataldo",
  "followersUrl": "https://api.github.com/users/GabrielHCataldo/followers",
  "followingUrl": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
  "gistsUrl": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
  "starredUrl": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
  "subscriptionsUrl": "https://api.github.com/users/GabrielHCataldo/subscriptions",
  "organizationsUrl": "https://api.github.com/users/GabrielHCataldo/orgs",
  "reposUrl": "https://api.github.com/users/GabrielHCataldo/repos",
  "eventsUrl": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
  "receivedEventsUrl": "https://api.github.com/users/GabrielHCataldo/received_events",
  "type": "User",
  "name": "Gabriel Cataldo",
  "company": "Petz",
  "location": "Blumenau, Santa Catarina ",
  "hireable": true,
  "publicRepos": 8,
  "followers": 5,
  "following": 4,
  "createdAt": "2023-08-01T20:28:28Z",
  "updatedAt": "2024-08-08T19:54:17Z"
}
```

### Caso 2

Backend único + Cache + Transformação básica de resposta do backend e endpoint.

```text
curl --location 'localhost:8080/case/2/git/GabrielHCataldo'
```

Nesse exemplo utilizamos a customização de dados de resposta do endpoint, alterando a nomenclatura de snake case que é
padrão nos retornos dos endpoints do Github para lower camel case, removemos a codificação gzip e limpamos os campos
vazios, além disso, adicionamos uma customização no retorno do próprio backend, omitindo os campos personalizados do
cabeçalho de resposta e projetamos apenas alguns campos do corpo JSON, veja a diferença:

**Antes**

```json
{
  "login": "GabrielHCataldo",
  "id": 141183601,
  "node_id": "U_kgDOCGpKcQ",
  "avatar_url": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/GabrielHCataldo",
  "html_url": "https://github.com/GabrielHCataldo",
  "followers_url": "https://api.github.com/users/GabrielHCataldo/followers",
  "following_url": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
  "gists_url": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/GabrielHCataldo/subscriptions",
  "organizations_url": "https://api.github.com/users/GabrielHCataldo/orgs",
  "repos_url": "https://api.github.com/users/GabrielHCataldo/repos",
  "events_url": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
  "received_events_url": "https://api.github.com/users/GabrielHCataldo/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Gabriel Cataldo",
  "company": "Petz",
  "blog": "",
  "location": "Blumenau, Santa Catarina ",
  "email": null,
  "hireable": true,
  "bio": null,
  "twitter_username": null,
  "public_repos": 8,
  "public_gists": 0,
  "followers": 5,
  "following": 4,
  "created_at": "2023-08-01T20:28:28Z",
  "updated_at": "2024-08-08T19:54:17Z"
}
```

**Depois**

```json
{
  "id": 141183601,
  "login": "GabrielHCataldo",
  "name": "Gabriel Cataldo",
  "avatarUrl": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "publicRepos": 8,
  "followers": 5,
  "following": 4,
  "createdAt": "2023-08-01T20:28:28Z"
}
```

### Caso 3

Backend único + Cache customizado + Transformação completa de resposta do backend e endpoint.

```text
curl --location 'localhost:8080/case/3/git/GabrielHCataldo'
```

Nesse exemplo utilizamos a customização granular do cache, alterando-o apenas para o endpoint específico,
além disso, alteramos totalmente o body de resposta, e compactamos utilizando a codificação Deflate, veja:

**Antes**

```json
{
  "login": "GabrielHCataldo",
  "id": 141183601,
  "node_id": "U_kgDOCGpKcQ",
  "avatar_url": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/GabrielHCataldo",
  "html_url": "https://github.com/GabrielHCataldo",
  "followers_url": "https://api.github.com/users/GabrielHCataldo/followers",
  "following_url": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
  "gists_url": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/GabrielHCataldo/subscriptions",
  "organizations_url": "https://api.github.com/users/GabrielHCataldo/orgs",
  "repos_url": "https://api.github.com/users/GabrielHCataldo/repos",
  "events_url": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
  "received_events_url": "https://api.github.com/users/GabrielHCataldo/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Gabriel Cataldo",
  "company": "Petz",
  "blog": "",
  "location": "Blumenau, Santa Catarina ",
  "email": null,
  "hireable": true,
  "bio": null,
  "twitter_username": null,
  "public_repos": 8,
  "public_gists": 0,
  "followers": 5,
  "following": 4,
  "created_at": "2023-08-01T20:28:28Z",
  "updated_at": "2024-08-08T19:54:17Z"
}
```

**Depois**

```xml

<root>
    <createdAt>2023-08-01T20:28:28Z</createdAt>
    <id>141183601</id>
    <personalData>
        <avatar>https://avatars.githubusercontent.com/u/141183601?v=4</avatar>
        <fullName>Gabriel Cataldo</fullName>
        <wife>
            <age>24</age>
            <fullName>Maria Cataldo Moskorz</fullName>
            <since>2023-04-14T00:00:00Z</since>
        </wife>
    </personalData>
    <statistics>
        <followers>521</followers>
        <following>402</following>
        <publicRepos>301</publicRepos>
        <verified>true</verified>
    </statistics>
    <username>GabrielHCataldo</username>
</root>
```

### Caso 4

Múltiplos backends + Transformação média de resposta

```text
curl --location 'localhost:8080/case/4/git/GabrielHCataldo'
```

Nesse exemplo utilizamos dois backends, o primeiro para obter os dados do usuário informado, e o segundo para obter
os repósitorios, no primeiro modificamos a resposta para mapear e projetar apenas os campos necessários e no segundo
agrupamos a lista de repositórios respondida em um campo chamado `repos`, veja:

**Antes**

Backend 1

```json
{
  "login": "GabrielHCataldo",
  "id": 141183601,
  "node_id": "U_kgDOCGpKcQ",
  "avatar_url": "https://avatars.githubusercontent.com/u/141183601?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/GabrielHCataldo",
  "html_url": "https://github.com/GabrielHCataldo",
  "followers_url": "https://api.github.com/users/GabrielHCataldo/followers",
  "following_url": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
  "gists_url": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/GabrielHCataldo/subscriptions",
  "organizations_url": "https://api.github.com/users/GabrielHCataldo/orgs",
  "repos_url": "https://api.github.com/users/GabrielHCataldo/repos",
  "events_url": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
  "received_events_url": "https://api.github.com/users/GabrielHCataldo/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Gabriel Cataldo",
  "company": "Petz",
  "blog": "",
  "location": "Blumenau, Santa Catarina ",
  "email": null,
  "hireable": true,
  "bio": null,
  "twitter_username": null,
  "public_repos": 8,
  "public_gists": 0,
  "followers": 5,
  "following": 4,
  "created_at": "2023-08-01T20:28:28Z",
  "updated_at": "2024-08-08T19:54:17Z"
}
```

Backend 2

```json
[
  {
    "id": 722927592,
    "node_id": "R_kgDOKxb_6A",
    "name": "go-asaas",
    "full_name": "GabrielHCataldo/go-asaas",
    "private": false,
    "owner": {
      "login": "GabrielHCataldo",
      "id": 141183601,
      "node_id": "U_kgDOCGpKcQ",
      "avatar_url": "https://avatars.githubusercontent.com/u/141183601?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/GabrielHCataldo",
      "html_url": "https://github.com/GabrielHCataldo",
      "followers_url": "https://api.github.com/users/GabrielHCataldo/followers",
      "following_url": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
      "gists_url": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/GabrielHCataldo/subscriptions",
      "organizations_url": "https://api.github.com/users/GabrielHCataldo/orgs",
      "repos_url": "https://api.github.com/users/GabrielHCataldo/repos",
      "events_url": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
      "received_events_url": "https://api.github.com/users/GabrielHCataldo/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/GabrielHCataldo/go-asaas",
    "description": "💸 Go payment library, with full integration with the Asaas API.",
    "fork": false,
    "url": "https://api.github.com/repos/GabrielHCataldo/go-asaas",
    "forks_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/forks",
    "keys_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/teams",
    "hooks_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/hooks",
    "issue_events_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/events{/number}",
    "events_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/events",
    "assignees_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/assignees{/user}",
    "branches_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/branches{/branch}",
    "tags_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/tags",
    "blobs_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/languages",
    "stargazers_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/stargazers",
    "contributors_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contributors",
    "subscribers_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscribers",
    "subscription_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscription",
    "commits_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contents/{+path}",
    "compare_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/merges",
    "archive_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/downloads",
    "issues_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues{/number}",
    "pulls_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/labels{/name}",
    "releases_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/releases{/id}",
    "deployments_url": "https://api.github.com/repos/GabrielHCataldo/go-asaas/deployments",
    "created_at": "2023-11-24T09:28:18Z",
    "updated_at": "2024-07-24T19:25:11Z",
    "pushed_at": "2023-12-11T13:59:02Z",
    "git_url": "git://github.com/GabrielHCataldo/go-asaas.git",
    "ssh_url": "git@github.com:GabrielHCataldo/go-asaas.git",
    "clone_url": "https://github.com/GabrielHCataldo/go-asaas.git",
    "svn_url": "https://github.com/GabrielHCataldo/go-asaas",
    "homepage": "https://asaas.com",
    "size": 298,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Go",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": false,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": {
      "key": "mit",
      "name": "MIT License",
      "spdx_id": "MIT",
      "url": "https://api.github.com/licenses/mit",
      "node_id": "MDc6TGljZW5zZTEz"
    },
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [
      "bank",
      "billing",
      "boleto",
      "credit-card",
      "gopay",
      "payment",
      "payment-gateway",
      "payment-integration",
      "payment-module",
      "pix",
      "virtual-account"
    ],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "main"
  },
  {
    ...
  }
]
```

**Depois**

```json
[
  {
    "ok": true,
    "code": 200,
    "id": 141183601,
    "username": "GabrielHCataldo",
    "personalData": {
      "avatar": "https://avatars.githubusercontent.com/u/141183601?v=4",
      "fullName": "Gabriel Cataldo"
    },
    "statistics": {
      "publicRepos": 8,
      "followers": 5,
      "following": 4
    },
    "createdAt": "2023-08-01T20:28:28Z"
  },
  {
    "ok": true,
    "code": 200,
    "repos": [
      {
        "id": 722927592,
        "nodeId": "R_kgDOKxb_6A",
        "name": "go-asaas",
        "fullName": "GabrielHCataldo/go-asaas",
        "owner": {
          "login": "GabrielHCataldo",
          "id": 141183601,
          "nodeId": "U_kgDOCGpKcQ",
          "avatarUrl": "https://avatars.githubusercontent.com/u/141183601?v=4",
          "url": "https://api.github.com/users/GabrielHCataldo",
          "htmlUrl": "https://github.com/GabrielHCataldo",
          "followersUrl": "https://api.github.com/users/GabrielHCataldo/followers",
          "followingUrl": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
          "gistsUrl": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
          "starredUrl": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
          "subscriptionsUrl": "https://api.github.com/users/GabrielHCataldo/subscriptions",
          "organizationsUrl": "https://api.github.com/users/GabrielHCataldo/orgs",
          "reposUrl": "https://api.github.com/users/GabrielHCataldo/repos",
          "eventsUrl": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
          "receivedEventsUrl": "https://api.github.com/users/GabrielHCataldo/received_events",
          "type": "User"
        },
        "htmlUrl": "https://github.com/GabrielHCataldo/go-asaas",
        "description": "💸 Go payment library, with full integration with the Asaas API.",
        "url": "https://api.github.com/repos/GabrielHCataldo/go-asaas",
        "forksUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/forks",
        "keysUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/keys{/key_id}",
        "collaboratorsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/collaborators{/collaborator}",
        "teamsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/teams",
        "hooksUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/hooks",
        "issueEventsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/events{/number}",
        "eventsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/events",
        "assigneesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/assignees{/user}",
        "branchesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/branches{/branch}",
        "tagsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/tags",
        "blobsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/blobs{/sha}",
        "gitTagsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/tags{/sha}",
        "gitRefsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/refs{/sha}",
        "treesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/trees{/sha}",
        "statusesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/statuses/{sha}",
        "languagesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/languages",
        "stargazersUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/stargazers",
        "contributorsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contributors",
        "subscribersUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscribers",
        "subscriptionUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscription",
        "commitsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/commits{/sha}",
        "gitCommitsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/commits{/sha}",
        "commentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/comments{/number}",
        "issueCommentUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/comments{/number}",
        "contentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contents/{+path}",
        "compareUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/compare/{base}...{head}",
        "mergesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/merges",
        "archiveUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/{archive_format}{/ref}",
        "downloadsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/downloads",
        "issuesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues{/number}",
        "pullsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/pulls{/number}",
        "milestonesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/milestones{/number}",
        "notificationsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/notifications{?since,all,participating}",
        "labelsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/labels{/name}",
        "releasesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/releases{/id}",
        "deploymentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/deployments",
        "createdAt": "2023-11-24T09:28:18Z",
        "updatedAt": "2024-07-24T19:25:11Z",
        "pushedAt": "2023-12-11T13:59:02Z",
        "gitUrl": "git://github.com/GabrielHCataldo/go-asaas.git",
        "sshUrl": "git@github.com:GabrielHCataldo/go-asaas.git",
        "cloneUrl": "https://github.com/GabrielHCataldo/go-asaas.git",
        "svnUrl": "https://github.com/GabrielHCataldo/go-asaas",
        "homepage": "https://asaas.com",
        "size": 298,
        "stargazersCount": 1,
        "watchersCount": 1,
        "language": "Go",
        "hasIssues": true,
        "hasProjects": true,
        "hasDownloads": true,
        "license": {
          "key": "mit",
          "name": "MIT License",
          "spdxId": "MIT",
          "url": "https://api.github.com/licenses/mit",
          "nodeId": "MDc6TGljZW5zZTEz"
        },
        "allowForking": true,
        "topics": [
          "bank",
          "billing",
          "boleto",
          "credit-card",
          "gopay",
          "payment",
          "payment-gateway",
          "payment-integration",
          "payment-module",
          "pix",
          "virtual-account"
        ],
        "visibility": "public",
        "watchers": 1,
        "defaultBranch": "main"
      },
      {
        ...
      }
    ]
  }
]
```

### Caso 5

Múltiplos backends + Transformação completa de resposta + Agregação

```text
curl --location 'localhost:8080/case/5/git/GabrielHCataldo'
```

Nesse exemplo, seguimos o mesmo caminho do [caso 4](#caso-4), porém, no
campo [endpoint.aggregate](https://github.com/tech4works/gopen-gateway#endpointresponseaggregate) informamos com o valor
`true`, e projetamos apenas os campos que precisamos, veja diferença:

**Antes**

Caso 4

```json
[
  {
    "ok": true,
    "code": 200,
    "id": 141183601,
    "username": "GabrielHCataldo",
    "personalData": {
      "avatar": "https://avatars.githubusercontent.com/u/141183601?v=4",
      "fullName": "Gabriel Cataldo"
    },
    "statistics": {
      "publicRepos": 8,
      "followers": 5,
      "following": 4
    },
    "createdAt": "2023-08-01T20:28:28Z"
  },
  {
    "ok": true,
    "code": 200,
    "repos": [
      {
        "id": 722927592,
        "nodeId": "R_kgDOKxb_6A",
        "name": "go-asaas",
        "fullName": "GabrielHCataldo/go-asaas",
        "owner": {
          "login": "GabrielHCataldo",
          "id": 141183601,
          "nodeId": "U_kgDOCGpKcQ",
          "avatarUrl": "https://avatars.githubusercontent.com/u/141183601?v=4",
          "url": "https://api.github.com/users/GabrielHCataldo",
          "htmlUrl": "https://github.com/GabrielHCataldo",
          "followersUrl": "https://api.github.com/users/GabrielHCataldo/followers",
          "followingUrl": "https://api.github.com/users/GabrielHCataldo/following{/other_user}",
          "gistsUrl": "https://api.github.com/users/GabrielHCataldo/gists{/gist_id}",
          "starredUrl": "https://api.github.com/users/GabrielHCataldo/starred{/owner}{/repo}",
          "subscriptionsUrl": "https://api.github.com/users/GabrielHCataldo/subscriptions",
          "organizationsUrl": "https://api.github.com/users/GabrielHCataldo/orgs",
          "reposUrl": "https://api.github.com/users/GabrielHCataldo/repos",
          "eventsUrl": "https://api.github.com/users/GabrielHCataldo/events{/privacy}",
          "receivedEventsUrl": "https://api.github.com/users/GabrielHCataldo/received_events",
          "type": "User"
        },
        "htmlUrl": "https://github.com/GabrielHCataldo/go-asaas",
        "description": "💸 Go payment library, with full integration with the Asaas API.",
        "url": "https://api.github.com/repos/GabrielHCataldo/go-asaas",
        "forksUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/forks",
        "keysUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/keys{/key_id}",
        "collaboratorsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/collaborators{/collaborator}",
        "teamsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/teams",
        "hooksUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/hooks",
        "issueEventsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/events{/number}",
        "eventsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/events",
        "assigneesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/assignees{/user}",
        "branchesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/branches{/branch}",
        "tagsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/tags",
        "blobsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/blobs{/sha}",
        "gitTagsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/tags{/sha}",
        "gitRefsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/refs{/sha}",
        "treesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/trees{/sha}",
        "statusesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/statuses/{sha}",
        "languagesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/languages",
        "stargazersUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/stargazers",
        "contributorsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contributors",
        "subscribersUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscribers",
        "subscriptionUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/subscription",
        "commitsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/commits{/sha}",
        "gitCommitsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/git/commits{/sha}",
        "commentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/comments{/number}",
        "issueCommentUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues/comments{/number}",
        "contentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/contents/{+path}",
        "compareUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/compare/{base}...{head}",
        "mergesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/merges",
        "archiveUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/{archive_format}{/ref}",
        "downloadsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/downloads",
        "issuesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/issues{/number}",
        "pullsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/pulls{/number}",
        "milestonesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/milestones{/number}",
        "notificationsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/notifications{?since,all,participating}",
        "labelsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/labels{/name}",
        "releasesUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/releases{/id}",
        "deploymentsUrl": "https://api.github.com/repos/GabrielHCataldo/go-asaas/deployments",
        "createdAt": "2023-11-24T09:28:18Z",
        "updatedAt": "2024-07-24T19:25:11Z",
        "pushedAt": "2023-12-11T13:59:02Z",
        "gitUrl": "git://github.com/GabrielHCataldo/go-asaas.git",
        "sshUrl": "git@github.com:GabrielHCataldo/go-asaas.git",
        "cloneUrl": "https://github.com/GabrielHCataldo/go-asaas.git",
        "svnUrl": "https://github.com/GabrielHCataldo/go-asaas",
        "homepage": "https://asaas.com",
        "size": 298,
        "stargazersCount": 1,
        "watchersCount": 1,
        "language": "Go",
        "hasIssues": true,
        "hasProjects": true,
        "hasDownloads": true,
        "license": {
          "key": "mit",
          "name": "MIT License",
          "spdxId": "MIT",
          "url": "https://api.github.com/licenses/mit",
          "nodeId": "MDc6TGljZW5zZTEz"
        },
        "allowForking": true,
        "topics": [
          "bank",
          "billing",
          "boleto",
          "credit-card",
          "gopay",
          "payment",
          "payment-gateway",
          "payment-integration",
          "payment-module",
          "pix",
          "virtual-account"
        ],
        "visibility": "public",
        "watchers": 1,
        "defaultBranch": "main"
      },
      {
        ...
      }
    ]
  }
]
```

**Depois**

```json
{
  "id": 141183601,
  "username": "GabrielHCataldo",
  "personalData": {
    "avatar": "https://avatars.githubusercontent.com/u/141183601?v=4",
    "fullName": "Gabriel Cataldo"
  },
  "statistics": {
    "publicRepos": 8,
    "followers": 5,
    "following": 4
  },
  "repos": [
    {
      "id": 536150718,
      "name": "secretsmanager-example",
      "url": "https://api.github.com/repos/wesleywillians/secretsmanager-example",
      "language": "Go",
      "visibility": "public",
      "createdAt": "2022-09-13T13:54:50Z",
      "updatedAt": "2022-11-22T18:33:33Z",
      "pushedAt": "2022-09-13T13:55:18Z"
    },
    {
      "id": 473374415,
      "name": "argocd",
      "url": "https://api.github.com/repos/wesleywillians/argocd",
      "language": "Go",
      "visibility": "public",
      "createdAt": "2022-03-23T22:12:33Z",
      "updatedAt": "2022-03-23T22:20:56Z",
      "pushedAt": "2022-03-23T23:38:55Z"
    },
    {
      "id": 409772904,
      "name": "test-gitops",
      "url": "https://api.github.com/repos/wesleywillians/test-gitops",
      "language": "Dockerfile",
      "visibility": "public",
      "createdAt": "2021-09-23T23:35:22Z",
      "updatedAt": "2021-09-25T16:09:24Z",
      "pushedAt": "2021-09-25T16:09:22Z"
    }
  ]
}
```

### Caso 6

Timeout

```text
curl --location 'localhost:8080/case/6/timeout'
```

Nesse exemplo utilizamos o timeout granular, customizando o tempo para o endpoint específico, e aguardamos a resposta
[504 Gateway Timeout](https://github.com/tech4works/gopen-gateway#504-gateway-timeout).

### Caso 7

Backend único + Transformação básica de requisição e resposta, o token de resposta a ser utilizado nos
casos [8](#caso-8), [9](#caso-9).

```text
curl --location 'localhost:8080/case/7/login' \
--header 'Content-Type: application/json' \
--data '{
    "username": "emilys",
    "password": "emilyspass"
}'
```

Nesse exemplo adicionamos obrigatóriamente o campo `expiresInMins` no body de resposta ao backend indicando o tempo
que token irá durar após o login bem-sucedido, e projetamos apenas os campos necessários, veja a resposta:

**Antes**

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU3ODksImV4cCI6MTcyNTI3OTM4OX0.-TEYCDGsAvn-hbVwgQi4JiW0BGjnMyuKIoZ2s_j-tww",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU3ODksImV4cCI6MTcyNzg2Nzc4OX0.EN46KW0yOgJDtUmrqALAeXMx6Af9PO6hu7rzdaQkOPY",
  "id": 1,
  "username": "emilys",
  "email": "emily.johnson@x.dummyjson.com",
  "firstName": "Emily",
  "lastName": "Johnson",
  "gender": "female",
  "image": "https://dummyjson.com/icon/emilys/128"
}
```

**Depois**

```json
{
  "id": 1,
  "image": "https://dummyjson.com/icon/emilys/128",
  "username": "emilys",
  "email": "emily.johnson@x.dummyjson.com",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU4NzYsImV4cCI6MTcyNTI3OTQ3Nn0.Uyx4OZbfce2gDq976_Ugzdo6LNi9EOCzK00kzFhvh0g",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU4NzYsImV4cCI6MTcyNzg2Nzg3Nn0.aEZ2TgARkuR1RyDRJ_GHNBD6yGp52FnpeIRQXRWEP-0"
}
```

### Caso 8

Middleware de autorização de pré-requisição (beforeware) + Backend único

```text
curl --location 'localhost:8080/case/8/my/posts' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU4NzYsImV4cCI6MTcyNTI3OTQ3Nn0.Uyx4OZbfce2gDq976_Ugzdo6LNi9EOCzK00kzFhvh0g'
```

Nesse exemplo utilizamos o middleware `get-user-by-token` pré-configurado para validar o token passado, caso
bem-sucedido, o backend irá obter o id do mesmo retornado pelo middleware e alterar a URL param para utilizar o mesmo,
caso contrário, é abortado retornando a própria resposta, veja:

**Sucesso**

```text
200 (OK)
```

```json
{
  "posts": [
    {
      "id": 15,
      "title": "The trees, therefore, must be such old",
      "body": "The trees, therefore, must be such old and primitive techniques that they thought nothing of them, deeming them so inconsequential that even savages like us would know of them and not be suspicious. At that, they probably didn't have too much time after they detected us orbiting and intending to land. And if that were true, there could be only one place where their civilization was hidden.",
      "tags": [
        "fiction",
        "history",
        "crime"
      ],
      "reactions": {
        "likes": 951,
        "dislikes": 12
      },
      "views": 2911,
      "userId": 1
    }
  ],
  "total": 1,
  "skip": 0,
  "limit": 1
}
```

**Falha**

``401 (Unauthorized)``

``` json
{
    "name": "TokenExpiredError",
    "message": "Token Expired!",
    "expiredAt": "2024-09-02T11:27:49.000Z"
}
```

### Caso 9

Middleware de autorização de pré-requisição (beforeware) + Múltiplos backends + Propagação

```text
curl --location 'localhost:8080/case/9/my/profile' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjUyNzU4NzYsImV4cCI6MTcyNTI3OTQ3Nn0.Uyx4OZbfce2gDq976_Ugzdo6LNi9EOCzK00kzFhvh0g'
```

Nesse exemplo seguimos o mesmo caminho do [caso 8](#caso-8) com middleware de autorização, porém, agora com múltiplos
backends, utilizando o campo de propagação para assim não precisarmos repetir a modificação em cada backend subjacente,
e fizemos pequenas transformações, veja o resultado:

```json
{
  "id": 1,
  "username": "emilys",
  "image": "https://dummyjson.com/icon/emilys/128",
  "personalData": {
    "firstName": "Emily",
    "lastName": "Johnson",
    "birthDate": "1996-5-30",
    "age": 28,
    "gender": "female"
  },
  "contact": {
    "email": "emily.johnson@x.dummyjson.com",
    "phone": "+81 965-431-3024"
  },
  "todos": {
    "total": 2,
    "limit": 2,
    "page": [
      {
        "id": 47,
        "todo": "Learn Javascript",
        "userId": 1
      },
      {
        "id": 64,
        "todo": "Listen to a new music genre",
        "completed": true,
        "userId": 1
      }
    ]
  },
  "posts": {
    "total": 1,
    "limit": 1,
    "page": [
      {
        "id": 15,
        "title": "The trees, therefore, must be such old",
        "body": "The trees, therefore, must be such old and primitive techniques that they thought nothing of them, deeming them so inconsequential that even savages like us would know of them and not be suspicious. At that, they probably didn't have too much time after they detected us orbiting and intending to land. And if that were true, there could be only one place where their civilization was hidden.",
        "tags": [
          "fiction",
          "history",
          "crime"
        ],
        "reactions": {
          "likes": 951,
          "dislikes": 12
        },
        "views": 2911,
        "userId": 1
      }
    ]
  }
}
```

### Caso 10

Concorrência desativada e ativada.

**Desativada**

```text
curl --location 'localhost:8080/case/10/concurrent/disabled'
```

**Ativada**

```text
curl --location 'localhost:8080/case/10/concurrent/enabled'
```

Nesse exemplo temos dois endpoints parecidos, única diferença é as chamadas concorrentes, quando `/enabled` o mesmo
faz 3 chamadas, a primeira que for respondida será retornada, e as outras serão canceladas.

Veja mais sobre essa
configuração [clicando aqui](https://github.com/tech4works/gopen-gateway#endpointbackendrequestconcurrent).

### Observabilidade

Na pasta do projeto, importe as configurações personalizadas rodando o comando abaixo:

```
curl -X POST "localhost:5601/api/saved_objects/_import?overwrite=true" -H "kbn-xsrf: true" --form file=@kibana-config.ndjson -H "kbn-xsrf: true"
```

Veja os dashboards, traces e logs acessando o http://localhost:5601.

<img src="assets/kibana-discover-dashboard.png">

# Como contribuir?

Acesse o repositório
principal [clicando aqui](https://github.com/tech4works/gopen-gateway?tab=readme-ov-file#como-contríbuir) e veja como
contribuir.

# Agradecimento

- [APIs Github](https://docs.github.com/en/rest?apiVersion=2022-11-28)
- [Dummyjson](https://dummyjson.com)

# Licença Apache 2.0

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Ftech4works%2Fgopen-gateway.svg?type=large&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2Ftech4works%2Fgopen-gateway?ref=badge_large&issueType=license)
