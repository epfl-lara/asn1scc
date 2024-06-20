; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57112 () Bool)

(assert start!57112)

(declare-datatypes ((T!45273 0))(
  ( (T!45274 (val!93 Int)) )
))
(declare-fun v!328 () T!45273)

(declare-fun at!213 () (_ BitVec 32))

(declare-fun e!182313 () Bool)

(declare-datatypes ((array!14529 0))(
  ( (array!14530 (arr!7327 (Array (_ BitVec 32) T!45273)) (size!6340 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14529)

(declare-fun b!261901 () Bool)

(declare-fun arrayRangesEq!962 (array!14529 array!14529 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261901 (= e!182313 (not (arrayRangesEq!962 a!411 (array!14530 (store (arr!7327 a!411) at!213 v!328) (size!6340 a!411)) at!213 at!213)))))

(declare-fun res!219224 () Bool)

(assert (=> start!57112 (=> (not res!219224) (not e!182313))))

(assert (=> start!57112 (= res!219224 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6340 a!411))))))

(assert (=> start!57112 e!182313))

(assert (=> start!57112 true))

(declare-fun e!182314 () Bool)

(declare-fun array_inv!6077 (array!14529) Bool)

(assert (=> start!57112 (and (array_inv!6077 a!411) e!182314)))

(declare-fun tp_is_empty!187 () Bool)

(assert (=> start!57112 tp_is_empty!187))

(declare-fun b!261902 () Bool)

(declare-fun mapRes!523 () Bool)

(assert (=> b!261902 (= e!182314 (and tp_is_empty!187 mapRes!523))))

(declare-fun condMapEmpty!523 () Bool)

(declare-fun mapDefault!523 () T!45273)

