; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15896 () Bool)

(assert start!15896)

(declare-fun res!66406 () Bool)

(declare-fun e!52765 () Bool)

(assert (=> start!15896 (=> (not res!66406) (not e!52765))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15896 (= res!66406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15896 e!52765))

(assert (=> start!15896 true))

(declare-datatypes ((array!3508 0))(
  ( (array!3509 (arr!2226 (Array (_ BitVec 32) (_ BitVec 8))) (size!1619 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2800 0))(
  ( (BitStream!2801 (buf!2009 array!3508) (currentByte!3901 (_ BitVec 32)) (currentBit!3896 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2800)

(declare-fun e!52766 () Bool)

(declare-fun inv!12 (BitStream!2800) Bool)

(assert (=> start!15896 (and (inv!12 thiss!1716) e!52766)))

(declare-fun b!80260 () Bool)

(declare-fun res!66405 () Bool)

(assert (=> b!80260 (=> (not res!66405) (not e!52765))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80260 (= res!66405 (validate_offset_bits!1 ((_ sign_extend 32) (size!1619 (buf!2009 thiss!1716))) ((_ sign_extend 32) (currentByte!3901 thiss!1716)) ((_ sign_extend 32) (currentBit!3896 thiss!1716)) nBits!516))))

(declare-fun b!80261 () Bool)

(assert (=> b!80261 (= e!52765 (bvslt ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000))))

(declare-fun b!80262 () Bool)

(declare-fun array_inv!1465 (array!3508) Bool)

(assert (=> b!80262 (= e!52766 (array_inv!1465 (buf!2009 thiss!1716)))))

(assert (= (and start!15896 res!66406) b!80260))

(assert (= (and b!80260 res!66405) b!80261))

(assert (= start!15896 b!80262))

(declare-fun m!125733 () Bool)

(assert (=> start!15896 m!125733))

(declare-fun m!125735 () Bool)

(assert (=> b!80260 m!125735))

(declare-fun m!125737 () Bool)

(assert (=> b!80262 m!125737))

(push 1)

(assert (not b!80262))

(assert (not b!80260))

(assert (not start!15896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

