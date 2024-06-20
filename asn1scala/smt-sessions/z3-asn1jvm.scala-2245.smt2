; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57114 () Bool)

(assert start!57114)

(declare-fun mapNonEmpty!526 () Bool)

(declare-fun mapRes!526 () Bool)

(declare-fun tp!526 () Bool)

(declare-fun tp_is_empty!189 () Bool)

(assert (=> mapNonEmpty!526 (= mapRes!526 (and tp!526 tp_is_empty!189))))

(declare-fun mapKey!526 () (_ BitVec 32))

(declare-datatypes ((T!45275 0))(
  ( (T!45276 (val!94 Int)) )
))
(declare-datatypes ((array!14531 0))(
  ( (array!14532 (arr!7328 (Array (_ BitVec 32) T!45275)) (size!6341 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14531)

(declare-fun mapValue!526 () T!45275)

(declare-fun mapRest!526 () (Array (_ BitVec 32) T!45275))

(assert (=> mapNonEmpty!526 (= (arr!7328 a!411) (store mapRest!526 mapKey!526 mapValue!526))))

(declare-fun res!219227 () Bool)

(declare-fun e!182319 () Bool)

(assert (=> start!57114 (=> (not res!219227) (not e!182319))))

(declare-fun at!213 () (_ BitVec 32))

(assert (=> start!57114 (= res!219227 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6341 a!411))))))

(assert (=> start!57114 e!182319))

(assert (=> start!57114 true))

(declare-fun e!182320 () Bool)

(declare-fun array_inv!6078 (array!14531) Bool)

(assert (=> start!57114 (and (array_inv!6078 a!411) e!182320)))

(assert (=> start!57114 tp_is_empty!189))

(declare-fun b!261908 () Bool)

(assert (=> b!261908 (= e!182320 (and tp_is_empty!189 mapRes!526))))

(declare-fun condMapEmpty!526 () Bool)

(declare-fun mapDefault!526 () T!45275)

(assert (=> b!261908 (= condMapEmpty!526 (= (arr!7328 a!411) ((as const (Array (_ BitVec 32) T!45275)) mapDefault!526)))))

(declare-fun mapIsEmpty!526 () Bool)

(assert (=> mapIsEmpty!526 mapRes!526))

(declare-fun b!261907 () Bool)

(declare-fun v!328 () T!45275)

(declare-fun arrayRangesEq!963 (array!14531 array!14531 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261907 (= e!182319 (not (arrayRangesEq!963 a!411 (array!14532 (store (arr!7328 a!411) at!213 v!328) (size!6341 a!411)) at!213 at!213)))))

(assert (= (and start!57114 res!219227) b!261907))

(assert (= (and b!261908 condMapEmpty!526) mapIsEmpty!526))

(assert (= (and b!261908 (not condMapEmpty!526)) mapNonEmpty!526))

(assert (= start!57114 b!261908))

(declare-fun m!391971 () Bool)

(assert (=> mapNonEmpty!526 m!391971))

(declare-fun m!391973 () Bool)

(assert (=> start!57114 m!391973))

(declare-fun m!391975 () Bool)

(assert (=> b!261907 m!391975))

(declare-fun m!391977 () Bool)

(assert (=> b!261907 m!391977))

(check-sat (not b!261907) (not start!57114) (not mapNonEmpty!526) tp_is_empty!189)
(check-sat)
(get-model)

(declare-fun d!88408 () Bool)

(declare-fun res!219235 () Bool)

(declare-fun e!182331 () Bool)

(assert (=> d!88408 (=> res!219235 e!182331)))

(assert (=> d!88408 (= res!219235 (= at!213 at!213))))

(assert (=> d!88408 (= (arrayRangesEq!963 a!411 (array!14532 (store (arr!7328 a!411) at!213 v!328) (size!6341 a!411)) at!213 at!213) e!182331)))

(declare-fun b!261919 () Bool)

(declare-fun e!182332 () Bool)

(assert (=> b!261919 (= e!182331 e!182332)))

(declare-fun res!219236 () Bool)

(assert (=> b!261919 (=> (not res!219236) (not e!182332))))

(assert (=> b!261919 (= res!219236 (= (select (arr!7328 a!411) at!213) (select (arr!7328 (array!14532 (store (arr!7328 a!411) at!213 v!328) (size!6341 a!411))) at!213)))))

(declare-fun b!261920 () Bool)

(assert (=> b!261920 (= e!182332 (arrayRangesEq!963 a!411 (array!14532 (store (arr!7328 a!411) at!213 v!328) (size!6341 a!411)) (bvadd at!213 #b00000000000000000000000000000001) at!213))))

(assert (= (and d!88408 (not res!219235)) b!261919))

(assert (= (and b!261919 res!219236) b!261920))

(declare-fun m!391987 () Bool)

(assert (=> b!261919 m!391987))

(declare-fun m!391989 () Bool)

(assert (=> b!261919 m!391989))

(declare-fun m!391991 () Bool)

(assert (=> b!261920 m!391991))

(assert (=> b!261907 d!88408))

(declare-fun d!88410 () Bool)

(assert (=> d!88410 (= (array_inv!6078 a!411) (bvsge (size!6341 a!411) #b00000000000000000000000000000000))))

(assert (=> start!57114 d!88410))

(declare-fun condMapEmpty!532 () Bool)

(declare-fun mapDefault!532 () T!45275)

(assert (=> mapNonEmpty!526 (= condMapEmpty!532 (= mapRest!526 ((as const (Array (_ BitVec 32) T!45275)) mapDefault!532)))))

(declare-fun mapRes!532 () Bool)

(assert (=> mapNonEmpty!526 (= tp!526 (and tp_is_empty!189 mapRes!532))))

(declare-fun mapIsEmpty!532 () Bool)

(assert (=> mapIsEmpty!532 mapRes!532))

(declare-fun mapNonEmpty!532 () Bool)

(declare-fun tp!532 () Bool)

(assert (=> mapNonEmpty!532 (= mapRes!532 (and tp!532 tp_is_empty!189))))

(declare-fun mapKey!532 () (_ BitVec 32))

(declare-fun mapRest!532 () (Array (_ BitVec 32) T!45275))

(declare-fun mapValue!532 () T!45275)

(assert (=> mapNonEmpty!532 (= mapRest!526 (store mapRest!532 mapKey!532 mapValue!532))))

(assert (= (and mapNonEmpty!526 condMapEmpty!532) mapIsEmpty!532))

(assert (= (and mapNonEmpty!526 (not condMapEmpty!532)) mapNonEmpty!532))

(declare-fun m!391993 () Bool)

(assert (=> mapNonEmpty!532 m!391993))

(check-sat (not b!261920) (not mapNonEmpty!532) tp_is_empty!189)
(check-sat)
