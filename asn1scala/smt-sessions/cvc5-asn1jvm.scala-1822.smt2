; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49044 () Bool)

(assert start!49044)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369055 () (_ BitVec 64))

(declare-fun b!232909 () Bool)

(declare-fun lt!369057 () (_ BitVec 64))

(declare-datatypes ((array!12013 0))(
  ( (array!12014 (arr!6259 (Array (_ BitVec 32) (_ BitVec 8))) (size!5272 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9640 0))(
  ( (BitStream!9641 (buf!5813 array!12013) (currentByte!10820 (_ BitVec 32)) (currentBit!10815 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9640)

(declare-fun e!160415 () Bool)

(declare-fun lt!369056 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9640)

(assert (=> b!232909 (= e!160415 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5272 (buf!5813 b1!101)))) lt!369055) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14390 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10820 b2!99))) ((_ sign_extend 32) (currentBit!10815 b2!99))))) (and (= lt!369057 bdg!14390) (= (bvsub lt!369057 bits!86) lt!369055) (let ((bdg!14391 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5272 (buf!5813 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14391 (bvsub bdg!14390 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14391 bdg!14390) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369056)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232909 (= lt!369055 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10820 b1!101))) ((_ sign_extend 32) (currentBit!10815 b1!101))))))

(declare-fun b!232910 () Bool)

(declare-fun res!194888 () Bool)

(assert (=> b!232910 (=> (not res!194888) (not e!160415))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232910 (= res!194888 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5272 (buf!5813 b1!101))) ((_ sign_extend 32) (currentByte!10820 b1!101)) ((_ sign_extend 32) (currentBit!10815 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232911 () Bool)

(declare-fun res!194891 () Bool)

(assert (=> b!232911 (=> (not res!194891) (not e!160415))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232911 (= res!194891 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5272 (buf!5813 b1!101))) ((_ sign_extend 32) (currentByte!10820 b1!101)) ((_ sign_extend 32) (currentBit!10815 b1!101)) bytes!19))))

(declare-fun b!232912 () Bool)

(declare-fun e!160411 () Bool)

(declare-fun array_inv!5013 (array!12013) Bool)

(assert (=> b!232912 (= e!160411 (array_inv!5013 (buf!5813 b1!101)))))

(declare-fun b!232913 () Bool)

(declare-fun e!160414 () Bool)

(declare-fun e!160412 () Bool)

(assert (=> b!232913 (= e!160414 e!160412)))

(declare-fun res!194887 () Bool)

(assert (=> b!232913 (=> (not res!194887) (not e!160412))))

(assert (=> b!232913 (= res!194887 (bvsle bits!86 lt!369057))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232913 (= lt!369057 (bitIndex!0 (size!5272 (buf!5813 b2!99)) (currentByte!10820 b2!99) (currentBit!10815 b2!99)))))

(declare-fun res!194892 () Bool)

(assert (=> start!49044 (=> (not res!194892) (not e!160414))))

(assert (=> start!49044 (= res!194892 (and (= (size!5272 (buf!5813 b1!101)) (size!5272 (buf!5813 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49044 e!160414))

(declare-fun inv!12 (BitStream!9640) Bool)

(assert (=> start!49044 (and (inv!12 b1!101) e!160411)))

(declare-fun e!160410 () Bool)

(assert (=> start!49044 (and (inv!12 b2!99) e!160410)))

(assert (=> start!49044 true))

(declare-fun b!232914 () Bool)

(assert (=> b!232914 (= e!160412 e!160415)))

(declare-fun res!194890 () Bool)

(assert (=> b!232914 (=> (not res!194890) (not e!160415))))

(assert (=> b!232914 (= res!194890 (bvsle ((_ extract 31 0) lt!369056) bytes!19))))

(assert (=> b!232914 (= lt!369056 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!232915 () Bool)

(assert (=> b!232915 (= e!160410 (array_inv!5013 (buf!5813 b2!99)))))

(declare-fun b!232916 () Bool)

(declare-fun res!194889 () Bool)

(assert (=> b!232916 (=> (not res!194889) (not e!160415))))

(assert (=> b!232916 (= res!194889 (= lt!369057 (bvadd (bitIndex!0 (size!5272 (buf!5813 b1!101)) (currentByte!10820 b1!101) (currentBit!10815 b1!101)) bits!86)))))

(assert (= (and start!49044 res!194892) b!232913))

(assert (= (and b!232913 res!194887) b!232914))

(assert (= (and b!232914 res!194890) b!232911))

(assert (= (and b!232911 res!194891) b!232916))

(assert (= (and b!232916 res!194889) b!232910))

(assert (= (and b!232910 res!194888) b!232909))

(assert (= start!49044 b!232912))

(assert (= start!49044 b!232915))

(declare-fun m!355679 () Bool)

(assert (=> b!232916 m!355679))

(declare-fun m!355681 () Bool)

(assert (=> b!232911 m!355681))

(declare-fun m!355683 () Bool)

(assert (=> b!232915 m!355683))

(declare-fun m!355685 () Bool)

(assert (=> b!232912 m!355685))

(declare-fun m!355687 () Bool)

(assert (=> b!232910 m!355687))

(declare-fun m!355689 () Bool)

(assert (=> start!49044 m!355689))

(declare-fun m!355691 () Bool)

(assert (=> start!49044 m!355691))

(declare-fun m!355693 () Bool)

(assert (=> b!232913 m!355693))

(push 1)

(assert (not b!232916))

(assert (not b!232913))

(assert (not b!232915))

(assert (not b!232910))

(assert (not start!49044))

(assert (not b!232911))

(assert (not b!232912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

