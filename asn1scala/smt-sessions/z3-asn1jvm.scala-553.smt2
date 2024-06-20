; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15892 () Bool)

(assert start!15892)

(declare-fun res!66394 () Bool)

(declare-fun e!52747 () Bool)

(assert (=> start!15892 (=> (not res!66394) (not e!52747))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15892 (= res!66394 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15892 e!52747))

(assert (=> start!15892 true))

(declare-datatypes ((array!3504 0))(
  ( (array!3505 (arr!2224 (Array (_ BitVec 32) (_ BitVec 8))) (size!1617 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2796 0))(
  ( (BitStream!2797 (buf!2007 array!3504) (currentByte!3899 (_ BitVec 32)) (currentBit!3894 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2796)

(declare-fun e!52748 () Bool)

(declare-fun inv!12 (BitStream!2796) Bool)

(assert (=> start!15892 (and (inv!12 thiss!1716) e!52748)))

(declare-fun b!80242 () Bool)

(declare-fun res!66393 () Bool)

(assert (=> b!80242 (=> (not res!66393) (not e!52747))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80242 (= res!66393 (validate_offset_bits!1 ((_ sign_extend 32) (size!1617 (buf!2007 thiss!1716))) ((_ sign_extend 32) (currentByte!3899 thiss!1716)) ((_ sign_extend 32) (currentBit!3894 thiss!1716)) nBits!516))))

(declare-fun b!80243 () Bool)

(declare-fun lt!127188 () (_ BitVec 64))

(assert (=> b!80243 (= e!52747 (and (bvslt lt!127188 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127188 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (=> b!80243 (= lt!127188 (bvsdiv (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!80244 () Bool)

(declare-fun array_inv!1463 (array!3504) Bool)

(assert (=> b!80244 (= e!52748 (array_inv!1463 (buf!2007 thiss!1716)))))

(assert (= (and start!15892 res!66394) b!80242))

(assert (= (and b!80242 res!66393) b!80243))

(assert (= start!15892 b!80244))

(declare-fun m!125721 () Bool)

(assert (=> start!15892 m!125721))

(declare-fun m!125723 () Bool)

(assert (=> b!80242 m!125723))

(declare-fun m!125725 () Bool)

(assert (=> b!80244 m!125725))

(check-sat (not b!80242) (not start!15892) (not b!80244))
(check-sat)
