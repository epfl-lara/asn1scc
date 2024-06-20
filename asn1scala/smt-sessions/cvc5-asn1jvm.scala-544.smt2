; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15836 () Bool)

(assert start!15836)

(declare-fun res!66072 () Bool)

(declare-fun e!52444 () Bool)

(assert (=> start!15836 (=> (not res!66072) (not e!52444))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15836 (= res!66072 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15836 e!52444))

(assert (=> start!15836 true))

(declare-datatypes ((array!3448 0))(
  ( (array!3449 (arr!2196 (Array (_ BitVec 32) (_ BitVec 8))) (size!1589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2740 0))(
  ( (BitStream!2741 (buf!1979 array!3448) (currentByte!3871 (_ BitVec 32)) (currentBit!3866 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2740)

(declare-fun e!52446 () Bool)

(declare-fun inv!12 (BitStream!2740) Bool)

(assert (=> start!15836 (and (inv!12 thiss!1716) e!52446)))

(declare-fun b!79834 () Bool)

(declare-fun res!66070 () Bool)

(declare-fun e!52445 () Bool)

(assert (=> b!79834 (=> res!66070 e!52445)))

(declare-datatypes ((Unit!5254 0))(
  ( (Unit!5255) )
))
(declare-datatypes ((tuple3!244 0))(
  ( (tuple3!245 (_1!3707 Unit!5254) (_2!3707 BitStream!2740) (_3!143 array!3448)) )
))
(declare-fun lt!127037 () tuple3!244)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79834 (= res!66070 (not (= (bvadd (bitIndex!0 (size!1589 (buf!1979 thiss!1716)) (currentByte!3871 thiss!1716) (currentBit!3866 thiss!1716)) nBits!516) (bitIndex!0 (size!1589 (buf!1979 (_2!3707 lt!127037))) (currentByte!3871 (_2!3707 lt!127037)) (currentBit!3866 (_2!3707 lt!127037))))))))

(declare-fun b!79835 () Bool)

(assert (=> b!79835 (= e!52444 false)))

(declare-fun lt!127036 () Bool)

(assert (=> b!79835 (= lt!127036 e!52445)))

(declare-fun res!66073 () Bool)

(assert (=> b!79835 (=> res!66073 e!52445)))

(assert (=> b!79835 (= res!66073 (not (= (buf!1979 (_2!3707 lt!127037)) (buf!1979 thiss!1716))))))

(declare-fun lt!127038 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!2740 (_ BitVec 64) array!3448 (_ BitVec 64) (_ BitVec 64)) tuple3!244)

(assert (=> b!79835 (= lt!127037 (readBitsLoop!0 thiss!1716 nBits!516 (array!3449 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127038) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79835 (= lt!127038 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79836 () Bool)

(declare-fun res!66069 () Bool)

(assert (=> b!79836 (=> (not res!66069) (not e!52444))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79836 (= res!66069 (validate_offset_bits!1 ((_ sign_extend 32) (size!1589 (buf!1979 thiss!1716))) ((_ sign_extend 32) (currentByte!3871 thiss!1716)) ((_ sign_extend 32) (currentBit!3866 thiss!1716)) nBits!516))))

(declare-fun b!79837 () Bool)

(declare-fun array_inv!1435 (array!3448) Bool)

(assert (=> b!79837 (= e!52446 (array_inv!1435 (buf!1979 thiss!1716)))))

(declare-fun b!79838 () Bool)

(declare-fun res!66071 () Bool)

(assert (=> b!79838 (=> res!66071 e!52445)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79838 (= res!66071 (not (invariant!0 (currentBit!3866 (_2!3707 lt!127037)) (currentByte!3871 (_2!3707 lt!127037)) (size!1589 (buf!1979 (_2!3707 lt!127037))))))))

(declare-fun b!79839 () Bool)

(assert (=> b!79839 (= e!52445 (or (not (= (size!1589 (_3!143 lt!127037)) lt!127038)) (bvsgt (currentByte!3871 thiss!1716) (currentByte!3871 (_2!3707 lt!127037)))))))

(assert (= (and start!15836 res!66072) b!79836))

(assert (= (and b!79836 res!66069) b!79835))

(assert (= (and b!79835 (not res!66073)) b!79834))

(assert (= (and b!79834 (not res!66070)) b!79838))

(assert (= (and b!79838 (not res!66071)) b!79839))

(assert (= start!15836 b!79837))

(declare-fun m!125409 () Bool)

(assert (=> b!79838 m!125409))

(declare-fun m!125411 () Bool)

(assert (=> b!79834 m!125411))

(declare-fun m!125413 () Bool)

(assert (=> b!79834 m!125413))

(declare-fun m!125415 () Bool)

(assert (=> b!79837 m!125415))

(declare-fun m!125417 () Bool)

(assert (=> b!79836 m!125417))

(declare-fun m!125419 () Bool)

(assert (=> b!79835 m!125419))

(declare-fun m!125421 () Bool)

(assert (=> start!15836 m!125421))

(push 1)

(assert (not b!79834))

(assert (not b!79836))

(assert (not b!79837))

(assert (not b!79838))

(assert (not start!15836))

(assert (not b!79835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

