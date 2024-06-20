; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57156 () Bool)

(assert start!57156)

(declare-fun b!262099 () Bool)

(declare-fun e!182465 () Bool)

(declare-fun e!182467 () Bool)

(assert (=> b!262099 (= e!182465 e!182467)))

(declare-fun res!219361 () Bool)

(assert (=> b!262099 (=> (not res!219361) (not e!182467))))

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45433 0))(
  ( (T!45434 (val!113 Int)) )
))
(declare-datatypes ((array!14570 0))(
  ( (array!14571 (arr!7347 (Array (_ BitVec 32) T!45433)) (size!6360 (_ BitVec 32))) )
))
(declare-fun lt!404005 () array!14570)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14570)

(declare-fun arrayRangesEq!977 (array!14570 array!14570 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262099 (= res!219361 (arrayRangesEq!977 a!416 lt!404005 i!922 at!218))))

(declare-fun v!333 () T!45433)

(assert (=> b!262099 (= lt!404005 (array!14571 (store (arr!7347 a!416) at!218 v!333) (size!6360 a!416)))))

(declare-fun mapNonEmpty!586 () Bool)

(declare-fun mapRes!586 () Bool)

(declare-fun tp!586 () Bool)

(declare-fun tp_is_empty!227 () Bool)

(assert (=> mapNonEmpty!586 (= mapRes!586 (and tp!586 tp_is_empty!227))))

(declare-fun mapValue!586 () T!45433)

(declare-fun mapRest!586 () (Array (_ BitVec 32) T!45433))

(declare-fun mapKey!586 () (_ BitVec 32))

(assert (=> mapNonEmpty!586 (= (arr!7347 a!416) (store mapRest!586 mapKey!586 mapValue!586))))

(declare-fun mapIsEmpty!586 () Bool)

(assert (=> mapIsEmpty!586 mapRes!586))

(declare-fun b!262100 () Bool)

(declare-fun res!219360 () Bool)

(assert (=> b!262100 (=> (not res!219360) (not e!182467))))

(assert (=> b!262100 (= res!219360 (arrayRangesEq!977 a!416 lt!404005 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262098 () Bool)

(declare-fun res!219359 () Bool)

(assert (=> b!262098 (=> (not res!219359) (not e!182467))))

(assert (=> b!262098 (= res!219359 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun res!219362 () Bool)

(assert (=> start!57156 (=> (not res!219362) (not e!182465))))

(assert (=> start!57156 (= res!219362 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6360 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57156 e!182465))

(assert (=> start!57156 true))

(declare-fun e!182466 () Bool)

(declare-fun array_inv!6092 (array!14570) Bool)

(assert (=> start!57156 (and (array_inv!6092 a!416) e!182466)))

(assert (=> start!57156 tp_is_empty!227))

(declare-fun b!262101 () Bool)

(assert (=> b!262101 (= e!182466 (and tp_is_empty!227 mapRes!586))))

(declare-fun condMapEmpty!586 () Bool)

(declare-fun mapDefault!586 () T!45433)

