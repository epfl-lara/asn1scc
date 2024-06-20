; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61424 () Bool)

(assert start!61424)

(declare-fun b!276156 () Bool)

(declare-fun res!229492 () Bool)

(declare-fun e!196110 () Bool)

(assert (=> b!276156 (=> (not res!229492) (not e!196110))))

(declare-datatypes ((array!15794 0))(
  ( (array!15795 (arr!7833 (Array (_ BitVec 32) (_ BitVec 8))) (size!6840 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12494 0))(
  ( (BitStream!12495 (buf!7308 array!15794) (currentByte!13510 (_ BitVec 32)) (currentBit!13505 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12494)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276156 (= res!229492 (validate_offset_bit!0 ((_ sign_extend 32) (size!6840 (buf!7308 bs1!11))) ((_ sign_extend 32) (currentByte!13510 bs1!11)) ((_ sign_extend 32) (currentBit!13505 bs1!11))))))

(declare-fun b!276157 () Bool)

(assert (=> b!276157 (= e!196110 false)))

(declare-fun lt!414339 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276157 (= lt!414339 (bitIndex!0 (size!6840 (buf!7308 bs1!11)) (currentByte!13510 bs1!11) (currentBit!13505 bs1!11)))))

(declare-fun res!229491 () Bool)

(assert (=> start!61424 (=> (not res!229491) (not e!196110))))

(declare-fun bs2!19 () BitStream!12494)

(assert (=> start!61424 (= res!229491 (= (size!6840 (buf!7308 bs1!11)) (size!6840 (buf!7308 bs2!19))))))

(assert (=> start!61424 e!196110))

(declare-fun e!196112 () Bool)

(declare-fun inv!12 (BitStream!12494) Bool)

(assert (=> start!61424 (and (inv!12 bs1!11) e!196112)))

(declare-fun e!196108 () Bool)

(assert (=> start!61424 (and (inv!12 bs2!19) e!196108)))

(declare-fun b!276159 () Bool)

(declare-fun array_inv!6564 (array!15794) Bool)

(assert (=> b!276159 (= e!196108 (array_inv!6564 (buf!7308 bs2!19)))))

(declare-fun b!276158 () Bool)

(assert (=> b!276158 (= e!196112 (array_inv!6564 (buf!7308 bs1!11)))))

(assert (= (and start!61424 res!229491) b!276156))

(assert (= (and b!276156 res!229492) b!276157))

(assert (= start!61424 b!276158))

(assert (= start!61424 b!276159))

(declare-fun m!409139 () Bool)

(assert (=> b!276158 m!409139))

(declare-fun m!409141 () Bool)

(assert (=> b!276156 m!409141))

(declare-fun m!409143 () Bool)

(assert (=> b!276157 m!409143))

(declare-fun m!409145 () Bool)

(assert (=> start!61424 m!409145))

(declare-fun m!409147 () Bool)

(assert (=> start!61424 m!409147))

(declare-fun m!409149 () Bool)

(assert (=> b!276159 m!409149))

(push 1)

(assert (not b!276157))

(assert (not b!276156))

(assert (not b!276159))

(assert (not b!276158))

(assert (not start!61424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

