; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57168 () Bool)

(assert start!57168)

(declare-fun res!219425 () Bool)

(declare-fun e!182520 () Bool)

(assert (=> start!57168 (=> (not res!219425) (not e!182520))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((T!45485 0))(
  ( (T!45486 (val!119 Int)) )
))
(declare-datatypes ((array!14582 0))(
  ( (array!14583 (arr!7353 (Array (_ BitVec 32) T!45485)) (size!6366 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14582)

(assert (=> start!57168 (= res!219425 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6366 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57168 e!182520))

(assert (=> start!57168 true))

(declare-fun e!182519 () Bool)

(declare-fun array_inv!6095 (array!14582) Bool)

(assert (=> start!57168 (and (array_inv!6095 a!416) e!182519)))

(declare-fun tp_is_empty!239 () Bool)

(assert (=> start!57168 tp_is_empty!239))

(declare-fun b!262180 () Bool)

(declare-fun res!219423 () Bool)

(declare-fun e!182521 () Bool)

(assert (=> b!262180 (=> (not res!219423) (not e!182521))))

(assert (=> b!262180 (= res!219423 (= i!922 #b00000000000000000000000000000000))))

(declare-fun b!262181 () Bool)

(declare-fun mapRes!604 () Bool)

(assert (=> b!262181 (= e!182519 (and tp_is_empty!239 mapRes!604))))

(declare-fun condMapEmpty!604 () Bool)

(declare-fun mapDefault!604 () T!45485)

