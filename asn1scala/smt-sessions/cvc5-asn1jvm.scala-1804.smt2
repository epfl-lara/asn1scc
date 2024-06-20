; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48936 () Bool)

(assert start!48936)

(declare-fun b!231818 () Bool)

(declare-fun res!194124 () Bool)

(declare-fun e!159484 () Bool)

(assert (=> b!231818 (=> (not res!194124) (not e!159484))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368768 () (_ BitVec 64))

(declare-datatypes ((array!11905 0))(
  ( (array!11906 (arr!6205 (Array (_ BitVec 32) (_ BitVec 8))) (size!5218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9532 0))(
  ( (BitStream!9533 (buf!5759 array!11905) (currentByte!10766 (_ BitVec 32)) (currentBit!10761 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9532)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231818 (= res!194124 (= lt!368768 (bvadd (bitIndex!0 (size!5218 (buf!5759 b1!101)) (currentByte!10766 b1!101) (currentBit!10761 b1!101)) bits!86)))))

(declare-fun b!231819 () Bool)

(declare-fun e!159481 () Bool)

(declare-fun b2!99 () BitStream!9532)

(declare-fun array_inv!4959 (array!11905) Bool)

(assert (=> b!231819 (= e!159481 (array_inv!4959 (buf!5759 b2!99)))))

(declare-fun b!231820 () Bool)

(declare-fun res!194121 () Bool)

(assert (=> b!231820 (=> (not res!194121) (not e!159484))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231820 (= res!194121 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5218 (buf!5759 b1!101))) ((_ sign_extend 32) (currentByte!10766 b1!101)) ((_ sign_extend 32) (currentBit!10761 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231821 () Bool)

(declare-fun res!194123 () Bool)

(assert (=> b!231821 (=> (not res!194123) (not e!159484))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231821 (= res!194123 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5218 (buf!5759 b1!101))) ((_ sign_extend 32) (currentByte!10766 b1!101)) ((_ sign_extend 32) (currentBit!10761 b1!101)) bytes!19))))

(declare-fun res!194120 () Bool)

(declare-fun e!159483 () Bool)

(assert (=> start!48936 (=> (not res!194120) (not e!159483))))

(assert (=> start!48936 (= res!194120 (and (= (size!5218 (buf!5759 b1!101)) (size!5218 (buf!5759 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48936 e!159483))

(declare-fun e!159482 () Bool)

(declare-fun inv!12 (BitStream!9532) Bool)

(assert (=> start!48936 (and (inv!12 b1!101) e!159482)))

(assert (=> start!48936 (and (inv!12 b2!99) e!159481)))

(assert (=> start!48936 true))

(declare-fun b!231822 () Bool)

(assert (=> b!231822 (= e!159483 e!159484)))

(declare-fun res!194122 () Bool)

(assert (=> b!231822 (=> (not res!194122) (not e!159484))))

(assert (=> b!231822 (= res!194122 (and (bvsle bits!86 lt!368768) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231822 (= lt!368768 (bitIndex!0 (size!5218 (buf!5759 b2!99)) (currentByte!10766 b2!99) (currentBit!10761 b2!99)))))

(declare-fun b!231823 () Bool)

(assert (=> b!231823 (= e!159482 (array_inv!4959 (buf!5759 b1!101)))))

(declare-fun lt!368769 () (_ BitVec 64))

(declare-fun b!231824 () Bool)

(declare-fun lt!368767 () (_ BitVec 64))

(assert (=> b!231824 (= e!159484 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5218 (buf!5759 b1!101)))) lt!368769) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368768 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10766 b2!99))) ((_ sign_extend 32) (currentBit!10761 b2!99)))) (let ((bdg!14332 (bvand lt!368767 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14332 (bvand ((_ sign_extend 32) (currentBit!10761 b1!101)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14332 (bvand lt!368769 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!231824 (= lt!368769 (bvadd lt!368767 ((_ sign_extend 32) (currentBit!10761 b1!101))))))

(assert (=> b!231824 (= lt!368767 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10766 b1!101))))))

(assert (= (and start!48936 res!194120) b!231822))

(assert (= (and b!231822 res!194122) b!231821))

(assert (= (and b!231821 res!194123) b!231818))

(assert (= (and b!231818 res!194124) b!231820))

(assert (= (and b!231820 res!194121) b!231824))

(assert (= start!48936 b!231823))

(assert (= start!48936 b!231819))

(declare-fun m!354851 () Bool)

(assert (=> b!231822 m!354851))

(declare-fun m!354853 () Bool)

(assert (=> start!48936 m!354853))

(declare-fun m!354855 () Bool)

(assert (=> start!48936 m!354855))

(declare-fun m!354857 () Bool)

(assert (=> b!231821 m!354857))

(declare-fun m!354859 () Bool)

(assert (=> b!231819 m!354859))

(declare-fun m!354861 () Bool)

(assert (=> b!231818 m!354861))

(declare-fun m!354863 () Bool)

(assert (=> b!231820 m!354863))

(declare-fun m!354865 () Bool)

(assert (=> b!231823 m!354865))

(push 1)

(assert (not b!231820))

(assert (not b!231819))

(assert (not b!231822))

(assert (not start!48936))

(assert (not b!231821))

(assert (not b!231818))

(assert (not b!231823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

