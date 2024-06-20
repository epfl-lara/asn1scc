; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15754 () Bool)

(assert start!15754)

(declare-fun res!65845 () Bool)

(declare-fun e!52262 () Bool)

(assert (=> start!15754 (=> (not res!65845) (not e!52262))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15754 (= res!65845 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15754 e!52262))

(assert (=> start!15754 true))

(declare-datatypes ((array!3420 0))(
  ( (array!3421 (arr!2179 (Array (_ BitVec 32) (_ BitVec 8))) (size!1578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2718 0))(
  ( (BitStream!2719 (buf!1968 array!3420) (currentByte!3848 (_ BitVec 32)) (currentBit!3843 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2718)

(declare-fun e!52261 () Bool)

(declare-fun inv!12 (BitStream!2718) Bool)

(assert (=> start!15754 (and (inv!12 thiss!1716) e!52261)))

(declare-fun b!79540 () Bool)

(declare-fun res!65844 () Bool)

(assert (=> b!79540 (=> (not res!65844) (not e!52262))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79540 (= res!65844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1578 (buf!1968 thiss!1716))) ((_ sign_extend 32) (currentByte!3848 thiss!1716)) ((_ sign_extend 32) (currentBit!3843 thiss!1716)) nBits!516))))

(declare-fun b!79541 () Bool)

(assert (=> b!79541 (= e!52262 (bvslt ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79542 () Bool)

(declare-fun array_inv!1424 (array!3420) Bool)

(assert (=> b!79542 (= e!52261 (array_inv!1424 (buf!1968 thiss!1716)))))

(assert (= (and start!15754 res!65845) b!79540))

(assert (= (and b!79540 res!65844) b!79541))

(assert (= start!15754 b!79542))

(declare-fun m!124953 () Bool)

(assert (=> start!15754 m!124953))

(declare-fun m!124955 () Bool)

(assert (=> b!79540 m!124955))

(declare-fun m!124957 () Bool)

(assert (=> b!79542 m!124957))

(check-sat (not start!15754) (not b!79540) (not b!79542))
(check-sat)
