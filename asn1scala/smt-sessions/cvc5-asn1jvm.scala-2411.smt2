; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61420 () Bool)

(assert start!61420)

(declare-fun b!276135 () Bool)

(declare-fun e!196081 () Bool)

(declare-datatypes ((array!15790 0))(
  ( (array!15791 (arr!7831 (Array (_ BitVec 32) (_ BitVec 8))) (size!6838 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12490 0))(
  ( (BitStream!12491 (buf!7306 array!15790) (currentByte!13508 (_ BitVec 32)) (currentBit!13503 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12490)

(declare-fun array_inv!6562 (array!15790) Bool)

(assert (=> b!276135 (= e!196081 (array_inv!6562 (buf!7306 bs2!19)))))

(declare-fun b!276133 () Bool)

(declare-fun e!196078 () Bool)

(assert (=> b!276133 (= e!196078 false)))

(declare-fun lt!414333 () (_ BitVec 64))

(declare-fun bs1!11 () BitStream!12490)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276133 (= lt!414333 (bitIndex!0 (size!6838 (buf!7306 bs1!11)) (currentByte!13508 bs1!11) (currentBit!13503 bs1!11)))))

(declare-fun b!276134 () Bool)

(declare-fun e!196079 () Bool)

(assert (=> b!276134 (= e!196079 (array_inv!6562 (buf!7306 bs1!11)))))

(declare-fun b!276132 () Bool)

(declare-fun res!229479 () Bool)

(assert (=> b!276132 (=> (not res!229479) (not e!196078))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276132 (= res!229479 (validate_offset_bit!0 ((_ sign_extend 32) (size!6838 (buf!7306 bs1!11))) ((_ sign_extend 32) (currentByte!13508 bs1!11)) ((_ sign_extend 32) (currentBit!13503 bs1!11))))))

(declare-fun res!229480 () Bool)

(assert (=> start!61420 (=> (not res!229480) (not e!196078))))

(assert (=> start!61420 (= res!229480 (= (size!6838 (buf!7306 bs1!11)) (size!6838 (buf!7306 bs2!19))))))

(assert (=> start!61420 e!196078))

(declare-fun inv!12 (BitStream!12490) Bool)

(assert (=> start!61420 (and (inv!12 bs1!11) e!196079)))

(assert (=> start!61420 (and (inv!12 bs2!19) e!196081)))

(assert (= (and start!61420 res!229480) b!276132))

(assert (= (and b!276132 res!229479) b!276133))

(assert (= start!61420 b!276134))

(assert (= start!61420 b!276135))

(declare-fun m!409115 () Bool)

(assert (=> b!276132 m!409115))

(declare-fun m!409117 () Bool)

(assert (=> b!276133 m!409117))

(declare-fun m!409119 () Bool)

(assert (=> start!61420 m!409119))

(declare-fun m!409121 () Bool)

(assert (=> start!61420 m!409121))

(declare-fun m!409123 () Bool)

(assert (=> b!276135 m!409123))

(declare-fun m!409125 () Bool)

(assert (=> b!276134 m!409125))

(push 1)

(assert (not start!61420))

(assert (not b!276132))

(assert (not b!276133))

(assert (not b!276135))

(assert (not b!276134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

