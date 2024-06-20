; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57150 () Bool)

(assert start!57150)

(declare-fun mapNonEmpty!577 () Bool)

(declare-fun mapRes!577 () Bool)

(declare-fun tp!577 () Bool)

(declare-fun tp_is_empty!221 () Bool)

(assert (=> mapNonEmpty!577 (= mapRes!577 (and tp!577 tp_is_empty!221))))

(declare-datatypes ((T!45407 0))(
  ( (T!45408 (val!110 Int)) )
))
(declare-datatypes ((array!14564 0))(
  ( (array!14565 (arr!7344 (Array (_ BitVec 32) T!45407)) (size!6357 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14564)

(declare-fun mapRest!577 () (Array (_ BitVec 32) T!45407))

(declare-fun mapKey!577 () (_ BitVec 32))

(declare-fun mapValue!577 () T!45407)

(assert (=> mapNonEmpty!577 (= (arr!7344 a!416) (store mapRest!577 mapKey!577 mapValue!577))))

(declare-fun b!262053 () Bool)

(declare-fun res!219323 () Bool)

(declare-fun e!182440 () Bool)

(assert (=> b!262053 (=> (not res!219323) (not e!182440))))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(assert (=> b!262053 (= res!219323 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262054 () Bool)

(assert (=> b!262054 (= e!182440 (not true))))

(declare-fun lt!403988 () array!14564)

(declare-fun arrayRangesEq!974 (array!14564 array!14564 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262054 (arrayRangesEq!974 a!416 lt!403988 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18697 0))(
  ( (Unit!18698) )
))
(declare-fun lt!403987 () Unit!18697)

(declare-fun v!333 () T!45407)

(declare-fun rec!36 (array!14564 (_ BitVec 32) T!45407 (_ BitVec 32)) Unit!18697)

(assert (=> b!262054 (= lt!403987 (rec!36 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun res!219325 () Bool)

(declare-fun e!182438 () Bool)

(assert (=> start!57150 (=> (not res!219325) (not e!182438))))

(assert (=> start!57150 (= res!219325 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6357 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57150 e!182438))

(assert (=> start!57150 true))

(declare-fun e!182439 () Bool)

(declare-fun array_inv!6089 (array!14564) Bool)

(assert (=> start!57150 (and (array_inv!6089 a!416) e!182439)))

(assert (=> start!57150 tp_is_empty!221))

(declare-fun mapIsEmpty!577 () Bool)

(assert (=> mapIsEmpty!577 mapRes!577))

(declare-fun b!262055 () Bool)

(assert (=> b!262055 (= e!182439 (and tp_is_empty!221 mapRes!577))))

(declare-fun condMapEmpty!577 () Bool)

(declare-fun mapDefault!577 () T!45407)

