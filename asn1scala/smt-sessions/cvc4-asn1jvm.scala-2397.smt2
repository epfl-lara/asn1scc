; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61116 () Bool)

(assert start!61116)

(declare-fun b!275225 () Bool)

(declare-fun e!195194 () Bool)

(declare-datatypes ((array!15698 0))(
  ( (array!15699 (arr!7785 (Array (_ BitVec 32) (_ BitVec 8))) (size!6798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12410 0))(
  ( (BitStream!12411 (buf!7266 array!15698) (currentByte!13433 (_ BitVec 32)) (currentBit!13428 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12410)

(declare-fun array_inv!6522 (array!15698) Bool)

(assert (=> b!275225 (= e!195194 (array_inv!6522 (buf!7266 bs1!11)))))

(declare-fun b!275224 () Bool)

(declare-fun e!195196 () Bool)

(assert (=> b!275224 (= e!195196 false)))

(declare-fun lt!413474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275224 (= lt!413474 (bitIndex!0 (size!6798 (buf!7266 bs1!11)) (currentByte!13433 bs1!11) (currentBit!13428 bs1!11)))))

(declare-fun b!275223 () Bool)

(declare-fun res!228847 () Bool)

(assert (=> b!275223 (=> (not res!228847) (not e!195196))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275223 (= res!228847 (validate_offset_bit!0 ((_ sign_extend 32) (size!6798 (buf!7266 bs1!11))) ((_ sign_extend 32) (currentByte!13433 bs1!11)) ((_ sign_extend 32) (currentBit!13428 bs1!11))))))

(declare-fun b!275226 () Bool)

(declare-fun e!195193 () Bool)

(declare-fun bs2!19 () BitStream!12410)

(assert (=> b!275226 (= e!195193 (array_inv!6522 (buf!7266 bs2!19)))))

(declare-fun res!228846 () Bool)

(assert (=> start!61116 (=> (not res!228846) (not e!195196))))

(assert (=> start!61116 (= res!228846 (= (size!6798 (buf!7266 bs1!11)) (size!6798 (buf!7266 bs2!19))))))

(assert (=> start!61116 e!195196))

(declare-fun inv!12 (BitStream!12410) Bool)

(assert (=> start!61116 (and (inv!12 bs1!11) e!195194)))

(assert (=> start!61116 (and (inv!12 bs2!19) e!195193)))

(assert (= (and start!61116 res!228846) b!275223))

(assert (= (and b!275223 res!228847) b!275224))

(assert (= start!61116 b!275225))

(assert (= start!61116 b!275226))

(declare-fun m!407809 () Bool)

(assert (=> b!275223 m!407809))

(declare-fun m!407811 () Bool)

(assert (=> b!275225 m!407811))

(declare-fun m!407813 () Bool)

(assert (=> b!275224 m!407813))

(declare-fun m!407815 () Bool)

(assert (=> start!61116 m!407815))

(declare-fun m!407817 () Bool)

(assert (=> start!61116 m!407817))

(declare-fun m!407819 () Bool)

(assert (=> b!275226 m!407819))

(push 1)

(assert (not b!275224))

(assert (not b!275226))

(assert (not start!61116))

(assert (not b!275223))

(assert (not b!275225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

