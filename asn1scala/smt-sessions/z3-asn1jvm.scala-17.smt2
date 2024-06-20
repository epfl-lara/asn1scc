; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!534 () Bool)

(assert start!534)

(declare-fun b!1584 () Bool)

(declare-fun e!1001 () Bool)

(declare-fun tp_is_empty!3 () Bool)

(declare-fun mapRes!11 () Bool)

(assert (=> b!1584 (= e!1001 (and tp_is_empty!3 mapRes!11))))

(declare-fun condMapEmpty!10 () Bool)

(declare-datatypes ((T!535 0))(
  ( (T!536 (val!1 Int)) )
))
(declare-datatypes ((array!134 0))(
  ( (array!135 (arr!437 (Array (_ BitVec 32) T!535)) (size!50 (_ BitVec 32))) )
))
(declare-fun a1!444 () array!134)

(declare-fun mapDefault!11 () T!535)

(assert (=> b!1584 (= condMapEmpty!10 (= (arr!437 a1!444) ((as const (Array (_ BitVec 32) T!535)) mapDefault!11)))))

(declare-fun mapIsEmpty!10 () Bool)

(declare-fun mapRes!10 () Bool)

(assert (=> mapIsEmpty!10 mapRes!10))

(declare-fun b!1585 () Bool)

(declare-fun e!1000 () Bool)

(assert (=> b!1585 (= e!1000 (and tp_is_empty!3 mapRes!10))))

(declare-fun condMapEmpty!11 () Bool)

(declare-fun a2!444 () array!134)

(declare-fun mapDefault!10 () T!535)

(assert (=> b!1585 (= condMapEmpty!11 (= (arr!437 a2!444) ((as const (Array (_ BitVec 32) T!535)) mapDefault!10)))))

(declare-fun mapNonEmpty!10 () Bool)

(declare-fun tp!10 () Bool)

(assert (=> mapNonEmpty!10 (= mapRes!11 (and tp!10 tp_is_empty!3))))

(declare-fun mapValue!11 () T!535)

(declare-fun mapKey!10 () (_ BitVec 32))

(declare-fun mapRest!11 () (Array (_ BitVec 32) T!535))

(assert (=> mapNonEmpty!10 (= (arr!437 a1!444) (store mapRest!11 mapKey!10 mapValue!11))))

(declare-fun mapIsEmpty!11 () Bool)

(assert (=> mapIsEmpty!11 mapRes!11))

(assert (=> start!534 (and (= (size!50 a1!444) (size!50 a2!444)) (bvsgt #b00000000000000000000000000000000 (size!50 a1!444)))))

(declare-fun array_inv!46 (array!134) Bool)

(assert (=> start!534 (and (array_inv!46 a1!444) e!1001)))

(assert (=> start!534 (and (array_inv!46 a2!444) e!1000)))

(declare-fun mapNonEmpty!11 () Bool)

(declare-fun tp!11 () Bool)

(assert (=> mapNonEmpty!11 (= mapRes!10 (and tp!11 tp_is_empty!3))))

(declare-fun mapValue!10 () T!535)

(declare-fun mapKey!11 () (_ BitVec 32))

(declare-fun mapRest!10 () (Array (_ BitVec 32) T!535))

(assert (=> mapNonEmpty!11 (= (arr!437 a2!444) (store mapRest!10 mapKey!11 mapValue!10))))

(assert (= (and b!1584 condMapEmpty!10) mapIsEmpty!11))

(assert (= (and b!1584 (not condMapEmpty!10)) mapNonEmpty!10))

(assert (= start!534 b!1584))

(assert (= (and b!1585 condMapEmpty!11) mapIsEmpty!10))

(assert (= (and b!1585 (not condMapEmpty!11)) mapNonEmpty!11))

(assert (= start!534 b!1585))

(declare-fun m!1161 () Bool)

(assert (=> mapNonEmpty!10 m!1161))

(declare-fun m!1163 () Bool)

(assert (=> start!534 m!1163))

(declare-fun m!1165 () Bool)

(assert (=> start!534 m!1165))

(declare-fun m!1167 () Bool)

(assert (=> mapNonEmpty!11 m!1167))

(check-sat (not start!534) (not mapNonEmpty!11) (not mapNonEmpty!10) tp_is_empty!3)
(check-sat)
(get-model)

(declare-fun d!1252 () Bool)

(assert (=> d!1252 (= (array_inv!46 a1!444) (bvsge (size!50 a1!444) #b00000000000000000000000000000000))))

(assert (=> start!534 d!1252))

(declare-fun d!1254 () Bool)

(assert (=> d!1254 (= (array_inv!46 a2!444) (bvsge (size!50 a2!444) #b00000000000000000000000000000000))))

(assert (=> start!534 d!1254))

(declare-fun condMapEmpty!20 () Bool)

(declare-fun mapDefault!20 () T!535)

(assert (=> mapNonEmpty!11 (= condMapEmpty!20 (= mapRest!10 ((as const (Array (_ BitVec 32) T!535)) mapDefault!20)))))

(declare-fun mapRes!20 () Bool)

(assert (=> mapNonEmpty!11 (= tp!11 (and tp_is_empty!3 mapRes!20))))

(declare-fun mapIsEmpty!20 () Bool)

(assert (=> mapIsEmpty!20 mapRes!20))

(declare-fun mapNonEmpty!20 () Bool)

(declare-fun tp!20 () Bool)

(assert (=> mapNonEmpty!20 (= mapRes!20 (and tp!20 tp_is_empty!3))))

(declare-fun mapKey!20 () (_ BitVec 32))

(declare-fun mapValue!20 () T!535)

(declare-fun mapRest!20 () (Array (_ BitVec 32) T!535))

(assert (=> mapNonEmpty!20 (= mapRest!10 (store mapRest!20 mapKey!20 mapValue!20))))

(assert (= (and mapNonEmpty!11 condMapEmpty!20) mapIsEmpty!20))

(assert (= (and mapNonEmpty!11 (not condMapEmpty!20)) mapNonEmpty!20))

(declare-fun m!1177 () Bool)

(assert (=> mapNonEmpty!20 m!1177))

(declare-fun condMapEmpty!21 () Bool)

(declare-fun mapDefault!21 () T!535)

(assert (=> mapNonEmpty!10 (= condMapEmpty!21 (= mapRest!11 ((as const (Array (_ BitVec 32) T!535)) mapDefault!21)))))

(declare-fun mapRes!21 () Bool)

(assert (=> mapNonEmpty!10 (= tp!10 (and tp_is_empty!3 mapRes!21))))

(declare-fun mapIsEmpty!21 () Bool)

(assert (=> mapIsEmpty!21 mapRes!21))

(declare-fun mapNonEmpty!21 () Bool)

(declare-fun tp!21 () Bool)

(assert (=> mapNonEmpty!21 (= mapRes!21 (and tp!21 tp_is_empty!3))))

(declare-fun mapRest!21 () (Array (_ BitVec 32) T!535))

(declare-fun mapValue!21 () T!535)

(declare-fun mapKey!21 () (_ BitVec 32))

(assert (=> mapNonEmpty!21 (= mapRest!11 (store mapRest!21 mapKey!21 mapValue!21))))

(assert (= (and mapNonEmpty!10 condMapEmpty!21) mapIsEmpty!21))

(assert (= (and mapNonEmpty!10 (not condMapEmpty!21)) mapNonEmpty!21))

(declare-fun m!1179 () Bool)

(assert (=> mapNonEmpty!21 m!1179))

(check-sat (not mapNonEmpty!20) (not mapNonEmpty!21) tp_is_empty!3)
(check-sat)
