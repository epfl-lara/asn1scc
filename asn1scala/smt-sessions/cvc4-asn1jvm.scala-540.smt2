; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15756 () Bool)

(assert start!15756)

(declare-fun res!65851 () Bool)

(declare-fun e!52272 () Bool)

(assert (=> start!15756 (=> (not res!65851) (not e!52272))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15756 (= res!65851 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15756 e!52272))

(assert (=> start!15756 true))

(declare-datatypes ((array!3422 0))(
  ( (array!3423 (arr!2180 (Array (_ BitVec 32) (_ BitVec 8))) (size!1579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2720 0))(
  ( (BitStream!2721 (buf!1969 array!3422) (currentByte!3849 (_ BitVec 32)) (currentBit!3844 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2720)

(declare-fun e!52271 () Bool)

(declare-fun inv!12 (BitStream!2720) Bool)

(assert (=> start!15756 (and (inv!12 thiss!1716) e!52271)))

(declare-fun b!79549 () Bool)

(declare-fun res!65850 () Bool)

(assert (=> b!79549 (=> (not res!65850) (not e!52272))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79549 (= res!65850 (validate_offset_bits!1 ((_ sign_extend 32) (size!1579 (buf!1969 thiss!1716))) ((_ sign_extend 32) (currentByte!3849 thiss!1716)) ((_ sign_extend 32) (currentBit!3844 thiss!1716)) nBits!516))))

(declare-fun b!79550 () Bool)

(assert (=> b!79550 (= e!52272 (bvslt ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79551 () Bool)

(declare-fun array_inv!1425 (array!3422) Bool)

(assert (=> b!79551 (= e!52271 (array_inv!1425 (buf!1969 thiss!1716)))))

(assert (= (and start!15756 res!65851) b!79549))

(assert (= (and b!79549 res!65850) b!79550))

(assert (= start!15756 b!79551))

(declare-fun m!124959 () Bool)

(assert (=> start!15756 m!124959))

(declare-fun m!124961 () Bool)

(assert (=> b!79549 m!124961))

(declare-fun m!124963 () Bool)

(assert (=> b!79551 m!124963))

(push 1)

(assert (not b!79549))

(assert (not b!79551))

(assert (not start!15756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

