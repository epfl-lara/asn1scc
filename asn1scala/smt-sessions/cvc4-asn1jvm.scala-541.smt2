; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15762 () Bool)

(assert start!15762)

(declare-fun b!79587 () Bool)

(declare-fun e!52298 () Bool)

(declare-datatypes ((array!3428 0))(
  ( (array!3429 (arr!2183 (Array (_ BitVec 32) (_ BitVec 8))) (size!1582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2726 0))(
  ( (BitStream!2727 (buf!1972 array!3428) (currentByte!3852 (_ BitVec 32)) (currentBit!3847 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2726)

(declare-fun array_inv!1428 (array!3428) Bool)

(assert (=> b!79587 (= e!52298 (array_inv!1428 (buf!1972 thiss!1716)))))

(declare-fun b!79584 () Bool)

(declare-fun res!65877 () Bool)

(declare-fun e!52299 () Bool)

(assert (=> b!79584 (=> (not res!65877) (not e!52299))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79584 (= res!65877 (validate_offset_bits!1 ((_ sign_extend 32) (size!1582 (buf!1972 thiss!1716))) ((_ sign_extend 32) (currentByte!3852 thiss!1716)) ((_ sign_extend 32) (currentBit!3847 thiss!1716)) nBits!516))))

(declare-fun res!65878 () Bool)

(assert (=> start!15762 (=> (not res!65878) (not e!52299))))

(assert (=> start!15762 (= res!65878 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15762 e!52299))

(assert (=> start!15762 true))

(declare-fun inv!12 (BitStream!2726) Bool)

(assert (=> start!15762 (and (inv!12 thiss!1716) e!52298)))

(declare-fun b!79586 () Bool)

(assert (=> b!79586 (= e!52299 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1582 (buf!1972 thiss!1716))) ((_ sign_extend 32) (currentByte!3852 thiss!1716)) ((_ sign_extend 32) (currentBit!3847 thiss!1716)) nBits!516)))))

(declare-fun b!79585 () Bool)

(declare-fun res!65876 () Bool)

(assert (=> b!79585 (=> (not res!65876) (not e!52299))))

(assert (=> b!79585 (= res!65876 (bvsge ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!15762 res!65878) b!79584))

(assert (= (and b!79584 res!65877) b!79585))

(assert (= (and b!79585 res!65876) b!79586))

(assert (= start!15762 b!79587))

(declare-fun m!124977 () Bool)

(assert (=> b!79587 m!124977))

(declare-fun m!124979 () Bool)

(assert (=> b!79584 m!124979))

(declare-fun m!124981 () Bool)

(assert (=> start!15762 m!124981))

(assert (=> b!79586 m!124979))

(push 1)

(assert (not b!79586))

(assert (not b!79587))

(assert (not start!15762))

(assert (not b!79584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

