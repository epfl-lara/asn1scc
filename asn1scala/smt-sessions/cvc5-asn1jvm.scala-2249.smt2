; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57140 () Bool)

(assert start!57140)

(declare-fun res!219278 () Bool)

(declare-fun e!182401 () Bool)

(assert (=> start!57140 (=> (not res!219278) (not e!182401))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((T!45377 0))(
  ( (T!45378 (val!105 Int)) )
))
(declare-datatypes ((array!14554 0))(
  ( (array!14555 (arr!7339 (Array (_ BitVec 32) T!45377)) (size!6352 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14554)

(assert (=> start!57140 (= res!219278 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6352 a!416)) (bvsle i!922 at!218)))))

(assert (=> start!57140 e!182401))

(assert (=> start!57140 true))

(declare-fun e!182400 () Bool)

(declare-fun array_inv!6085 (array!14554) Bool)

(assert (=> start!57140 (and (array_inv!6085 a!416) e!182400)))

(declare-fun tp_is_empty!211 () Bool)

(assert (=> start!57140 tp_is_empty!211))

(declare-fun b!261992 () Bool)

(declare-fun res!219277 () Bool)

(assert (=> b!261992 (=> (not res!219277) (not e!182401))))

(declare-fun v!333 () T!45377)

(declare-fun arrayRangesEq!970 (array!14554 array!14554 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261992 (= res!219277 (arrayRangesEq!970 a!416 (array!14555 (store (arr!7339 a!416) at!218 v!333) (size!6352 a!416)) i!922 at!218))))

(declare-fun b!261993 () Bool)

(declare-fun mapRes!562 () Bool)

(assert (=> b!261993 (= e!182400 (and tp_is_empty!211 mapRes!562))))

(declare-fun condMapEmpty!562 () Bool)

(declare-fun mapDefault!562 () T!45377)

