; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48958 () Bool)

(assert start!48958)

(declare-fun b!232049 () Bool)

(declare-fun e!159682 () Bool)

(declare-datatypes ((array!11927 0))(
  ( (array!11928 (arr!6216 (Array (_ BitVec 32) (_ BitVec 8))) (size!5229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9554 0))(
  ( (BitStream!9555 (buf!5770 array!11927) (currentByte!10777 (_ BitVec 32)) (currentBit!10772 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9554)

(declare-fun array_inv!4970 (array!11927) Bool)

(assert (=> b!232049 (= e!159682 (array_inv!4970 (buf!5770 b1!101)))))

(declare-fun res!194286 () Bool)

(declare-fun e!159683 () Bool)

(assert (=> start!48958 (=> (not res!194286) (not e!159683))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9554)

(assert (=> start!48958 (= res!194286 (and (= (size!5229 (buf!5770 b1!101)) (size!5229 (buf!5770 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48958 e!159683))

(declare-fun inv!12 (BitStream!9554) Bool)

(assert (=> start!48958 (and (inv!12 b1!101) e!159682)))

(declare-fun e!159680 () Bool)

(assert (=> start!48958 (and (inv!12 b2!99) e!159680)))

(assert (=> start!48958 true))

(declare-fun b!232050 () Bool)

(declare-fun res!194289 () Bool)

(declare-fun e!159681 () Bool)

(assert (=> b!232050 (=> (not res!194289) (not e!159681))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232050 (= res!194289 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5229 (buf!5770 b1!101))) ((_ sign_extend 32) (currentByte!10777 b1!101)) ((_ sign_extend 32) (currentBit!10772 b1!101)) bytes!19))))

(declare-fun b!232051 () Bool)

(assert (=> b!232051 (= e!159680 (array_inv!4970 (buf!5770 b2!99)))))

(declare-fun lt!368840 () (_ BitVec 64))

(declare-fun b!232052 () Bool)

(declare-fun lt!368841 () (_ BitVec 64))

(assert (=> b!232052 (= e!159681 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5229 (buf!5770 b1!101)))) lt!368840) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14340 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10777 b2!99))))) (let ((bdg!14341 (bvadd bdg!14340 ((_ sign_extend 32) (currentBit!10772 b2!99))))) (and (= lt!368841 bdg!14341) (= (bvsub lt!368841 bits!86) lt!368840) (let ((bdg!14342 (bvand bdg!14340 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14342 (bvand ((_ sign_extend 32) (currentBit!10772 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14342 (bvand bdg!14341 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232052 (= lt!368840 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10777 b1!101))) ((_ sign_extend 32) (currentBit!10772 b1!101))))))

(declare-fun b!232053 () Bool)

(assert (=> b!232053 (= e!159683 e!159681)))

(declare-fun res!194285 () Bool)

(assert (=> b!232053 (=> (not res!194285) (not e!159681))))

(assert (=> b!232053 (= res!194285 (and (bvsle bits!86 lt!368841) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232053 (= lt!368841 (bitIndex!0 (size!5229 (buf!5770 b2!99)) (currentByte!10777 b2!99) (currentBit!10772 b2!99)))))

(declare-fun b!232054 () Bool)

(declare-fun res!194287 () Bool)

(assert (=> b!232054 (=> (not res!194287) (not e!159681))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232054 (= res!194287 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5229 (buf!5770 b1!101))) ((_ sign_extend 32) (currentByte!10777 b1!101)) ((_ sign_extend 32) (currentBit!10772 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232055 () Bool)

(declare-fun res!194288 () Bool)

(assert (=> b!232055 (=> (not res!194288) (not e!159681))))

(assert (=> b!232055 (= res!194288 (= lt!368841 (bvadd (bitIndex!0 (size!5229 (buf!5770 b1!101)) (currentByte!10777 b1!101) (currentBit!10772 b1!101)) bits!86)))))

(assert (= (and start!48958 res!194286) b!232053))

(assert (= (and b!232053 res!194285) b!232050))

(assert (= (and b!232050 res!194289) b!232055))

(assert (= (and b!232055 res!194288) b!232054))

(assert (= (and b!232054 res!194287) b!232052))

(assert (= start!48958 b!232049))

(assert (= start!48958 b!232051))

(declare-fun m!355027 () Bool)

(assert (=> b!232055 m!355027))

(declare-fun m!355029 () Bool)

(assert (=> b!232050 m!355029))

(declare-fun m!355031 () Bool)

(assert (=> b!232054 m!355031))

(declare-fun m!355033 () Bool)

(assert (=> b!232051 m!355033))

(declare-fun m!355035 () Bool)

(assert (=> b!232049 m!355035))

(declare-fun m!355037 () Bool)

(assert (=> b!232053 m!355037))

(declare-fun m!355039 () Bool)

(assert (=> start!48958 m!355039))

(declare-fun m!355041 () Bool)

(assert (=> start!48958 m!355041))

(push 1)

(assert (not b!232050))

(assert (not b!232049))

(assert (not b!232051))

(assert (not b!232053))

(assert (not start!48958))

(assert (not b!232055))

(assert (not b!232054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

