; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48956 () Bool)

(assert start!48956)

(declare-fun b!232028 () Bool)

(declare-fun res!194274 () Bool)

(declare-fun e!159661 () Bool)

(assert (=> b!232028 (=> (not res!194274) (not e!159661))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11925 0))(
  ( (array!11926 (arr!6215 (Array (_ BitVec 32) (_ BitVec 8))) (size!5228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9552 0))(
  ( (BitStream!9553 (buf!5769 array!11925) (currentByte!10776 (_ BitVec 32)) (currentBit!10771 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9552)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232028 (= res!194274 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5228 (buf!5769 b1!101))) ((_ sign_extend 32) (currentByte!10776 b1!101)) ((_ sign_extend 32) (currentBit!10771 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232029 () Bool)

(declare-fun lt!368835 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368834 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9552)

(assert (=> b!232029 (= e!159661 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5228 (buf!5769 b1!101)))) lt!368834) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14340 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10776 b2!99))))) (let ((bdg!14341 (bvadd bdg!14340 ((_ sign_extend 32) (currentBit!10771 b2!99))))) (and (= lt!368835 bdg!14341) (= (bvsub lt!368835 bits!86) lt!368834) (let ((bdg!14342 (bvand bdg!14340 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14342 (bvand ((_ sign_extend 32) (currentBit!10771 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14342 (bvand bdg!14341 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232029 (= lt!368834 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10776 b1!101))) ((_ sign_extend 32) (currentBit!10771 b1!101))))))

(declare-fun res!194271 () Bool)

(declare-fun e!159665 () Bool)

(assert (=> start!48956 (=> (not res!194271) (not e!159665))))

(assert (=> start!48956 (= res!194271 (and (= (size!5228 (buf!5769 b1!101)) (size!5228 (buf!5769 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48956 e!159665))

(declare-fun e!159660 () Bool)

(declare-fun inv!12 (BitStream!9552) Bool)

(assert (=> start!48956 (and (inv!12 b1!101) e!159660)))

(declare-fun e!159662 () Bool)

(assert (=> start!48956 (and (inv!12 b2!99) e!159662)))

(assert (=> start!48956 true))

(declare-fun b!232030 () Bool)

(assert (=> b!232030 (= e!159665 e!159661)))

(declare-fun res!194270 () Bool)

(assert (=> b!232030 (=> (not res!194270) (not e!159661))))

(assert (=> b!232030 (= res!194270 (and (bvsle bits!86 lt!368835) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232030 (= lt!368835 (bitIndex!0 (size!5228 (buf!5769 b2!99)) (currentByte!10776 b2!99) (currentBit!10771 b2!99)))))

(declare-fun b!232031 () Bool)

(declare-fun res!194273 () Bool)

(assert (=> b!232031 (=> (not res!194273) (not e!159661))))

(assert (=> b!232031 (= res!194273 (= lt!368835 (bvadd (bitIndex!0 (size!5228 (buf!5769 b1!101)) (currentByte!10776 b1!101) (currentBit!10771 b1!101)) bits!86)))))

(declare-fun b!232032 () Bool)

(declare-fun array_inv!4969 (array!11925) Bool)

(assert (=> b!232032 (= e!159660 (array_inv!4969 (buf!5769 b1!101)))))

(declare-fun b!232033 () Bool)

(assert (=> b!232033 (= e!159662 (array_inv!4969 (buf!5769 b2!99)))))

(declare-fun b!232034 () Bool)

(declare-fun res!194272 () Bool)

(assert (=> b!232034 (=> (not res!194272) (not e!159661))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232034 (= res!194272 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5228 (buf!5769 b1!101))) ((_ sign_extend 32) (currentByte!10776 b1!101)) ((_ sign_extend 32) (currentBit!10771 b1!101)) bytes!19))))

(assert (= (and start!48956 res!194271) b!232030))

(assert (= (and b!232030 res!194270) b!232034))

(assert (= (and b!232034 res!194272) b!232031))

(assert (= (and b!232031 res!194273) b!232028))

(assert (= (and b!232028 res!194274) b!232029))

(assert (= start!48956 b!232032))

(assert (= start!48956 b!232033))

(declare-fun m!355011 () Bool)

(assert (=> b!232032 m!355011))

(declare-fun m!355013 () Bool)

(assert (=> start!48956 m!355013))

(declare-fun m!355015 () Bool)

(assert (=> start!48956 m!355015))

(declare-fun m!355017 () Bool)

(assert (=> b!232034 m!355017))

(declare-fun m!355019 () Bool)

(assert (=> b!232030 m!355019))

(declare-fun m!355021 () Bool)

(assert (=> b!232033 m!355021))

(declare-fun m!355023 () Bool)

(assert (=> b!232031 m!355023))

(declare-fun m!355025 () Bool)

(assert (=> b!232028 m!355025))

(check-sat (not b!232031) (not b!232030) (not b!232028) (not b!232033) (not start!48956) (not b!232034) (not b!232032))
(check-sat)
