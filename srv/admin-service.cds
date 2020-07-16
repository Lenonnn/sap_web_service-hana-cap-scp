// Importa entidades da pasta schemas
using { sap.capire.bookshop as my} from '../db/schemas';

// Serviço de administração do web services
service AdminService @(_requires:'admin') {
    // entidades que estão espoxtas pelo serviço
    entity Books as projection on my.Books;
    entity Movies as projection on my.Movies;
    entity Authors as projection on my.Authors;
    entity Orders as select from my.Orders;
    entity Magazine as select from my.Magazine;

} 

// Enable Fiori Draft for Orders
annotate AdminService.Orders with @odata.draft.enabled;
// annotate AdminService.Books with @odata.draft.enabled;

// Temporary workaround -> cap/issues#3121
extend service AdminService with {
  entity OrderItems as select from my.OrderItems;
}