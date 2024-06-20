; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24580 () Bool)

(assert start!24580)

(declare-fun mapIsEmpty!464 () Bool)

(declare-fun mapRes!464 () Bool)

(assert (=> mapIsEmpty!464 mapRes!464))

(declare-datatypes ((T!17079 0))(
  ( (T!17080 (val!76 Int)) )
))
(declare-datatypes ((array!5545 0))(
  ( (array!5546 (arr!3103 (Array (_ BitVec 32) T!17079)) (size!2510 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5545)

(declare-fun toA1!7 () (_ BitVec 32))

(declare-fun fromA1!7 () (_ BitVec 32))

(declare-fun a1!447 () array!5545)

(declare-fun fromA2!7 () (_ BitVec 32))

(assert (=> start!24580 (and (bvsle #b00000000000000000000000000000000 fromA1!7) (bvsle fromA1!7 toA1!7) (bvsle toA1!7 (size!2510 a1!447)) (bvsle #b00000000000000000000000000000000 fromA2!7) (bvsle fromA2!7 (bvsub (size!2510 a2!447) (bvsub toA1!7 fromA1!7))) (not (= fromA1!7 toA1!7)) (= (select (arr!3103 a1!447) fromA1!7) (select (arr!3103 a2!447) fromA2!7)) (= (bvand fromA2!7 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromA2!7 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromA2!7) #b10000000000000000000000000000000))))))

(declare-fun e!81851 () Bool)

(declare-fun array_inv!2302 (array!5545) Bool)

(assert (=> start!24580 (and (array_inv!2302 a2!447) e!81851)))

(assert (=> start!24580 true))

(declare-fun e!81850 () Bool)

(assert (=> start!24580 (and (array_inv!2302 a1!447) e!81850)))

(declare-fun mapIsEmpty!465 () Bool)

(declare-fun mapRes!465 () Bool)

(assert (=> mapIsEmpty!465 mapRes!465))

(declare-fun b!124718 () Bool)

(declare-fun tp_is_empty!153 () Bool)

(assert (=> b!124718 (= e!81850 (and tp_is_empty!153 mapRes!465))))

(declare-fun condMapEmpty!464 () Bool)

(declare-fun mapDefault!464 () T!17079)

(assert (=> b!124718 (= condMapEmpty!464 (= (arr!3103 a1!447) ((as const (Array (_ BitVec 32) T!17079)) mapDefault!464)))))

(declare-fun mapNonEmpty!464 () Bool)

(declare-fun tp!465 () Bool)

(assert (=> mapNonEmpty!464 (= mapRes!465 (and tp!465 tp_is_empty!153))))

(declare-fun mapValue!465 () T!17079)

(declare-fun mapRest!465 () (Array (_ BitVec 32) T!17079))

(declare-fun mapKey!464 () (_ BitVec 32))

(assert (=> mapNonEmpty!464 (= (arr!3103 a1!447) (store mapRest!465 mapKey!464 mapValue!465))))

(declare-fun b!124719 () Bool)

(assert (=> b!124719 (= e!81851 (and tp_is_empty!153 mapRes!464))))

(declare-fun condMapEmpty!465 () Bool)

(declare-fun mapDefault!465 () T!17079)

(assert (=> b!124719 (= condMapEmpty!465 (= (arr!3103 a2!447) ((as const (Array (_ BitVec 32) T!17079)) mapDefault!465)))))

(declare-fun mapNonEmpty!465 () Bool)

(declare-fun tp!464 () Bool)

(assert (=> mapNonEmpty!465 (= mapRes!464 (and tp!464 tp_is_empty!153))))

(declare-fun mapValue!464 () T!17079)

(declare-fun mapKey!465 () (_ BitVec 32))

(declare-fun mapRest!464 () (Array (_ BitVec 32) T!17079))

(assert (=> mapNonEmpty!465 (= (arr!3103 a2!447) (store mapRest!464 mapKey!465 mapValue!464))))

(assert (= (and b!124719 condMapEmpty!465) mapIsEmpty!464))

(assert (= (and b!124719 (not condMapEmpty!465)) mapNonEmpty!465))

(assert (= start!24580 b!124719))

(assert (= (and b!124718 condMapEmpty!464) mapIsEmpty!465))

(assert (= (and b!124718 (not condMapEmpty!464)) mapNonEmpty!464))

(assert (= start!24580 b!124718))

(declare-fun m!190025 () Bool)

(assert (=> start!24580 m!190025))

(declare-fun m!190027 () Bool)

(assert (=> start!24580 m!190027))

(declare-fun m!190029 () Bool)

(assert (=> start!24580 m!190029))

(declare-fun m!190031 () Bool)

(assert (=> start!24580 m!190031))

(declare-fun m!190033 () Bool)

(assert (=> mapNonEmpty!464 m!190033))

(declare-fun m!190035 () Bool)

(assert (=> mapNonEmpty!465 m!190035))

(check-sat (not start!24580) (not mapNonEmpty!464) (not mapNonEmpty!465) tp_is_empty!153)
(check-sat)
(get-model)

(declare-fun d!40598 () Bool)

(assert (=> d!40598 (= (array_inv!2302 a2!447) (bvsge (size!2510 a2!447) #b00000000000000000000000000000000))))

(assert (=> start!24580 d!40598))

(declare-fun d!40600 () Bool)

(assert (=> d!40600 (= (array_inv!2302 a1!447) (bvsge (size!2510 a1!447) #b00000000000000000000000000000000))))

(assert (=> start!24580 d!40600))

(declare-fun condMapEmpty!474 () Bool)

(declare-fun mapDefault!474 () T!17079)

(assert (=> mapNonEmpty!464 (= condMapEmpty!474 (= mapRest!465 ((as const (Array (_ BitVec 32) T!17079)) mapDefault!474)))))

(declare-fun mapRes!474 () Bool)

(assert (=> mapNonEmpty!464 (= tp!465 (and tp_is_empty!153 mapRes!474))))

(declare-fun mapIsEmpty!474 () Bool)

(assert (=> mapIsEmpty!474 mapRes!474))

(declare-fun mapNonEmpty!474 () Bool)

(declare-fun tp!474 () Bool)

(assert (=> mapNonEmpty!474 (= mapRes!474 (and tp!474 tp_is_empty!153))))

(declare-fun mapRest!474 () (Array (_ BitVec 32) T!17079))

(declare-fun mapValue!474 () T!17079)

(declare-fun mapKey!474 () (_ BitVec 32))

(assert (=> mapNonEmpty!474 (= mapRest!465 (store mapRest!474 mapKey!474 mapValue!474))))

(assert (= (and mapNonEmpty!464 condMapEmpty!474) mapIsEmpty!474))

(assert (= (and mapNonEmpty!464 (not condMapEmpty!474)) mapNonEmpty!474))

(declare-fun m!190049 () Bool)

(assert (=> mapNonEmpty!474 m!190049))

(declare-fun condMapEmpty!475 () Bool)

(declare-fun mapDefault!475 () T!17079)

(assert (=> mapNonEmpty!465 (= condMapEmpty!475 (= mapRest!464 ((as const (Array (_ BitVec 32) T!17079)) mapDefault!475)))))

(declare-fun mapRes!475 () Bool)

(assert (=> mapNonEmpty!465 (= tp!464 (and tp_is_empty!153 mapRes!475))))

(declare-fun mapIsEmpty!475 () Bool)

(assert (=> mapIsEmpty!475 mapRes!475))

(declare-fun mapNonEmpty!475 () Bool)

(declare-fun tp!475 () Bool)

(assert (=> mapNonEmpty!475 (= mapRes!475 (and tp!475 tp_is_empty!153))))

(declare-fun mapRest!475 () (Array (_ BitVec 32) T!17079))

(declare-fun mapKey!475 () (_ BitVec 32))

(declare-fun mapValue!475 () T!17079)

(assert (=> mapNonEmpty!475 (= mapRest!464 (store mapRest!475 mapKey!475 mapValue!475))))

(assert (= (and mapNonEmpty!465 condMapEmpty!475) mapIsEmpty!475))

(assert (= (and mapNonEmpty!465 (not condMapEmpty!475)) mapNonEmpty!475))

(declare-fun m!190051 () Bool)

(assert (=> mapNonEmpty!475 m!190051))

(check-sat (not mapNonEmpty!475) (not mapNonEmpty!474) tp_is_empty!153)
(check-sat)
