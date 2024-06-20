; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57134 () Bool)

(assert start!57134)

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45351 0))(
  ( (T!45352 (val!102 Int)) )
))
(declare-datatypes ((array!14548 0))(
  ( (array!14549 (arr!7336 (Array (_ BitVec 32) T!45351)) (size!6349 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14548)

(declare-fun i!922 () (_ BitVec 32))

(assert (=> start!57134 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6349 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218) (bvsgt at!218 (size!6349 a!416)))))

(assert (=> start!57134 true))

(declare-fun e!182389 () Bool)

(declare-fun array_inv!6082 (array!14548) Bool)

(assert (=> start!57134 (and (array_inv!6082 a!416) e!182389)))

(declare-fun b!261979 () Bool)

(declare-fun tp_is_empty!205 () Bool)

(declare-fun mapRes!553 () Bool)

(assert (=> b!261979 (= e!182389 (and tp_is_empty!205 mapRes!553))))

(declare-fun condMapEmpty!553 () Bool)

(declare-fun mapDefault!553 () T!45351)

