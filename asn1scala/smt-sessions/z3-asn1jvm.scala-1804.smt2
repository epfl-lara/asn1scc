; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48938 () Bool)

(assert start!48938)

(declare-fun b!231839 () Bool)

(declare-fun res!194137 () Bool)

(declare-fun e!159502 () Bool)

(assert (=> b!231839 (=> (not res!194137) (not e!159502))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11907 0))(
  ( (array!11908 (arr!6206 (Array (_ BitVec 32) (_ BitVec 8))) (size!5219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9534 0))(
  ( (BitStream!9535 (buf!5760 array!11907) (currentByte!10767 (_ BitVec 32)) (currentBit!10762 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9534)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231839 (= res!194137 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5219 (buf!5760 b1!101))) ((_ sign_extend 32) (currentByte!10767 b1!101)) ((_ sign_extend 32) (currentBit!10762 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231840 () Bool)

(declare-fun lt!368777 () (_ BitVec 64))

(declare-fun lt!368776 () (_ BitVec 64))

(declare-fun lt!368778 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9534)

(assert (=> b!231840 (= e!159502 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5219 (buf!5760 b1!101)))) lt!368778) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368776 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10767 b2!99))) ((_ sign_extend 32) (currentBit!10762 b2!99)))) (let ((bdg!14332 (bvand lt!368777 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14332 (bvand ((_ sign_extend 32) (currentBit!10762 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14332 (bvand lt!368778 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!231840 (= lt!368778 (bvadd lt!368777 ((_ sign_extend 32) (currentBit!10762 b1!101))))))

(assert (=> b!231840 (= lt!368777 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10767 b1!101))))))

(declare-fun b!231841 () Bool)

(declare-fun res!194139 () Bool)

(assert (=> b!231841 (=> (not res!194139) (not e!159502))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231841 (= res!194139 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5219 (buf!5760 b1!101))) ((_ sign_extend 32) (currentByte!10767 b1!101)) ((_ sign_extend 32) (currentBit!10762 b1!101)) bytes!19))))

(declare-fun b!231842 () Bool)

(declare-fun e!159500 () Bool)

(assert (=> b!231842 (= e!159500 e!159502)))

(declare-fun res!194135 () Bool)

(assert (=> b!231842 (=> (not res!194135) (not e!159502))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!231842 (= res!194135 (and (bvsle bits!86 lt!368776) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231842 (= lt!368776 (bitIndex!0 (size!5219 (buf!5760 b2!99)) (currentByte!10767 b2!99) (currentBit!10762 b2!99)))))

(declare-fun b!231843 () Bool)

(declare-fun e!159498 () Bool)

(declare-fun array_inv!4960 (array!11907) Bool)

(assert (=> b!231843 (= e!159498 (array_inv!4960 (buf!5760 b2!99)))))

(declare-fun res!194138 () Bool)

(assert (=> start!48938 (=> (not res!194138) (not e!159500))))

(assert (=> start!48938 (= res!194138 (and (= (size!5219 (buf!5760 b1!101)) (size!5219 (buf!5760 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48938 e!159500))

(declare-fun e!159503 () Bool)

(declare-fun inv!12 (BitStream!9534) Bool)

(assert (=> start!48938 (and (inv!12 b1!101) e!159503)))

(assert (=> start!48938 (and (inv!12 b2!99) e!159498)))

(assert (=> start!48938 true))

(declare-fun b!231844 () Bool)

(assert (=> b!231844 (= e!159503 (array_inv!4960 (buf!5760 b1!101)))))

(declare-fun b!231845 () Bool)

(declare-fun res!194136 () Bool)

(assert (=> b!231845 (=> (not res!194136) (not e!159502))))

(assert (=> b!231845 (= res!194136 (= lt!368776 (bvadd (bitIndex!0 (size!5219 (buf!5760 b1!101)) (currentByte!10767 b1!101) (currentBit!10762 b1!101)) bits!86)))))

(assert (= (and start!48938 res!194138) b!231842))

(assert (= (and b!231842 res!194135) b!231841))

(assert (= (and b!231841 res!194139) b!231845))

(assert (= (and b!231845 res!194136) b!231839))

(assert (= (and b!231839 res!194137) b!231840))

(assert (= start!48938 b!231844))

(assert (= start!48938 b!231843))

(declare-fun m!354867 () Bool)

(assert (=> b!231844 m!354867))

(declare-fun m!354869 () Bool)

(assert (=> start!48938 m!354869))

(declare-fun m!354871 () Bool)

(assert (=> start!48938 m!354871))

(declare-fun m!354873 () Bool)

(assert (=> b!231842 m!354873))

(declare-fun m!354875 () Bool)

(assert (=> b!231841 m!354875))

(declare-fun m!354877 () Bool)

(assert (=> b!231839 m!354877))

(declare-fun m!354879 () Bool)

(assert (=> b!231845 m!354879))

(declare-fun m!354881 () Bool)

(assert (=> b!231843 m!354881))

(check-sat (not start!48938) (not b!231842) (not b!231841) (not b!231839) (not b!231843) (not b!231844) (not b!231845))
(check-sat)
