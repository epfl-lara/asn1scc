; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49046 () Bool)

(assert start!49046)

(declare-fun b!232933 () Bool)

(declare-fun e!160436 () Bool)

(declare-datatypes ((array!12015 0))(
  ( (array!12016 (arr!6260 (Array (_ BitVec 32) (_ BitVec 8))) (size!5273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9642 0))(
  ( (BitStream!9643 (buf!5814 array!12015) (currentByte!10821 (_ BitVec 32)) (currentBit!10816 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9642)

(declare-fun array_inv!5014 (array!12015) Bool)

(assert (=> b!232933 (= e!160436 (array_inv!5014 (buf!5814 b2!99)))))

(declare-fun res!194909 () Bool)

(declare-fun e!160433 () Bool)

(assert (=> start!49046 (=> (not res!194909) (not e!160433))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9642)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49046 (= res!194909 (and (= (size!5273 (buf!5814 b1!101)) (size!5273 (buf!5814 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49046 e!160433))

(declare-fun e!160435 () Bool)

(declare-fun inv!12 (BitStream!9642) Bool)

(assert (=> start!49046 (and (inv!12 b1!101) e!160435)))

(assert (=> start!49046 (and (inv!12 b2!99) e!160436)))

(assert (=> start!49046 true))

(declare-fun b!232934 () Bool)

(declare-fun e!160430 () Bool)

(declare-fun e!160431 () Bool)

(assert (=> b!232934 (= e!160430 e!160431)))

(declare-fun res!194906 () Bool)

(assert (=> b!232934 (=> (not res!194906) (not e!160431))))

(declare-fun lt!369064 () (_ BitVec 64))

(assert (=> b!232934 (= res!194906 (bvsle ((_ extract 31 0) lt!369064) bytes!19))))

(assert (=> b!232934 (= lt!369064 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!232935 () Bool)

(declare-fun res!194907 () Bool)

(assert (=> b!232935 (=> (not res!194907) (not e!160431))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232935 (= res!194907 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5273 (buf!5814 b1!101))) ((_ sign_extend 32) (currentByte!10821 b1!101)) ((_ sign_extend 32) (currentBit!10816 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232936 () Bool)

(assert (=> b!232936 (= e!160435 (array_inv!5014 (buf!5814 b1!101)))))

(declare-fun b!232937 () Bool)

(assert (=> b!232937 (= e!160433 e!160430)))

(declare-fun res!194910 () Bool)

(assert (=> b!232937 (=> (not res!194910) (not e!160430))))

(declare-fun lt!369065 () (_ BitVec 64))

(assert (=> b!232937 (= res!194910 (bvsle bits!86 lt!369065))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232937 (= lt!369065 (bitIndex!0 (size!5273 (buf!5814 b2!99)) (currentByte!10821 b2!99) (currentBit!10816 b2!99)))))

(declare-fun b!232938 () Bool)

(declare-fun lt!369066 () (_ BitVec 64))

(assert (=> b!232938 (= e!160431 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5273 (buf!5814 b1!101)))) lt!369066) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14390 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10821 b2!99))) ((_ sign_extend 32) (currentBit!10816 b2!99))))) (and (= lt!369065 bdg!14390) (= (bvsub lt!369065 bits!86) lt!369066) (let ((bdg!14391 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5273 (buf!5814 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14391 (bvsub bdg!14390 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14391 bdg!14390) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369064)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232938 (= lt!369066 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10821 b1!101))) ((_ sign_extend 32) (currentBit!10816 b1!101))))))

(declare-fun b!232939 () Bool)

(declare-fun res!194908 () Bool)

(assert (=> b!232939 (=> (not res!194908) (not e!160431))))

(assert (=> b!232939 (= res!194908 (= lt!369065 (bvadd (bitIndex!0 (size!5273 (buf!5814 b1!101)) (currentByte!10821 b1!101) (currentBit!10816 b1!101)) bits!86)))))

(declare-fun b!232940 () Bool)

(declare-fun res!194905 () Bool)

(assert (=> b!232940 (=> (not res!194905) (not e!160431))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232940 (= res!194905 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5273 (buf!5814 b1!101))) ((_ sign_extend 32) (currentByte!10821 b1!101)) ((_ sign_extend 32) (currentBit!10816 b1!101)) bytes!19))))

(assert (= (and start!49046 res!194909) b!232937))

(assert (= (and b!232937 res!194910) b!232934))

(assert (= (and b!232934 res!194906) b!232940))

(assert (= (and b!232940 res!194905) b!232939))

(assert (= (and b!232939 res!194908) b!232935))

(assert (= (and b!232935 res!194907) b!232938))

(assert (= start!49046 b!232936))

(assert (= start!49046 b!232933))

(declare-fun m!355695 () Bool)

(assert (=> b!232936 m!355695))

(declare-fun m!355697 () Bool)

(assert (=> b!232939 m!355697))

(declare-fun m!355699 () Bool)

(assert (=> b!232933 m!355699))

(declare-fun m!355701 () Bool)

(assert (=> start!49046 m!355701))

(declare-fun m!355703 () Bool)

(assert (=> start!49046 m!355703))

(declare-fun m!355705 () Bool)

(assert (=> b!232940 m!355705))

(declare-fun m!355707 () Bool)

(assert (=> b!232935 m!355707))

(declare-fun m!355709 () Bool)

(assert (=> b!232937 m!355709))

(check-sat (not b!232935) (not start!49046) (not b!232939) (not b!232937) (not b!232940) (not b!232936) (not b!232933))
(check-sat)
