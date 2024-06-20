; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15962 () Bool)

(assert start!15962)

(declare-fun b!80626 () Bool)

(declare-fun e!53012 () Bool)

(declare-fun e!53011 () Bool)

(assert (=> b!80626 (= e!53012 e!53011)))

(declare-fun res!66700 () Bool)

(assert (=> b!80626 (=> (not res!66700) (not e!53011))))

(declare-datatypes ((array!3547 0))(
  ( (array!3548 (arr!2247 (Array (_ BitVec 32) (_ BitVec 8))) (size!1637 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2836 0))(
  ( (BitStream!2837 (buf!2027 array!3547) (currentByte!3925 (_ BitVec 32)) (currentBit!3920 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5332 0))(
  ( (Unit!5333) )
))
(declare-datatypes ((tuple3!310 0))(
  ( (tuple3!311 (_1!3746 Unit!5332) (_2!3746 BitStream!2836) (_3!176 array!3547)) )
))
(declare-fun lt!127656 () tuple3!310)

(declare-fun thiss!1716 () BitStream!2836)

(assert (=> b!80626 (= res!66700 (= (buf!2027 (_2!3746 lt!127656)) (buf!2027 thiss!1716)))))

(declare-fun lt!127655 () (_ BitVec 64))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2836 (_ BitVec 64) array!3547 (_ BitVec 64) (_ BitVec 64)) tuple3!310)

(assert (=> b!80626 (= lt!127656 (readBitsLoop!0 thiss!1716 nBits!516 (array!3548 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127655)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80626 (= lt!127655 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80627 () Bool)

(declare-fun res!66699 () Bool)

(assert (=> b!80627 (=> (not res!66699) (not e!53012))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80627 (= res!66699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1637 (buf!2027 thiss!1716))) ((_ sign_extend 32) (currentByte!3925 thiss!1716)) ((_ sign_extend 32) (currentBit!3920 thiss!1716)) nBits!516))))

(declare-fun res!66702 () Bool)

(assert (=> start!15962 (=> (not res!66702) (not e!53012))))

(assert (=> start!15962 (= res!66702 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15962 e!53012))

(assert (=> start!15962 true))

(declare-fun e!53013 () Bool)

(declare-fun inv!12 (BitStream!2836) Bool)

(assert (=> start!15962 (and (inv!12 thiss!1716) e!53013)))

(declare-fun b!80628 () Bool)

(declare-fun array_inv!1483 (array!3547) Bool)

(assert (=> b!80628 (= e!53013 (array_inv!1483 (buf!2027 thiss!1716)))))

(declare-fun b!80629 () Bool)

(declare-fun res!66703 () Bool)

(assert (=> b!80629 (=> (not res!66703) (not e!53011))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80629 (= res!66703 (= (bvadd (bitIndex!0 (size!1637 (buf!2027 thiss!1716)) (currentByte!3925 thiss!1716) (currentBit!3920 thiss!1716)) nBits!516) (bitIndex!0 (size!1637 (buf!2027 (_2!3746 lt!127656))) (currentByte!3925 (_2!3746 lt!127656)) (currentBit!3920 (_2!3746 lt!127656)))))))

(declare-fun b!80630 () Bool)

(declare-fun res!66701 () Bool)

(assert (=> b!80630 (=> (not res!66701) (not e!53011))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80630 (= res!66701 (invariant!0 (currentBit!3920 (_2!3746 lt!127656)) (currentByte!3925 (_2!3746 lt!127656)) (size!1637 (buf!2027 (_2!3746 lt!127656)))))))

(declare-fun b!80631 () Bool)

(assert (=> b!80631 (= e!53011 (bvsge lt!127655 #b0000000000000000000000000000000010000000000000000000000000000000))))

(assert (= (and start!15962 res!66702) b!80627))

(assert (= (and b!80627 res!66699) b!80626))

(assert (= (and b!80626 res!66700) b!80629))

(assert (= (and b!80629 res!66703) b!80630))

(assert (= (and b!80630 res!66701) b!80631))

(assert (= start!15962 b!80628))

(declare-fun m!126129 () Bool)

(assert (=> b!80629 m!126129))

(declare-fun m!126131 () Bool)

(assert (=> b!80629 m!126131))

(declare-fun m!126133 () Bool)

(assert (=> start!15962 m!126133))

(declare-fun m!126135 () Bool)

(assert (=> b!80628 m!126135))

(declare-fun m!126137 () Bool)

(assert (=> b!80626 m!126137))

(declare-fun m!126139 () Bool)

(assert (=> b!80627 m!126139))

(declare-fun m!126141 () Bool)

(assert (=> b!80630 m!126141))

(push 1)

(assert (not start!15962))

(assert (not b!80628))

(assert (not b!80629))

(assert (not b!80630))

(assert (not b!80627))

(assert (not b!80626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

