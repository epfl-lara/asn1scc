; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48930 () Bool)

(assert start!48930)

(declare-fun b!231755 () Bool)

(declare-fun e!159429 () Bool)

(declare-fun e!159428 () Bool)

(assert (=> b!231755 (= e!159429 e!159428)))

(declare-fun res!194077 () Bool)

(assert (=> b!231755 (=> (not res!194077) (not e!159428))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!368748 () (_ BitVec 64))

(assert (=> b!231755 (= res!194077 (and (bvsle bits!86 lt!368748) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11899 0))(
  ( (array!11900 (arr!6202 (Array (_ BitVec 32) (_ BitVec 8))) (size!5215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9526 0))(
  ( (BitStream!9527 (buf!5756 array!11899) (currentByte!10763 (_ BitVec 32)) (currentBit!10758 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9526)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231755 (= lt!368748 (bitIndex!0 (size!5215 (buf!5756 b2!99)) (currentByte!10763 b2!99) (currentBit!10758 b2!99)))))

(declare-fun b!231756 () Bool)

(declare-fun e!159426 () Bool)

(declare-fun b1!101 () BitStream!9526)

(declare-fun array_inv!4956 (array!11899) Bool)

(assert (=> b!231756 (= e!159426 (array_inv!4956 (buf!5756 b1!101)))))

(declare-fun b!231757 () Bool)

(declare-fun lt!368747 () (_ BitVec 64))

(assert (=> b!231757 (= e!159428 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5215 (buf!5756 b1!101)))) (bvadd lt!368747 ((_ sign_extend 32) (currentBit!10758 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368748 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10763 b2!99))) ((_ sign_extend 32) (currentBit!10758 b2!99)))) (not (= ((_ sign_extend 32) (currentByte!10763 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!368747 ((_ sign_extend 32) (currentByte!10763 b1!101)))))))))

(assert (=> b!231757 (= lt!368747 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10763 b1!101))))))

(declare-fun b!231759 () Bool)

(declare-fun res!194075 () Bool)

(assert (=> b!231759 (=> (not res!194075) (not e!159428))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231759 (= res!194075 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5215 (buf!5756 b1!101))) ((_ sign_extend 32) (currentByte!10763 b1!101)) ((_ sign_extend 32) (currentBit!10758 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231760 () Bool)

(declare-fun e!159430 () Bool)

(assert (=> b!231760 (= e!159430 (array_inv!4956 (buf!5756 b2!99)))))

(declare-fun b!231761 () Bool)

(declare-fun res!194076 () Bool)

(assert (=> b!231761 (=> (not res!194076) (not e!159428))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231761 (= res!194076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5215 (buf!5756 b1!101))) ((_ sign_extend 32) (currentByte!10763 b1!101)) ((_ sign_extend 32) (currentBit!10758 b1!101)) bytes!19))))

(declare-fun b!231758 () Bool)

(declare-fun res!194078 () Bool)

(assert (=> b!231758 (=> (not res!194078) (not e!159428))))

(assert (=> b!231758 (= res!194078 (= lt!368748 (bvadd (bitIndex!0 (size!5215 (buf!5756 b1!101)) (currentByte!10763 b1!101) (currentBit!10758 b1!101)) bits!86)))))

(declare-fun res!194079 () Bool)

(assert (=> start!48930 (=> (not res!194079) (not e!159429))))

(assert (=> start!48930 (= res!194079 (and (= (size!5215 (buf!5756 b1!101)) (size!5215 (buf!5756 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48930 e!159429))

(declare-fun inv!12 (BitStream!9526) Bool)

(assert (=> start!48930 (and (inv!12 b1!101) e!159426)))

(assert (=> start!48930 (and (inv!12 b2!99) e!159430)))

(assert (=> start!48930 true))

(assert (= (and start!48930 res!194079) b!231755))

(assert (= (and b!231755 res!194077) b!231761))

(assert (= (and b!231761 res!194076) b!231758))

(assert (= (and b!231758 res!194078) b!231759))

(assert (= (and b!231759 res!194075) b!231757))

(assert (= start!48930 b!231756))

(assert (= start!48930 b!231760))

(declare-fun m!354803 () Bool)

(assert (=> b!231760 m!354803))

(declare-fun m!354805 () Bool)

(assert (=> start!48930 m!354805))

(declare-fun m!354807 () Bool)

(assert (=> start!48930 m!354807))

(declare-fun m!354809 () Bool)

(assert (=> b!231756 m!354809))

(declare-fun m!354811 () Bool)

(assert (=> b!231758 m!354811))

(declare-fun m!354813 () Bool)

(assert (=> b!231759 m!354813))

(declare-fun m!354815 () Bool)

(assert (=> b!231755 m!354815))

(declare-fun m!354817 () Bool)

(assert (=> b!231761 m!354817))

(push 1)

(assert (not b!231759))

(assert (not b!231755))

(assert (not start!48930))

(assert (not b!231760))

(assert (not b!231756))

(assert (not b!231761))

(assert (not b!231758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

