; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49042 () Bool)

(assert start!49042)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun e!160390 () Bool)

(declare-fun lt!369048 () (_ BitVec 64))

(declare-fun lt!369046 () (_ BitVec 64))

(declare-datatypes ((array!12011 0))(
  ( (array!12012 (arr!6258 (Array (_ BitVec 32) (_ BitVec 8))) (size!5271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9638 0))(
  ( (BitStream!9639 (buf!5812 array!12011) (currentByte!10819 (_ BitVec 32)) (currentBit!10814 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9638)

(declare-fun b!232885 () Bool)

(declare-fun lt!369047 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9638)

(assert (=> b!232885 (= e!160390 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5271 (buf!5812 b1!101)))) lt!369046) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14383 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10819 b2!99))) ((_ sign_extend 32) (currentBit!10814 b2!99))))) (and (= lt!369048 bdg!14383) (= (bvsub lt!369048 bits!86) lt!369046) (let ((bdg!14384 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5271 (buf!5812 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14384 (bvsub bdg!14383 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14385 (bvsdiv (bvsub bdg!14384 bdg!14383) #b0000000000000000000000000000000000000000000000000000000000001000))) (let ((bdg!14386 (bvand bdg!14385 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14386 (bvand lt!369047 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14386 (bvand (bvadd bdg!14385 lt!369047) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))))

(assert (=> b!232885 (= lt!369046 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10819 b1!101))) ((_ sign_extend 32) (currentBit!10814 b1!101))))))

(declare-fun b!232886 () Bool)

(declare-fun res!194873 () Bool)

(assert (=> b!232886 (=> (not res!194873) (not e!160390))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232886 (= res!194873 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5271 (buf!5812 b1!101))) ((_ sign_extend 32) (currentByte!10819 b1!101)) ((_ sign_extend 32) (currentBit!10814 b1!101)) bytes!19))))

(declare-fun b!232888 () Bool)

(declare-fun e!160394 () Bool)

(declare-fun e!160392 () Bool)

(assert (=> b!232888 (= e!160394 e!160392)))

(declare-fun res!194871 () Bool)

(assert (=> b!232888 (=> (not res!194871) (not e!160392))))

(assert (=> b!232888 (= res!194871 (bvsle bits!86 lt!369048))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232888 (= lt!369048 (bitIndex!0 (size!5271 (buf!5812 b2!99)) (currentByte!10819 b2!99) (currentBit!10814 b2!99)))))

(declare-fun b!232889 () Bool)

(declare-fun e!160393 () Bool)

(declare-fun array_inv!5012 (array!12011) Bool)

(assert (=> b!232889 (= e!160393 (array_inv!5012 (buf!5812 b1!101)))))

(declare-fun b!232890 () Bool)

(assert (=> b!232890 (= e!160392 e!160390)))

(declare-fun res!194869 () Bool)

(assert (=> b!232890 (=> (not res!194869) (not e!160390))))

(assert (=> b!232890 (= res!194869 (bvsle ((_ extract 31 0) lt!369047) bytes!19))))

(assert (=> b!232890 (= lt!369047 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!232891 () Bool)

(declare-fun e!160389 () Bool)

(assert (=> b!232891 (= e!160389 (array_inv!5012 (buf!5812 b2!99)))))

(declare-fun b!232892 () Bool)

(declare-fun res!194874 () Bool)

(assert (=> b!232892 (=> (not res!194874) (not e!160390))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232892 (= res!194874 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5271 (buf!5812 b1!101))) ((_ sign_extend 32) (currentByte!10819 b1!101)) ((_ sign_extend 32) (currentBit!10814 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194870 () Bool)

(assert (=> start!49042 (=> (not res!194870) (not e!160394))))

(assert (=> start!49042 (= res!194870 (and (= (size!5271 (buf!5812 b1!101)) (size!5271 (buf!5812 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49042 e!160394))

(declare-fun inv!12 (BitStream!9638) Bool)

(assert (=> start!49042 (and (inv!12 b1!101) e!160393)))

(assert (=> start!49042 (and (inv!12 b2!99) e!160389)))

(assert (=> start!49042 true))

(declare-fun b!232887 () Bool)

(declare-fun res!194872 () Bool)

(assert (=> b!232887 (=> (not res!194872) (not e!160390))))

(assert (=> b!232887 (= res!194872 (= lt!369048 (bvadd (bitIndex!0 (size!5271 (buf!5812 b1!101)) (currentByte!10819 b1!101) (currentBit!10814 b1!101)) bits!86)))))

(assert (= (and start!49042 res!194870) b!232888))

(assert (= (and b!232888 res!194871) b!232890))

(assert (= (and b!232890 res!194869) b!232886))

(assert (= (and b!232886 res!194873) b!232887))

(assert (= (and b!232887 res!194872) b!232892))

(assert (= (and b!232892 res!194874) b!232885))

(assert (= start!49042 b!232889))

(assert (= start!49042 b!232891))

(declare-fun m!355663 () Bool)

(assert (=> b!232889 m!355663))

(declare-fun m!355665 () Bool)

(assert (=> b!232888 m!355665))

(declare-fun m!355667 () Bool)

(assert (=> b!232892 m!355667))

(declare-fun m!355669 () Bool)

(assert (=> b!232891 m!355669))

(declare-fun m!355671 () Bool)

(assert (=> b!232887 m!355671))

(declare-fun m!355673 () Bool)

(assert (=> b!232886 m!355673))

(declare-fun m!355675 () Bool)

(assert (=> start!49042 m!355675))

(declare-fun m!355677 () Bool)

(assert (=> start!49042 m!355677))

(push 1)

(assert (not b!232892))

(assert (not b!232888))

(assert (not start!49042))

(assert (not b!232891))

(assert (not b!232887))

(assert (not b!232886))

(assert (not b!232889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

