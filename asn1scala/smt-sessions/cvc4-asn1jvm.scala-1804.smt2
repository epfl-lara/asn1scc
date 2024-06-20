; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48940 () Bool)

(assert start!48940)

(declare-fun res!194153 () Bool)

(declare-fun e!159519 () Bool)

(assert (=> start!48940 (=> (not res!194153) (not e!159519))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11909 0))(
  ( (array!11910 (arr!6207 (Array (_ BitVec 32) (_ BitVec 8))) (size!5220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9536 0))(
  ( (BitStream!9537 (buf!5761 array!11909) (currentByte!10768 (_ BitVec 32)) (currentBit!10763 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9536)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9536)

(assert (=> start!48940 (= res!194153 (and (= (size!5220 (buf!5761 b1!101)) (size!5220 (buf!5761 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48940 e!159519))

(declare-fun e!159516 () Bool)

(declare-fun inv!12 (BitStream!9536) Bool)

(assert (=> start!48940 (and (inv!12 b1!101) e!159516)))

(declare-fun e!159517 () Bool)

(assert (=> start!48940 (and (inv!12 b2!99) e!159517)))

(assert (=> start!48940 true))

(declare-fun b!231860 () Bool)

(declare-fun res!194151 () Bool)

(declare-fun e!159521 () Bool)

(assert (=> b!231860 (=> (not res!194151) (not e!159521))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231860 (= res!194151 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5220 (buf!5761 b1!101))) ((_ sign_extend 32) (currentByte!10768 b1!101)) ((_ sign_extend 32) (currentBit!10763 b1!101)) bytes!19))))

(declare-fun b!231861 () Bool)

(declare-fun res!194154 () Bool)

(assert (=> b!231861 (=> (not res!194154) (not e!159521))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231861 (= res!194154 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5220 (buf!5761 b1!101))) ((_ sign_extend 32) (currentByte!10768 b1!101)) ((_ sign_extend 32) (currentBit!10763 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!368785 () (_ BitVec 64))

(declare-fun b!231862 () Bool)

(declare-fun lt!368787 () (_ BitVec 64))

(declare-fun lt!368786 () (_ BitVec 64))

(assert (=> b!231862 (= e!159521 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5220 (buf!5761 b1!101)))) lt!368786) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368785 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10768 b2!99))) ((_ sign_extend 32) (currentBit!10763 b2!99)))) (let ((bdg!14332 (bvand lt!368787 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14332 (bvand ((_ sign_extend 32) (currentBit!10763 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14332 (bvand lt!368786 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!231862 (= lt!368786 (bvadd lt!368787 ((_ sign_extend 32) (currentBit!10763 b1!101))))))

(assert (=> b!231862 (= lt!368787 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10768 b1!101))))))

(declare-fun b!231863 () Bool)

(assert (=> b!231863 (= e!159519 e!159521)))

(declare-fun res!194150 () Bool)

(assert (=> b!231863 (=> (not res!194150) (not e!159521))))

(assert (=> b!231863 (= res!194150 (and (bvsle bits!86 lt!368785) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231863 (= lt!368785 (bitIndex!0 (size!5220 (buf!5761 b2!99)) (currentByte!10768 b2!99) (currentBit!10763 b2!99)))))

(declare-fun b!231864 () Bool)

(declare-fun array_inv!4961 (array!11909) Bool)

(assert (=> b!231864 (= e!159517 (array_inv!4961 (buf!5761 b2!99)))))

(declare-fun b!231865 () Bool)

(declare-fun res!194152 () Bool)

(assert (=> b!231865 (=> (not res!194152) (not e!159521))))

(assert (=> b!231865 (= res!194152 (= lt!368785 (bvadd (bitIndex!0 (size!5220 (buf!5761 b1!101)) (currentByte!10768 b1!101) (currentBit!10763 b1!101)) bits!86)))))

(declare-fun b!231866 () Bool)

(assert (=> b!231866 (= e!159516 (array_inv!4961 (buf!5761 b1!101)))))

(assert (= (and start!48940 res!194153) b!231863))

(assert (= (and b!231863 res!194150) b!231860))

(assert (= (and b!231860 res!194151) b!231865))

(assert (= (and b!231865 res!194152) b!231861))

(assert (= (and b!231861 res!194154) b!231862))

(assert (= start!48940 b!231866))

(assert (= start!48940 b!231864))

(declare-fun m!354883 () Bool)

(assert (=> b!231866 m!354883))

(declare-fun m!354885 () Bool)

(assert (=> b!231863 m!354885))

(declare-fun m!354887 () Bool)

(assert (=> start!48940 m!354887))

(declare-fun m!354889 () Bool)

(assert (=> start!48940 m!354889))

(declare-fun m!354891 () Bool)

(assert (=> b!231861 m!354891))

(declare-fun m!354893 () Bool)

(assert (=> b!231860 m!354893))

(declare-fun m!354895 () Bool)

(assert (=> b!231865 m!354895))

(declare-fun m!354897 () Bool)

(assert (=> b!231864 m!354897))

(push 1)

(assert (not b!231866))

(assert (not b!231863))

(assert (not b!231865))

(assert (not b!231864))

(assert (not start!48940))

(assert (not b!231860))

(assert (not b!231861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

