; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57146 () Bool)

(assert start!57146)

(declare-fun b!262023 () Bool)

(declare-fun e!182420 () Bool)

(assert (=> b!262023 (= e!182420 (not true))))

(declare-datatypes ((T!45403 0))(
  ( (T!45404 (val!108 Int)) )
))
(declare-datatypes ((array!14560 0))(
  ( (array!14561 (arr!7342 (Array (_ BitVec 32) T!45403)) (size!6355 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14560)

(declare-fun lt!403975 () array!14560)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun arrayRangesEq!972 (array!14560 array!14560 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262023 (arrayRangesEq!972 a!416 lt!403975 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18693 0))(
  ( (Unit!18694) )
))
(declare-fun lt!403976 () Unit!18693)

(declare-fun v!333 () T!45403)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun rec!34 (array!14560 (_ BitVec 32) T!45403 (_ BitVec 32)) Unit!18693)

(assert (=> b!262023 (= lt!403976 (rec!34 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262024 () Bool)

(declare-fun e!182422 () Bool)

(declare-fun tp_is_empty!217 () Bool)

(declare-fun mapRes!571 () Bool)

(assert (=> b!262024 (= e!182422 (and tp_is_empty!217 mapRes!571))))

(declare-fun condMapEmpty!571 () Bool)

(declare-fun mapDefault!571 () T!45403)

