; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15888 () Bool)

(assert start!15888)

(declare-fun res!66382 () Bool)

(declare-fun e!52731 () Bool)

(assert (=> start!15888 (=> (not res!66382) (not e!52731))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15888 (= res!66382 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15888 e!52731))

(assert (=> start!15888 true))

(declare-datatypes ((array!3500 0))(
  ( (array!3501 (arr!2222 (Array (_ BitVec 32) (_ BitVec 8))) (size!1615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2792 0))(
  ( (BitStream!2793 (buf!2005 array!3500) (currentByte!3897 (_ BitVec 32)) (currentBit!3892 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2792)

(declare-fun e!52730 () Bool)

(declare-fun inv!12 (BitStream!2792) Bool)

(assert (=> start!15888 (and (inv!12 thiss!1716) e!52730)))

(declare-fun b!80224 () Bool)

(declare-fun res!66381 () Bool)

(assert (=> b!80224 (=> (not res!66381) (not e!52731))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80224 (= res!66381 (validate_offset_bits!1 ((_ sign_extend 32) (size!1615 (buf!2005 thiss!1716))) ((_ sign_extend 32) (currentByte!3897 thiss!1716)) ((_ sign_extend 32) (currentBit!3892 thiss!1716)) nBits!516))))

(declare-fun b!80225 () Bool)

(assert (=> b!80225 (= e!52731 (bvsge (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!80226 () Bool)

(declare-fun array_inv!1461 (array!3500) Bool)

(assert (=> b!80226 (= e!52730 (array_inv!1461 (buf!2005 thiss!1716)))))

(assert (= (and start!15888 res!66382) b!80224))

(assert (= (and b!80224 res!66381) b!80225))

(assert (= start!15888 b!80226))

(declare-fun m!125709 () Bool)

(assert (=> start!15888 m!125709))

(declare-fun m!125711 () Bool)

(assert (=> b!80224 m!125711))

(declare-fun m!125713 () Bool)

(assert (=> b!80226 m!125713))

(push 1)

(assert (not start!15888))

(assert (not b!80224))

(assert (not b!80226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

