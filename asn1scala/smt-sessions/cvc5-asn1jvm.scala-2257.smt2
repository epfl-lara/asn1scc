; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57192 () Bool)

(assert start!57192)

(declare-fun b!262294 () Bool)

(declare-fun e!182599 () Bool)

(declare-fun i!922 () (_ BitVec 32))

(assert (=> b!262294 (= e!182599 (bvsge (bvsub i!922 #b00000000000000000000000000000001) i!922))))

(declare-fun res!219506 () Bool)

(declare-fun e!182601 () Bool)

(assert (=> start!57192 (=> (not res!219506) (not e!182601))))

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45585 0))(
  ( (T!45586 (val!129 Int)) )
))
(declare-datatypes ((array!14603 0))(
  ( (array!14604 (arr!7363 (Array (_ BitVec 32) T!45585)) (size!6376 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14603)

(assert (=> start!57192 (= res!219506 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6376 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57192 e!182601))

(assert (=> start!57192 true))

(declare-fun e!182600 () Bool)

(declare-fun array_inv!6103 (array!14603) Bool)

(assert (=> start!57192 (and (array_inv!6103 a!416) e!182600)))

(declare-fun tp_is_empty!259 () Bool)

(assert (=> start!57192 tp_is_empty!259))

(declare-fun b!262295 () Bool)

(declare-fun mapRes!637 () Bool)

(assert (=> b!262295 (= e!182600 (and tp_is_empty!259 mapRes!637))))

(declare-fun condMapEmpty!637 () Bool)

(declare-fun mapDefault!637 () T!45585)

