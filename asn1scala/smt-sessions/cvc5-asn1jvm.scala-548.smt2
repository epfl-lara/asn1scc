; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15860 () Bool)

(assert start!15860)

(declare-fun lt!127127 () (_ BitVec 32))

(declare-datatypes ((array!3472 0))(
  ( (array!3473 (arr!2208 (Array (_ BitVec 32) (_ BitVec 8))) (size!1601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2764 0))(
  ( (BitStream!2765 (buf!1991 array!3472) (currentByte!3883 (_ BitVec 32)) (currentBit!3878 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2764)

(declare-fun e!52590 () Bool)

(declare-datatypes ((Unit!5278 0))(
  ( (Unit!5279) )
))
(declare-datatypes ((tuple3!268 0))(
  ( (tuple3!269 (_1!3719 Unit!5278) (_2!3719 BitStream!2764) (_3!155 array!3472)) )
))
(declare-fun lt!127126 () tuple3!268)

(declare-fun b!80050 () Bool)

(assert (=> b!80050 (= e!52590 (or (not (= (size!1601 (_3!155 lt!127126)) lt!127127)) (bvsgt (currentByte!3883 thiss!1716) (currentByte!3883 (_2!3719 lt!127126)))))))

(declare-fun b!80051 () Bool)

(declare-fun res!66253 () Bool)

(declare-fun e!52587 () Bool)

(assert (=> b!80051 (=> (not res!66253) (not e!52587))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80051 (= res!66253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1601 (buf!1991 thiss!1716))) ((_ sign_extend 32) (currentByte!3883 thiss!1716)) ((_ sign_extend 32) (currentBit!3878 thiss!1716)) nBits!516))))

(declare-fun b!80052 () Bool)

(declare-fun e!52588 () Bool)

(declare-fun array_inv!1447 (array!3472) Bool)

(assert (=> b!80052 (= e!52588 (array_inv!1447 (buf!1991 thiss!1716)))))

(declare-fun b!80053 () Bool)

(declare-fun res!66252 () Bool)

(assert (=> b!80053 (=> res!66252 e!52590)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80053 (= res!66252 (not (= (bvadd (bitIndex!0 (size!1601 (buf!1991 thiss!1716)) (currentByte!3883 thiss!1716) (currentBit!3878 thiss!1716)) nBits!516) (bitIndex!0 (size!1601 (buf!1991 (_2!3719 lt!127126))) (currentByte!3883 (_2!3719 lt!127126)) (currentBit!3878 (_2!3719 lt!127126))))))))

(declare-fun res!66250 () Bool)

(assert (=> start!15860 (=> (not res!66250) (not e!52587))))

(assert (=> start!15860 (= res!66250 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15860 e!52587))

(assert (=> start!15860 true))

(declare-fun inv!12 (BitStream!2764) Bool)

(assert (=> start!15860 (and (inv!12 thiss!1716) e!52588)))

(declare-fun b!80054 () Bool)

(assert (=> b!80054 (= e!52587 false)))

(declare-fun lt!127128 () Bool)

(assert (=> b!80054 (= lt!127128 e!52590)))

(declare-fun res!66251 () Bool)

(assert (=> b!80054 (=> res!66251 e!52590)))

(assert (=> b!80054 (= res!66251 (not (= (buf!1991 (_2!3719 lt!127126)) (buf!1991 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2764 (_ BitVec 64) array!3472 (_ BitVec 64) (_ BitVec 64)) tuple3!268)

(assert (=> b!80054 (= lt!127126 (readBitsLoop!0 thiss!1716 nBits!516 (array!3473 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127127) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80054 (= lt!127127 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!80055 () Bool)

(declare-fun res!66249 () Bool)

(assert (=> b!80055 (=> res!66249 e!52590)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80055 (= res!66249 (not (invariant!0 (currentBit!3878 (_2!3719 lt!127126)) (currentByte!3883 (_2!3719 lt!127126)) (size!1601 (buf!1991 (_2!3719 lt!127126))))))))

(assert (= (and start!15860 res!66250) b!80051))

(assert (= (and b!80051 res!66253) b!80054))

(assert (= (and b!80054 (not res!66251)) b!80053))

(assert (= (and b!80053 (not res!66252)) b!80055))

(assert (= (and b!80055 (not res!66249)) b!80050))

(assert (= start!15860 b!80052))

(declare-fun m!125577 () Bool)

(assert (=> start!15860 m!125577))

(declare-fun m!125579 () Bool)

(assert (=> b!80054 m!125579))

(declare-fun m!125581 () Bool)

(assert (=> b!80055 m!125581))

(declare-fun m!125583 () Bool)

(assert (=> b!80051 m!125583))

(declare-fun m!125585 () Bool)

(assert (=> b!80052 m!125585))

(declare-fun m!125587 () Bool)

(assert (=> b!80053 m!125587))

(declare-fun m!125589 () Bool)

(assert (=> b!80053 m!125589))

(push 1)

(assert (not b!80051))

(assert (not b!80055))

(assert (not b!80052))

(assert (not start!15860))

(assert (not b!80054))

(assert (not b!80053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

