; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57122 () Bool)

(assert start!57122)

(declare-fun b!261929 () Bool)

(declare-fun e!182339 () Bool)

(declare-fun e!182341 () Bool)

(assert (=> b!261929 (= e!182339 e!182341)))

(declare-fun res!219241 () Bool)

(assert (=> b!261929 (=> (not res!219241) (not e!182341))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45299 0))(
  ( (T!45300 (val!96 Int)) )
))
(declare-datatypes ((array!14536 0))(
  ( (array!14537 (arr!7330 (Array (_ BitVec 32) T!45299)) (size!6343 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14536)

(declare-fun lt!403939 () array!14536)

(declare-fun arrayRangesEq!965 (array!14536 array!14536 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261929 (= res!219241 (arrayRangesEq!965 a!411 lt!403939 at!213 at!213))))

(declare-fun v!328 () T!45299)

(assert (=> b!261929 (= lt!403939 (array!14537 (store (arr!7330 a!411) at!213 v!328) (size!6343 a!411)))))

(declare-fun b!261930 () Bool)

(declare-fun e!182340 () Bool)

(declare-fun tp_is_empty!193 () Bool)

(declare-fun mapRes!535 () Bool)

(assert (=> b!261930 (= e!182340 (and tp_is_empty!193 mapRes!535))))

(declare-fun condMapEmpty!535 () Bool)

(declare-fun mapDefault!535 () T!45299)

