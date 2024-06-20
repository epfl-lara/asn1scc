; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48932 () Bool)

(assert start!48932)

(declare-fun b!231776 () Bool)

(declare-fun e!159447 () Bool)

(declare-datatypes ((array!11901 0))(
  ( (array!11902 (arr!6203 (Array (_ BitVec 32) (_ BitVec 8))) (size!5216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9528 0))(
  ( (BitStream!9529 (buf!5757 array!11901) (currentByte!10764 (_ BitVec 32)) (currentBit!10759 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9528)

(declare-fun array_inv!4957 (array!11901) Bool)

(assert (=> b!231776 (= e!159447 (array_inv!4957 (buf!5757 b2!99)))))

(declare-fun b!231777 () Bool)

(declare-fun res!194092 () Bool)

(declare-fun e!159448 () Bool)

(assert (=> b!231777 (=> (not res!194092) (not e!159448))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9528)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231777 (= res!194092 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5216 (buf!5757 b1!101))) ((_ sign_extend 32) (currentByte!10764 b1!101)) ((_ sign_extend 32) (currentBit!10759 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231778 () Bool)

(declare-fun lt!368754 () (_ BitVec 64))

(declare-fun lt!368753 () (_ BitVec 64))

(assert (=> b!231778 (= e!159448 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5216 (buf!5757 b1!101)))) (bvadd lt!368753 ((_ sign_extend 32) (currentBit!10759 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368754 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10764 b2!99))) ((_ sign_extend 32) (currentBit!10759 b2!99)))) (not (= ((_ sign_extend 32) (currentByte!10764 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!368753 ((_ sign_extend 32) (currentByte!10764 b1!101)))))))))

(assert (=> b!231778 (= lt!368753 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10764 b1!101))))))

(declare-fun b!231779 () Bool)

(declare-fun e!159449 () Bool)

(assert (=> b!231779 (= e!159449 e!159448)))

(declare-fun res!194094 () Bool)

(assert (=> b!231779 (=> (not res!194094) (not e!159448))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231779 (= res!194094 (and (bvsle bits!86 lt!368754) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231779 (= lt!368754 (bitIndex!0 (size!5216 (buf!5757 b2!99)) (currentByte!10764 b2!99) (currentBit!10759 b2!99)))))

(declare-fun b!231780 () Bool)

(declare-fun e!159445 () Bool)

(assert (=> b!231780 (= e!159445 (array_inv!4957 (buf!5757 b1!101)))))

(declare-fun res!194090 () Bool)

(assert (=> start!48932 (=> (not res!194090) (not e!159449))))

(assert (=> start!48932 (= res!194090 (and (= (size!5216 (buf!5757 b1!101)) (size!5216 (buf!5757 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48932 e!159449))

(declare-fun inv!12 (BitStream!9528) Bool)

(assert (=> start!48932 (and (inv!12 b1!101) e!159445)))

(assert (=> start!48932 (and (inv!12 b2!99) e!159447)))

(assert (=> start!48932 true))

(declare-fun b!231781 () Bool)

(declare-fun res!194093 () Bool)

(assert (=> b!231781 (=> (not res!194093) (not e!159448))))

(assert (=> b!231781 (= res!194093 (= lt!368754 (bvadd (bitIndex!0 (size!5216 (buf!5757 b1!101)) (currentByte!10764 b1!101) (currentBit!10759 b1!101)) bits!86)))))

(declare-fun b!231782 () Bool)

(declare-fun res!194091 () Bool)

(assert (=> b!231782 (=> (not res!194091) (not e!159448))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231782 (= res!194091 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5216 (buf!5757 b1!101))) ((_ sign_extend 32) (currentByte!10764 b1!101)) ((_ sign_extend 32) (currentBit!10759 b1!101)) bytes!19))))

(assert (= (and start!48932 res!194090) b!231779))

(assert (= (and b!231779 res!194094) b!231782))

(assert (= (and b!231782 res!194091) b!231781))

(assert (= (and b!231781 res!194093) b!231777))

(assert (= (and b!231777 res!194092) b!231778))

(assert (= start!48932 b!231780))

(assert (= start!48932 b!231776))

(declare-fun m!354819 () Bool)

(assert (=> b!231776 m!354819))

(declare-fun m!354821 () Bool)

(assert (=> b!231781 m!354821))

(declare-fun m!354823 () Bool)

(assert (=> b!231777 m!354823))

(declare-fun m!354825 () Bool)

(assert (=> b!231780 m!354825))

(declare-fun m!354827 () Bool)

(assert (=> start!48932 m!354827))

(declare-fun m!354829 () Bool)

(assert (=> start!48932 m!354829))

(declare-fun m!354831 () Bool)

(assert (=> b!231782 m!354831))

(declare-fun m!354833 () Bool)

(assert (=> b!231779 m!354833))

(check-sat (not start!48932) (not b!231782) (not b!231777) (not b!231779) (not b!231776) (not b!231780) (not b!231781))
(check-sat)
