; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57182 () Bool)

(assert start!57182)

(declare-fun b!262246 () Bool)

(declare-fun e!182564 () Bool)

(declare-fun e!182565 () Bool)

(assert (=> b!262246 (= e!182564 e!182565)))

(declare-fun res!219468 () Bool)

(assert (=> b!262246 (=> (not res!219468) (not e!182565))))

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45559 0))(
  ( (T!45560 (val!126 Int)) )
))
(declare-datatypes ((array!14596 0))(
  ( (array!14597 (arr!7360 (Array (_ BitVec 32) T!45559)) (size!6373 (_ BitVec 32))) )
))
(declare-fun lt!404036 () array!14596)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14596)

(declare-fun arrayRangesEq!987 (array!14596 array!14596 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262246 (= res!219468 (arrayRangesEq!987 a!416 lt!404036 i!922 at!218))))

(declare-fun v!333 () T!45559)

(assert (=> b!262246 (= lt!404036 (array!14597 (store (arr!7360 a!416) at!218 v!333) (size!6373 a!416)))))

(declare-fun b!262247 () Bool)

(assert (=> b!262247 (= e!182565 (not (arrayRangesEq!987 a!416 lt!404036 (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun res!219470 () Bool)

(assert (=> start!57182 (=> (not res!219470) (not e!182564))))

(assert (=> start!57182 (= res!219470 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6373 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57182 e!182564))

(assert (=> start!57182 true))

(declare-fun e!182566 () Bool)

(declare-fun array_inv!6101 (array!14596) Bool)

(assert (=> start!57182 (and (array_inv!6101 a!416) e!182566)))

(declare-fun tp_is_empty!253 () Bool)

(assert (=> start!57182 tp_is_empty!253))

(declare-fun mapNonEmpty!625 () Bool)

(declare-fun mapRes!625 () Bool)

(declare-fun tp!625 () Bool)

(assert (=> mapNonEmpty!625 (= mapRes!625 (and tp!625 tp_is_empty!253))))

(declare-fun mapRest!625 () (Array (_ BitVec 32) T!45559))

(declare-fun mapValue!625 () T!45559)

(declare-fun mapKey!625 () (_ BitVec 32))

(assert (=> mapNonEmpty!625 (= (arr!7360 a!416) (store mapRest!625 mapKey!625 mapValue!625))))

(declare-fun mapIsEmpty!625 () Bool)

(assert (=> mapIsEmpty!625 mapRes!625))

(declare-fun b!262248 () Bool)

(assert (=> b!262248 (= e!182566 (and tp_is_empty!253 mapRes!625))))

(declare-fun condMapEmpty!625 () Bool)

(declare-fun mapDefault!625 () T!45559)

