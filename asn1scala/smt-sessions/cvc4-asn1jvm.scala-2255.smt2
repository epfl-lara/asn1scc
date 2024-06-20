; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57180 () Bool)

(assert start!57180)

(declare-fun mapNonEmpty!622 () Bool)

(declare-fun mapRes!622 () Bool)

(declare-fun tp!622 () Bool)

(declare-fun tp_is_empty!251 () Bool)

(assert (=> mapNonEmpty!622 (= mapRes!622 (and tp!622 tp_is_empty!251))))

(declare-datatypes ((T!45537 0))(
  ( (T!45538 (val!125 Int)) )
))
(declare-fun mapRest!622 () (Array (_ BitVec 32) T!45537))

(declare-datatypes ((array!14594 0))(
  ( (array!14595 (arr!7359 (Array (_ BitVec 32) T!45537)) (size!6372 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14594)

(declare-fun mapKey!622 () (_ BitVec 32))

(declare-fun mapValue!622 () T!45537)

(assert (=> mapNonEmpty!622 (= (arr!7359 a!416) (store mapRest!622 mapKey!622 mapValue!622))))

(declare-fun res!219460 () Bool)

(declare-fun e!182557 () Bool)

(assert (=> start!57180 (=> (not res!219460) (not e!182557))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(assert (=> start!57180 (= res!219460 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6372 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57180 e!182557))

(assert (=> start!57180 true))

(declare-fun e!182556 () Bool)

(declare-fun array_inv!6100 (array!14594) Bool)

(assert (=> start!57180 (and (array_inv!6100 a!416) e!182556)))

(assert (=> start!57180 tp_is_empty!251))

(declare-fun b!262235 () Bool)

(assert (=> b!262235 (= e!182557 (and (not (= i!922 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsgt (bvsub i!922 #b00000000000000000000000000000001) at!218))))))

(declare-fun b!262236 () Bool)

(assert (=> b!262236 (= e!182556 (and tp_is_empty!251 mapRes!622))))

(declare-fun condMapEmpty!622 () Bool)

(declare-fun mapDefault!622 () T!45537)

