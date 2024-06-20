; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57164 () Bool)

(assert start!57164)

(declare-fun mapIsEmpty!598 () Bool)

(declare-fun mapRes!598 () Bool)

(assert (=> mapIsEmpty!598 mapRes!598))

(declare-fun b!262156 () Bool)

(declare-fun e!182501 () Bool)

(declare-fun e!182503 () Bool)

(assert (=> b!262156 (= e!182501 e!182503)))

(declare-fun res!219405 () Bool)

(assert (=> b!262156 (=> (not res!219405) (not e!182503))))

(declare-datatypes ((T!45481 0))(
  ( (T!45482 (val!117 Int)) )
))
(declare-datatypes ((array!14578 0))(
  ( (array!14579 (arr!7351 (Array (_ BitVec 32) T!45481)) (size!6364 (_ BitVec 32))) )
))
(declare-fun lt!404027 () array!14578)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14578)

(declare-fun arrayRangesEq!981 (array!14578 array!14578 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262156 (= res!219405 (arrayRangesEq!981 a!416 lt!404027 i!922 at!218))))

(declare-fun v!333 () T!45481)

(assert (=> b!262156 (= lt!404027 (array!14579 (store (arr!7351 a!416) at!218 v!333) (size!6364 a!416)))))

(declare-fun b!262157 () Bool)

(declare-fun e!182502 () Bool)

(declare-fun tp_is_empty!235 () Bool)

(assert (=> b!262157 (= e!182502 (and tp_is_empty!235 mapRes!598))))

(declare-fun condMapEmpty!598 () Bool)

(declare-fun mapDefault!598 () T!45481)

