; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48944 () Bool)

(assert start!48944)

(declare-fun b!231902 () Bool)

(declare-fun e!159557 () Bool)

(declare-datatypes ((array!11913 0))(
  ( (array!11914 (arr!6209 (Array (_ BitVec 32) (_ BitVec 8))) (size!5222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9540 0))(
  ( (BitStream!9541 (buf!5763 array!11913) (currentByte!10770 (_ BitVec 32)) (currentBit!10765 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9540)

(declare-fun array_inv!4963 (array!11913) Bool)

(assert (=> b!231902 (= e!159557 (array_inv!4963 (buf!5763 b1!101)))))

(declare-fun b!231903 () Bool)

(declare-fun res!194184 () Bool)

(declare-fun e!159554 () Bool)

(assert (=> b!231903 (=> (not res!194184) (not e!159554))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231903 (= res!194184 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5222 (buf!5763 b1!101))) ((_ sign_extend 32) (currentByte!10770 b1!101)) ((_ sign_extend 32) (currentBit!10765 b1!101)) bytes!19))))

(declare-fun b!231904 () Bool)

(declare-fun e!159553 () Bool)

(declare-fun b2!99 () BitStream!9540)

(assert (=> b!231904 (= e!159553 (array_inv!4963 (buf!5763 b2!99)))))

(declare-fun res!194183 () Bool)

(declare-fun e!159556 () Bool)

(assert (=> start!48944 (=> (not res!194183) (not e!159556))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> start!48944 (= res!194183 (and (= (size!5222 (buf!5763 b1!101)) (size!5222 (buf!5763 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48944 e!159556))

(declare-fun inv!12 (BitStream!9540) Bool)

(assert (=> start!48944 (and (inv!12 b1!101) e!159557)))

(assert (=> start!48944 (and (inv!12 b2!99) e!159553)))

(assert (=> start!48944 true))

(declare-fun b!231905 () Bool)

(declare-fun res!194181 () Bool)

(assert (=> b!231905 (=> (not res!194181) (not e!159554))))

(declare-fun lt!368799 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231905 (= res!194181 (= lt!368799 (bvadd (bitIndex!0 (size!5222 (buf!5763 b1!101)) (currentByte!10770 b1!101) (currentBit!10765 b1!101)) bits!86)))))

(declare-fun b!231906 () Bool)

(assert (=> b!231906 (= e!159556 e!159554)))

(declare-fun res!194180 () Bool)

(assert (=> b!231906 (=> (not res!194180) (not e!159554))))

(assert (=> b!231906 (= res!194180 (and (bvsle bits!86 lt!368799) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231906 (= lt!368799 (bitIndex!0 (size!5222 (buf!5763 b2!99)) (currentByte!10770 b2!99) (currentBit!10765 b2!99)))))

(declare-fun lt!368798 () (_ BitVec 64))

(declare-fun b!231907 () Bool)

(assert (=> b!231907 (= e!159554 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5222 (buf!5763 b1!101)))) lt!368798) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368799 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10770 b2!99))) ((_ sign_extend 32) (currentBit!10765 b2!99)))) (= (bvsub lt!368799 bits!86) lt!368798) (not (= ((_ sign_extend 32) (size!5222 (buf!5763 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5222 (buf!5763 b2!99)))) ((_ sign_extend 32) (size!5222 (buf!5763 b2!99))))))))))

(assert (=> b!231907 (= lt!368798 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10770 b1!101))) ((_ sign_extend 32) (currentBit!10765 b1!101))))))

(declare-fun b!231908 () Bool)

(declare-fun res!194182 () Bool)

(assert (=> b!231908 (=> (not res!194182) (not e!159554))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231908 (= res!194182 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5222 (buf!5763 b1!101))) ((_ sign_extend 32) (currentByte!10770 b1!101)) ((_ sign_extend 32) (currentBit!10765 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48944 res!194183) b!231906))

(assert (= (and b!231906 res!194180) b!231903))

(assert (= (and b!231903 res!194184) b!231905))

(assert (= (and b!231905 res!194181) b!231908))

(assert (= (and b!231908 res!194182) b!231907))

(assert (= start!48944 b!231902))

(assert (= start!48944 b!231904))

(declare-fun m!354915 () Bool)

(assert (=> b!231904 m!354915))

(declare-fun m!354917 () Bool)

(assert (=> b!231903 m!354917))

(declare-fun m!354919 () Bool)

(assert (=> b!231908 m!354919))

(declare-fun m!354921 () Bool)

(assert (=> b!231905 m!354921))

(declare-fun m!354923 () Bool)

(assert (=> start!48944 m!354923))

(declare-fun m!354925 () Bool)

(assert (=> start!48944 m!354925))

(declare-fun m!354927 () Bool)

(assert (=> b!231902 m!354927))

(declare-fun m!354929 () Bool)

(assert (=> b!231906 m!354929))

(check-sat (not b!231908) (not start!48944) (not b!231903) (not b!231902) (not b!231904) (not b!231905) (not b!231906))
(check-sat)
