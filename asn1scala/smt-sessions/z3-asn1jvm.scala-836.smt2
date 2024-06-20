; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24574 () Bool)

(assert start!24574)

(declare-fun mapNonEmpty!446 () Bool)

(declare-fun mapRes!447 () Bool)

(declare-fun tp!446 () Bool)

(declare-fun tp_is_empty!147 () Bool)

(assert (=> mapNonEmpty!446 (= mapRes!447 (and tp!446 tp_is_empty!147))))

(declare-datatypes ((T!17053 0))(
  ( (T!17054 (val!73 Int)) )
))
(declare-fun mapRest!446 () (Array (_ BitVec 32) T!17053))

(declare-datatypes ((array!5539 0))(
  ( (array!5540 (arr!3100 (Array (_ BitVec 32) T!17053)) (size!2507 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5539)

(declare-fun mapValue!447 () T!17053)

(declare-fun mapKey!447 () (_ BitVec 32))

(assert (=> mapNonEmpty!446 (= (arr!3100 a2!447) (store mapRest!446 mapKey!447 mapValue!447))))

(declare-fun mapIsEmpty!446 () Bool)

(assert (=> mapIsEmpty!446 mapRes!447))

(declare-fun b!124700 () Bool)

(declare-fun e!81832 () Bool)

(assert (=> b!124700 (= e!81832 (and tp_is_empty!147 mapRes!447))))

(declare-fun condMapEmpty!447 () Bool)

(declare-fun mapDefault!446 () T!17053)

(assert (=> b!124700 (= condMapEmpty!447 (= (arr!3100 a2!447) ((as const (Array (_ BitVec 32) T!17053)) mapDefault!446)))))

(declare-fun mapIsEmpty!447 () Bool)

(declare-fun mapRes!446 () Bool)

(assert (=> mapIsEmpty!447 mapRes!446))

(declare-fun b!124701 () Bool)

(declare-fun e!81833 () Bool)

(assert (=> b!124701 (= e!81833 (and tp_is_empty!147 mapRes!446))))

(declare-fun condMapEmpty!446 () Bool)

(declare-fun a1!447 () array!5539)

(declare-fun mapDefault!447 () T!17053)

(assert (=> b!124701 (= condMapEmpty!446 (= (arr!3100 a1!447) ((as const (Array (_ BitVec 32) T!17053)) mapDefault!447)))))

(declare-fun fromA2!7 () (_ BitVec 32))

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(assert (=> start!24574 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2507 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2507 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3100 a1!447) fromA1!7) (select (arr!3100 a2!447) fromA2!7)) (= (bvand fromA1!7 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromA1!7 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromA1!7) #b10000000000000000000000000000000))))))

(declare-fun array_inv!2301 (array!5539) Bool)

(assert (=> start!24574 (and (array_inv!2301 a2!447) e!81832)))

(assert (=> start!24574 true))

(assert (=> start!24574 (and (array_inv!2301 a1!447) e!81833)))

(declare-fun mapNonEmpty!447 () Bool)

(declare-fun tp!447 () Bool)

(assert (=> mapNonEmpty!447 (= mapRes!446 (and tp!447 tp_is_empty!147))))

(declare-fun mapKey!446 () (_ BitVec 32))

(declare-fun mapRest!447 () (Array (_ BitVec 32) T!17053))

(declare-fun mapValue!446 () T!17053)

(assert (=> mapNonEmpty!447 (= (arr!3100 a1!447) (store mapRest!447 mapKey!446 mapValue!446))))

(assert (= (and b!124700 condMapEmpty!447) mapIsEmpty!446))

(assert (= (and b!124700 (not condMapEmpty!447)) mapNonEmpty!446))

(assert (= start!24574 b!124700))

(assert (= (and b!124701 condMapEmpty!446) mapIsEmpty!447))

(assert (= (and b!124701 (not condMapEmpty!446)) mapNonEmpty!447))

(assert (= start!24574 b!124701))

(declare-fun m!189989 () Bool)

(assert (=> mapNonEmpty!446 m!189989))

(declare-fun m!189991 () Bool)

(assert (=> start!24574 m!189991))

(declare-fun m!189993 () Bool)

(assert (=> start!24574 m!189993))

(declare-fun m!189995 () Bool)

(assert (=> start!24574 m!189995))

(declare-fun m!189997 () Bool)

(assert (=> start!24574 m!189997))

(declare-fun m!189999 () Bool)

(assert (=> mapNonEmpty!447 m!189999))

(check-sat (not start!24574) (not mapNonEmpty!446) (not mapNonEmpty!447) tp_is_empty!147)
(check-sat)
