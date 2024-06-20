; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57138 () Bool)

(assert start!57138)

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45355 0))(
  ( (T!45356 (val!104 Int)) )
))
(declare-datatypes ((array!14552 0))(
  ( (array!14553 (arr!7338 (Array (_ BitVec 32) T!45355)) (size!6351 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14552)

(declare-fun i!922 () (_ BitVec 32))

(assert (=> start!57138 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6351 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218) (bvsgt at!218 (size!6351 a!416)))))

(assert (=> start!57138 true))

(declare-fun e!182395 () Bool)

(declare-fun array_inv!6084 (array!14552) Bool)

(assert (=> start!57138 (and (array_inv!6084 a!416) e!182395)))

(declare-fun b!261985 () Bool)

(declare-fun tp_is_empty!209 () Bool)

(declare-fun mapRes!559 () Bool)

(assert (=> b!261985 (= e!182395 (and tp_is_empty!209 mapRes!559))))

(declare-fun condMapEmpty!559 () Bool)

(declare-fun mapDefault!559 () T!45355)

