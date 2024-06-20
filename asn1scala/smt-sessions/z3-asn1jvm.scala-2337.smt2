; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59704 () Bool)

(assert start!59704)

(declare-fun res!227041 () Bool)

(declare-fun e!192530 () Bool)

(assert (=> start!59704 (=> (not res!227041) (not e!192530))))

(declare-datatypes ((array!15220 0))(
  ( (array!15221 (arr!7604 (Array (_ BitVec 32) (_ BitVec 8))) (size!6617 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12048 0))(
  ( (BitStream!12049 (buf!7085 array!15220) (currentByte!13089 (_ BitVec 32)) (currentBit!13084 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12048)

(assert (=> start!59704 (= res!227041 (not (= (size!6617 (buf!7085 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59704 e!192530))

(declare-fun e!192531 () Bool)

(declare-fun inv!12 (BitStream!12048) Bool)

(assert (=> start!59704 (and (inv!12 bs!71) e!192531)))

(declare-fun b!272680 () Bool)

(assert (=> b!272680 (= e!192530 (not true))))

(declare-fun lt!410513 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272680 (= lt!410513 (bitIndex!0 (size!6617 (buf!7085 bs!71)) (currentByte!13089 bs!71) (currentBit!13084 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15220 array!15220 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272680 (arrayBitRangesEq!0 (buf!7085 bs!71) (buf!7085 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6617 (buf!7085 bs!71)))))))

(declare-datatypes ((Unit!19213 0))(
  ( (Unit!19214) )
))
(declare-fun lt!410512 () Unit!19213)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15220) Unit!19213)

(assert (=> b!272680 (= lt!410512 (arrayBitEqImpliesRangesEqLemma!0 (buf!7085 bs!71)))))

(declare-fun b!272681 () Bool)

(declare-fun array_inv!6341 (array!15220) Bool)

(assert (=> b!272681 (= e!192531 (array_inv!6341 (buf!7085 bs!71)))))

(assert (= (and start!59704 res!227041) b!272680))

(assert (= start!59704 b!272681))

(declare-fun m!405529 () Bool)

(assert (=> start!59704 m!405529))

(declare-fun m!405531 () Bool)

(assert (=> b!272680 m!405531))

(declare-fun m!405533 () Bool)

(assert (=> b!272680 m!405533))

(declare-fun m!405535 () Bool)

(assert (=> b!272680 m!405535))

(declare-fun m!405537 () Bool)

(assert (=> b!272681 m!405537))

(check-sat (not b!272681) (not start!59704) (not b!272680))
