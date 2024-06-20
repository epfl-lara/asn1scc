; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15948 () Bool)

(assert start!15948)

(declare-fun b!80518 () Bool)

(declare-fun e!52926 () Bool)

(declare-fun lt!127613 () (_ BitVec 64))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> b!80518 (= e!52926 (and (not (= lt!127613 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127613 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80518 (= lt!127613 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80519 () Bool)

(declare-fun e!52927 () Bool)

(declare-datatypes ((array!3533 0))(
  ( (array!3534 (arr!2240 (Array (_ BitVec 32) (_ BitVec 8))) (size!1630 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2822 0))(
  ( (BitStream!2823 (buf!2020 array!3533) (currentByte!3918 (_ BitVec 32)) (currentBit!3913 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2822)

(declare-fun array_inv!1476 (array!3533) Bool)

(assert (=> b!80519 (= e!52927 (array_inv!1476 (buf!2020 thiss!1716)))))

(declare-fun b!80520 () Bool)

(declare-fun res!66613 () Bool)

(assert (=> b!80520 (=> (not res!66613) (not e!52926))))

(declare-datatypes ((Unit!5318 0))(
  ( (Unit!5319) )
))
(declare-datatypes ((tuple3!296 0))(
  ( (tuple3!297 (_1!3739 Unit!5318) (_2!3739 BitStream!2822) (_3!169 array!3533)) )
))
(declare-fun lt!127614 () tuple3!296)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80520 (= res!66613 (invariant!0 (currentBit!3913 (_2!3739 lt!127614)) (currentByte!3918 (_2!3739 lt!127614)) (size!1630 (buf!2020 (_2!3739 lt!127614)))))))

(declare-fun b!80521 () Bool)

(declare-fun e!52928 () Bool)

(assert (=> b!80521 (= e!52928 e!52926)))

(declare-fun res!66612 () Bool)

(assert (=> b!80521 (=> (not res!66612) (not e!52926))))

(assert (=> b!80521 (= res!66612 (= (buf!2020 (_2!3739 lt!127614)) (buf!2020 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2822 (_ BitVec 64) array!3533 (_ BitVec 64) (_ BitVec 64)) tuple3!296)

(assert (=> b!80521 (= lt!127614 (readBitsLoop!0 thiss!1716 nBits!516 (array!3534 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80522 () Bool)

(declare-fun res!66615 () Bool)

(assert (=> b!80522 (=> (not res!66615) (not e!52926))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80522 (= res!66615 (= (bvadd (bitIndex!0 (size!1630 (buf!2020 thiss!1716)) (currentByte!3918 thiss!1716) (currentBit!3913 thiss!1716)) nBits!516) (bitIndex!0 (size!1630 (buf!2020 (_2!3739 lt!127614))) (currentByte!3918 (_2!3739 lt!127614)) (currentBit!3913 (_2!3739 lt!127614)))))))

(declare-fun res!66616 () Bool)

(assert (=> start!15948 (=> (not res!66616) (not e!52928))))

(assert (=> start!15948 (= res!66616 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15948 e!52928))

(assert (=> start!15948 true))

(declare-fun inv!12 (BitStream!2822) Bool)

(assert (=> start!15948 (and (inv!12 thiss!1716) e!52927)))

(declare-fun b!80523 () Bool)

(declare-fun res!66614 () Bool)

(assert (=> b!80523 (=> (not res!66614) (not e!52928))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80523 (= res!66614 (validate_offset_bits!1 ((_ sign_extend 32) (size!1630 (buf!2020 thiss!1716))) ((_ sign_extend 32) (currentByte!3918 thiss!1716)) ((_ sign_extend 32) (currentBit!3913 thiss!1716)) nBits!516))))

(assert (= (and start!15948 res!66616) b!80523))

(assert (= (and b!80523 res!66614) b!80521))

(assert (= (and b!80521 res!66612) b!80522))

(assert (= (and b!80522 res!66615) b!80520))

(assert (= (and b!80520 res!66613) b!80518))

(assert (= start!15948 b!80519))

(declare-fun m!126031 () Bool)

(assert (=> start!15948 m!126031))

(declare-fun m!126033 () Bool)

(assert (=> b!80521 m!126033))

(declare-fun m!126035 () Bool)

(assert (=> b!80520 m!126035))

(declare-fun m!126037 () Bool)

(assert (=> b!80519 m!126037))

(declare-fun m!126039 () Bool)

(assert (=> b!80522 m!126039))

(declare-fun m!126041 () Bool)

(assert (=> b!80522 m!126041))

(declare-fun m!126043 () Bool)

(assert (=> b!80523 m!126043))

(push 1)

(assert (not b!80519))

(assert (not b!80520))

(assert (not b!80523))

(assert (not start!15948))

(assert (not b!80522))

(assert (not b!80521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

