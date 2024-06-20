; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15752 () Bool)

(assert start!15752)

(declare-fun res!65838 () Bool)

(declare-fun e!52252 () Bool)

(assert (=> start!15752 (=> (not res!65838) (not e!52252))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15752 (= res!65838 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15752 e!52252))

(assert (=> start!15752 true))

(declare-datatypes ((array!3418 0))(
  ( (array!3419 (arr!2178 (Array (_ BitVec 32) (_ BitVec 8))) (size!1577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2716 0))(
  ( (BitStream!2717 (buf!1967 array!3418) (currentByte!3847 (_ BitVec 32)) (currentBit!3842 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2716)

(declare-fun e!52253 () Bool)

(declare-fun inv!12 (BitStream!2716) Bool)

(assert (=> start!15752 (and (inv!12 thiss!1716) e!52253)))

(declare-fun b!79531 () Bool)

(declare-fun res!65839 () Bool)

(assert (=> b!79531 (=> (not res!65839) (not e!52252))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79531 (= res!65839 (validate_offset_bits!1 ((_ sign_extend 32) (size!1577 (buf!1967 thiss!1716))) ((_ sign_extend 32) (currentByte!3847 thiss!1716)) ((_ sign_extend 32) (currentBit!3842 thiss!1716)) nBits!516))))

(declare-fun b!79532 () Bool)

(assert (=> b!79532 (= e!52252 (bvslt ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79533 () Bool)

(declare-fun array_inv!1423 (array!3418) Bool)

(assert (=> b!79533 (= e!52253 (array_inv!1423 (buf!1967 thiss!1716)))))

(assert (= (and start!15752 res!65838) b!79531))

(assert (= (and b!79531 res!65839) b!79532))

(assert (= start!15752 b!79533))

(declare-fun m!124947 () Bool)

(assert (=> start!15752 m!124947))

(declare-fun m!124949 () Bool)

(assert (=> b!79531 m!124949))

(declare-fun m!124951 () Bool)

(assert (=> b!79533 m!124951))

(push 1)

(assert (not start!15752))

(assert (not b!79531))

(assert (not b!79533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

