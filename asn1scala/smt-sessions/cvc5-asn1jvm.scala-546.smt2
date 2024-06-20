; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15848 () Bool)

(assert start!15848)

(declare-fun res!66163 () Bool)

(declare-fun e!52515 () Bool)

(assert (=> start!15848 (=> (not res!66163) (not e!52515))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15848 (= res!66163 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15848 e!52515))

(assert (=> start!15848 true))

(declare-datatypes ((array!3460 0))(
  ( (array!3461 (arr!2202 (Array (_ BitVec 32) (_ BitVec 8))) (size!1595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2752 0))(
  ( (BitStream!2753 (buf!1985 array!3460) (currentByte!3877 (_ BitVec 32)) (currentBit!3872 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2752)

(declare-fun e!52517 () Bool)

(declare-fun inv!12 (BitStream!2752) Bool)

(assert (=> start!15848 (and (inv!12 thiss!1716) e!52517)))

(declare-fun b!79942 () Bool)

(declare-fun res!66162 () Bool)

(declare-fun e!52516 () Bool)

(assert (=> b!79942 (=> (not res!66162) (not e!52516))))

(declare-datatypes ((Unit!5266 0))(
  ( (Unit!5267) )
))
(declare-datatypes ((tuple3!256 0))(
  ( (tuple3!257 (_1!3713 Unit!5266) (_2!3713 BitStream!2752) (_3!149 array!3460)) )
))
(declare-fun lt!127088 () tuple3!256)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79942 (= res!66162 (= (bvadd (bitIndex!0 (size!1595 (buf!1985 thiss!1716)) (currentByte!3877 thiss!1716) (currentBit!3872 thiss!1716)) nBits!516) (bitIndex!0 (size!1595 (buf!1985 (_2!3713 lt!127088))) (currentByte!3877 (_2!3713 lt!127088)) (currentBit!3872 (_2!3713 lt!127088)))))))

(declare-fun b!79943 () Bool)

(declare-fun res!66161 () Bool)

(assert (=> b!79943 (=> (not res!66161) (not e!52515))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79943 (= res!66161 (validate_offset_bits!1 ((_ sign_extend 32) (size!1595 (buf!1985 thiss!1716))) ((_ sign_extend 32) (currentByte!3877 thiss!1716)) ((_ sign_extend 32) (currentBit!3872 thiss!1716)) nBits!516))))

(declare-fun lt!127089 () (_ BitVec 32))

(declare-fun b!79944 () Bool)

(assert (=> b!79944 (= e!52516 (and (= (size!1595 (_3!149 lt!127088)) lt!127089) (bvsle (currentByte!3877 thiss!1716) (currentByte!3877 (_2!3713 lt!127088))) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!516))))))

(declare-fun b!79945 () Bool)

(declare-fun array_inv!1441 (array!3460) Bool)

(assert (=> b!79945 (= e!52517 (array_inv!1441 (buf!1985 thiss!1716)))))

(declare-fun b!79946 () Bool)

(assert (=> b!79946 (= e!52515 e!52516)))

(declare-fun res!66160 () Bool)

(assert (=> b!79946 (=> (not res!66160) (not e!52516))))

(assert (=> b!79946 (= res!66160 (= (buf!1985 (_2!3713 lt!127088)) (buf!1985 thiss!1716)))))

(declare-fun readBitsLoop!0 (BitStream!2752 (_ BitVec 64) array!3460 (_ BitVec 64) (_ BitVec 64)) tuple3!256)

(assert (=> b!79946 (= lt!127088 (readBitsLoop!0 thiss!1716 nBits!516 (array!3461 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127089) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79946 (= lt!127089 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79947 () Bool)

(declare-fun res!66159 () Bool)

(assert (=> b!79947 (=> (not res!66159) (not e!52516))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79947 (= res!66159 (invariant!0 (currentBit!3872 (_2!3713 lt!127088)) (currentByte!3877 (_2!3713 lt!127088)) (size!1595 (buf!1985 (_2!3713 lt!127088)))))))

(assert (= (and start!15848 res!66163) b!79943))

(assert (= (and b!79943 res!66161) b!79946))

(assert (= (and b!79946 res!66160) b!79942))

(assert (= (and b!79942 res!66162) b!79947))

(assert (= (and b!79947 res!66159) b!79944))

(assert (= start!15848 b!79945))

(declare-fun m!125493 () Bool)

(assert (=> b!79943 m!125493))

(declare-fun m!125495 () Bool)

(assert (=> b!79942 m!125495))

(declare-fun m!125497 () Bool)

(assert (=> b!79942 m!125497))

(declare-fun m!125499 () Bool)

(assert (=> b!79947 m!125499))

(declare-fun m!125501 () Bool)

(assert (=> b!79946 m!125501))

(declare-fun m!125503 () Bool)

(assert (=> b!79945 m!125503))

(declare-fun m!125505 () Bool)

(assert (=> start!15848 m!125505))

(push 1)

(assert (not b!79945))

(assert (not b!79947))

(assert (not b!79946))

(assert (not b!79942))

(assert (not start!15848))

(assert (not b!79943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

