; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74174 () Bool)

(assert start!74174)

(declare-datatypes ((T!66959 0))(
  ( (T!66960 (val!586 Int)) )
))
(declare-datatypes ((array!21397 0))(
  ( (array!21398 (arr!10382 (Array (_ BitVec 32) T!66959)) (size!9290 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21397)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(declare-fun a2!451 () array!21397)

(assert (=> start!74174 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9290 a1!451) (size!9290 a2!451)) (bvsle to!544 (size!9290 a1!451)) (not (= from!577 to!544)) (bvsge from!577 (size!9290 a2!451)))))

(assert (=> start!74174 true))

(declare-fun e!236384 () Bool)

(declare-fun array_inv!8825 (array!21397) Bool)

(assert (=> start!74174 (and (array_inv!8825 a1!451) e!236384)))

(declare-fun e!236385 () Bool)

(assert (=> start!74174 (and (array_inv!8825 a2!451) e!236385)))

(declare-fun b!327231 () Bool)

(declare-fun tp_is_empty!1173 () Bool)

(declare-fun mapRes!3522 () Bool)

(assert (=> b!327231 (= e!236385 (and tp_is_empty!1173 mapRes!3522))))

(declare-fun condMapEmpty!3523 () Bool)

(declare-fun mapDefault!3522 () T!66959)

(assert (=> b!327231 (= condMapEmpty!3523 (= (arr!10382 a2!451) ((as const (Array (_ BitVec 32) T!66959)) mapDefault!3522)))))

(declare-fun mapNonEmpty!3522 () Bool)

(declare-fun tp!3523 () Bool)

(assert (=> mapNonEmpty!3522 (= mapRes!3522 (and tp!3523 tp_is_empty!1173))))

(declare-fun mapValue!3522 () T!66959)

(declare-fun mapRest!3523 () (Array (_ BitVec 32) T!66959))

(declare-fun mapKey!3522 () (_ BitVec 32))

(assert (=> mapNonEmpty!3522 (= (arr!10382 a2!451) (store mapRest!3523 mapKey!3522 mapValue!3522))))

(declare-fun mapIsEmpty!3522 () Bool)

(assert (=> mapIsEmpty!3522 mapRes!3522))

(declare-fun mapNonEmpty!3523 () Bool)

(declare-fun mapRes!3523 () Bool)

(declare-fun tp!3522 () Bool)

(assert (=> mapNonEmpty!3523 (= mapRes!3523 (and tp!3522 tp_is_empty!1173))))

(declare-fun mapRest!3522 () (Array (_ BitVec 32) T!66959))

(declare-fun mapValue!3523 () T!66959)

(declare-fun mapKey!3523 () (_ BitVec 32))

(assert (=> mapNonEmpty!3523 (= (arr!10382 a1!451) (store mapRest!3522 mapKey!3523 mapValue!3523))))

(declare-fun b!327232 () Bool)

(assert (=> b!327232 (= e!236384 (and tp_is_empty!1173 mapRes!3523))))

(declare-fun condMapEmpty!3522 () Bool)

(declare-fun mapDefault!3523 () T!66959)

(assert (=> b!327232 (= condMapEmpty!3522 (= (arr!10382 a1!451) ((as const (Array (_ BitVec 32) T!66959)) mapDefault!3523)))))

(declare-fun mapIsEmpty!3523 () Bool)

(assert (=> mapIsEmpty!3523 mapRes!3523))

(assert (= (and b!327232 condMapEmpty!3522) mapIsEmpty!3523))

(assert (= (and b!327232 (not condMapEmpty!3522)) mapNonEmpty!3523))

(assert (= start!74174 b!327232))

(assert (= (and b!327231 condMapEmpty!3523) mapIsEmpty!3522))

(assert (= (and b!327231 (not condMapEmpty!3523)) mapNonEmpty!3522))

(assert (= start!74174 b!327231))

(declare-fun m!465031 () Bool)

(assert (=> start!74174 m!465031))

(declare-fun m!465033 () Bool)

(assert (=> start!74174 m!465033))

(declare-fun m!465035 () Bool)

(assert (=> mapNonEmpty!3522 m!465035))

(declare-fun m!465037 () Bool)

(assert (=> mapNonEmpty!3523 m!465037))

(check-sat (not start!74174) (not mapNonEmpty!3522) (not mapNonEmpty!3523) tp_is_empty!1173)
(check-sat)
