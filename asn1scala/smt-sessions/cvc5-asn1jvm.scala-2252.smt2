; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57158 () Bool)

(assert start!57158)

(declare-fun b!262113 () Bool)

(declare-fun e!182474 () Bool)

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45455 0))(
  ( (T!45456 (val!114 Int)) )
))
(declare-datatypes ((array!14572 0))(
  ( (array!14573 (arr!7348 (Array (_ BitVec 32) T!45455)) (size!6361 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14572)

(assert (=> b!262113 (= e!182474 (not (bvsle at!218 (size!6361 a!416))))))

(declare-fun lt!404012 () array!14572)

(declare-fun arrayRangesEq!978 (array!14572 array!14572 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262113 (arrayRangesEq!978 a!416 lt!404012 #b00000000000000000000000000000000 at!218)))

(declare-fun v!333 () T!45455)

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((Unit!18703 0))(
  ( (Unit!18704) )
))
(declare-fun lt!404011 () Unit!18703)

(declare-fun rec!39 (array!14572 (_ BitVec 32) T!45455 (_ BitVec 32)) Unit!18703)

(assert (=> b!262113 (= lt!404011 (rec!39 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262114 () Bool)

(declare-fun e!182475 () Bool)

(declare-fun tp_is_empty!229 () Bool)

(declare-fun mapRes!589 () Bool)

(assert (=> b!262114 (= e!182475 (and tp_is_empty!229 mapRes!589))))

(declare-fun condMapEmpty!589 () Bool)

(declare-fun mapDefault!589 () T!45455)

