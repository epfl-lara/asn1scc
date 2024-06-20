; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57162 () Bool)

(assert start!57162)

(declare-fun mapIsEmpty!595 () Bool)

(declare-fun mapRes!595 () Bool)

(assert (=> mapIsEmpty!595 mapRes!595))

(declare-fun b!262143 () Bool)

(declare-fun res!219398 () Bool)

(declare-fun e!182493 () Bool)

(assert (=> b!262143 (=> (not res!219398) (not e!182493))))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(assert (=> b!262143 (= res!219398 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262144 () Bool)

(declare-fun e!182492 () Bool)

(assert (=> b!262144 (= e!182492 e!182493)))

(declare-fun res!219395 () Bool)

(assert (=> b!262144 (=> (not res!219395) (not e!182493))))

(declare-datatypes ((T!45459 0))(
  ( (T!45460 (val!116 Int)) )
))
(declare-datatypes ((array!14576 0))(
  ( (array!14577 (arr!7350 (Array (_ BitVec 32) T!45459)) (size!6363 (_ BitVec 32))) )
))
(declare-fun lt!404024 () array!14576)

(declare-fun a!416 () array!14576)

(declare-fun arrayRangesEq!980 (array!14576 array!14576 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262144 (= res!219395 (arrayRangesEq!980 a!416 lt!404024 i!922 at!218))))

(declare-fun v!333 () T!45459)

(assert (=> b!262144 (= lt!404024 (array!14577 (store (arr!7350 a!416) at!218 v!333) (size!6363 a!416)))))

(declare-fun b!262145 () Bool)

(assert (=> b!262145 (= e!182493 (not (bvsle at!218 (size!6363 a!416))))))

(assert (=> b!262145 (arrayRangesEq!980 a!416 lt!404024 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18707 0))(
  ( (Unit!18708) )
))
(declare-fun lt!404023 () Unit!18707)

(declare-fun rec!41 (array!14576 (_ BitVec 32) T!45459 (_ BitVec 32)) Unit!18707)

(assert (=> b!262145 (= lt!404023 (rec!41 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262146 () Bool)

(declare-fun res!219396 () Bool)

(assert (=> b!262146 (=> (not res!219396) (not e!182493))))

(assert (=> b!262146 (= res!219396 (arrayRangesEq!980 a!416 lt!404024 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262147 () Bool)

(declare-fun e!182494 () Bool)

(declare-fun tp_is_empty!233 () Bool)

(assert (=> b!262147 (= e!182494 (and tp_is_empty!233 mapRes!595))))

(declare-fun condMapEmpty!595 () Bool)

(declare-fun mapDefault!595 () T!45459)

