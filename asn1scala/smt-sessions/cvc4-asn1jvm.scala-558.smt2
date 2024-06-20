; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15954 () Bool)

(assert start!15954)

(declare-fun b!80564 () Bool)

(declare-fun e!52964 () Bool)

(assert (=> b!80564 (= e!52964 false)))

(declare-fun lt!127631 () Bool)

(declare-fun e!52962 () Bool)

(assert (=> b!80564 (= lt!127631 e!52962)))

(declare-fun res!66651 () Bool)

(assert (=> b!80564 (=> res!66651 e!52962)))

(declare-datatypes ((array!3539 0))(
  ( (array!3540 (arr!2243 (Array (_ BitVec 32) (_ BitVec 8))) (size!1633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2828 0))(
  ( (BitStream!2829 (buf!2023 array!3539) (currentByte!3921 (_ BitVec 32)) (currentBit!3916 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5324 0))(
  ( (Unit!5325) )
))
(declare-datatypes ((tuple3!302 0))(
  ( (tuple3!303 (_1!3742 Unit!5324) (_2!3742 BitStream!2828) (_3!172 array!3539)) )
))
(declare-fun lt!127632 () tuple3!302)

(declare-fun thiss!1716 () BitStream!2828)

(assert (=> b!80564 (= res!66651 (not (= (buf!2023 (_2!3742 lt!127632)) (buf!2023 thiss!1716))))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2828 (_ BitVec 64) array!3539 (_ BitVec 64) (_ BitVec 64)) tuple3!302)

(assert (=> b!80564 (= lt!127632 (readBitsLoop!0 thiss!1716 nBits!516 (array!3540 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80565 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80565 (= e!52962 (not (invariant!0 (currentBit!3916 (_2!3742 lt!127632)) (currentByte!3921 (_2!3742 lt!127632)) (size!1633 (buf!2023 (_2!3742 lt!127632))))))))

(declare-fun res!66652 () Bool)

(assert (=> start!15954 (=> (not res!66652) (not e!52964))))

(assert (=> start!15954 (= res!66652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15954 e!52964))

(assert (=> start!15954 true))

(declare-fun e!52963 () Bool)

(declare-fun inv!12 (BitStream!2828) Bool)

(assert (=> start!15954 (and (inv!12 thiss!1716) e!52963)))

(declare-fun b!80566 () Bool)

(declare-fun res!66650 () Bool)

(assert (=> b!80566 (=> res!66650 e!52962)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80566 (= res!66650 (not (= (bvadd (bitIndex!0 (size!1633 (buf!2023 thiss!1716)) (currentByte!3921 thiss!1716) (currentBit!3916 thiss!1716)) nBits!516) (bitIndex!0 (size!1633 (buf!2023 (_2!3742 lt!127632))) (currentByte!3921 (_2!3742 lt!127632)) (currentBit!3916 (_2!3742 lt!127632))))))))

(declare-fun b!80567 () Bool)

(declare-fun res!66649 () Bool)

(assert (=> b!80567 (=> (not res!66649) (not e!52964))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80567 (= res!66649 (validate_offset_bits!1 ((_ sign_extend 32) (size!1633 (buf!2023 thiss!1716))) ((_ sign_extend 32) (currentByte!3921 thiss!1716)) ((_ sign_extend 32) (currentBit!3916 thiss!1716)) nBits!516))))

(declare-fun b!80568 () Bool)

(declare-fun array_inv!1479 (array!3539) Bool)

(assert (=> b!80568 (= e!52963 (array_inv!1479 (buf!2023 thiss!1716)))))

(assert (= (and start!15954 res!66652) b!80567))

(assert (= (and b!80567 res!66649) b!80564))

(assert (= (and b!80564 (not res!66651)) b!80566))

(assert (= (and b!80566 (not res!66650)) b!80565))

(assert (= start!15954 b!80568))

(declare-fun m!126073 () Bool)

(assert (=> b!80565 m!126073))

(declare-fun m!126075 () Bool)

(assert (=> b!80564 m!126075))

(declare-fun m!126077 () Bool)

(assert (=> b!80566 m!126077))

(declare-fun m!126079 () Bool)

(assert (=> b!80566 m!126079))

(declare-fun m!126081 () Bool)

(assert (=> b!80568 m!126081))

(declare-fun m!126083 () Bool)

(assert (=> b!80567 m!126083))

(declare-fun m!126085 () Bool)

(assert (=> start!15954 m!126085))

(push 1)

(assert (not start!15954))

(assert (not b!80567))

(assert (not b!80568))

(assert (not b!80566))

(assert (not b!80564))

(assert (not b!80565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

