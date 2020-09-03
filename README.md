## CURSO - SAP Cloud Aplication Programming Model

Curso disponível no site [openSAP!](https://open.sap.com/courses/cp7) :bowtie:

Existe um tutorial no site [CAP Cloud](https://cap.cloud.sap/docs/get-started/hello-world) com alguns exemplos.

**Este arquivo possuí 1 pasta/pcacote, com códigos desenvolvidos durante o curso**

> 2-bookshop-cap_NodeJS


:neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:  :neckbeard:

> Esse curso tem o objetivo de aprimorar e ensinar como contruir um web service utilizando node.js e o modelo de ´rogramação em nuvem da SAP  

:movie_camera:

```
Os pacotes de aplicativos são bem simples, e estão com instruções separadas por cada pacote em um README apropriado.    
```


:loudspeaker:  :watch:

*Aconselho a quem realmente se interessar em aprender, podem fazer o curso, que poderá ser um pouco extenso dependendo do nível de conhecimento, mas que com certeza, será um grande facilitador no entendimento de como utilizar as ferramentas de desenvolvimento SAP.* :chart_with_upwards_trend:  :chart_with_downwards_trend:




# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File / Folder | Purpose
---------|----------
`app/` | content for UI frontends go here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps...

- Open a new terminal and run  `cds watch`
- ( in VSCode simply choose _**Terminal** > Run Task > cds watch_ )
- Start adding content, e.g. a [db/schema.cds](db/schemas.cds), ...


## Learn more...

Learn more at https://cap.cloud.sap/docs/get-started/


### Minha primeira aplicação com node.js usando SAP Business Aplication Studio

# Adaptando ambiente windows e VSCode

- npm set @sap:registry=https://npm.sap.com
- npm i -g @sap/cds
- CDS --version

## Comandos

- cds init ( inicializa o projeto )

- cds watch ( Vai rodar o servidor e se o serviço tiver altereções, vai rodar o código novamente semelhante ao nodemon )


## Deploy para o SQLite
- cds deploy --to sqlite ( cria arquivo de banco de dados sqlite persistente)
> Vai criar um arquivo : sqlite.db

***É possível também fazer isto da seguinte forma***

- cds deploy --to sqlite:bookshop.db 
> Vai criar um arquivo : bookshop.db

- rm sqlite.db ( remove o banco de dados que tem o nome sqlite.db )


### ( Cria as queries em SQL das views e tables contidas no documento srv/cat-service.cds )
- cds compile srv/cat-service.cds --to sql 

### ( Compila para o HANA - criando arquivos hdbcds e hdbtable ou hdbu)
- cds compile srv/cat-service.cds --to hana


 
## Deploy para o Hana
- cds deploy --to hana ( cria arquivo de banco de dados sqlite persistente)

### Roda a aplicação em produção no HANA
- CDS_ENV=production cds watch


### Rodar testes
- npm i -g jest
- jest --watchAll



## Observação::: 
```
O WebApp em Fiori(UI5) não está rodando, precisa de ajustes !!!!!
```


## Curso openSAP
Link do curso [aqui](https://open.sap.com/courses/cp7).
