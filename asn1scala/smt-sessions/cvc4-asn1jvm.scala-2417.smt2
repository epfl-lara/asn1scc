; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61628 () Bool)

(assert start!61628)

(declare-fun b!276749 () Bool)

(declare-fun res!229905 () Bool)

(declare-fun e!196667 () Bool)

(assert (=> b!276749 (=> (not res!229905) (not e!196667))))

(declare-datatypes ((array!15842 0))(
  ( (array!15843 (arr!7851 (Array (_ BitVec 32) (_ BitVec 8))) (size!6858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12530 0))(
  ( (BitStream!12531 (buf!7326 array!15842) (currentByte!13564 (_ BitVec 32)) (currentBit!13559 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12530)

(declare-fun bs2!19 () BitStream!12530)

(declare-fun arrayBitRangesEq!0 (array!15842 array!15842 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276749 (= res!229905 (arrayBitRangesEq!0 (buf!7326 bs1!11) (buf!7326 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6858 (buf!7326 bs1!11)) (currentByte!13564 bs1!11) (currentBit!13559 bs1!11)))))))

(declare-fun b!276750 () Bool)

(declare-fun res!229904 () Bool)

(assert (=> b!276750 (=> (not res!229904) (not e!196667))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276750 (= res!229904 (validate_offset_bit!0 ((_ sign_extend 32) (size!6858 (buf!7326 bs1!11))) ((_ sign_extend 32) (currentByte!13564 bs1!11)) ((_ sign_extend 32) (currentBit!13559 bs1!11))))))

(declare-fun b!276751 () Bool)

(declare-fun e!196666 () Bool)

(declare-fun array_inv!6582 (array!15842) Bool)

(assert (=> b!276751 (= e!196666 (array_inv!6582 (buf!7326 bs1!11)))))

(declare-fun res!229906 () Bool)

(assert (=> start!61628 (=> (not res!229906) (not e!196667))))

(assert (=> start!61628 (= res!229906 (= (size!6858 (buf!7326 bs1!11)) (size!6858 (buf!7326 bs2!19))))))

(assert (=> start!61628 e!196667))

(declare-fun inv!12 (BitStream!12530) Bool)

(assert (=> start!61628 (and (inv!12 bs1!11) e!196666)))

(declare-fun e!196668 () Bool)

(assert (=> start!61628 (and (inv!12 bs2!19) e!196668)))

(declare-fun b!276752 () Bool)

(assert (=> b!276752 (= e!196667 (not true))))

(declare-datatypes ((tuple2!22570 0))(
  ( (tuple2!22571 (_1!12335 BitStream!12530) (_2!12335 Bool)) )
))
(declare-fun lt!414882 () tuple2!22570)

(declare-fun readBitPure!0 (BitStream!12530) tuple2!22570)

(assert (=> b!276752 (= lt!414882 (readBitPure!0 (BitStream!12531 (buf!7326 bs2!19) (currentByte!13564 bs1!11) (currentBit!13559 bs1!11))))))

(declare-fun lt!414881 () tuple2!22570)

(assert (=> b!276752 (= lt!414881 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276752 (invariant!0 (currentBit!13559 bs1!11) (currentByte!13564 bs1!11) (size!6858 (buf!7326 bs2!19)))))

(declare-fun b!276753 () Bool)

(assert (=> b!276753 (= e!196668 (array_inv!6582 (buf!7326 bs2!19)))))

(assert (= (and start!61628 res!229906) b!276750))

(assert (= (and b!276750 res!229904) b!276749))

(assert (= (and b!276749 res!229905) b!276752))

(assert (= start!61628 b!276751))

(assert (= start!61628 b!276753))

(declare-fun m!409803 () Bool)

(assert (=> b!276752 m!409803))

(declare-fun m!409805 () Bool)

(assert (=> b!276752 m!409805))

(declare-fun m!409807 () Bool)

(assert (=> b!276752 m!409807))

(declare-fun m!409809 () Bool)

(assert (=> b!276753 m!409809))

(declare-fun m!409811 () Bool)

(assert (=> start!61628 m!409811))

(declare-fun m!409813 () Bool)

(assert (=> start!61628 m!409813))

(declare-fun m!409815 () Bool)

(assert (=> b!276751 m!409815))

(declare-fun m!409817 () Bool)

(assert (=> b!276750 m!409817))

(declare-fun m!409819 () Bool)

(assert (=> b!276749 m!409819))

(declare-fun m!409821 () Bool)

(assert (=> b!276749 m!409821))

(push 1)

(assert (not b!276750))

(assert (not b!276752))

(assert (not b!276751))

(assert (not b!276753))

(assert (not b!276749))

(assert (not start!61628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

