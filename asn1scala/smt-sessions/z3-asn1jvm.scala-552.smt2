; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15886 () Bool)

(assert start!15886)

(declare-fun res!66375 () Bool)

(declare-fun e!52720 () Bool)

(assert (=> start!15886 (=> (not res!66375) (not e!52720))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15886 (= res!66375 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15886 e!52720))

(assert (=> start!15886 true))

(declare-datatypes ((array!3498 0))(
  ( (array!3499 (arr!2221 (Array (_ BitVec 32) (_ BitVec 8))) (size!1614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2790 0))(
  ( (BitStream!2791 (buf!2004 array!3498) (currentByte!3896 (_ BitVec 32)) (currentBit!3891 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2790)

(declare-fun e!52721 () Bool)

(declare-fun inv!12 (BitStream!2790) Bool)

(assert (=> start!15886 (and (inv!12 thiss!1716) e!52721)))

(declare-fun b!80215 () Bool)

(declare-fun res!66376 () Bool)

(assert (=> b!80215 (=> (not res!66376) (not e!52720))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80215 (= res!66376 (validate_offset_bits!1 ((_ sign_extend 32) (size!1614 (buf!2004 thiss!1716))) ((_ sign_extend 32) (currentByte!3896 thiss!1716)) ((_ sign_extend 32) (currentBit!3891 thiss!1716)) nBits!516))))

(declare-fun b!80216 () Bool)

(assert (=> b!80216 (= e!52720 (bvsge (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!80217 () Bool)

(declare-fun array_inv!1460 (array!3498) Bool)

(assert (=> b!80217 (= e!52721 (array_inv!1460 (buf!2004 thiss!1716)))))

(assert (= (and start!15886 res!66375) b!80215))

(assert (= (and b!80215 res!66376) b!80216))

(assert (= start!15886 b!80217))

(declare-fun m!125703 () Bool)

(assert (=> start!15886 m!125703))

(declare-fun m!125705 () Bool)

(assert (=> b!80215 m!125705))

(declare-fun m!125707 () Bool)

(assert (=> b!80217 m!125707))

(check-sat (not b!80217) (not b!80215) (not start!15886))
(check-sat)
