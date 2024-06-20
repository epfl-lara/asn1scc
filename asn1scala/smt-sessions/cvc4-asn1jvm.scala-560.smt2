; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15966 () Bool)

(assert start!15966)

(declare-fun b!80662 () Bool)

(declare-fun res!66731 () Bool)

(declare-fun e!53035 () Bool)

(assert (=> b!80662 (=> (not res!66731) (not e!53035))))

(declare-datatypes ((array!3551 0))(
  ( (array!3552 (arr!2249 (Array (_ BitVec 32) (_ BitVec 8))) (size!1639 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2840 0))(
  ( (BitStream!2841 (buf!2029 array!3551) (currentByte!3927 (_ BitVec 32)) (currentBit!3922 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2840)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80662 (= res!66731 (validate_offset_bits!1 ((_ sign_extend 32) (size!1639 (buf!2029 thiss!1716))) ((_ sign_extend 32) (currentByte!3927 thiss!1716)) ((_ sign_extend 32) (currentBit!3922 thiss!1716)) nBits!516))))

(declare-fun b!80663 () Bool)

(declare-fun e!53036 () Bool)

(assert (=> b!80663 (= e!53035 e!53036)))

(declare-fun res!66733 () Bool)

(assert (=> b!80663 (=> (not res!66733) (not e!53036))))

(declare-datatypes ((Unit!5336 0))(
  ( (Unit!5337) )
))
(declare-datatypes ((tuple3!314 0))(
  ( (tuple3!315 (_1!3748 Unit!5336) (_2!3748 BitStream!2840) (_3!178 array!3551)) )
))
(declare-fun lt!127667 () tuple3!314)

(assert (=> b!80663 (= res!66733 (= (buf!2029 (_2!3748 lt!127667)) (buf!2029 thiss!1716)))))

(declare-fun lt!127668 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2840 (_ BitVec 64) array!3551 (_ BitVec 64) (_ BitVec 64)) tuple3!314)

(assert (=> b!80663 (= lt!127667 (readBitsLoop!0 thiss!1716 nBits!516 (array!3552 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127668)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80663 (= lt!127668 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80664 () Bool)

(assert (=> b!80664 (= e!53036 (bvsge lt!127668 #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!80665 () Bool)

(declare-fun res!66732 () Bool)

(assert (=> b!80665 (=> (not res!66732) (not e!53036))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80665 (= res!66732 (invariant!0 (currentBit!3922 (_2!3748 lt!127667)) (currentByte!3927 (_2!3748 lt!127667)) (size!1639 (buf!2029 (_2!3748 lt!127667)))))))

(declare-fun b!80666 () Bool)

(declare-fun res!66729 () Bool)

(assert (=> b!80666 (=> (not res!66729) (not e!53036))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80666 (= res!66729 (= (bvadd (bitIndex!0 (size!1639 (buf!2029 thiss!1716)) (currentByte!3927 thiss!1716) (currentBit!3922 thiss!1716)) nBits!516) (bitIndex!0 (size!1639 (buf!2029 (_2!3748 lt!127667))) (currentByte!3927 (_2!3748 lt!127667)) (currentBit!3922 (_2!3748 lt!127667)))))))

(declare-fun res!66730 () Bool)

(assert (=> start!15966 (=> (not res!66730) (not e!53035))))

(assert (=> start!15966 (= res!66730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15966 e!53035))

(assert (=> start!15966 true))

(declare-fun e!53037 () Bool)

(declare-fun inv!12 (BitStream!2840) Bool)

(assert (=> start!15966 (and (inv!12 thiss!1716) e!53037)))

(declare-fun b!80667 () Bool)

(declare-fun array_inv!1485 (array!3551) Bool)

(assert (=> b!80667 (= e!53037 (array_inv!1485 (buf!2029 thiss!1716)))))

(assert (= (and start!15966 res!66730) b!80662))

(assert (= (and b!80662 res!66731) b!80663))

(assert (= (and b!80663 res!66733) b!80666))

(assert (= (and b!80666 res!66729) b!80665))

(assert (= (and b!80665 res!66732) b!80664))

(assert (= start!15966 b!80667))

(declare-fun m!126157 () Bool)

(assert (=> start!15966 m!126157))

(declare-fun m!126159 () Bool)

(assert (=> b!80662 m!126159))

(declare-fun m!126161 () Bool)

(assert (=> b!80665 m!126161))

(declare-fun m!126163 () Bool)

(assert (=> b!80667 m!126163))

(declare-fun m!126165 () Bool)

(assert (=> b!80663 m!126165))

(declare-fun m!126167 () Bool)

(assert (=> b!80666 m!126167))

(declare-fun m!126169 () Bool)

(assert (=> b!80666 m!126169))

(push 1)

(assert (not b!80666))

(assert (not start!15966))

(assert (not b!80667))

(assert (not b!80665))

(assert (not b!80662))

(assert (not b!80663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

