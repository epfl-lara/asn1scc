; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61114 () Bool)

(assert start!61114)

(declare-fun b!275212 () Bool)

(declare-fun e!195178 () Bool)

(assert (=> b!275212 (= e!195178 false)))

(declare-fun lt!413471 () (_ BitVec 64))

(declare-datatypes ((array!15696 0))(
  ( (array!15697 (arr!7784 (Array (_ BitVec 32) (_ BitVec 8))) (size!6797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12408 0))(
  ( (BitStream!12409 (buf!7265 array!15696) (currentByte!13432 (_ BitVec 32)) (currentBit!13427 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12408)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275212 (= lt!413471 (bitIndex!0 (size!6797 (buf!7265 bs1!11)) (currentByte!13432 bs1!11) (currentBit!13427 bs1!11)))))

(declare-fun b!275211 () Bool)

(declare-fun res!228840 () Bool)

(assert (=> b!275211 (=> (not res!228840) (not e!195178))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275211 (= res!228840 (validate_offset_bit!0 ((_ sign_extend 32) (size!6797 (buf!7265 bs1!11))) ((_ sign_extend 32) (currentByte!13432 bs1!11)) ((_ sign_extend 32) (currentBit!13427 bs1!11))))))

(declare-fun b!275214 () Bool)

(declare-fun e!195177 () Bool)

(declare-fun bs2!19 () BitStream!12408)

(declare-fun array_inv!6521 (array!15696) Bool)

(assert (=> b!275214 (= e!195177 (array_inv!6521 (buf!7265 bs2!19)))))

(declare-fun res!228841 () Bool)

(assert (=> start!61114 (=> (not res!228841) (not e!195178))))

(assert (=> start!61114 (= res!228841 (= (size!6797 (buf!7265 bs1!11)) (size!6797 (buf!7265 bs2!19))))))

(assert (=> start!61114 e!195178))

(declare-fun e!195179 () Bool)

(declare-fun inv!12 (BitStream!12408) Bool)

(assert (=> start!61114 (and (inv!12 bs1!11) e!195179)))

(assert (=> start!61114 (and (inv!12 bs2!19) e!195177)))

(declare-fun b!275213 () Bool)

(assert (=> b!275213 (= e!195179 (array_inv!6521 (buf!7265 bs1!11)))))

(assert (= (and start!61114 res!228841) b!275211))

(assert (= (and b!275211 res!228840) b!275212))

(assert (= start!61114 b!275213))

(assert (= start!61114 b!275214))

(declare-fun m!407797 () Bool)

(assert (=> b!275213 m!407797))

(declare-fun m!407799 () Bool)

(assert (=> b!275214 m!407799))

(declare-fun m!407801 () Bool)

(assert (=> b!275211 m!407801))

(declare-fun m!407803 () Bool)

(assert (=> start!61114 m!407803))

(declare-fun m!407805 () Bool)

(assert (=> start!61114 m!407805))

(declare-fun m!407807 () Bool)

(assert (=> b!275212 m!407807))

(check-sat (not b!275213) (not b!275212) (not b!275214) (not b!275211) (not start!61114))
