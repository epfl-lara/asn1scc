; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57132 () Bool)

(assert start!57132)

(declare-fun b!261974 () Bool)

(declare-fun e!182386 () Bool)

(declare-fun e!182385 () Bool)

(assert (=> b!261974 (= e!182386 e!182385)))

(declare-fun res!219271 () Bool)

(assert (=> b!261974 (=> (not res!219271) (not e!182385))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45329 0))(
  ( (T!45330 (val!101 Int)) )
))
(declare-datatypes ((array!14546 0))(
  ( (array!14547 (arr!7335 (Array (_ BitVec 32) T!45329)) (size!6348 (_ BitVec 32))) )
))
(declare-fun lt!403969 () array!14546)

(declare-fun a!411 () array!14546)

(declare-fun arrayRangesEq!969 (array!14546 array!14546 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261974 (= res!219271 (arrayRangesEq!969 a!411 lt!403969 at!213 at!213))))

(declare-fun v!328 () T!45329)

(assert (=> b!261974 (= lt!403969 (array!14547 (store (arr!7335 a!411) at!213 v!328) (size!6348 a!411)))))

(declare-fun b!261975 () Bool)

(assert (=> b!261975 (= e!182385 (not true))))

(assert (=> b!261975 (arrayRangesEq!969 a!411 lt!403969 #b00000000000000000000000000000000 at!213)))

(declare-datatypes ((Unit!18691 0))(
  ( (Unit!18692) )
))
(declare-fun lt!403970 () Unit!18691)

(declare-fun rec!33 (array!14546 (_ BitVec 32) T!45329 (_ BitVec 32)) Unit!18691)

(assert (=> b!261975 (= lt!403970 (rec!33 a!411 at!213 v!328 at!213))))

(declare-fun mapIsEmpty!550 () Bool)

(declare-fun mapRes!550 () Bool)

(assert (=> mapIsEmpty!550 mapRes!550))

(declare-fun b!261976 () Bool)

(declare-fun e!182384 () Bool)

(declare-fun tp_is_empty!203 () Bool)

(assert (=> b!261976 (= e!182384 (and tp_is_empty!203 mapRes!550))))

(declare-fun condMapEmpty!550 () Bool)

(declare-fun mapDefault!550 () T!45329)

