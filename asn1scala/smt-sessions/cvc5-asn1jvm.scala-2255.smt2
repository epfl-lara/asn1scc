; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57176 () Bool)

(assert start!57176)

(declare-fun b!262217 () Bool)

(declare-fun e!182544 () Bool)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(assert (=> b!262217 (= e!182544 (and (not (= i!922 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsgt (bvsub i!922 #b00000000000000000000000000000001) at!218))))))

(declare-fun mapNonEmpty!616 () Bool)

(declare-fun mapRes!616 () Bool)

(declare-fun tp!616 () Bool)

(declare-fun tp_is_empty!247 () Bool)

(assert (=> mapNonEmpty!616 (= mapRes!616 (and tp!616 tp_is_empty!247))))

(declare-fun mapKey!616 () (_ BitVec 32))

(declare-datatypes ((T!45533 0))(
  ( (T!45534 (val!123 Int)) )
))
(declare-fun mapRest!616 () (Array (_ BitVec 32) T!45533))

(declare-datatypes ((array!14590 0))(
  ( (array!14591 (arr!7357 (Array (_ BitVec 32) T!45533)) (size!6370 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14590)

(declare-fun mapValue!616 () T!45533)

(assert (=> mapNonEmpty!616 (= (arr!7357 a!416) (store mapRest!616 mapKey!616 mapValue!616))))

(declare-fun res!219449 () Bool)

(assert (=> start!57176 (=> (not res!219449) (not e!182544))))

(assert (=> start!57176 (= res!219449 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6370 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57176 e!182544))

(assert (=> start!57176 true))

(declare-fun e!182545 () Bool)

(declare-fun array_inv!6098 (array!14590) Bool)

(assert (=> start!57176 (and (array_inv!6098 a!416) e!182545)))

(assert (=> start!57176 tp_is_empty!247))

(declare-fun mapIsEmpty!616 () Bool)

(assert (=> mapIsEmpty!616 mapRes!616))

(declare-fun b!262218 () Bool)

(declare-fun res!219448 () Bool)

(assert (=> b!262218 (=> (not res!219448) (not e!182544))))

(declare-fun v!333 () T!45533)

(declare-fun arrayRangesEq!985 (array!14590 array!14590 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262218 (= res!219448 (arrayRangesEq!985 a!416 (array!14591 (store (arr!7357 a!416) at!218 v!333) (size!6370 a!416)) i!922 at!218))))

(declare-fun b!262219 () Bool)

(assert (=> b!262219 (= e!182545 (and tp_is_empty!247 mapRes!616))))

(declare-fun condMapEmpty!616 () Bool)

(declare-fun mapDefault!616 () T!45533)

