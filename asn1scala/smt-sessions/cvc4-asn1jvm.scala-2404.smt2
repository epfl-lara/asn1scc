; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61182 () Bool)

(assert start!61182)

(declare-fun b!275546 () Bool)

(declare-fun e!195520 () Bool)

(declare-datatypes ((array!15743 0))(
  ( (array!15744 (arr!7806 (Array (_ BitVec 32) (_ BitVec 8))) (size!6819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12452 0))(
  ( (BitStream!12453 (buf!7287 array!15743) (currentByte!13460 (_ BitVec 32)) (currentBit!13455 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12452)

(declare-fun array_inv!6543 (array!15743) Bool)

(assert (=> b!275546 (= e!195520 (array_inv!6543 (buf!7287 bs2!19)))))

(declare-fun b!275547 () Bool)

(declare-fun e!195517 () Bool)

(declare-fun bs1!11 () BitStream!12452)

(assert (=> b!275547 (= e!195517 (array_inv!6543 (buf!7287 bs1!11)))))

(declare-fun b!275548 () Bool)

(declare-fun e!195516 () Bool)

(assert (=> b!275548 (= e!195516 (not true))))

(declare-datatypes ((tuple2!22458 0))(
  ( (tuple2!22459 (_1!12261 BitStream!12452) (_2!12261 Bool)) )
))
(declare-fun lt!413618 () tuple2!22458)

(declare-fun readBitPure!0 (BitStream!12452) tuple2!22458)

(assert (=> b!275548 (= lt!413618 (readBitPure!0 (BitStream!12453 (buf!7287 bs2!19) (currentByte!13460 bs1!11) (currentBit!13455 bs1!11))))))

(declare-fun lt!413617 () tuple2!22458)

(assert (=> b!275548 (= lt!413617 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275548 (invariant!0 (currentBit!13455 bs1!11) (currentByte!13460 bs1!11) (size!6819 (buf!7287 bs2!19)))))

(declare-fun b!275549 () Bool)

(declare-fun res!229044 () Bool)

(assert (=> b!275549 (=> (not res!229044) (not e!195516))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275549 (= res!229044 (validate_offset_bit!0 ((_ sign_extend 32) (size!6819 (buf!7287 bs1!11))) ((_ sign_extend 32) (currentByte!13460 bs1!11)) ((_ sign_extend 32) (currentBit!13455 bs1!11))))))

(declare-fun b!275550 () Bool)

(declare-fun res!229043 () Bool)

(assert (=> b!275550 (=> (not res!229043) (not e!195516))))

(declare-fun arrayBitRangesEq!0 (array!15743 array!15743 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275550 (= res!229043 (arrayBitRangesEq!0 (buf!7287 bs1!11) (buf!7287 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6819 (buf!7287 bs1!11)) (currentByte!13460 bs1!11) (currentBit!13455 bs1!11)))))))

(declare-fun res!229045 () Bool)

(assert (=> start!61182 (=> (not res!229045) (not e!195516))))

(assert (=> start!61182 (= res!229045 (= (size!6819 (buf!7287 bs1!11)) (size!6819 (buf!7287 bs2!19))))))

(assert (=> start!61182 e!195516))

(declare-fun inv!12 (BitStream!12452) Bool)

(assert (=> start!61182 (and (inv!12 bs1!11) e!195517)))

(assert (=> start!61182 (and (inv!12 bs2!19) e!195520)))

(assert (= (and start!61182 res!229045) b!275549))

(assert (= (and b!275549 res!229044) b!275550))

(assert (= (and b!275550 res!229043) b!275548))

(assert (= start!61182 b!275547))

(assert (= start!61182 b!275546))

(declare-fun m!408215 () Bool)

(assert (=> start!61182 m!408215))

(declare-fun m!408217 () Bool)

(assert (=> start!61182 m!408217))

(declare-fun m!408219 () Bool)

(assert (=> b!275549 m!408219))

(declare-fun m!408221 () Bool)

(assert (=> b!275550 m!408221))

(declare-fun m!408223 () Bool)

(assert (=> b!275550 m!408223))

(declare-fun m!408225 () Bool)

(assert (=> b!275546 m!408225))

(declare-fun m!408227 () Bool)

(assert (=> b!275548 m!408227))

(declare-fun m!408229 () Bool)

(assert (=> b!275548 m!408229))

(declare-fun m!408231 () Bool)

(assert (=> b!275548 m!408231))

(declare-fun m!408233 () Bool)

(assert (=> b!275547 m!408233))

(push 1)

(assert (not b!275548))

(assert (not b!275547))

(assert (not b!275549))

(assert (not b!275550))

(assert (not start!61182))

(assert (not b!275546))

(check-sat)

(pop 1)

