; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48216 () Bool)

(assert start!48216)

(declare-fun b!228926 () Bool)

(declare-fun e!157054 () Bool)

(declare-datatypes ((array!11609 0))(
  ( (array!11610 (arr!6082 (Array (_ BitVec 32) (_ BitVec 8))) (size!5095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9286 0))(
  ( (BitStream!9287 (buf!5636 array!11609) (currentByte!10506 (_ BitVec 32)) (currentBit!10501 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9286)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228926 (= e!157054 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10501 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10506 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5095 (buf!5636 b1!101)))))))))

(declare-fun b!228927 () Bool)

(declare-fun res!191967 () Bool)

(assert (=> b!228927 (=> (not res!191967) (not e!157054))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9286)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228927 (= res!191967 (bvsle bits!86 (bitIndex!0 (size!5095 (buf!5636 b2!99)) (currentByte!10506 b2!99) (currentBit!10501 b2!99))))))

(declare-fun b!228928 () Bool)

(declare-fun e!157057 () Bool)

(declare-fun array_inv!4836 (array!11609) Bool)

(assert (=> b!228928 (= e!157057 (array_inv!4836 (buf!5636 b1!101)))))

(declare-fun b!228929 () Bool)

(declare-fun e!157055 () Bool)

(assert (=> b!228929 (= e!157055 (array_inv!4836 (buf!5636 b2!99)))))

(declare-fun res!191966 () Bool)

(assert (=> start!48216 (=> (not res!191966) (not e!157054))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48216 (= res!191966 (and (= (size!5095 (buf!5636 b1!101)) (size!5095 (buf!5636 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48216 e!157054))

(declare-fun inv!12 (BitStream!9286) Bool)

(assert (=> start!48216 (and (inv!12 b1!101) e!157057)))

(assert (=> start!48216 (and (inv!12 b2!99) e!157055)))

(assert (=> start!48216 true))

(declare-fun b!228930 () Bool)

(declare-fun res!191968 () Bool)

(assert (=> b!228930 (=> (not res!191968) (not e!157054))))

(assert (=> b!228930 (= res!191968 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5095 (buf!5636 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10506 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10501 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5095 (buf!5636 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10506 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10501 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!48216 res!191966) b!228927))

(assert (= (and b!228927 res!191967) b!228930))

(assert (= (and b!228930 res!191968) b!228926))

(assert (= start!48216 b!228928))

(assert (= start!48216 b!228929))

(declare-fun m!352717 () Bool)

(assert (=> b!228928 m!352717))

(declare-fun m!352719 () Bool)

(assert (=> b!228926 m!352719))

(declare-fun m!352721 () Bool)

(assert (=> b!228927 m!352721))

(declare-fun m!352723 () Bool)

(assert (=> start!48216 m!352723))

(declare-fun m!352725 () Bool)

(assert (=> start!48216 m!352725))

(declare-fun m!352727 () Bool)

(assert (=> b!228929 m!352727))

(push 1)

(assert (not b!228928))

(assert (not b!228929))

(assert (not b!228927))

(assert (not b!228926))

(assert (not start!48216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77652 () Bool)

(assert (=> d!77652 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10501 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10506 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5095 (buf!5636 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10501 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10501 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10506 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10506 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5095 (buf!5636 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10501 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10506 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5095 (buf!5636 b1!101)))))))))))

(assert (=> b!228926 d!77652))

(declare-fun d!77654 () Bool)

(declare-fun e!157093 () Bool)

(assert (=> d!77654 e!157093))

(declare-fun res!191998 () Bool)

(assert (=> d!77654 (=> (not res!191998) (not e!157093))))

(declare-fun lt!367068 () (_ BitVec 64))

(declare-fun lt!367067 () (_ BitVec 64))

(declare-fun lt!367070 () (_ BitVec 64))

(assert (=> d!77654 (= res!191998 (= lt!367067 (bvsub lt!367068 lt!367070)))))

(assert (=> d!77654 (or (= (bvand lt!367068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367068 lt!367070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77654 (= lt!367070 (remainingBits!0 ((_ sign_extend 32) (size!5095 (buf!5636 b2!99))) ((_ sign_extend 32) (currentByte!10506 b2!99)) ((_ sign_extend 32) (currentBit!10501 b2!99))))))

(declare-fun lt!367071 () (_ BitVec 64))

(declare-fun lt!367069 () (_ BitVec 64))

(assert (=> d!77654 (= lt!367068 (bvmul lt!367071 lt!367069))))

(assert (=> d!77654 (or (= lt!367071 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367069 (bvsdiv (bvmul lt!367071 lt!367069) lt!367071)))))

(assert (=> d!77654 (= lt!367069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77654 (= lt!367071 ((_ sign_extend 32) (size!5095 (buf!5636 b2!99))))))

(assert (=> d!77654 (= lt!367067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10506 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10501 b2!99))))))

(assert (=> d!77654 (invariant!0 (currentBit!10501 b2!99) (currentByte!10506 b2!99) (size!5095 (buf!5636 b2!99)))))

(assert (=> d!77654 (= (bitIndex!0 (size!5095 (buf!5636 b2!99)) (currentByte!10506 b2!99) (currentBit!10501 b2!99)) lt!367067)))

(declare-fun b!228971 () Bool)

(declare-fun res!191997 () Bool)

(assert (=> b!228971 (=> (not res!191997) (not e!157093))))

(assert (=> b!228971 (= res!191997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367067))))

(declare-fun b!228972 () Bool)

(declare-fun lt!367066 () (_ BitVec 64))

(assert (=> b!228972 (= e!157093 (bvsle lt!367067 (bvmul lt!367066 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228972 (or (= lt!367066 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367066 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367066)))))

(assert (=> b!228972 (= lt!367066 ((_ sign_extend 32) (size!5095 (buf!5636 b2!99))))))

(assert (= (and d!77654 res!191998) b!228971))

(assert (= (and b!228971 res!191997) b!228972))

(declare-fun m!352763 () Bool)

(assert (=> d!77654 m!352763))

(declare-fun m!352765 () Bool)

(assert (=> d!77654 m!352765))

(assert (=> b!228927 d!77654))

(declare-fun d!77668 () Bool)

(assert (=> d!77668 (= (inv!12 b1!101) (invariant!0 (currentBit!10501 b1!101) (currentByte!10506 b1!101) (size!5095 (buf!5636 b1!101))))))

(declare-fun bs!19018 () Bool)

(assert (= bs!19018 d!77668))

(declare-fun m!352767 () Bool)

(assert (=> bs!19018 m!352767))

(assert (=> start!48216 d!77668))

(declare-fun d!77670 () Bool)

(assert (=> d!77670 (= (inv!12 b2!99) (invariant!0 (currentBit!10501 b2!99) (currentByte!10506 b2!99) (size!5095 (buf!5636 b2!99))))))

(declare-fun bs!19019 () Bool)

(assert (= bs!19019 d!77670))

(assert (=> bs!19019 m!352765))

(assert (=> start!48216 d!77670))

(declare-fun d!77672 () Bool)

(assert (=> d!77672 (= (array_inv!4836 (buf!5636 b1!101)) (bvsge (size!5095 (buf!5636 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228928 d!77672))

(declare-fun d!77674 () Bool)

(assert (=> d!77674 (= (array_inv!4836 (buf!5636 b2!99)) (bvsge (size!5095 (buf!5636 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228929 d!77674))

(push 1)

(assert (not d!77654))

(assert (not d!77670))

(assert (not d!77668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

