; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15946 () Bool)

(assert start!15946)

(declare-fun b!80500 () Bool)

(declare-fun res!66599 () Bool)

(declare-fun e!52917 () Bool)

(assert (=> b!80500 (=> (not res!66599) (not e!52917))))

(declare-datatypes ((array!3531 0))(
  ( (array!3532 (arr!2239 (Array (_ BitVec 32) (_ BitVec 8))) (size!1629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2820 0))(
  ( (BitStream!2821 (buf!2019 array!3531) (currentByte!3917 (_ BitVec 32)) (currentBit!3912 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2820)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((Unit!5316 0))(
  ( (Unit!5317) )
))
(declare-datatypes ((tuple3!294 0))(
  ( (tuple3!295 (_1!3738 Unit!5316) (_2!3738 BitStream!2820) (_3!168 array!3531)) )
))
(declare-fun lt!127607 () tuple3!294)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!80500 (= res!66599 (= (bvadd (bitIndex!0 (size!1629 (buf!2019 thiss!1716)) (currentByte!3917 thiss!1716) (currentBit!3912 thiss!1716)) nBits!516) (bitIndex!0 (size!1629 (buf!2019 (_2!3738 lt!127607))) (currentByte!3917 (_2!3738 lt!127607)) (currentBit!3912 (_2!3738 lt!127607)))))))

(declare-fun b!80501 () Bool)

(declare-fun lt!127608 () (_ BitVec 64))

(assert (=> b!80501 (= e!52917 (and (not (= lt!127608 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!127608 (bvand (bvadd nBits!516 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!80501 (= lt!127608 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!80502 () Bool)

(declare-fun e!52916 () Bool)

(declare-fun array_inv!1475 (array!3531) Bool)

(assert (=> b!80502 (= e!52916 (array_inv!1475 (buf!2019 thiss!1716)))))

(declare-fun b!80503 () Bool)

(declare-fun e!52914 () Bool)

(assert (=> b!80503 (= e!52914 e!52917)))

(declare-fun res!66598 () Bool)

(assert (=> b!80503 (=> (not res!66598) (not e!52917))))

(assert (=> b!80503 (= res!66598 (= (buf!2019 (_2!3738 lt!127607)) (buf!2019 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2820 (_ BitVec 64) array!3531 (_ BitVec 64) (_ BitVec 64)) tuple3!294)

(assert (=> b!80503 (= lt!127607 (readBitsLoop!0 thiss!1716 nBits!516 (array!3532 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(declare-fun b!80504 () Bool)

(declare-fun res!66597 () Bool)

(assert (=> b!80504 (=> (not res!66597) (not e!52917))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!80504 (= res!66597 (invariant!0 (currentBit!3912 (_2!3738 lt!127607)) (currentByte!3917 (_2!3738 lt!127607)) (size!1629 (buf!2019 (_2!3738 lt!127607)))))))

(declare-fun b!80505 () Bool)

(declare-fun res!66600 () Bool)

(assert (=> b!80505 (=> (not res!66600) (not e!52914))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80505 (= res!66600 (validate_offset_bits!1 ((_ sign_extend 32) (size!1629 (buf!2019 thiss!1716))) ((_ sign_extend 32) (currentByte!3917 thiss!1716)) ((_ sign_extend 32) (currentBit!3912 thiss!1716)) nBits!516))))

(declare-fun res!66601 () Bool)

(assert (=> start!15946 (=> (not res!66601) (not e!52914))))

(assert (=> start!15946 (= res!66601 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15946 e!52914))

(assert (=> start!15946 true))

(declare-fun inv!12 (BitStream!2820) Bool)

(assert (=> start!15946 (and (inv!12 thiss!1716) e!52916)))

(assert (= (and start!15946 res!66601) b!80505))

(assert (= (and b!80505 res!66600) b!80503))

(assert (= (and b!80503 res!66598) b!80500))

(assert (= (and b!80500 res!66599) b!80504))

(assert (= (and b!80504 res!66597) b!80501))

(assert (= start!15946 b!80502))

(declare-fun m!126017 () Bool)

(assert (=> b!80502 m!126017))

(declare-fun m!126019 () Bool)

(assert (=> b!80504 m!126019))

(declare-fun m!126021 () Bool)

(assert (=> b!80503 m!126021))

(declare-fun m!126023 () Bool)

(assert (=> b!80500 m!126023))

(declare-fun m!126025 () Bool)

(assert (=> b!80500 m!126025))

(declare-fun m!126027 () Bool)

(assert (=> b!80505 m!126027))

(declare-fun m!126029 () Bool)

(assert (=> start!15946 m!126029))

(check-sat (not b!80503) (not b!80505) (not b!80504) (not start!15946) (not b!80500) (not b!80502))
(check-sat)
