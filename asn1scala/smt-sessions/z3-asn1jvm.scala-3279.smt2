; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74168 () Bool)

(assert start!74168)

(declare-fun b!327213 () Bool)

(declare-fun e!236366 () Bool)

(declare-fun tp_is_empty!1167 () Bool)

(declare-fun mapRes!3504 () Bool)

(assert (=> b!327213 (= e!236366 (and tp_is_empty!1167 mapRes!3504))))

(declare-fun condMapEmpty!3504 () Bool)

(declare-datatypes ((T!66933 0))(
  ( (T!66934 (val!583 Int)) )
))
(declare-datatypes ((array!21391 0))(
  ( (array!21392 (arr!10379 (Array (_ BitVec 32) T!66933)) (size!9287 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21391)

(declare-fun mapDefault!3505 () T!66933)

(assert (=> b!327213 (= condMapEmpty!3504 (= (arr!10379 a2!451) ((as const (Array (_ BitVec 32) T!66933)) mapDefault!3505)))))

(declare-fun mapIsEmpty!3504 () Bool)

(declare-fun mapRes!3505 () Bool)

(assert (=> mapIsEmpty!3504 mapRes!3505))

(declare-fun mapIsEmpty!3505 () Bool)

(assert (=> mapIsEmpty!3505 mapRes!3504))

(declare-fun b!327214 () Bool)

(declare-fun e!236367 () Bool)

(assert (=> b!327214 (= e!236367 (and tp_is_empty!1167 mapRes!3505))))

(declare-fun condMapEmpty!3505 () Bool)

(declare-fun a1!451 () array!21391)

(declare-fun mapDefault!3504 () T!66933)

(assert (=> b!327214 (= condMapEmpty!3505 (= (arr!10379 a1!451) ((as const (Array (_ BitVec 32) T!66933)) mapDefault!3504)))))

(declare-fun mapNonEmpty!3505 () Bool)

(declare-fun tp!3504 () Bool)

(assert (=> mapNonEmpty!3505 (= mapRes!3504 (and tp!3504 tp_is_empty!1167))))

(declare-fun mapValue!3504 () T!66933)

(declare-fun mapRest!3504 () (Array (_ BitVec 32) T!66933))

(declare-fun mapKey!3505 () (_ BitVec 32))

(assert (=> mapNonEmpty!3505 (= (arr!10379 a2!451) (store mapRest!3504 mapKey!3505 mapValue!3504))))

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(assert (=> start!74168 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9287 a1!451) (size!9287 a2!451)) (bvsle to!544 (size!9287 a1!451)) (not (= from!577 to!544)) (bvsge from!577 (size!9287 a1!451)))))

(assert (=> start!74168 true))

(declare-fun array_inv!8822 (array!21391) Bool)

(assert (=> start!74168 (and (array_inv!8822 a1!451) e!236367)))

(assert (=> start!74168 (and (array_inv!8822 a2!451) e!236366)))

(declare-fun mapNonEmpty!3504 () Bool)

(declare-fun tp!3505 () Bool)

(assert (=> mapNonEmpty!3504 (= mapRes!3505 (and tp!3505 tp_is_empty!1167))))

(declare-fun mapValue!3505 () T!66933)

(declare-fun mapRest!3505 () (Array (_ BitVec 32) T!66933))

(declare-fun mapKey!3504 () (_ BitVec 32))

(assert (=> mapNonEmpty!3504 (= (arr!10379 a1!451) (store mapRest!3505 mapKey!3504 mapValue!3505))))

(assert (= (and b!327214 condMapEmpty!3505) mapIsEmpty!3504))

(assert (= (and b!327214 (not condMapEmpty!3505)) mapNonEmpty!3504))

(assert (= start!74168 b!327214))

(assert (= (and b!327213 condMapEmpty!3504) mapIsEmpty!3505))

(assert (= (and b!327213 (not condMapEmpty!3504)) mapNonEmpty!3505))

(assert (= start!74168 b!327213))

(declare-fun m!465007 () Bool)

(assert (=> mapNonEmpty!3505 m!465007))

(declare-fun m!465009 () Bool)

(assert (=> start!74168 m!465009))

(declare-fun m!465011 () Bool)

(assert (=> start!74168 m!465011))

(declare-fun m!465013 () Bool)

(assert (=> mapNonEmpty!3504 m!465013))

(check-sat (not start!74168) (not mapNonEmpty!3504) (not mapNonEmpty!3505) tp_is_empty!1167)
(check-sat)
