; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49024 () Bool)

(assert start!49024)

(declare-fun b!232706 () Bool)

(declare-fun res!194745 () Bool)

(declare-fun e!160236 () Bool)

(assert (=> b!232706 (=> (not res!194745) (not e!160236))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11993 0))(
  ( (array!11994 (arr!6249 (Array (_ BitVec 32) (_ BitVec 8))) (size!5262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9620 0))(
  ( (BitStream!9621 (buf!5803 array!11993) (currentByte!10810 (_ BitVec 32)) (currentBit!10805 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9620)

(declare-fun lt!369003 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232706 (= res!194745 (= lt!369003 (bvadd (bitIndex!0 (size!5262 (buf!5803 b1!101)) (currentByte!10810 b1!101) (currentBit!10805 b1!101)) bits!86)))))

(declare-fun b!232708 () Bool)

(declare-fun e!160238 () Bool)

(assert (=> b!232708 (= e!160238 e!160236)))

(declare-fun res!194746 () Bool)

(assert (=> b!232708 (=> (not res!194746) (not e!160236))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232708 (= res!194746 (and (bvsle bits!86 lt!369003) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun b2!99 () BitStream!9620)

(assert (=> b!232708 (= lt!369003 (bitIndex!0 (size!5262 (buf!5803 b2!99)) (currentByte!10810 b2!99) (currentBit!10805 b2!99)))))

(declare-fun b!232709 () Bool)

(declare-fun lt!369002 () (_ BitVec 64))

(assert (=> b!232709 (= e!160236 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5262 (buf!5803 b1!101)))) lt!369002) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14377 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10810 b2!99))) ((_ sign_extend 32) (currentBit!10805 b2!99))))) (and (= lt!369003 bdg!14377) (= (bvsub lt!369003 bits!86) lt!369002) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5262 (buf!5803 b2!99)))) (bvsub bdg!14377 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!232709 (= lt!369002 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10810 b1!101))) ((_ sign_extend 32) (currentBit!10805 b1!101))))))

(declare-fun b!232710 () Bool)

(declare-fun res!194748 () Bool)

(assert (=> b!232710 (=> (not res!194748) (not e!160236))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232710 (= res!194748 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5262 (buf!5803 b1!101))) ((_ sign_extend 32) (currentByte!10810 b1!101)) ((_ sign_extend 32) (currentBit!10805 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194747 () Bool)

(assert (=> start!49024 (=> (not res!194747) (not e!160238))))

(assert (=> start!49024 (= res!194747 (and (= (size!5262 (buf!5803 b1!101)) (size!5262 (buf!5803 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49024 e!160238))

(declare-fun e!160241 () Bool)

(declare-fun inv!12 (BitStream!9620) Bool)

(assert (=> start!49024 (and (inv!12 b1!101) e!160241)))

(declare-fun e!160239 () Bool)

(assert (=> start!49024 (and (inv!12 b2!99) e!160239)))

(assert (=> start!49024 true))

(declare-fun b!232707 () Bool)

(declare-fun res!194744 () Bool)

(assert (=> b!232707 (=> (not res!194744) (not e!160236))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232707 (= res!194744 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5262 (buf!5803 b1!101))) ((_ sign_extend 32) (currentByte!10810 b1!101)) ((_ sign_extend 32) (currentBit!10805 b1!101)) bytes!19))))

(declare-fun b!232711 () Bool)

(declare-fun array_inv!5003 (array!11993) Bool)

(assert (=> b!232711 (= e!160239 (array_inv!5003 (buf!5803 b2!99)))))

(declare-fun b!232712 () Bool)

(assert (=> b!232712 (= e!160241 (array_inv!5003 (buf!5803 b1!101)))))

(assert (= (and start!49024 res!194747) b!232708))

(assert (= (and b!232708 res!194746) b!232707))

(assert (= (and b!232707 res!194744) b!232706))

(assert (= (and b!232706 res!194745) b!232710))

(assert (= (and b!232710 res!194748) b!232709))

(assert (= start!49024 b!232712))

(assert (= start!49024 b!232711))

(declare-fun m!355531 () Bool)

(assert (=> b!232711 m!355531))

(declare-fun m!355533 () Bool)

(assert (=> b!232710 m!355533))

(declare-fun m!355535 () Bool)

(assert (=> b!232712 m!355535))

(declare-fun m!355537 () Bool)

(assert (=> b!232708 m!355537))

(declare-fun m!355539 () Bool)

(assert (=> start!49024 m!355539))

(declare-fun m!355541 () Bool)

(assert (=> start!49024 m!355541))

(declare-fun m!355543 () Bool)

(assert (=> b!232706 m!355543))

(declare-fun m!355545 () Bool)

(assert (=> b!232707 m!355545))

(push 1)

(assert (not b!232708))

(assert (not b!232706))

(assert (not b!232710))

(assert (not b!232712))

(assert (not b!232707))

(assert (not start!49024))

(assert (not b!232711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

