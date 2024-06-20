; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15952 () Bool)

(assert start!15952)

(declare-fun res!66640 () Bool)

(declare-fun e!52953 () Bool)

(assert (=> start!15952 (=> (not res!66640) (not e!52953))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15952 (= res!66640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15952 e!52953))

(assert (=> start!15952 true))

(declare-datatypes ((array!3537 0))(
  ( (array!3538 (arr!2242 (Array (_ BitVec 32) (_ BitVec 8))) (size!1632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2826 0))(
  ( (BitStream!2827 (buf!2022 array!3537) (currentByte!3920 (_ BitVec 32)) (currentBit!3915 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2826)

(declare-fun e!52951 () Bool)

(declare-fun inv!12 (BitStream!2826) Bool)

(assert (=> start!15952 (and (inv!12 thiss!1716) e!52951)))

(declare-fun b!80549 () Bool)

(assert (=> b!80549 (= e!52953 false)))

(declare-fun lt!127625 () Bool)

(declare-fun e!52952 () Bool)

(assert (=> b!80549 (= lt!127625 e!52952)))

(declare-fun res!66638 () Bool)

(assert (=> b!80549 (=> res!66638 e!52952)))

(declare-datatypes ((Unit!5322 0))(
  ( (Unit!5323) )
))
(declare-datatypes ((tuple3!300 0))(
  ( (tuple3!301 (_1!3741 Unit!5322) (_2!3741 BitStream!2826) (_3!171 array!3537)) )
))
(declare-fun lt!127626 () tuple3!300)

(assert (=> b!80549 (= res!66638 (not (= (buf!2022 (_2!3741 lt!127626)) (buf!2022 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2826 (_ BitVec 64) array!3537 (_ BitVec 64) (_ BitVec 64)) tuple3!300)

(assert (=> b!80549 (= lt!127626 (readBitsLoop!0 thiss!1716 nBits!516 (array!3538 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80550 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80550 (= e!52952 (not (invariant!0 (currentBit!3915 (_2!3741 lt!127626)) (currentByte!3920 (_2!3741 lt!127626)) (size!1632 (buf!2022 (_2!3741 lt!127626))))))))

(declare-fun b!80551 () Bool)

(declare-fun res!66637 () Bool)

(assert (=> b!80551 (=> (not res!66637) (not e!52953))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80551 (= res!66637 (validate_offset_bits!1 ((_ sign_extend 32) (size!1632 (buf!2022 thiss!1716))) ((_ sign_extend 32) (currentByte!3920 thiss!1716)) ((_ sign_extend 32) (currentBit!3915 thiss!1716)) nBits!516))))

(declare-fun b!80552 () Bool)

(declare-fun res!66639 () Bool)

(assert (=> b!80552 (=> res!66639 e!52952)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80552 (= res!66639 (not (= (bvadd (bitIndex!0 (size!1632 (buf!2022 thiss!1716)) (currentByte!3920 thiss!1716) (currentBit!3915 thiss!1716)) nBits!516) (bitIndex!0 (size!1632 (buf!2022 (_2!3741 lt!127626))) (currentByte!3920 (_2!3741 lt!127626)) (currentBit!3915 (_2!3741 lt!127626))))))))

(declare-fun b!80553 () Bool)

(declare-fun array_inv!1478 (array!3537) Bool)

(assert (=> b!80553 (= e!52951 (array_inv!1478 (buf!2022 thiss!1716)))))

(assert (= (and start!15952 res!66640) b!80551))

(assert (= (and b!80551 res!66637) b!80549))

(assert (= (and b!80549 (not res!66638)) b!80552))

(assert (= (and b!80552 (not res!66639)) b!80550))

(assert (= start!15952 b!80553))

(declare-fun m!126059 () Bool)

(assert (=> b!80550 m!126059))

(declare-fun m!126061 () Bool)

(assert (=> start!15952 m!126061))

(declare-fun m!126063 () Bool)

(assert (=> b!80549 m!126063))

(declare-fun m!126065 () Bool)

(assert (=> b!80552 m!126065))

(declare-fun m!126067 () Bool)

(assert (=> b!80552 m!126067))

(declare-fun m!126069 () Bool)

(assert (=> b!80553 m!126069))

(declare-fun m!126071 () Bool)

(assert (=> b!80551 m!126071))

(check-sat (not b!80551) (not start!15952) (not b!80553) (not b!80550) (not b!80549) (not b!80552))
