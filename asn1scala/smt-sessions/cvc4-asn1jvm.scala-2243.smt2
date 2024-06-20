; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57104 () Bool)

(assert start!57104)

(declare-fun b!261867 () Bool)

(declare-fun e!182281 () Bool)

(declare-fun e!182279 () Bool)

(assert (=> b!261867 (= e!182281 e!182279)))

(declare-fun res!219203 () Bool)

(assert (=> b!261867 (=> (not res!219203) (not e!182279))))

(declare-datatypes ((T!45225 0))(
  ( (T!45226 (val!89 Int)) )
))
(declare-datatypes ((array!14521 0))(
  ( (array!14522 (arr!7323 (Array (_ BitVec 32) T!45225)) (size!6336 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14521)

(declare-fun lt!403915 () array!14521)

(declare-fun at!213 () (_ BitVec 32))

(declare-fun arrayRangesEq!959 (array!14521 array!14521 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261867 (= res!219203 (arrayRangesEq!959 a!411 lt!403915 at!213 at!213))))

(declare-fun v!328 () T!45225)

(assert (=> b!261867 (= lt!403915 (array!14522 (store (arr!7323 a!411) at!213 v!328) (size!6336 a!411)))))

(declare-fun b!261868 () Bool)

(declare-fun e!182280 () Bool)

(declare-fun tp_is_empty!179 () Bool)

(declare-fun mapRes!511 () Bool)

(assert (=> b!261868 (= e!182280 (and tp_is_empty!179 mapRes!511))))

(declare-fun condMapEmpty!511 () Bool)

(declare-fun mapDefault!511 () T!45225)

