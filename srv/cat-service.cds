using { sap.capire.bookshop as my } from '../db/schemas';
using { API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER.csn';



@(path:'browse')
service CatalogService{


    @readonly entity BusinessPartner as projection on external.A_BusinessPartner{
        key BusinessPartner as ID,
        FirstName,
        MiddleName,
        LastName,
        BusinessPartnerIsBlocked
    };




    //Vai permitir somente a leitura de livros
    // @readonly
    //Vai permitir a gravação de aterações em livros
    @odata.draft.enabled
    @impl: './my-service.js'
    entity Books as SELECT FROM my.Books 
    // { *, author.name as author  } 
    { * }
    excluding { createdBy, modifiedBy };

    @requires_: 
    'authenticated-user'
    
    //Vai permitir somente a inserção de pedidos
    // @insertonly
    //Vai permitir a gravação de aterações pedidos
    @odata.draft.enabled
    entity Orders as projection on my.Orders;


    event OrderBlocked {
        ID: UUID;
    }
}
