; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57170 () Bool)

(assert start!57170)

(declare-fun b!262190 () Bool)

(declare-fun e!182526 () Bool)

(declare-fun i!922 () (_ BitVec 32))

(assert (=> b!262190 (= e!182526 (and (not (= i!922 #b00000000000000000000000000000000)) (not (= (bvand i!922 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!922 #b10000000000000000000000000000000) (bvand (bvsub i!922 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!607 () Bool)

(declare-fun mapRes!607 () Bool)

(assert (=> mapIsEmpty!607 mapRes!607))

(declare-fun res!219430 () Bool)

(assert (=> start!57170 (=> (not res!219430) (not e!182526))))

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45507 0))(
  ( (T!45508 (val!120 Int)) )
))
(declare-datatypes ((array!14584 0))(
  ( (array!14585 (arr!7354 (Array (_ BitVec 32) T!45507)) (size!6367 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14584)

(assert (=> start!57170 (= res!219430 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6367 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57170 e!182526))

(assert (=> start!57170 true))

(declare-fun e!182527 () Bool)

(declare-fun array_inv!6096 (array!14584) Bool)

(assert (=> start!57170 (and (array_inv!6096 a!416) e!182527)))

(declare-fun tp_is_empty!241 () Bool)

(assert (=> start!57170 tp_is_empty!241))

(declare-fun b!262191 () Bool)

(assert (=> b!262191 (= e!182527 (and tp_is_empty!241 mapRes!607))))

(declare-fun condMapEmpty!607 () Bool)

(declare-fun mapDefault!607 () T!45507)

