; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24532 () Bool)

(assert start!24532)

(declare-fun mapIsEmpty!335 () Bool)

(declare-fun mapRes!336 () Bool)

(assert (=> mapIsEmpty!335 mapRes!336))

(declare-fun mapNonEmpty!335 () Bool)

(declare-fun tp!335 () Bool)

(declare-fun tp_is_empty!111 () Bool)

(assert (=> mapNonEmpty!335 (= mapRes!336 (and tp!335 tp_is_empty!111))))

(declare-datatypes ((T!16897 0))(
  ( (T!16898 (val!55 Int)) )
))
(declare-datatypes ((array!5500 0))(
  ( (array!5501 (arr!3082 (Array (_ BitVec 32) T!16897)) (size!2489 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5500)

(declare-fun mapValue!335 () T!16897)

(declare-fun mapRest!335 () (Array (_ BitVec 32) T!16897))

(declare-fun mapKey!335 () (_ BitVec 32))

(assert (=> mapNonEmpty!335 (= (arr!3082 a2!447) (store mapRest!335 mapKey!335 mapValue!335))))

(declare-fun mapIsEmpty!336 () Bool)

(declare-fun mapRes!335 () Bool)

(assert (=> mapIsEmpty!336 mapRes!335))

(declare-fun mapNonEmpty!336 () Bool)

(declare-fun tp!336 () Bool)

(assert (=> mapNonEmpty!336 (= mapRes!335 (and tp!336 tp_is_empty!111))))

(declare-fun a1!447 () array!5500)

(declare-fun mapValue!336 () T!16897)

(declare-fun mapRest!336 () (Array (_ BitVec 32) T!16897))

(declare-fun mapKey!336 () (_ BitVec 32))

(assert (=> mapNonEmpty!336 (= (arr!3082 a1!447) (store mapRest!336 mapKey!336 mapValue!336))))

(declare-fun b!124596 () Bool)

(declare-fun e!81733 () Bool)

(assert (=> b!124596 (= e!81733 (and tp_is_empty!111 mapRes!335))))

(declare-fun condMapEmpty!336 () Bool)

(declare-fun mapDefault!335 () T!16897)

(assert (=> b!124596 (= condMapEmpty!336 (= (arr!3082 a1!447) ((as const (Array (_ BitVec 32) T!16897)) mapDefault!335)))))

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(assert (=> start!24532 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2489 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2489 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3082 a1!447) fromA1!7) (select (arr!3082 a2!447) fromA2!7)) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA1!7)) (bvsle (bvadd #b00000000000000000000000000000001 fromA1!7) toA1!7) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 fromA2!7)))))

(declare-fun e!81734 () Bool)

(declare-fun array_inv!2290 (array!5500) Bool)

(assert (=> start!24532 (and (array_inv!2290 a2!447) e!81734)))

(assert (=> start!24532 true))

(assert (=> start!24532 (and (array_inv!2290 a1!447) e!81733)))

(declare-fun b!124595 () Bool)

(assert (=> b!124595 (= e!81734 (and tp_is_empty!111 mapRes!336))))

(declare-fun condMapEmpty!335 () Bool)

(declare-fun mapDefault!336 () T!16897)

(assert (=> b!124595 (= condMapEmpty!335 (= (arr!3082 a2!447) ((as const (Array (_ BitVec 32) T!16897)) mapDefault!336)))))

(assert (= (and b!124595 condMapEmpty!335) mapIsEmpty!335))

(assert (= (and b!124595 (not condMapEmpty!335)) mapNonEmpty!335))

(assert (= start!24532 b!124595))

(assert (= (and b!124596 condMapEmpty!336) mapIsEmpty!336))

(assert (= (and b!124596 (not condMapEmpty!336)) mapNonEmpty!336))

(assert (= start!24532 b!124596))

(declare-fun m!189833 () Bool)

(assert (=> mapNonEmpty!335 m!189833))

(declare-fun m!189835 () Bool)

(assert (=> mapNonEmpty!336 m!189835))

(declare-fun m!189837 () Bool)

(assert (=> start!24532 m!189837))

(declare-fun m!189839 () Bool)

(assert (=> start!24532 m!189839))

(declare-fun m!189841 () Bool)

(assert (=> start!24532 m!189841))

(declare-fun m!189843 () Bool)

(assert (=> start!24532 m!189843))

(check-sat (not start!24532) (not mapNonEmpty!336) (not mapNonEmpty!335) tp_is_empty!111)
(check-sat)
(get-model)

(declare-fun d!40572 () Bool)

(assert (=> d!40572 (= (array_inv!2290 a2!447) (bvsge (size!2489 a2!447) #b00000000000000000000000000000000))))

(assert (=> start!24532 d!40572))

(declare-fun d!40574 () Bool)

(assert (=> d!40574 (= (array_inv!2290 a1!447) (bvsge (size!2489 a1!447) #b00000000000000000000000000000000))))

(assert (=> start!24532 d!40574))

(declare-fun condMapEmpty!345 () Bool)

(declare-fun mapDefault!345 () T!16897)

(assert (=> mapNonEmpty!336 (= condMapEmpty!345 (= mapRest!336 ((as const (Array (_ BitVec 32) T!16897)) mapDefault!345)))))

(declare-fun mapRes!345 () Bool)

(assert (=> mapNonEmpty!336 (= tp!336 (and tp_is_empty!111 mapRes!345))))

(declare-fun mapIsEmpty!345 () Bool)

(assert (=> mapIsEmpty!345 mapRes!345))

(declare-fun mapNonEmpty!345 () Bool)

(declare-fun tp!345 () Bool)

(assert (=> mapNonEmpty!345 (= mapRes!345 (and tp!345 tp_is_empty!111))))

(declare-fun mapRest!345 () (Array (_ BitVec 32) T!16897))

(declare-fun mapValue!345 () T!16897)

(declare-fun mapKey!345 () (_ BitVec 32))

(assert (=> mapNonEmpty!345 (= mapRest!336 (store mapRest!345 mapKey!345 mapValue!345))))

(assert (= (and mapNonEmpty!336 condMapEmpty!345) mapIsEmpty!345))

(assert (= (and mapNonEmpty!336 (not condMapEmpty!345)) mapNonEmpty!345))

(declare-fun m!189857 () Bool)

(assert (=> mapNonEmpty!345 m!189857))

(declare-fun condMapEmpty!346 () Bool)

(declare-fun mapDefault!346 () T!16897)

(assert (=> mapNonEmpty!335 (= condMapEmpty!346 (= mapRest!335 ((as const (Array (_ BitVec 32) T!16897)) mapDefault!346)))))

(declare-fun mapRes!346 () Bool)

(assert (=> mapNonEmpty!335 (= tp!335 (and tp_is_empty!111 mapRes!346))))

(declare-fun mapIsEmpty!346 () Bool)

(assert (=> mapIsEmpty!346 mapRes!346))

(declare-fun mapNonEmpty!346 () Bool)

(declare-fun tp!346 () Bool)

(assert (=> mapNonEmpty!346 (= mapRes!346 (and tp!346 tp_is_empty!111))))

(declare-fun mapValue!346 () T!16897)

(declare-fun mapRest!346 () (Array (_ BitVec 32) T!16897))

(declare-fun mapKey!346 () (_ BitVec 32))

(assert (=> mapNonEmpty!346 (= mapRest!335 (store mapRest!346 mapKey!346 mapValue!346))))

(assert (= (and mapNonEmpty!335 condMapEmpty!346) mapIsEmpty!346))

(assert (= (and mapNonEmpty!335 (not condMapEmpty!346)) mapNonEmpty!346))

(declare-fun m!189859 () Bool)

(assert (=> mapNonEmpty!346 m!189859))

(check-sat (not mapNonEmpty!345) (not mapNonEmpty!346) tp_is_empty!111)
(check-sat)
