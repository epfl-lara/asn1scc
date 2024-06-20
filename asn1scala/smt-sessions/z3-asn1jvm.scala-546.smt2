; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15850 () Bool)

(assert start!15850)

(declare-fun b!79960 () Bool)

(declare-fun res!66174 () Bool)

(declare-fun e!52529 () Bool)

(assert (=> b!79960 (=> (not res!66174) (not e!52529))))

(declare-datatypes ((array!3462 0))(
  ( (array!3463 (arr!2203 (Array (_ BitVec 32) (_ BitVec 8))) (size!1596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2754 0))(
  ( (BitStream!2755 (buf!1986 array!3462) (currentByte!3878 (_ BitVec 32)) (currentBit!3873 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5268 0))(
  ( (Unit!5269) )
))
(declare-datatypes ((tuple3!258 0))(
  ( (tuple3!259 (_1!3714 Unit!5268) (_2!3714 BitStream!2754) (_3!150 array!3462)) )
))
(declare-fun lt!127095 () tuple3!258)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79960 (= res!66174 (invariant!0 (currentBit!3873 (_2!3714 lt!127095)) (currentByte!3878 (_2!3714 lt!127095)) (size!1596 (buf!1986 (_2!3714 lt!127095)))))))

(declare-fun lt!127094 () (_ BitVec 32))

(declare-fun thiss!1716 () BitStream!2754)

(declare-fun b!79961 () Bool)

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> b!79961 (= e!52529 (and (= (size!1596 (_3!150 lt!127095)) lt!127094) (bvsle (currentByte!3878 thiss!1716) (currentByte!3878 (_2!3714 lt!127095))) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516))))))

(declare-fun b!79962 () Bool)

(declare-fun res!66177 () Bool)

(declare-fun e!52530 () Bool)

(assert (=> b!79962 (=> (not res!66177) (not e!52530))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79962 (= res!66177 (validate_offset_bits!1 ((_ sign_extend 32) (size!1596 (buf!1986 thiss!1716))) ((_ sign_extend 32) (currentByte!3878 thiss!1716)) ((_ sign_extend 32) (currentBit!3873 thiss!1716)) nBits!516))))

(declare-fun b!79963 () Bool)

(assert (=> b!79963 (= e!52530 e!52529)))

(declare-fun res!66176 () Bool)

(assert (=> b!79963 (=> (not res!66176) (not e!52529))))

(assert (=> b!79963 (= res!66176 (= (buf!1986 (_2!3714 lt!127095)) (buf!1986 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2754 (_ BitVec 64) array!3462 (_ BitVec 64) (_ BitVec 64)) tuple3!258)

(assert (=> b!79963 (= lt!127095 (readBitsLoop!0 thiss!1716 nBits!516 (array!3463 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127094) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79963 (= lt!127094 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!66175 () Bool)

(assert (=> start!15850 (=> (not res!66175) (not e!52530))))

(assert (=> start!15850 (= res!66175 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15850 e!52530))

(assert (=> start!15850 true))

(declare-fun e!52527 () Bool)

(declare-fun inv!12 (BitStream!2754) Bool)

(assert (=> start!15850 (and (inv!12 thiss!1716) e!52527)))

(declare-fun b!79964 () Bool)

(declare-fun array_inv!1442 (array!3462) Bool)

(assert (=> b!79964 (= e!52527 (array_inv!1442 (buf!1986 thiss!1716)))))

(declare-fun b!79965 () Bool)

(declare-fun res!66178 () Bool)

(assert (=> b!79965 (=> (not res!66178) (not e!52529))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79965 (= res!66178 (= (bvadd (bitIndex!0 (size!1596 (buf!1986 thiss!1716)) (currentByte!3878 thiss!1716) (currentBit!3873 thiss!1716)) nBits!516) (bitIndex!0 (size!1596 (buf!1986 (_2!3714 lt!127095))) (currentByte!3878 (_2!3714 lt!127095)) (currentBit!3873 (_2!3714 lt!127095)))))))

(assert (= (and start!15850 res!66175) b!79962))

(assert (= (and b!79962 res!66177) b!79963))

(assert (= (and b!79963 res!66176) b!79965))

(assert (= (and b!79965 res!66178) b!79960))

(assert (= (and b!79960 res!66174) b!79961))

(assert (= start!15850 b!79964))

(declare-fun m!125507 () Bool)

(assert (=> start!15850 m!125507))

(declare-fun m!125509 () Bool)

(assert (=> b!79963 m!125509))

(declare-fun m!125511 () Bool)

(assert (=> b!79962 m!125511))

(declare-fun m!125513 () Bool)

(assert (=> b!79964 m!125513))

(declare-fun m!125515 () Bool)

(assert (=> b!79965 m!125515))

(declare-fun m!125517 () Bool)

(assert (=> b!79965 m!125517))

(declare-fun m!125519 () Bool)

(assert (=> b!79960 m!125519))

(check-sat (not b!79962) (not b!79963) (not b!79964) (not b!79960) (not start!15850) (not b!79965))
(check-sat)
