; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15758 () Bool)

(assert start!15758)

(declare-fun b!79562 () Bool)

(declare-fun e!52280 () Bool)

(declare-datatypes ((array!3424 0))(
  ( (array!3425 (arr!2181 (Array (_ BitVec 32) (_ BitVec 8))) (size!1580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2722 0))(
  ( (BitStream!2723 (buf!1970 array!3424) (currentByte!3850 (_ BitVec 32)) (currentBit!3845 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2722)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79562 (= e!52280 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1580 (buf!1970 thiss!1716))) ((_ sign_extend 32) (currentByte!3850 thiss!1716)) ((_ sign_extend 32) (currentBit!3845 thiss!1716)) nBits!516)))))

(declare-fun b!79560 () Bool)

(declare-fun res!65858 () Bool)

(assert (=> b!79560 (=> (not res!65858) (not e!52280))))

(assert (=> b!79560 (= res!65858 (validate_offset_bits!1 ((_ sign_extend 32) (size!1580 (buf!1970 thiss!1716))) ((_ sign_extend 32) (currentByte!3850 thiss!1716)) ((_ sign_extend 32) (currentBit!3845 thiss!1716)) nBits!516))))

(declare-fun b!79563 () Bool)

(declare-fun e!52279 () Bool)

(declare-fun array_inv!1426 (array!3424) Bool)

(assert (=> b!79563 (= e!52279 (array_inv!1426 (buf!1970 thiss!1716)))))

(declare-fun res!65859 () Bool)

(assert (=> start!15758 (=> (not res!65859) (not e!52280))))

(assert (=> start!15758 (= res!65859 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15758 e!52280))

(assert (=> start!15758 true))

(declare-fun inv!12 (BitStream!2722) Bool)

(assert (=> start!15758 (and (inv!12 thiss!1716) e!52279)))

(declare-fun b!79561 () Bool)

(declare-fun res!65860 () Bool)

(assert (=> b!79561 (=> (not res!65860) (not e!52280))))

(assert (=> b!79561 (= res!65860 (bvsge ((_ sign_extend 32) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!15758 res!65859) b!79560))

(assert (= (and b!79560 res!65858) b!79561))

(assert (= (and b!79561 res!65860) b!79562))

(assert (= start!15758 b!79563))

(declare-fun m!124965 () Bool)

(assert (=> b!79562 m!124965))

(assert (=> b!79560 m!124965))

(declare-fun m!124967 () Bool)

(assert (=> b!79563 m!124967))

(declare-fun m!124969 () Bool)

(assert (=> start!15758 m!124969))

(push 1)

(assert (not b!79562))

(assert (not b!79563))

(assert (not start!15758))

(assert (not b!79560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

