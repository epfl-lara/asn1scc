; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48954 () Bool)

(assert start!48954)

(declare-fun res!194258 () Bool)

(declare-fun e!159647 () Bool)

(assert (=> start!48954 (=> (not res!194258) (not e!159647))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11923 0))(
  ( (array!11924 (arr!6214 (Array (_ BitVec 32) (_ BitVec 8))) (size!5227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9550 0))(
  ( (BitStream!9551 (buf!5768 array!11923) (currentByte!10775 (_ BitVec 32)) (currentBit!10770 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9550)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9550)

(assert (=> start!48954 (= res!194258 (and (= (size!5227 (buf!5768 b1!101)) (size!5227 (buf!5768 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48954 e!159647))

(declare-fun e!159643 () Bool)

(declare-fun inv!12 (BitStream!9550) Bool)

(assert (=> start!48954 (and (inv!12 b1!101) e!159643)))

(declare-fun e!159646 () Bool)

(assert (=> start!48954 (and (inv!12 b2!99) e!159646)))

(assert (=> start!48954 true))

(declare-fun lt!368828 () (_ BitVec 64))

(declare-fun e!159642 () Bool)

(declare-fun b!232007 () Bool)

(declare-fun lt!368829 () (_ BitVec 64))

(assert (=> b!232007 (= e!159642 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5227 (buf!5768 b1!101)))) lt!368829) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14340 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10775 b2!99))))) (let ((bdg!14341 (bvadd bdg!14340 ((_ sign_extend 32) (currentBit!10770 b2!99))))) (and (= lt!368828 bdg!14341) (= (bvsub lt!368828 bits!86) lt!368829) (let ((bdg!14342 (bvand bdg!14340 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!14342 (bvand ((_ sign_extend 32) (currentBit!10770 b2!99)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!14342 (bvand bdg!14341 #b1000000000000000000000000000000000000000000000000000000000000000))))))))))))

(assert (=> b!232007 (= lt!368829 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10775 b1!101))) ((_ sign_extend 32) (currentBit!10770 b1!101))))))

(declare-fun b!232008 () Bool)

(declare-fun array_inv!4968 (array!11923) Bool)

(assert (=> b!232008 (= e!159646 (array_inv!4968 (buf!5768 b2!99)))))

(declare-fun b!232009 () Bool)

(declare-fun res!194255 () Bool)

(assert (=> b!232009 (=> (not res!194255) (not e!159642))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232009 (= res!194255 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5227 (buf!5768 b1!101))) ((_ sign_extend 32) (currentByte!10775 b1!101)) ((_ sign_extend 32) (currentBit!10770 b1!101)) bytes!19))))

(declare-fun b!232010 () Bool)

(assert (=> b!232010 (= e!159643 (array_inv!4968 (buf!5768 b1!101)))))

(declare-fun b!232011 () Bool)

(declare-fun res!194259 () Bool)

(assert (=> b!232011 (=> (not res!194259) (not e!159642))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232011 (= res!194259 (= lt!368828 (bvadd (bitIndex!0 (size!5227 (buf!5768 b1!101)) (currentByte!10775 b1!101) (currentBit!10770 b1!101)) bits!86)))))

(declare-fun b!232012 () Bool)

(assert (=> b!232012 (= e!159647 e!159642)))

(declare-fun res!194256 () Bool)

(assert (=> b!232012 (=> (not res!194256) (not e!159642))))

(assert (=> b!232012 (= res!194256 (and (bvsle bits!86 lt!368828) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232012 (= lt!368828 (bitIndex!0 (size!5227 (buf!5768 b2!99)) (currentByte!10775 b2!99) (currentBit!10770 b2!99)))))

(declare-fun b!232013 () Bool)

(declare-fun res!194257 () Bool)

(assert (=> b!232013 (=> (not res!194257) (not e!159642))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232013 (= res!194257 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5227 (buf!5768 b1!101))) ((_ sign_extend 32) (currentByte!10775 b1!101)) ((_ sign_extend 32) (currentBit!10770 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48954 res!194258) b!232012))

(assert (= (and b!232012 res!194256) b!232009))

(assert (= (and b!232009 res!194255) b!232011))

(assert (= (and b!232011 res!194259) b!232013))

(assert (= (and b!232013 res!194257) b!232007))

(assert (= start!48954 b!232010))

(assert (= start!48954 b!232008))

(declare-fun m!354995 () Bool)

(assert (=> b!232012 m!354995))

(declare-fun m!354997 () Bool)

(assert (=> b!232013 m!354997))

(declare-fun m!354999 () Bool)

(assert (=> b!232011 m!354999))

(declare-fun m!355001 () Bool)

(assert (=> b!232009 m!355001))

(declare-fun m!355003 () Bool)

(assert (=> start!48954 m!355003))

(declare-fun m!355005 () Bool)

(assert (=> start!48954 m!355005))

(declare-fun m!355007 () Bool)

(assert (=> b!232010 m!355007))

(declare-fun m!355009 () Bool)

(assert (=> b!232008 m!355009))

(push 1)

(assert (not b!232012))

(assert (not b!232008))

(assert (not start!48954))

(assert (not b!232010))

(assert (not b!232009))

(assert (not b!232013))

(assert (not b!232011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

