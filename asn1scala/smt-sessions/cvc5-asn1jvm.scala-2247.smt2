; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57128 () Bool)

(assert start!57128)

(declare-fun mapNonEmpty!544 () Bool)

(declare-fun mapRes!544 () Bool)

(declare-fun tp!544 () Bool)

(declare-fun tp_is_empty!199 () Bool)

(assert (=> mapNonEmpty!544 (= mapRes!544 (and tp!544 tp_is_empty!199))))

(declare-fun mapKey!544 () (_ BitVec 32))

(declare-datatypes ((T!45325 0))(
  ( (T!45326 (val!99 Int)) )
))
(declare-fun mapValue!544 () T!45325)

(declare-datatypes ((array!14542 0))(
  ( (array!14543 (arr!7333 (Array (_ BitVec 32) T!45325)) (size!6346 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14542)

(declare-fun mapRest!544 () (Array (_ BitVec 32) T!45325))

(assert (=> mapNonEmpty!544 (= (arr!7333 a!411) (store mapRest!544 mapKey!544 mapValue!544))))

(declare-fun res!219259 () Bool)

(declare-fun e!182366 () Bool)

(assert (=> start!57128 (=> (not res!219259) (not e!182366))))

(declare-fun at!213 () (_ BitVec 32))

(assert (=> start!57128 (= res!219259 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6346 a!411))))))

(assert (=> start!57128 e!182366))

(assert (=> start!57128 true))

(declare-fun e!182367 () Bool)

(declare-fun array_inv!6080 (array!14542) Bool)

(assert (=> start!57128 (and (array_inv!6080 a!411) e!182367)))

(assert (=> start!57128 tp_is_empty!199))

(declare-fun b!261956 () Bool)

(declare-fun e!182368 () Bool)

(assert (=> b!261956 (= e!182366 e!182368)))

(declare-fun res!219260 () Bool)

(assert (=> b!261956 (=> (not res!219260) (not e!182368))))

(declare-fun lt!403958 () array!14542)

(declare-fun arrayRangesEq!967 (array!14542 array!14542 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261956 (= res!219260 (arrayRangesEq!967 a!411 lt!403958 at!213 at!213))))

(declare-fun v!328 () T!45325)

(assert (=> b!261956 (= lt!403958 (array!14543 (store (arr!7333 a!411) at!213 v!328) (size!6346 a!411)))))

(declare-fun b!261957 () Bool)

(assert (=> b!261957 (= e!182368 (not true))))

(assert (=> b!261957 (arrayRangesEq!967 a!411 lt!403958 #b00000000000000000000000000000000 at!213)))

(declare-datatypes ((Unit!18687 0))(
  ( (Unit!18688) )
))
(declare-fun lt!403957 () Unit!18687)

(declare-fun rec!31 (array!14542 (_ BitVec 32) T!45325 (_ BitVec 32)) Unit!18687)

(assert (=> b!261957 (= lt!403957 (rec!31 a!411 at!213 v!328 at!213))))

(declare-fun b!261958 () Bool)

(assert (=> b!261958 (= e!182367 (and tp_is_empty!199 mapRes!544))))

(declare-fun condMapEmpty!544 () Bool)

(declare-fun mapDefault!544 () T!45325)

