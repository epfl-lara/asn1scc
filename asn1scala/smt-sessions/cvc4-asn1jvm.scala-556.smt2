; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15942 () Bool)

(assert start!15942)

(declare-fun b!80464 () Bool)

(declare-fun e!52893 () Bool)

(declare-fun e!52892 () Bool)

(assert (=> b!80464 (= e!52893 e!52892)))

(declare-fun res!66568 () Bool)

(assert (=> b!80464 (=> (not res!66568) (not e!52892))))

(declare-datatypes ((array!3527 0))(
  ( (array!3528 (arr!2237 (Array (_ BitVec 32) (_ BitVec 8))) (size!1627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2816 0))(
  ( (BitStream!2817 (buf!2017 array!3527) (currentByte!3915 (_ BitVec 32)) (currentBit!3910 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5312 0))(
  ( (Unit!5313) )
))
(declare-datatypes ((tuple3!290 0))(
  ( (tuple3!291 (_1!3736 Unit!5312) (_2!3736 BitStream!2816) (_3!166 array!3527)) )
))
(declare-fun lt!127596 () tuple3!290)

(declare-fun thiss!1716 () BitStream!2816)

(assert (=> b!80464 (= res!66568 (= (buf!2017 (_2!3736 lt!127596)) (buf!2017 thiss!1716)))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2816 (_ BitVec 64) array!3527 (_ BitVec 64) (_ BitVec 64)) tuple3!290)

(assert (=> b!80464 (= lt!127596 (readBitsLoop!0 thiss!1716 nBits!516 (array!3528 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80465 () Bool)

(declare-fun e!52891 () Bool)

(declare-fun array_inv!1473 (array!3527) Bool)

(assert (=> b!80465 (= e!52891 (array_inv!1473 (buf!2017 thiss!1716)))))

(declare-fun b!80466 () Bool)

(declare-fun res!66571 () Bool)

(assert (=> b!80466 (=> (not res!66571) (not e!52892))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80466 (= res!66571 (invariant!0 (currentBit!3910 (_2!3736 lt!127596)) (currentByte!3915 (_2!3736 lt!127596)) (size!1627 (buf!2017 (_2!3736 lt!127596)))))))

(declare-fun b!80467 () Bool)

(assert (=> b!80467 (= e!52892 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!66567 () Bool)

(assert (=> start!15942 (=> (not res!66567) (not e!52893))))

(assert (=> start!15942 (= res!66567 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15942 e!52893))

(assert (=> start!15942 true))

(declare-fun inv!12 (BitStream!2816) Bool)

(assert (=> start!15942 (and (inv!12 thiss!1716) e!52891)))

(declare-fun b!80468 () Bool)

(declare-fun res!66570 () Bool)

(assert (=> b!80468 (=> (not res!66570) (not e!52893))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80468 (= res!66570 (validate_offset_bits!1 ((_ sign_extend 32) (size!1627 (buf!2017 thiss!1716))) ((_ sign_extend 32) (currentByte!3915 thiss!1716)) ((_ sign_extend 32) (currentBit!3910 thiss!1716)) nBits!516))))

(declare-fun b!80469 () Bool)

(declare-fun res!66569 () Bool)

(assert (=> b!80469 (=> (not res!66569) (not e!52892))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80469 (= res!66569 (= (bvadd (bitIndex!0 (size!1627 (buf!2017 thiss!1716)) (currentByte!3915 thiss!1716) (currentBit!3910 thiss!1716)) nBits!516) (bitIndex!0 (size!1627 (buf!2017 (_2!3736 lt!127596))) (currentByte!3915 (_2!3736 lt!127596)) (currentBit!3910 (_2!3736 lt!127596)))))))

(assert (= (and start!15942 res!66567) b!80468))

(assert (= (and b!80468 res!66570) b!80464))

(assert (= (and b!80464 res!66568) b!80469))

(assert (= (and b!80469 res!66569) b!80466))

(assert (= (and b!80466 res!66571) b!80467))

(assert (= start!15942 b!80465))

(declare-fun m!125989 () Bool)

(assert (=> start!15942 m!125989))

(declare-fun m!125991 () Bool)

(assert (=> b!80466 m!125991))

(declare-fun m!125993 () Bool)

(assert (=> b!80464 m!125993))

(declare-fun m!125995 () Bool)

(assert (=> b!80468 m!125995))

(declare-fun m!125997 () Bool)

(assert (=> b!80465 m!125997))

(declare-fun m!125999 () Bool)

(assert (=> b!80469 m!125999))

(declare-fun m!126001 () Bool)

(assert (=> b!80469 m!126001))

(push 1)

(assert (not b!80469))

(assert (not b!80465))

(assert (not b!80464))

(assert (not b!80468))

(assert (not start!15942))

(assert (not b!80466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

