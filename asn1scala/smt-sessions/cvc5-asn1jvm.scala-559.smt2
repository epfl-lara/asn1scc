; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15956 () Bool)

(assert start!15956)

(declare-fun b!80579 () Bool)

(declare-fun e!52975 () Bool)

(declare-datatypes ((array!3541 0))(
  ( (array!3542 (arr!2244 (Array (_ BitVec 32) (_ BitVec 8))) (size!1634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2830 0))(
  ( (BitStream!2831 (buf!2024 array!3541) (currentByte!3922 (_ BitVec 32)) (currentBit!3917 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2830)

(declare-fun array_inv!1480 (array!3541) Bool)

(assert (=> b!80579 (= e!52975 (array_inv!1480 (buf!2024 thiss!1716)))))

(declare-fun b!80580 () Bool)

(declare-fun res!66664 () Bool)

(declare-fun e!52976 () Bool)

(assert (=> b!80580 (=> (not res!66664) (not e!52976))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80580 (= res!66664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1634 (buf!2024 thiss!1716))) ((_ sign_extend 32) (currentByte!3922 thiss!1716)) ((_ sign_extend 32) (currentBit!3917 thiss!1716)) nBits!516))))

(declare-fun res!66661 () Bool)

(assert (=> start!15956 (=> (not res!66661) (not e!52976))))

(assert (=> start!15956 (= res!66661 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15956 e!52976))

(assert (=> start!15956 true))

(declare-fun inv!12 (BitStream!2830) Bool)

(assert (=> start!15956 (and (inv!12 thiss!1716) e!52975)))

(declare-fun b!80581 () Bool)

(declare-fun e!52977 () Bool)

(declare-datatypes ((Unit!5326 0))(
  ( (Unit!5327) )
))
(declare-datatypes ((tuple3!304 0))(
  ( (tuple3!305 (_1!3743 Unit!5326) (_2!3743 BitStream!2830) (_3!173 array!3541)) )
))
(declare-fun lt!127638 () tuple3!304)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80581 (= e!52977 (not (invariant!0 (currentBit!3917 (_2!3743 lt!127638)) (currentByte!3922 (_2!3743 lt!127638)) (size!1634 (buf!2024 (_2!3743 lt!127638))))))))

(declare-fun b!80582 () Bool)

(assert (=> b!80582 (= e!52976 false)))

(declare-fun lt!127637 () Bool)

(assert (=> b!80582 (= lt!127637 e!52977)))

(declare-fun res!66663 () Bool)

(assert (=> b!80582 (=> res!66663 e!52977)))

(assert (=> b!80582 (= res!66663 (not (= (buf!2024 (_2!3743 lt!127638)) (buf!2024 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2830 (_ BitVec 64) array!3541 (_ BitVec 64) (_ BitVec 64)) tuple3!304)

(assert (=> b!80582 (= lt!127638 (readBitsLoop!0 thiss!1716 nBits!516 (array!3542 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80583 () Bool)

(declare-fun res!66662 () Bool)

(assert (=> b!80583 (=> res!66662 e!52977)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80583 (= res!66662 (not (= (bvadd (bitIndex!0 (size!1634 (buf!2024 thiss!1716)) (currentByte!3922 thiss!1716) (currentBit!3917 thiss!1716)) nBits!516) (bitIndex!0 (size!1634 (buf!2024 (_2!3743 lt!127638))) (currentByte!3922 (_2!3743 lt!127638)) (currentBit!3917 (_2!3743 lt!127638))))))))

(assert (= (and start!15956 res!66661) b!80580))

(assert (= (and b!80580 res!66664) b!80582))

(assert (= (and b!80582 (not res!66663)) b!80583))

(assert (= (and b!80583 (not res!66662)) b!80581))

(assert (= start!15956 b!80579))

(declare-fun m!126087 () Bool)

(assert (=> start!15956 m!126087))

(declare-fun m!126089 () Bool)

(assert (=> b!80581 m!126089))

(declare-fun m!126091 () Bool)

(assert (=> b!80582 m!126091))

(declare-fun m!126093 () Bool)

(assert (=> b!80583 m!126093))

(declare-fun m!126095 () Bool)

(assert (=> b!80583 m!126095))

(declare-fun m!126097 () Bool)

(assert (=> b!80579 m!126097))

(declare-fun m!126099 () Bool)

(assert (=> b!80580 m!126099))

(push 1)

(assert (not b!80579))

(assert (not b!80582))

(assert (not b!80581))

(assert (not start!15956))

(assert (not b!80580))

(assert (not b!80583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

