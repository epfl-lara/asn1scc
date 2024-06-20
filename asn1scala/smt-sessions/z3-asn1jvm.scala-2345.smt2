; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59812 () Bool)

(assert start!59812)

(declare-fun res!227257 () Bool)

(declare-fun e!192890 () Bool)

(assert (=> start!59812 (=> (not res!227257) (not e!192890))))

(declare-datatypes ((array!15274 0))(
  ( (array!15275 (arr!7628 (Array (_ BitVec 32) (_ BitVec 8))) (size!6641 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12096 0))(
  ( (BitStream!12097 (buf!7109 array!15274) (currentByte!13119 (_ BitVec 32)) (currentBit!13114 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12096)

(assert (=> start!59812 (= res!227257 (not (= (size!6641 (buf!7109 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59812 e!192890))

(declare-fun e!192891 () Bool)

(declare-fun inv!12 (BitStream!12096) Bool)

(assert (=> start!59812 (and (inv!12 bs!71) e!192891)))

(declare-fun b!273004 () Bool)

(assert (=> b!273004 (= e!192890 (not true))))

(declare-fun lt!410890 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273004 (= lt!410890 (bitIndex!0 (size!6641 (buf!7109 bs!71)) (currentByte!13119 bs!71) (currentBit!13114 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15274 array!15274 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273004 (arrayBitRangesEq!0 (buf!7109 bs!71) (buf!7109 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6641 (buf!7109 bs!71)))))))

(declare-datatypes ((Unit!19261 0))(
  ( (Unit!19262) )
))
(declare-fun lt!410891 () Unit!19261)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15274) Unit!19261)

(assert (=> b!273004 (= lt!410891 (arrayBitEqImpliesRangesEqLemma!0 (buf!7109 bs!71)))))

(declare-fun b!273005 () Bool)

(declare-fun array_inv!6365 (array!15274) Bool)

(assert (=> b!273005 (= e!192891 (array_inv!6365 (buf!7109 bs!71)))))

(assert (= (and start!59812 res!227257) b!273004))

(assert (= start!59812 b!273005))

(declare-fun m!405883 () Bool)

(assert (=> start!59812 m!405883))

(declare-fun m!405885 () Bool)

(assert (=> b!273004 m!405885))

(declare-fun m!405887 () Bool)

(assert (=> b!273004 m!405887))

(declare-fun m!405889 () Bool)

(assert (=> b!273004 m!405889))

(declare-fun m!405891 () Bool)

(assert (=> b!273005 m!405891))

(check-sat (not b!273005) (not b!273004) (not start!59812))
