; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15760 () Bool)

(assert start!15760)

(declare-fun res!65867 () Bool)

(declare-fun e!52290 () Bool)

(assert (=> start!15760 (=> (not res!65867) (not e!52290))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15760 (= res!65867 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15760 e!52290))

(assert (=> start!15760 true))

(declare-datatypes ((array!3426 0))(
  ( (array!3427 (arr!2182 (Array (_ BitVec 32) (_ BitVec 8))) (size!1581 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2724 0))(
  ( (BitStream!2725 (buf!1971 array!3426) (currentByte!3851 (_ BitVec 32)) (currentBit!3846 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2724)

(declare-fun e!52288 () Bool)

(declare-fun inv!12 (BitStream!2724) Bool)

(assert (=> start!15760 (and (inv!12 thiss!1716) e!52288)))

(declare-fun b!79572 () Bool)

(declare-fun res!65868 () Bool)

(assert (=> b!79572 (=> (not res!65868) (not e!52290))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79572 (= res!65868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1581 (buf!1971 thiss!1716))) ((_ sign_extend 32) (currentByte!3851 thiss!1716)) ((_ sign_extend 32) (currentBit!3846 thiss!1716)) nBits!516))))

(declare-fun b!79575 () Bool)

(declare-fun array_inv!1427 (array!3426) Bool)

(assert (=> b!79575 (= e!52288 (array_inv!1427 (buf!1971 thiss!1716)))))

(declare-fun b!79573 () Bool)

(declare-fun res!65869 () Bool)

(assert (=> b!79573 (=> (not res!65869) (not e!52290))))

(assert (=> b!79573 (= res!65869 (bvsge ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79574 () Bool)

(assert (=> b!79574 (= e!52290 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1581 (buf!1971 thiss!1716))) ((_ sign_extend 32) (currentByte!3851 thiss!1716)) ((_ sign_extend 32) (currentBit!3846 thiss!1716)) nBits!516)))))

(assert (= (and start!15760 res!65867) b!79572))

(assert (= (and b!79572 res!65868) b!79573))

(assert (= (and b!79573 res!65869) b!79574))

(assert (= start!15760 b!79575))

(declare-fun m!124971 () Bool)

(assert (=> start!15760 m!124971))

(declare-fun m!124973 () Bool)

(assert (=> b!79572 m!124973))

(declare-fun m!124975 () Bool)

(assert (=> b!79575 m!124975))

(assert (=> b!79574 m!124973))

(check-sat (not b!79574) (not b!79575) (not start!15760) (not b!79572))
