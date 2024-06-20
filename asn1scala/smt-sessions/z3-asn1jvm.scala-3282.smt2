; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74186 () Bool)

(assert start!74186)

(declare-fun b!327267 () Bool)

(declare-fun e!236420 () Bool)

(declare-fun tp_is_empty!1185 () Bool)

(declare-fun mapRes!3558 () Bool)

(assert (=> b!327267 (= e!236420 (and tp_is_empty!1185 mapRes!3558))))

(declare-fun condMapEmpty!3558 () Bool)

(declare-datatypes ((T!67011 0))(
  ( (T!67012 (val!592 Int)) )
))
(declare-datatypes ((array!21409 0))(
  ( (array!21410 (arr!10388 (Array (_ BitVec 32) T!67011)) (size!9296 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21409)

(declare-fun mapDefault!3558 () T!67011)

(assert (=> b!327267 (= condMapEmpty!3558 (= (arr!10388 a2!451) ((as const (Array (_ BitVec 32) T!67011)) mapDefault!3558)))))

(declare-fun mapIsEmpty!3558 () Bool)

(declare-fun mapRes!3559 () Bool)

(assert (=> mapIsEmpty!3558 mapRes!3559))

(declare-fun a1!451 () array!21409)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(assert (=> start!74186 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9296 a1!451) (size!9296 a2!451)) (bvsle to!544 (size!9296 a1!451)) (not (= from!577 to!544)) (= (select (arr!10388 a1!451) from!577) (select (arr!10388 a2!451) from!577)) (bvsge (bvsub to!544 (bvadd #b00000000000000000000000000000001 from!577)) (bvsub to!544 from!577)))))

(assert (=> start!74186 true))

(declare-fun e!236421 () Bool)

(declare-fun array_inv!8829 (array!21409) Bool)

(assert (=> start!74186 (and (array_inv!8829 a1!451) e!236421)))

(assert (=> start!74186 (and (array_inv!8829 a2!451) e!236420)))

(declare-fun b!327268 () Bool)

(assert (=> b!327268 (= e!236421 (and tp_is_empty!1185 mapRes!3559))))

(declare-fun condMapEmpty!3559 () Bool)

(declare-fun mapDefault!3559 () T!67011)

(assert (=> b!327268 (= condMapEmpty!3559 (= (arr!10388 a1!451) ((as const (Array (_ BitVec 32) T!67011)) mapDefault!3559)))))

(declare-fun mapNonEmpty!3558 () Bool)

(declare-fun tp!3558 () Bool)

(assert (=> mapNonEmpty!3558 (= mapRes!3558 (and tp!3558 tp_is_empty!1185))))

(declare-fun mapValue!3558 () T!67011)

(declare-fun mapKey!3558 () (_ BitVec 32))

(declare-fun mapRest!3558 () (Array (_ BitVec 32) T!67011))

(assert (=> mapNonEmpty!3558 (= (arr!10388 a2!451) (store mapRest!3558 mapKey!3558 mapValue!3558))))

(declare-fun mapNonEmpty!3559 () Bool)

(declare-fun tp!3559 () Bool)

(assert (=> mapNonEmpty!3559 (= mapRes!3559 (and tp!3559 tp_is_empty!1185))))

(declare-fun mapRest!3559 () (Array (_ BitVec 32) T!67011))

(declare-fun mapValue!3559 () T!67011)

(declare-fun mapKey!3559 () (_ BitVec 32))

(assert (=> mapNonEmpty!3559 (= (arr!10388 a1!451) (store mapRest!3559 mapKey!3559 mapValue!3559))))

(declare-fun mapIsEmpty!3559 () Bool)

(assert (=> mapIsEmpty!3559 mapRes!3558))

(assert (= (and b!327268 condMapEmpty!3559) mapIsEmpty!3558))

(assert (= (and b!327268 (not condMapEmpty!3559)) mapNonEmpty!3559))

(assert (= start!74186 b!327268))

(assert (= (and b!327267 condMapEmpty!3558) mapIsEmpty!3559))

(assert (= (and b!327267 (not condMapEmpty!3558)) mapNonEmpty!3558))

(assert (= start!74186 b!327267))

(declare-fun m!465095 () Bool)

(assert (=> start!74186 m!465095))

(declare-fun m!465097 () Bool)

(assert (=> start!74186 m!465097))

(declare-fun m!465099 () Bool)

(assert (=> start!74186 m!465099))

(declare-fun m!465101 () Bool)

(assert (=> start!74186 m!465101))

(declare-fun m!465103 () Bool)

(assert (=> mapNonEmpty!3558 m!465103))

(declare-fun m!465105 () Bool)

(assert (=> mapNonEmpty!3559 m!465105))

(check-sat (not start!74186) (not mapNonEmpty!3559) (not mapNonEmpty!3558) tp_is_empty!1185)
(check-sat)
