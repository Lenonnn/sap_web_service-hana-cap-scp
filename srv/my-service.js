  const cds = require('@sap/cds')

module.exports = (srv)=>{

    // Use reflection to get the csn definition of Books
    const {Books, Orders, BusinessPartners} = cds.entities

    const extSrv = cds.connect.to('API_BUSINESS_PARTNER')

    srv.on('READ', BusinessPartners, req => extSrv.tx(req).run(req.query))

     extSrv.on('BusinessPartener/Changed', async msg => {
        console.log('>>> BusinesPartener/Changed', msg.data)
        const BUSINESSPARTNER = msg.data.KEY[0].BUSINESSPARTNER
        const tx = cds.tx(msg)
        const orders = await tx.run(SELECT('ID')
            .from(Orders)
            .where({ createdBy:BUSINESSPARTNER, status: 'processing'}))
        if (!orders.length) return
        const businessPartner = await extSrv.tx(msg)
            .run(SELECT.one(['ID', 'BusinessPartnerIsBlocked']))
            .from(BusinessPartners)
            .where(({ ID: BUSINESSPARTNER}))
        if ( !businessPartner || !businessPartner.BusinessPartnerIsBlocked) return
        await Promise.all(orders.map(order => tx.run(UPDATE(Orders)
            .where(order)
            .set({status: 'blocked '}))))
        console.log('Own orders set to blocked')
        orders.forEach(order => this.emit('OrderBlocked', order) &&
        console.log('<<< OrderBlocked', order))
})

       // Adiciona um desconto se estoque for muito grande
    srv.after ('READ','Books', (each) => {
        if (each.stock > 111) each.title += ' -- 11% discount'
    })

    

    // Atualiza estoque
    srv.before ('CREATE','Orders', async (req) => {
        const tx = cds.transaction(req), order = req.data;
        if (order.Items) { 
            const affectedRows = await tx.run(order.Items.map(item =>
            UPDATE(Books) .where({ID:item.book_ID})
            .and(`stock >=`, item.amount)
            .set(`stock -=`, item.amount)
          )
        )
        if (affectedRows.some(row => !row)) req.error(409, 'Esgotado') 
        } 
    });
    /*
     Por que o arquivo de implementação personalizado
     cat-service.js é executado automaticamente ?
    */
    // RES: Porque ele tem o mesmo nome que o arquivo .cds

    try{
        srv.before ('*', (req) => { 
        console.debug ('>>>', req.method, req.target.name);
        })
    }
    catch(error){
         console.error(400, 'Boo');
    }
   
        
   
       
    
}
