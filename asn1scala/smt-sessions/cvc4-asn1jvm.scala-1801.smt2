; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48922 () Bool)

(assert start!48922)

(declare-fun b!231671 () Bool)

(declare-fun e!159359 () Bool)

(declare-fun e!159356 () Bool)

(assert (=> b!231671 (= e!159359 e!159356)))

(declare-fun res!194017 () Bool)

(assert (=> b!231671 (=> (not res!194017) (not e!159356))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!368733 () (_ BitVec 64))

(assert (=> b!231671 (= res!194017 (and (bvsle bits!86 lt!368733) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11891 0))(
  ( (array!11892 (arr!6198 (Array (_ BitVec 32) (_ BitVec 8))) (size!5211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9518 0))(
  ( (BitStream!9519 (buf!5752 array!11891) (currentByte!10759 (_ BitVec 32)) (currentBit!10754 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9518)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231671 (= lt!368733 (bitIndex!0 (size!5211 (buf!5752 b2!99)) (currentByte!10759 b2!99) (currentBit!10754 b2!99)))))

(declare-fun b!231672 () Bool)

(declare-fun e!159357 () Bool)

(declare-fun b1!101 () BitStream!9518)

(declare-fun array_inv!4952 (array!11891) Bool)

(assert (=> b!231672 (= e!159357 (array_inv!4952 (buf!5752 b1!101)))))

(declare-fun b!231673 () Bool)

(declare-fun res!194018 () Bool)

(assert (=> b!231673 (=> (not res!194018) (not e!159356))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231673 (= res!194018 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5211 (buf!5752 b1!101))) ((_ sign_extend 32) (currentByte!10759 b1!101)) ((_ sign_extend 32) (currentBit!10754 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231674 () Bool)

(declare-fun e!159358 () Bool)

(assert (=> b!231674 (= e!159358 (array_inv!4952 (buf!5752 b2!99)))))

(declare-fun res!194019 () Bool)

(assert (=> start!48922 (=> (not res!194019) (not e!159359))))

(assert (=> start!48922 (= res!194019 (and (= (size!5211 (buf!5752 b1!101)) (size!5211 (buf!5752 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48922 e!159359))

(declare-fun inv!12 (BitStream!9518) Bool)

(assert (=> start!48922 (and (inv!12 b1!101) e!159357)))

(assert (=> start!48922 (and (inv!12 b2!99) e!159358)))

(assert (=> start!48922 true))

(declare-fun b!231675 () Bool)

(declare-fun res!194015 () Bool)

(assert (=> b!231675 (=> (not res!194015) (not e!159356))))

(assert (=> b!231675 (= res!194015 (= lt!368733 (bvadd (bitIndex!0 (size!5211 (buf!5752 b1!101)) (currentByte!10759 b1!101) (currentBit!10754 b1!101)) bits!86)))))

(declare-fun b!231676 () Bool)

(declare-fun res!194016 () Bool)

(assert (=> b!231676 (=> (not res!194016) (not e!159356))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231676 (= res!194016 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5211 (buf!5752 b1!101))) ((_ sign_extend 32) (currentByte!10759 b1!101)) ((_ sign_extend 32) (currentBit!10754 b1!101)) bytes!19))))

(declare-fun b!231677 () Bool)

(assert (=> b!231677 (= e!159356 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5211 (buf!5752 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10759 b1!101))) ((_ sign_extend 32) (currentBit!10754 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14323 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10759 b2!99))))) (let ((bdg!14324 (bvand bdg!14323 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14324 (bvand ((_ sign_extend 32) (currentBit!10754 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14324 (bvand (bvadd bdg!14323 ((_ sign_extend 32) (currentBit!10754 b2!99))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and start!48922 res!194019) b!231671))

(assert (= (and b!231671 res!194017) b!231676))

(assert (= (and b!231676 res!194016) b!231675))

(assert (= (and b!231675 res!194015) b!231673))

(assert (= (and b!231673 res!194018) b!231677))

(assert (= start!48922 b!231672))

(assert (= start!48922 b!231674))

(declare-fun m!354739 () Bool)

(assert (=> b!231676 m!354739))

(declare-fun m!354741 () Bool)

(assert (=> b!231673 m!354741))

(declare-fun m!354743 () Bool)

(assert (=> b!231671 m!354743))

(declare-fun m!354745 () Bool)

(assert (=> b!231672 m!354745))

(declare-fun m!354747 () Bool)

(assert (=> b!231675 m!354747))

(declare-fun m!354749 () Bool)

(assert (=> start!48922 m!354749))

(declare-fun m!354751 () Bool)

(assert (=> start!48922 m!354751))

(declare-fun m!354753 () Bool)

(assert (=> b!231674 m!354753))

(push 1)

(assert (not b!231674))

(assert (not b!231676))

(assert (not b!231673))

(assert (not b!231672))

(assert (not start!48922))

(assert (not b!231671))

(assert (not b!231675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

