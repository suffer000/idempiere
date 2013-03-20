﻿DROP VIEW rv_bpartner;

CREATE OR REPLACE VIEW rv_bpartner AS 
 SELECT bp.ad_client_id, bp.ad_org_id, bp.isactive, bp.created, bp.createdby, bp.updated, bp.updatedby, bp.c_bpartner_id, bp.value, bp.name, bp.name2, bp.description, bp.issummary, bp.c_bp_group_id, bp.isonetime, bp.isprospect, bp.isvendor, bp.iscustomer, bp.isemployee, bp.issalesrep, bp.referenceno, bp.duns, bp.url, bp.ad_language, bp.taxid, bp.istaxexempt, bp.c_invoiceschedule_id, bp.rating, bp.salesvolume, bp.numberemployees, bp.naics, bp.firstsale, bp.acqusitioncost, bp.potentiallifetimevalue, bp.actuallifetimevalue, bp.shareofcustomer, bp.paymentrule, bp.so_creditlimit, bp.so_creditused, bp.so_creditused - bp.so_creditlimit AS so_creditavailable, bp.c_paymentterm_id, bp.m_pricelist_id, bp.m_discountschema_id, bp.c_dunning_id, bp.isdiscountprinted, bp.so_description, bp.poreference, bp.paymentrulepo, bp.po_pricelist_id, bp.po_discountschema_id, bp.po_paymentterm_id, bp.documentcopies, bp.c_greeting_id, bp.invoicerule, bp.deliveryrule, bp.freightcostrule, bp.deliveryviarule, bp.salesrep_id, bp.sendemail, bp.bpartner_parent_id, bp.invoice_printformat_id, bp.socreditstatus, bp.shelflifeminpct, bp.ad_orgbp_id, bp.flatdiscount, bp.totalopenbalance, c.ad_user_id, c.name AS contactname, c.description AS contactdescription, c.email, c.supervisor_id, c.emailuser, c.c_greeting_id AS bpcontactgreeting, c.title, c.comments, c.phone, c.phone2, c.fax, c.lastcontact, c.lastresult, c.birthday, c.ad_orgtrx_id, c.emailverify, c.ldapuser, c.emailverifydate, c.notificationtype, l.c_bpartner_location_id, a.postal, a.city, a.address1, a.address2, a.address3, a.c_region_id, COALESCE(r.name, a.regionname) AS regionname, a.c_country_id, cc.name AS countryname, bp.c_taxgroup_id AS c_bp_c_taxgroup_id, bp.dunninggrace AS c_bp_dunninggrace, bp.ismanufacturer AS c_bp_ismanufacturer, bp.ispotaxexempt AS c_bp_ispotaxexempt, bp.logo_id AS c_bp_logo_id, l.ad_org_id AS c_bp_location_ad_org_id, l.c_bpartner_id AS c_bp_location_c_bpartner_id, l.c_location_id AS c_bp_location_c_location_id, l.created AS c_bp_location_created, l.createdby AS c_bp_location_createdby, l.c_salesregion_id AS c_bp_location_salesregion_id, l.fax AS c_bp_location_fax, l.isactive AS c_bp_location_isactive, l.isbillto AS c_bp_location_isbillto, l.isdn AS c_bp_location_isdn, l.ispayfrom AS c_bp_location_ispayfrom, l.isremitto AS c_bp_location_isremitto, l.isshipto AS c_bp_location_isshipto, l.name AS c_bp_location_name, l.phone AS c_bp_location_phone, l.phone2 AS c_bp_location_phone2, l.updated AS c_bp_location_updated, l.updatedby AS c_bp_location_updatedby, c.ad_org_id AS ad_user_ad_org_id, c.c_bpartner_id AS ad_user_c_bpartner_id, c.c_bpartner_location_id AS ad_user_c_bpartner_location_id, c.created AS ad_user_created, c.createdby AS ad_user_createdby, c.isactive AS ad_user_isactive, c.updated AS ad_user_updated, c.updatedby AS ad_user_updatedby, c.value AS ad_user_value, a.address4, a.ad_org_id AS c_location_ad_org_id, a.c_city_id, a.c_location_id, a.created AS c_location_created, a.createdby AS c_location_createdby, a.isactive AS c_location_isactive, a.postal_add, a.updated AS c_location_updated, a.updatedby AS c_location_updatedby, r.ad_org_id AS c_region_ad_org_id, r.c_country_id AS c_region_c_country_id, r.description AS c_region_description, r.isactive AS c_region_isactive, r.isdefault, cc.ad_language AS c_country_ad_language, cc.c_currency_id AS c_country_c_currency_id, cc.countrycode, cc.description AS c_country_description, cc.isactive AS c_country_isactive
   FROM c_bpartner bp
   LEFT JOIN c_bpartner_location l ON bp.c_bpartner_id = l.c_bpartner_id AND l.isactive = 'Y'
   LEFT JOIN ad_user c ON bp.c_bpartner_id = c.c_bpartner_id AND (c.c_bpartner_location_id IS NULL OR c.c_bpartner_location_id = l.c_bpartner_location_id) AND c.isactive = 'Y'
   LEFT JOIN c_location a ON l.c_location_id = a.c_location_id
   LEFT JOIN c_region r ON a.c_region_id = r.c_region_id
   JOIN c_country cc ON a.c_country_id = cc.c_country_id;

