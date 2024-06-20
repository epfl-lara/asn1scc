; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15970 () Bool)

(assert start!15970)

(declare-fun b!80698 () Bool)

(declare-fun e!53061 () Bool)

(declare-datatypes ((array!3555 0))(
  ( (array!3556 (arr!2251 (Array (_ BitVec 32) (_ BitVec 8))) (size!1641 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2844 0))(
  ( (BitStream!2845 (buf!2031 array!3555) (currentByte!3929 (_ BitVec 32)) (currentBit!3924 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2844)

(declare-fun array_inv!1487 (array!3555) Bool)

(assert (=> b!80698 (= e!53061 (array_inv!1487 (buf!2031 thiss!1716)))))

(declare-fun b!80699 () Bool)

(declare-fun e!53059 () Bool)

(declare-fun lt!127680 () (_ BitVec 64))

(assert (=> b!80699 (= e!53059 (and (bvslt lt!127680 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!127680 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!80700 () Bool)

(declare-fun e!53060 () Bool)

(assert (=> b!80700 (= e!53060 e!53059)))

(declare-fun res!66762 () Bool)

(assert (=> b!80700 (=> (not res!66762) (not e!53059))))

(declare-datatypes ((Unit!5340 0))(
  ( (Unit!5341) )
))
(declare-datatypes ((tuple3!318 0))(
  ( (tuple3!319 (_1!3750 Unit!5340) (_2!3750 BitStream!2844) (_3!180 array!3555)) )
))
(declare-fun lt!127679 () tuple3!318)

(assert (=> b!80700 (= res!66762 (= (buf!2031 (_2!3750 lt!127679)) (buf!2031 thiss!1716)))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!2844 (_ BitVec 64) array!3555 (_ BitVec 64) (_ BitVec 64)) tuple3!318)

(assert (=> b!80700 (= lt!127679 (readBitsLoop!0 thiss!1716 nBits!516 (array!3556 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) lt!127680)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!80700 (= lt!127680 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!66761 () Bool)

(assert (=> start!15970 (=> (not res!66761) (not e!53060))))

(assert (=> start!15970 (= res!66761 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15970 e!53060))

(assert (=> start!15970 true))

(declare-fun inv!12 (BitStream!2844) Bool)

(assert (=> start!15970 (and (inv!12 thiss!1716) e!53061)))

(declare-fun b!80701 () Bool)

(declare-fun res!66763 () Bool)

(assert (=> b!80701 (=> (not res!66763) (not e!53060))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80701 (= res!66763 (validate_offset_bits!1 ((_ sign_extend 32) (size!1641 (buf!2031 thiss!1716))) ((_ sign_extend 32) (currentByte!3929 thiss!1716)) ((_ sign_extend 32) (currentBit!3924 thiss!1716)) nBits!516))))

(declare-fun b!80702 () Bool)

(declare-fun res!66760 () Bool)

(assert (=> b!80702 (=> (not res!66760) (not e!53059))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80702 (= res!66760 (invariant!0 (currentBit!3924 (_2!3750 lt!127679)) (currentByte!3929 (_2!3750 lt!127679)) (size!1641 (buf!2031 (_2!3750 lt!127679)))))))

(declare-fun b!80703 () Bool)

(declare-fun res!66759 () Bool)

(assert (=> b!80703 (=> (not res!66759) (not e!53059))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80703 (= res!66759 (= (bvadd (bitIndex!0 (size!1641 (buf!2031 thiss!1716)) (currentByte!3929 thiss!1716) (currentBit!3924 thiss!1716)) nBits!516) (bitIndex!0 (size!1641 (buf!2031 (_2!3750 lt!127679))) (currentByte!3929 (_2!3750 lt!127679)) (currentBit!3924 (_2!3750 lt!127679)))))))

(assert (= (and start!15970 res!66761) b!80701))

(assert (= (and b!80701 res!66763) b!80700))

(assert (= (and b!80700 res!66762) b!80703))

(assert (= (and b!80703 res!66759) b!80702))

(assert (= (and b!80702 res!66760) b!80699))

(assert (= start!15970 b!80698))

(declare-fun m!126185 () Bool)

(assert (=> b!80702 m!126185))

(declare-fun m!126187 () Bool)

(assert (=> b!80700 m!126187))

(declare-fun m!126189 () Bool)

(assert (=> b!80701 m!126189))

(declare-fun m!126191 () Bool)

(assert (=> b!80698 m!126191))

(declare-fun m!126193 () Bool)

(assert (=> start!15970 m!126193))

(declare-fun m!126195 () Bool)

(assert (=> b!80703 m!126195))

(declare-fun m!126197 () Bool)

(assert (=> b!80703 m!126197))

(check-sat (not start!15970) (not b!80703) (not b!80700) (not b!80698) (not b!80702) (not b!80701))
(check-sat)
