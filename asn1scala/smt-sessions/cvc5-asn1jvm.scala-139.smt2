; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3296 () Bool)

(assert start!3296)

(declare-fun res!13703 () Bool)

(declare-fun e!9116 () Bool)

(assert (=> start!3296 (=> (not res!13703) (not e!9116))))

(declare-fun nBytes!1 () (_ BitVec 32))

(assert (=> start!3296 (= res!13703 (bvsge nBytes!1 #b00000000000000000000000000000000))))

(assert (=> start!3296 e!9116))

(assert (=> start!3296 true))

(declare-datatypes ((array!843 0))(
  ( (array!844 (arr!787 (Array (_ BitVec 32) (_ BitVec 8))) (size!358 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!676 0))(
  ( (BitStream!677 (buf!709 array!843) (currentByte!1855 (_ BitVec 32)) (currentBit!1850 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!676)

(declare-fun e!9117 () Bool)

(declare-fun inv!12 (BitStream!676) Bool)

(assert (=> start!3296 (and (inv!12 thiss!1862) e!9117)))

(declare-fun b!14622 () Bool)

(declare-fun res!13702 () Bool)

(assert (=> b!14622 (=> (not res!13702) (not e!9116))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!14622 (= res!13702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!358 (buf!709 thiss!1862))) ((_ sign_extend 32) (currentByte!1855 thiss!1862)) ((_ sign_extend 32) (currentBit!1850 thiss!1862)) nBytes!1))))

(declare-fun b!14623 () Bool)

(assert (=> b!14623 (= e!9116 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!358 (buf!709 thiss!1862))) ((_ sign_extend 32) (currentByte!1855 thiss!1862)) ((_ sign_extend 32) (currentBit!1850 thiss!1862)) nBytes!1)))))

(declare-fun b!14624 () Bool)

(declare-fun array_inv!347 (array!843) Bool)

(assert (=> b!14624 (= e!9117 (array_inv!347 (buf!709 thiss!1862)))))

(assert (= (and start!3296 res!13703) b!14622))

(assert (= (and b!14622 res!13702) b!14623))

(assert (= start!3296 b!14624))

(declare-fun m!21059 () Bool)

(assert (=> start!3296 m!21059))

(declare-fun m!21061 () Bool)

(assert (=> b!14622 m!21061))

(assert (=> b!14623 m!21061))

(declare-fun m!21063 () Bool)

(assert (=> b!14624 m!21063))

(push 1)

(assert (not b!14624))

(assert (not b!14623))

(assert (not b!14622))

(assert (not start!3296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

