; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49232 () Bool)

(assert start!49232)

(declare-fun b!233868 () Bool)

(declare-fun e!161199 () Bool)

(declare-fun e!161201 () Bool)

(assert (=> b!233868 (= e!161199 e!161201)))

(declare-fun res!195650 () Bool)

(assert (=> b!233868 (=> (not res!195650) (not e!161201))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369684 () (_ BitVec 64))

(assert (=> b!233868 (= res!195650 (bvsle bits!86 lt!369684))))

(declare-datatypes ((array!12093 0))(
  ( (array!12094 (arr!6293 (Array (_ BitVec 32) (_ BitVec 8))) (size!5306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9708 0))(
  ( (BitStream!9709 (buf!5847 array!12093) (currentByte!10890 (_ BitVec 32)) (currentBit!10885 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9708)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233868 (= lt!369684 (bitIndex!0 (size!5306 (buf!5847 b2!99)) (currentByte!10890 b2!99) (currentBit!10885 b2!99)))))

(declare-fun b!233869 () Bool)

(declare-fun res!195646 () Bool)

(declare-fun e!161202 () Bool)

(assert (=> b!233869 (=> (not res!195646) (not e!161202))))

(declare-fun b1!101 () BitStream!9708)

(assert (=> b!233869 (= res!195646 (= lt!369684 (bvadd (bitIndex!0 (size!5306 (buf!5847 b1!101)) (currentByte!10890 b1!101) (currentBit!10885 b1!101)) bits!86)))))

(declare-fun b!233870 () Bool)

(declare-fun e!161195 () Bool)

(assert (=> b!233870 (= e!161202 e!161195)))

(declare-fun res!195644 () Bool)

(assert (=> b!233870 (=> (not res!195644) (not e!161195))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!369685 () (_ BitVec 64))

(assert (=> b!233870 (= res!195644 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5306 (buf!5847 b1!101)))) lt!369685) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233870 (= lt!369685 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10890 b1!101))) ((_ sign_extend 32) (currentBit!10885 b1!101))))))

(declare-fun b!233871 () Bool)

(declare-fun e!161203 () Bool)

(declare-fun e!161204 () Bool)

(assert (=> b!233871 (= e!161203 e!161204)))

(declare-fun res!195649 () Bool)

(assert (=> b!233871 (=> (not res!195649) (not e!161204))))

(declare-fun lt!369687 () (_ BitVec 64))

(declare-fun lt!369683 () (_ BitVec 64))

(declare-fun lt!369682 () (_ BitVec 64))

(assert (=> b!233871 (= res!195649 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369687 (bvsub lt!369683 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369687 lt!369683) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369682))))))

(assert (=> b!233871 (= lt!369687 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5306 (buf!5847 b2!99)))))))

(declare-fun b!233872 () Bool)

(assert (=> b!233872 (= e!161201 e!161202)))

(declare-fun res!195647 () Bool)

(assert (=> b!233872 (=> (not res!195647) (not e!161202))))

(declare-fun lt!369686 () (_ BitVec 32))

(assert (=> b!233872 (= res!195647 (bvsle lt!369686 bytes!19))))

(assert (=> b!233872 (= lt!369686 ((_ extract 31 0) lt!369682))))

(assert (=> b!233872 (= lt!369682 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233873 () Bool)

(assert (=> b!233873 (= e!161204 (and (bvslt lt!369682 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369682 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun res!195643 () Bool)

(assert (=> start!49232 (=> (not res!195643) (not e!161199))))

(assert (=> start!49232 (= res!195643 (and (= (size!5306 (buf!5847 b1!101)) (size!5306 (buf!5847 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49232 e!161199))

(declare-fun e!161197 () Bool)

(declare-fun inv!12 (BitStream!9708) Bool)

(assert (=> start!49232 (and (inv!12 b1!101) e!161197)))

(declare-fun e!161196 () Bool)

(assert (=> start!49232 (and (inv!12 b2!99) e!161196)))

(assert (=> start!49232 true))

(declare-fun b!233874 () Bool)

(declare-fun array_inv!5047 (array!12093) Bool)

(assert (=> b!233874 (= e!161197 (array_inv!5047 (buf!5847 b1!101)))))

(declare-fun b!233875 () Bool)

(assert (=> b!233875 (= e!161195 e!161203)))

(declare-fun res!195648 () Bool)

(assert (=> b!233875 (=> (not res!195648) (not e!161203))))

(assert (=> b!233875 (= res!195648 (and (= lt!369684 lt!369683) (= (bvsub lt!369684 bits!86) lt!369685)))))

(assert (=> b!233875 (= lt!369683 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10890 b2!99))) ((_ sign_extend 32) (currentBit!10885 b2!99))))))

(declare-fun b!233876 () Bool)

(declare-fun res!195642 () Bool)

(assert (=> b!233876 (=> (not res!195642) (not e!161202))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233876 (= res!195642 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5306 (buf!5847 b1!101))) ((_ sign_extend 32) (currentByte!10890 b1!101)) ((_ sign_extend 32) (currentBit!10885 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233877 () Bool)

(declare-fun res!195645 () Bool)

(assert (=> b!233877 (=> (not res!195645) (not e!161202))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233877 (= res!195645 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5306 (buf!5847 b1!101))) ((_ sign_extend 32) (currentByte!10890 b1!101)) ((_ sign_extend 32) (currentBit!10885 b1!101)) bytes!19))))

(declare-fun b!233878 () Bool)

(assert (=> b!233878 (= e!161196 (array_inv!5047 (buf!5847 b2!99)))))

(declare-fun b!233879 () Bool)

(declare-fun res!195651 () Bool)

(assert (=> b!233879 (=> (not res!195651) (not e!161204))))

(assert (=> b!233879 (= res!195651 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5306 (buf!5847 b2!99))) ((_ sign_extend 32) (currentByte!10890 b2!99)) ((_ sign_extend 32) (currentBit!10885 b2!99)) (bvsub bytes!19 lt!369686)))))

(assert (= (and start!49232 res!195643) b!233868))

(assert (= (and b!233868 res!195650) b!233872))

(assert (= (and b!233872 res!195647) b!233877))

(assert (= (and b!233877 res!195645) b!233869))

(assert (= (and b!233869 res!195646) b!233876))

(assert (= (and b!233876 res!195642) b!233870))

(assert (= (and b!233870 res!195644) b!233875))

(assert (= (and b!233875 res!195648) b!233871))

(assert (= (and b!233871 res!195649) b!233879))

(assert (= (and b!233879 res!195651) b!233873))

(assert (= start!49232 b!233874))

(assert (= start!49232 b!233878))

(declare-fun m!356291 () Bool)

(assert (=> b!233878 m!356291))

(declare-fun m!356293 () Bool)

(assert (=> b!233876 m!356293))

(declare-fun m!356295 () Bool)

(assert (=> b!233879 m!356295))

(declare-fun m!356297 () Bool)

(assert (=> b!233868 m!356297))

(declare-fun m!356299 () Bool)

(assert (=> b!233869 m!356299))

(declare-fun m!356301 () Bool)

(assert (=> start!49232 m!356301))

(declare-fun m!356303 () Bool)

(assert (=> start!49232 m!356303))

(declare-fun m!356305 () Bool)

(assert (=> b!233874 m!356305))

(declare-fun m!356307 () Bool)

(assert (=> b!233877 m!356307))

(check-sat (not b!233868) (not b!233877) (not b!233876) (not b!233869) (not b!233879) (not b!233878) (not b!233874) (not start!49232))
(check-sat)
