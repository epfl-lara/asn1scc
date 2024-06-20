; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15900 () Bool)

(assert start!15900)

(declare-fun res!66417 () Bool)

(declare-fun e!52784 () Bool)

(assert (=> start!15900 (=> (not res!66417) (not e!52784))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15900 (= res!66417 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15900 e!52784))

(assert (=> start!15900 true))

(declare-datatypes ((array!3512 0))(
  ( (array!3513 (arr!2228 (Array (_ BitVec 32) (_ BitVec 8))) (size!1621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2804 0))(
  ( (BitStream!2805 (buf!2011 array!3512) (currentByte!3903 (_ BitVec 32)) (currentBit!3898 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2804)

(declare-fun e!52785 () Bool)

(declare-fun inv!12 (BitStream!2804) Bool)

(assert (=> start!15900 (and (inv!12 thiss!1716) e!52785)))

(declare-fun b!80278 () Bool)

(declare-fun res!66418 () Bool)

(assert (=> b!80278 (=> (not res!66418) (not e!52784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80278 (= res!66418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1621 (buf!2011 thiss!1716))) ((_ sign_extend 32) (currentByte!3903 thiss!1716)) ((_ sign_extend 32) (currentBit!3898 thiss!1716)) nBits!516))))

(declare-fun b!80279 () Bool)

(assert (=> b!80279 (= e!52784 (bvslt ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000))))

(declare-fun b!80280 () Bool)

(declare-fun array_inv!1467 (array!3512) Bool)

(assert (=> b!80280 (= e!52785 (array_inv!1467 (buf!2011 thiss!1716)))))

(assert (= (and start!15900 res!66417) b!80278))

(assert (= (and b!80278 res!66418) b!80279))

(assert (= start!15900 b!80280))

(declare-fun m!125745 () Bool)

(assert (=> start!15900 m!125745))

(declare-fun m!125747 () Bool)

(assert (=> b!80278 m!125747))

(declare-fun m!125749 () Bool)

(assert (=> b!80280 m!125749))

(push 1)

(assert (not b!80278))

(assert (not start!15900))

(assert (not b!80280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

