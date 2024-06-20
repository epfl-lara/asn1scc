; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57204 () Bool)

(assert start!57204)

(declare-fun b!262384 () Bool)

(declare-fun res!219579 () Bool)

(declare-fun e!182655 () Bool)

(assert (=> b!262384 (=> (not res!219579) (not e!182655))))

(declare-datatypes ((T!45637 0))(
  ( (T!45638 (val!135 Int)) )
))
(declare-datatypes ((array!14615 0))(
  ( (array!14616 (arr!7369 (Array (_ BitVec 32) T!45637)) (size!6382 (_ BitVec 32))) )
))
(declare-fun lt!404074 () array!14615)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14615)

(declare-fun arrayRangesEq!993 (array!14615 array!14615 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262384 (= res!219579 (arrayRangesEq!993 a!416 lt!404074 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun mapNonEmpty!655 () Bool)

(declare-fun mapRes!655 () Bool)

(declare-fun tp!655 () Bool)

(declare-fun tp_is_empty!271 () Bool)

(assert (=> mapNonEmpty!655 (= mapRes!655 (and tp!655 tp_is_empty!271))))

(declare-fun mapKey!655 () (_ BitVec 32))

(declare-fun mapValue!655 () T!45637)

(declare-fun mapRest!655 () (Array (_ BitVec 32) T!45637))

(assert (=> mapNonEmpty!655 (= (arr!7369 a!416) (store mapRest!655 mapKey!655 mapValue!655))))

(declare-fun b!262385 () Bool)

(assert (=> b!262385 (= e!182655 (not true))))

(assert (=> b!262385 (arrayRangesEq!993 a!416 lt!404074 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18715 0))(
  ( (Unit!18716) )
))
(declare-fun lt!404075 () Unit!18715)

(declare-fun v!333 () T!45637)

(declare-fun rec!45 (array!14615 (_ BitVec 32) T!45637 (_ BitVec 32)) Unit!18715)

(assert (=> b!262385 (= lt!404075 (rec!45 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!655 () Bool)

(assert (=> mapIsEmpty!655 mapRes!655))

(declare-fun b!262386 () Bool)

(declare-fun e!182654 () Bool)

(assert (=> b!262386 (= e!182654 (and tp_is_empty!271 mapRes!655))))

(declare-fun condMapEmpty!655 () Bool)

(declare-fun mapDefault!655 () T!45637)

