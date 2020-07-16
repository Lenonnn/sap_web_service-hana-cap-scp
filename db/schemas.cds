namespace sap.capire.bookshop;

using { Currency, managed, cuid } from '@sap/cds/common';
//using { sap.capire.produtos.produtcs } from '/produtcs';
using { sap.capire.products.Products} from '../../3-products/produtos';
// Entidade livros
entity Books : Products {
    // Associação para um autor
    author : Association to Authors;

    // -- Aqui serão reaproveitados os campo importados de Products
    /*
    key ID : Integer;
    title : localized String(111);
    descr : localized String(1111);
    stock : Integer;
    price : Decimal(9, 2);
    currency: Currency;
    */
} 


entity Magazine : Products {
    publisher : String;
}



// Entidade Autor
// Um Livro tem somente um autor, enquanto um autor pode ter vários livros  
@cds.autoexpose
entity Authors : managed {
    key ID : Integer;
    name : String(111);
    dateOfBirth  : Date;
    dateOfDeath  : Date;
    placeOfBirth : String;
    placeOfDeath : String;
    books : Association to many Books on books.author = $self;
}


//Entidade pedidos
// 'CUID' serve para criar o ID no servço
entity Orders : managed, cuid {

    //O modelo de ID abaixo, vai ser substituido por CUID logo na declração
    // key ID : UUID;
    OrderNo : String @title:'Order Number'; //;> readable key
    // Pode ser composta por vários items(livros)
    Items : Composition of many OrderItems on Items.parent = $self;
    total : Decimal(9, 2) @readonly;  
}

entity OrderItems : cuid {

    //O modelo de ID abaixo, vai ser substituido por CUID logo na declração
    // key ID : UUID;
    parent : Association to Orders;
    book : Association to Books;
    amount : Integer;
    netAmount : Decimal(9, 2);
}

// Entidade Filmes
entity Movies : additionalInfo {
    key ID : Integer;
    name: String(111);
}

// Cria aspecto de informação adicional
aspect additionalInfo {
    genre: String(100);
    language: String(200);
}


 
