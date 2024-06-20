; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15880 () Bool)

(assert start!15880)

(declare-fun res!66357 () Bool)

(declare-fun e!52694 () Bool)

(assert (=> start!15880 (=> (not res!66357) (not e!52694))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15880 (= res!66357 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15880 e!52694))

(assert (=> start!15880 true))

(declare-datatypes ((array!3492 0))(
  ( (array!3493 (arr!2218 (Array (_ BitVec 32) (_ BitVec 8))) (size!1611 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2784 0))(
  ( (BitStream!2785 (buf!2001 array!3492) (currentByte!3893 (_ BitVec 32)) (currentBit!3888 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2784)

(declare-fun e!52695 () Bool)

(declare-fun inv!12 (BitStream!2784) Bool)

(assert (=> start!15880 (and (inv!12 thiss!1716) e!52695)))

(declare-fun b!80188 () Bool)

(declare-fun res!66358 () Bool)

(assert (=> b!80188 (=> (not res!66358) (not e!52694))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80188 (= res!66358 (validate_offset_bits!1 ((_ sign_extend 32) (size!1611 (buf!2001 thiss!1716))) ((_ sign_extend 32) (currentByte!3893 thiss!1716)) ((_ sign_extend 32) (currentBit!3888 thiss!1716)) nBits!516))))

(declare-fun b!80189 () Bool)

(declare-fun lt!127179 () (_ BitVec 64))

(assert (=> b!80189 (= e!52694 (and (not (= lt!127179 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127179 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80189 (= lt!127179 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80190 () Bool)

(declare-fun array_inv!1457 (array!3492) Bool)

(assert (=> b!80190 (= e!52695 (array_inv!1457 (buf!2001 thiss!1716)))))

(assert (= (and start!15880 res!66357) b!80188))

(assert (= (and b!80188 res!66358) b!80189))

(assert (= start!15880 b!80190))

(declare-fun m!125685 () Bool)

(assert (=> start!15880 m!125685))

(declare-fun m!125687 () Bool)

(assert (=> b!80188 m!125687))

(declare-fun m!125689 () Bool)

(assert (=> b!80190 m!125689))

(check-sat (not b!80188) (not b!80190) (not start!15880))
(check-sat)
