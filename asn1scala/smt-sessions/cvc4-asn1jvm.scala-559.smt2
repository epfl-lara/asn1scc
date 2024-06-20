; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15960 () Bool)

(assert start!15960)

(declare-fun res!66688 () Bool)

(declare-fun e!53000 () Bool)

(assert (=> start!15960 (=> (not res!66688) (not e!53000))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15960 (= res!66688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15960 e!53000))

(assert (=> start!15960 true))

(declare-datatypes ((array!3545 0))(
  ( (array!3546 (arr!2246 (Array (_ BitVec 32) (_ BitVec 8))) (size!1636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2834 0))(
  ( (BitStream!2835 (buf!2026 array!3545) (currentByte!3924 (_ BitVec 32)) (currentBit!3919 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2834)

(declare-fun e!52998 () Bool)

(declare-fun inv!12 (BitStream!2834) Bool)

(assert (=> start!15960 (and (inv!12 thiss!1716) e!52998)))

(declare-fun b!80609 () Bool)

(declare-fun res!66686 () Bool)

(declare-fun e!52999 () Bool)

(assert (=> b!80609 (=> res!66686 e!52999)))

(declare-datatypes ((Unit!5330 0))(
  ( (Unit!5331) )
))
(declare-datatypes ((tuple3!308 0))(
  ( (tuple3!309 (_1!3745 Unit!5330) (_2!3745 BitStream!2834) (_3!175 array!3545)) )
))
(declare-fun lt!127650 () tuple3!308)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80609 (= res!66686 (not (= (bvadd (bitIndex!0 (size!1636 (buf!2026 thiss!1716)) (currentByte!3924 thiss!1716) (currentBit!3919 thiss!1716)) nBits!516) (bitIndex!0 (size!1636 (buf!2026 (_2!3745 lt!127650))) (currentByte!3924 (_2!3745 lt!127650)) (currentBit!3919 (_2!3745 lt!127650))))))))

(declare-fun b!80610 () Bool)

(declare-fun res!66685 () Bool)

(assert (=> b!80610 (=> (not res!66685) (not e!53000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80610 (= res!66685 (validate_offset_bits!1 ((_ sign_extend 32) (size!1636 (buf!2026 thiss!1716))) ((_ sign_extend 32) (currentByte!3924 thiss!1716)) ((_ sign_extend 32) (currentBit!3919 thiss!1716)) nBits!516))))

(declare-fun b!80611 () Bool)

(assert (=> b!80611 (= e!53000 false)))

(declare-fun lt!127649 () Bool)

(assert (=> b!80611 (= lt!127649 e!52999)))

(declare-fun res!66687 () Bool)

(assert (=> b!80611 (=> res!66687 e!52999)))

(assert (=> b!80611 (= res!66687 (not (= (buf!2026 (_2!3745 lt!127650)) (buf!2026 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2834 (_ BitVec 64) array!3545 (_ BitVec 64) (_ BitVec 64)) tuple3!308)

(assert (=> b!80611 (= lt!127650 (readBitsLoop!0 thiss!1716 nBits!516 (array!3546 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80612 () Bool)

(declare-fun array_inv!1482 (array!3545) Bool)

(assert (=> b!80612 (= e!52998 (array_inv!1482 (buf!2026 thiss!1716)))))

(declare-fun b!80613 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80613 (= e!52999 (not (invariant!0 (currentBit!3919 (_2!3745 lt!127650)) (currentByte!3924 (_2!3745 lt!127650)) (size!1636 (buf!2026 (_2!3745 lt!127650))))))))

(assert (= (and start!15960 res!66688) b!80610))

(assert (= (and b!80610 res!66685) b!80611))

(assert (= (and b!80611 (not res!66687)) b!80609))

(assert (= (and b!80609 (not res!66686)) b!80613))

(assert (= start!15960 b!80612))

(declare-fun m!126115 () Bool)

(assert (=> start!15960 m!126115))

(declare-fun m!126117 () Bool)

(assert (=> b!80613 m!126117))

(declare-fun m!126119 () Bool)

(assert (=> b!80610 m!126119))

(declare-fun m!126121 () Bool)

(assert (=> b!80609 m!126121))

(declare-fun m!126123 () Bool)

(assert (=> b!80609 m!126123))

(declare-fun m!126125 () Bool)

(assert (=> b!80612 m!126125))

(declare-fun m!126127 () Bool)

(assert (=> b!80611 m!126127))

(push 1)

(assert (not b!80612))

(assert (not b!80611))

(assert (not b!80609))

(assert (not b!80610))

(assert (not start!15960))

(assert (not b!80613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

