; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57198 () Bool)

(assert start!57198)

(declare-fun b!262339 () Bool)

(declare-fun e!182628 () Bool)

(declare-fun e!182627 () Bool)

(assert (=> b!262339 (= e!182628 e!182627)))

(declare-fun res!219542 () Bool)

(assert (=> b!262339 (=> (not res!219542) (not e!182627))))

(declare-datatypes ((T!45611 0))(
  ( (T!45612 (val!132 Int)) )
))
(declare-datatypes ((array!14609 0))(
  ( (array!14610 (arr!7366 (Array (_ BitVec 32) T!45611)) (size!6379 (_ BitVec 32))) )
))
(declare-fun lt!404057 () array!14609)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14609)

(declare-fun arrayRangesEq!990 (array!14609 array!14609 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262339 (= res!219542 (arrayRangesEq!990 a!416 lt!404057 i!922 at!218))))

(declare-fun v!333 () T!45611)

(assert (=> b!262339 (= lt!404057 (array!14610 (store (arr!7366 a!416) at!218 v!333) (size!6379 a!416)))))

(declare-fun mapIsEmpty!646 () Bool)

(declare-fun mapRes!646 () Bool)

(assert (=> mapIsEmpty!646 mapRes!646))

(declare-fun res!219543 () Bool)

(assert (=> start!57198 (=> (not res!219543) (not e!182628))))

(assert (=> start!57198 (= res!219543 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6379 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57198 e!182628))

(assert (=> start!57198 true))

(declare-fun e!182626 () Bool)

(declare-fun array_inv!6105 (array!14609) Bool)

(assert (=> start!57198 (and (array_inv!6105 a!416) e!182626)))

(declare-fun tp_is_empty!265 () Bool)

(assert (=> start!57198 tp_is_empty!265))

(declare-fun b!262340 () Bool)

(declare-fun res!219541 () Bool)

(assert (=> b!262340 (=> (not res!219541) (not e!182627))))

(assert (=> b!262340 (= res!219541 (arrayRangesEq!990 a!416 lt!404057 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262341 () Bool)

(declare-fun res!219544 () Bool)

(assert (=> b!262341 (=> (not res!219544) (not e!182627))))

(assert (=> b!262341 (= res!219544 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun mapNonEmpty!646 () Bool)

(declare-fun tp!646 () Bool)

(assert (=> mapNonEmpty!646 (= mapRes!646 (and tp!646 tp_is_empty!265))))

(declare-fun mapKey!646 () (_ BitVec 32))

(declare-fun mapRest!646 () (Array (_ BitVec 32) T!45611))

(declare-fun mapValue!646 () T!45611)

(assert (=> mapNonEmpty!646 (= (arr!7366 a!416) (store mapRest!646 mapKey!646 mapValue!646))))

(declare-fun b!262342 () Bool)

(assert (=> b!262342 (= e!182627 (not true))))

(assert (=> b!262342 (arrayRangesEq!990 a!416 lt!404057 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18709 0))(
  ( (Unit!18710) )
))
(declare-fun lt!404056 () Unit!18709)

(declare-fun rec!42 (array!14609 (_ BitVec 32) T!45611 (_ BitVec 32)) Unit!18709)

(assert (=> b!262342 (= lt!404056 (rec!42 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262343 () Bool)

(assert (=> b!262343 (= e!182626 (and tp_is_empty!265 mapRes!646))))

(declare-fun condMapEmpty!646 () Bool)

(declare-fun mapDefault!646 () T!45611)

