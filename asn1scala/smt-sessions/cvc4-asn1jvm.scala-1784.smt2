; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48742 () Bool)

(assert start!48742)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!230711 () Bool)

(declare-datatypes ((array!11777 0))(
  ( (array!11778 (arr!6147 (Array (_ BitVec 32) (_ BitVec 8))) (size!5160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9416 0))(
  ( (BitStream!9417 (buf!5701 array!11777) (currentByte!10693 (_ BitVec 32)) (currentBit!10688 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9416)

(declare-fun lt!368291 () (_ BitVec 64))

(declare-fun lt!368292 () (_ BitVec 64))

(declare-fun e!158478 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9416)

(assert (=> b!230711 (= e!158478 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5160 (buf!5701 b1!101)))) lt!368292) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14297 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10693 b2!99))) ((_ sign_extend 32) (currentBit!10688 b2!99))))) (and (= lt!368291 bdg!14297) (= (bvsub lt!368291 bits!86) lt!368292) (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5160 (buf!5701 b2!99)))) (bvsub bdg!14297 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(assert (=> b!230711 (= lt!368292 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10693 b1!101))) ((_ sign_extend 32) (currentBit!10688 b1!101))))))

(declare-fun b!230712 () Bool)

(declare-fun res!193361 () Bool)

(assert (=> b!230712 (=> (not res!193361) (not e!158478))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230712 (= res!193361 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5160 (buf!5701 b1!101))) ((_ sign_extend 32) (currentByte!10693 b1!101)) ((_ sign_extend 32) (currentBit!10688 b1!101)) bytes!19))))

(declare-fun b!230713 () Bool)

(declare-fun res!193364 () Bool)

(assert (=> b!230713 (=> (not res!193364) (not e!158478))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230713 (= res!193364 (= lt!368291 (bvadd (bitIndex!0 (size!5160 (buf!5701 b1!101)) (currentByte!10693 b1!101) (currentBit!10688 b1!101)) bits!86)))))

(declare-fun b!230714 () Bool)

(declare-fun e!158481 () Bool)

(assert (=> b!230714 (= e!158481 e!158478)))

(declare-fun res!193365 () Bool)

(assert (=> b!230714 (=> (not res!193365) (not e!158478))))

(assert (=> b!230714 (= res!193365 (and (bvsle bits!86 lt!368291) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230714 (= lt!368291 (bitIndex!0 (size!5160 (buf!5701 b2!99)) (currentByte!10693 b2!99) (currentBit!10688 b2!99)))))

(declare-fun b!230715 () Bool)

(declare-fun res!193363 () Bool)

(assert (=> b!230715 (=> (not res!193363) (not e!158478))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230715 (= res!193363 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5160 (buf!5701 b1!101))) ((_ sign_extend 32) (currentByte!10693 b1!101)) ((_ sign_extend 32) (currentBit!10688 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230716 () Bool)

(declare-fun e!158480 () Bool)

(declare-fun array_inv!4901 (array!11777) Bool)

(assert (=> b!230716 (= e!158480 (array_inv!4901 (buf!5701 b2!99)))))

(declare-fun b!230717 () Bool)

(declare-fun e!158479 () Bool)

(assert (=> b!230717 (= e!158479 (array_inv!4901 (buf!5701 b1!101)))))

(declare-fun res!193362 () Bool)

(assert (=> start!48742 (=> (not res!193362) (not e!158481))))

(assert (=> start!48742 (= res!193362 (and (= (size!5160 (buf!5701 b1!101)) (size!5160 (buf!5701 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48742 e!158481))

(declare-fun inv!12 (BitStream!9416) Bool)

(assert (=> start!48742 (and (inv!12 b1!101) e!158479)))

(assert (=> start!48742 (and (inv!12 b2!99) e!158480)))

(assert (=> start!48742 true))

(assert (= (and start!48742 res!193362) b!230714))

(assert (= (and b!230714 res!193365) b!230712))

(assert (= (and b!230712 res!193361) b!230713))

(assert (= (and b!230713 res!193364) b!230715))

(assert (= (and b!230715 res!193363) b!230711))

(assert (= start!48742 b!230717))

(assert (= start!48742 b!230716))

(declare-fun m!353965 () Bool)

(assert (=> start!48742 m!353965))

(declare-fun m!353967 () Bool)

(assert (=> start!48742 m!353967))

(declare-fun m!353969 () Bool)

(assert (=> b!230713 m!353969))

(declare-fun m!353971 () Bool)

(assert (=> b!230714 m!353971))

(declare-fun m!353973 () Bool)

(assert (=> b!230715 m!353973))

(declare-fun m!353975 () Bool)

(assert (=> b!230717 m!353975))

(declare-fun m!353977 () Bool)

(assert (=> b!230716 m!353977))

(declare-fun m!353979 () Bool)

(assert (=> b!230712 m!353979))

(push 1)

(assert (not b!230715))

(assert (not b!230712))

(assert (not start!48742))

(assert (not b!230714))

(assert (not b!230717))

(assert (not b!230716))

(assert (not b!230713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

