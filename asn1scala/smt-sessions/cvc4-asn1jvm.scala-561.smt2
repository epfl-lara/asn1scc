; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15972 () Bool)

(assert start!15972)

(declare-fun res!66777 () Bool)

(declare-fun e!53070 () Bool)

(assert (=> start!15972 (=> (not res!66777) (not e!53070))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15972 (= res!66777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15972 e!53070))

(assert (=> start!15972 true))

(declare-datatypes ((array!3557 0))(
  ( (array!3558 (arr!2252 (Array (_ BitVec 32) (_ BitVec 8))) (size!1642 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2846 0))(
  ( (BitStream!2847 (buf!2032 array!3557) (currentByte!3930 (_ BitVec 32)) (currentBit!3925 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2846)

(declare-fun e!53073 () Bool)

(declare-fun inv!12 (BitStream!2846) Bool)

(assert (=> start!15972 (and (inv!12 thiss!1716) e!53073)))

(declare-fun b!80716 () Bool)

(declare-fun res!66775 () Bool)

(declare-fun e!53071 () Bool)

(assert (=> b!80716 (=> (not res!66775) (not e!53071))))

(declare-datatypes ((Unit!5342 0))(
  ( (Unit!5343) )
))
(declare-datatypes ((tuple3!320 0))(
  ( (tuple3!321 (_1!3751 Unit!5342) (_2!3751 BitStream!2846) (_3!181 array!3557)) )
))
(declare-fun lt!127686 () tuple3!320)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80716 (= res!66775 (= (bvadd (bitIndex!0 (size!1642 (buf!2032 thiss!1716)) (currentByte!3930 thiss!1716) (currentBit!3925 thiss!1716)) nBits!516) (bitIndex!0 (size!1642 (buf!2032 (_2!3751 lt!127686))) (currentByte!3930 (_2!3751 lt!127686)) (currentBit!3925 (_2!3751 lt!127686)))))))

(declare-fun b!80717 () Bool)

(assert (=> b!80717 (= e!53070 e!53071)))

(declare-fun res!66774 () Bool)

(assert (=> b!80717 (=> (not res!66774) (not e!53071))))

(assert (=> b!80717 (= res!66774 (= (buf!2032 (_2!3751 lt!127686)) (buf!2032 thiss!1716)))))

(declare-fun lt!127685 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2846 (_ BitVec 64) array!3557 (_ BitVec 64) (_ BitVec 64)) tuple3!320)

(assert (=> b!80717 (= lt!127686 (readBitsLoop!0 thiss!1716 nBits!516 (array!3558 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127685)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80717 (= lt!127685 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80718 () Bool)

(declare-fun res!66778 () Bool)

(assert (=> b!80718 (=> (not res!66778) (not e!53071))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80718 (= res!66778 (invariant!0 (currentBit!3925 (_2!3751 lt!127686)) (currentByte!3930 (_2!3751 lt!127686)) (size!1642 (buf!2032 (_2!3751 lt!127686)))))))

(declare-fun b!80719 () Bool)

(assert (=> b!80719 (= e!53071 (and (bvslt lt!127685 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127685 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!80720 () Bool)

(declare-fun array_inv!1488 (array!3557) Bool)

(assert (=> b!80720 (= e!53073 (array_inv!1488 (buf!2032 thiss!1716)))))

(declare-fun b!80721 () Bool)

(declare-fun res!66776 () Bool)

(assert (=> b!80721 (=> (not res!66776) (not e!53070))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80721 (= res!66776 (validate_offset_bits!1 ((_ sign_extend 32) (size!1642 (buf!2032 thiss!1716))) ((_ sign_extend 32) (currentByte!3930 thiss!1716)) ((_ sign_extend 32) (currentBit!3925 thiss!1716)) nBits!516))))

(assert (= (and start!15972 res!66777) b!80721))

(assert (= (and b!80721 res!66776) b!80717))

(assert (= (and b!80717 res!66774) b!80716))

(assert (= (and b!80716 res!66775) b!80718))

(assert (= (and b!80718 res!66778) b!80719))

(assert (= start!15972 b!80720))

(declare-fun m!126199 () Bool)

(assert (=> b!80716 m!126199))

(declare-fun m!126201 () Bool)

(assert (=> b!80716 m!126201))

(declare-fun m!126203 () Bool)

(assert (=> start!15972 m!126203))

(declare-fun m!126205 () Bool)

(assert (=> b!80717 m!126205))

(declare-fun m!126207 () Bool)

(assert (=> b!80720 m!126207))

(declare-fun m!126209 () Bool)

(assert (=> b!80718 m!126209))

(declare-fun m!126211 () Bool)

(assert (=> b!80721 m!126211))

(push 1)

(assert (not b!80721))

(assert (not b!80717))

(assert (not b!80720))

(assert (not start!15972))

(assert (not b!80716))

(assert (not b!80718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

