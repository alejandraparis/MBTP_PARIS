@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MASTER
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTES_MAP
  as select from ztb_clientes_map as Clientes
    inner join   ztb_clnts_lib_mp as RelClLib on RelClLib.id_cliente = Clientes.id_cliente
{
  key RelClLib.id_libro    as IdLibro,
  key Clientes.id_cliente  as IdCliente,
  key Clientes.tipo_acceso as Acceso,
      Clientes.nombre      as Nombre,
      Clientes.apellidos   as Apellidos,
      Clientes.email       as Email,
      Clientes.url         as Imagen
}
