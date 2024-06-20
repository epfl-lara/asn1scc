; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48508 () Bool)

(assert start!48508)

(declare-fun b!229762 () Bool)

(declare-fun e!157722 () Bool)

(declare-datatypes ((array!11697 0))(
  ( (array!11698 (arr!6115 (Array (_ BitVec 32) (_ BitVec 8))) (size!5128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9352 0))(
  ( (BitStream!9353 (buf!5669 array!11697) (currentByte!10608 (_ BitVec 32)) (currentBit!10603 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9352)

(declare-fun array_inv!4869 (array!11697) Bool)

(assert (=> b!229762 (= e!157722 (array_inv!4869 (buf!5669 b1!101)))))

(declare-fun res!192611 () Bool)

(declare-fun e!157721 () Bool)

(assert (=> start!48508 (=> (not res!192611) (not e!157721))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9352)

(assert (=> start!48508 (= res!192611 (and (= (size!5128 (buf!5669 b1!101)) (size!5128 (buf!5669 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48508 e!157721))

(declare-fun inv!12 (BitStream!9352) Bool)

(assert (=> start!48508 (and (inv!12 b1!101) e!157722)))

(declare-fun e!157723 () Bool)

(assert (=> start!48508 (and (inv!12 b2!99) e!157723)))

(assert (=> start!48508 true))

(declare-fun b!229763 () Bool)

(declare-fun res!192608 () Bool)

(declare-fun e!157725 () Bool)

(assert (=> b!229763 (=> (not res!192608) (not e!157725))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229763 (= res!192608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101)) bytes!19))))

(declare-fun b!229764 () Bool)

(declare-fun e!157718 () Bool)

(declare-fun e!157727 () Bool)

(assert (=> b!229764 (= e!157718 e!157727)))

(declare-fun res!192606 () Bool)

(assert (=> b!229764 (=> (not res!192606) (not e!157727))))

(declare-fun lt!367621 () (_ BitVec 64))

(declare-fun lt!367622 () (_ BitVec 64))

(declare-fun lt!367623 () (_ BitVec 64))

(assert (=> b!229764 (= res!192606 (and (= lt!367622 lt!367621) (= (bvsub lt!367622 bits!86) lt!367623)))))

(assert (=> b!229764 (= lt!367621 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10608 b2!99))) ((_ sign_extend 32) (currentBit!10603 b2!99))))))

(declare-fun b!229765 () Bool)

(declare-fun e!157726 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229765 (= e!157726 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10603 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10608 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5128 (buf!5669 b2!99)))))))))

(declare-fun b!229766 () Bool)

(declare-fun res!192609 () Bool)

(assert (=> b!229766 (=> (not res!192609) (not e!157725))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229766 (= res!192609 (= lt!367622 (bvadd (bitIndex!0 (size!5128 (buf!5669 b1!101)) (currentByte!10608 b1!101) (currentBit!10603 b1!101)) bits!86)))))

(declare-fun b!229767 () Bool)

(assert (=> b!229767 (= e!157725 e!157718)))

(declare-fun res!192607 () Bool)

(assert (=> b!229767 (=> (not res!192607) (not e!157718))))

(assert (=> b!229767 (= res!192607 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101)))) lt!367623) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229767 (= lt!367623 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10608 b1!101))) ((_ sign_extend 32) (currentBit!10603 b1!101))))))

(declare-fun b!229768 () Bool)

(declare-fun res!192612 () Bool)

(assert (=> b!229768 (=> (not res!192612) (not e!157725))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229768 (= res!192612 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229769 () Bool)

(declare-fun e!157720 () Bool)

(assert (=> b!229769 (= e!157720 e!157725)))

(declare-fun res!192604 () Bool)

(assert (=> b!229769 (=> (not res!192604) (not e!157725))))

(declare-fun lt!367619 () (_ BitVec 64))

(assert (=> b!229769 (= res!192604 (bvsle ((_ extract 31 0) lt!367619) bytes!19))))

(assert (=> b!229769 (= lt!367619 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229770 () Bool)

(assert (=> b!229770 (= e!157727 e!157726)))

(declare-fun res!192610 () Bool)

(assert (=> b!229770 (=> (not res!192610) (not e!157726))))

(declare-fun lt!367620 () (_ BitVec 64))

(assert (=> b!229770 (= res!192610 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367620 (bvsub lt!367621 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367620 lt!367621) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367619)) (bvsle ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10608 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10603 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10608 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10603 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!229770 (= lt!367620 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5128 (buf!5669 b2!99)))))))

(declare-fun b!229771 () Bool)

(assert (=> b!229771 (= e!157723 (array_inv!4869 (buf!5669 b2!99)))))

(declare-fun b!229772 () Bool)

(assert (=> b!229772 (= e!157721 e!157720)))

(declare-fun res!192605 () Bool)

(assert (=> b!229772 (=> (not res!192605) (not e!157720))))

(assert (=> b!229772 (= res!192605 (bvsle bits!86 lt!367622))))

(assert (=> b!229772 (= lt!367622 (bitIndex!0 (size!5128 (buf!5669 b2!99)) (currentByte!10608 b2!99) (currentBit!10603 b2!99)))))

(assert (= (and start!48508 res!192611) b!229772))

(assert (= (and b!229772 res!192605) b!229769))

(assert (= (and b!229769 res!192604) b!229763))

(assert (= (and b!229763 res!192608) b!229766))

(assert (= (and b!229766 res!192609) b!229768))

(assert (= (and b!229768 res!192612) b!229767))

(assert (= (and b!229767 res!192607) b!229764))

(assert (= (and b!229764 res!192606) b!229770))

(assert (= (and b!229770 res!192610) b!229765))

(assert (= start!48508 b!229762))

(assert (= start!48508 b!229771))

(declare-fun m!353341 () Bool)

(assert (=> b!229763 m!353341))

(declare-fun m!353343 () Bool)

(assert (=> b!229765 m!353343))

(declare-fun m!353345 () Bool)

(assert (=> b!229772 m!353345))

(declare-fun m!353347 () Bool)

(assert (=> start!48508 m!353347))

(declare-fun m!353349 () Bool)

(assert (=> start!48508 m!353349))

(declare-fun m!353351 () Bool)

(assert (=> b!229762 m!353351))

(declare-fun m!353353 () Bool)

(assert (=> b!229771 m!353353))

(declare-fun m!353355 () Bool)

(assert (=> b!229768 m!353355))

(declare-fun m!353357 () Bool)

(assert (=> b!229766 m!353357))

(push 1)

(assert (not b!229771))

(assert (not b!229768))

(assert (not b!229762))

(assert (not start!48508))

(assert (not b!229766))

(assert (not b!229772))

(assert (not b!229763))

(assert (not b!229765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78028 () Bool)

(assert (=> d!78028 (= (array_inv!4869 (buf!5669 b2!99)) (bvsge (size!5128 (buf!5669 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!229771 d!78028))

(declare-fun d!78030 () Bool)

(declare-fun e!157794 () Bool)

(assert (=> d!78030 e!157794))

(declare-fun res!192680 () Bool)

(assert (=> d!78030 (=> (not res!192680) (not e!157794))))

(declare-fun lt!367695 () (_ BitVec 64))

(declare-fun lt!367693 () (_ BitVec 64))

(declare-fun lt!367692 () (_ BitVec 64))

(assert (=> d!78030 (= res!192680 (= lt!367695 (bvsub lt!367693 lt!367692)))))

(assert (=> d!78030 (or (= (bvand lt!367693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367692 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367693 lt!367692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78030 (= lt!367692 (remainingBits!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101))))))

(declare-fun lt!367691 () (_ BitVec 64))

(declare-fun lt!367694 () (_ BitVec 64))

(assert (=> d!78030 (= lt!367693 (bvmul lt!367691 lt!367694))))

(assert (=> d!78030 (or (= lt!367691 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367694 (bvsdiv (bvmul lt!367691 lt!367694) lt!367691)))))

(assert (=> d!78030 (= lt!367694 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78030 (= lt!367691 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))))))

(assert (=> d!78030 (= lt!367695 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10608 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10603 b1!101))))))

(assert (=> d!78030 (invariant!0 (currentBit!10603 b1!101) (currentByte!10608 b1!101) (size!5128 (buf!5669 b1!101)))))

(assert (=> d!78030 (= (bitIndex!0 (size!5128 (buf!5669 b1!101)) (currentByte!10608 b1!101) (currentBit!10603 b1!101)) lt!367695)))

(declare-fun b!229851 () Bool)

(declare-fun res!192679 () Bool)

(assert (=> b!229851 (=> (not res!192679) (not e!157794))))

(assert (=> b!229851 (= res!192679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367695))))

(declare-fun b!229852 () Bool)

(declare-fun lt!367690 () (_ BitVec 64))

(assert (=> b!229852 (= e!157794 (bvsle lt!367695 (bvmul lt!367690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229852 (or (= lt!367690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367690)))))

(assert (=> b!229852 (= lt!367690 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))))))

(assert (= (and d!78030 res!192680) b!229851))

(assert (= (and b!229851 res!192679) b!229852))

(assert (=> d!78030 m!353355))

(declare-fun m!353401 () Bool)

(assert (=> d!78030 m!353401))

(assert (=> b!229766 d!78030))

(declare-fun d!78032 () Bool)

(declare-fun e!157795 () Bool)

(assert (=> d!78032 e!157795))

(declare-fun res!192682 () Bool)

(assert (=> d!78032 (=> (not res!192682) (not e!157795))))

(declare-fun lt!367701 () (_ BitVec 64))

(declare-fun lt!367698 () (_ BitVec 64))

(declare-fun lt!367699 () (_ BitVec 64))

(assert (=> d!78032 (= res!192682 (= lt!367701 (bvsub lt!367699 lt!367698)))))

(assert (=> d!78032 (or (= (bvand lt!367699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367699 lt!367698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78032 (= lt!367698 (remainingBits!0 ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))) ((_ sign_extend 32) (currentByte!10608 b2!99)) ((_ sign_extend 32) (currentBit!10603 b2!99))))))

(declare-fun lt!367697 () (_ BitVec 64))

(declare-fun lt!367700 () (_ BitVec 64))

(assert (=> d!78032 (= lt!367699 (bvmul lt!367697 lt!367700))))

(assert (=> d!78032 (or (= lt!367697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367700 (bvsdiv (bvmul lt!367697 lt!367700) lt!367697)))))

(assert (=> d!78032 (= lt!367700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78032 (= lt!367697 ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))))))

(assert (=> d!78032 (= lt!367701 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10608 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10603 b2!99))))))

(assert (=> d!78032 (invariant!0 (currentBit!10603 b2!99) (currentByte!10608 b2!99) (size!5128 (buf!5669 b2!99)))))

(assert (=> d!78032 (= (bitIndex!0 (size!5128 (buf!5669 b2!99)) (currentByte!10608 b2!99) (currentBit!10603 b2!99)) lt!367701)))

(declare-fun b!229853 () Bool)

(declare-fun res!192681 () Bool)

(assert (=> b!229853 (=> (not res!192681) (not e!157795))))

(assert (=> b!229853 (= res!192681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367701))))

(declare-fun b!229854 () Bool)

(declare-fun lt!367696 () (_ BitVec 64))

(assert (=> b!229854 (= e!157795 (bvsle lt!367701 (bvmul lt!367696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229854 (or (= lt!367696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367696)))))

(assert (=> b!229854 (= lt!367696 ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))))))

(assert (= (and d!78032 res!192682) b!229853))

(assert (= (and b!229853 res!192681) b!229854))

(declare-fun m!353403 () Bool)

(assert (=> d!78032 m!353403))

(declare-fun m!353405 () Bool)

(assert (=> d!78032 m!353405))

(assert (=> b!229772 d!78032))

(declare-fun d!78034 () Bool)

(assert (=> d!78034 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10603 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10608 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10603 b2!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10603 b2!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10608 b2!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10608 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5128 (buf!5669 b2!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10603 b2!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10608 b2!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!5128 (buf!5669 b2!99)))))))))))

(assert (=> b!229765 d!78034))

(declare-fun d!78036 () Bool)

(assert (=> d!78036 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19113 () Bool)

(assert (= bs!19113 d!78036))

(assert (=> bs!19113 m!353355))

(assert (=> b!229763 d!78036))

(declare-fun d!78038 () Bool)

(assert (=> d!78038 (= (inv!12 b1!101) (invariant!0 (currentBit!10603 b1!101) (currentByte!10608 b1!101) (size!5128 (buf!5669 b1!101))))))

(declare-fun bs!19114 () Bool)

(assert (= bs!19114 d!78038))

(assert (=> bs!19114 m!353401))

(assert (=> start!48508 d!78038))

(declare-fun d!78040 () Bool)

(assert (=> d!78040 (= (inv!12 b2!99) (invariant!0 (currentBit!10603 b2!99) (currentByte!10608 b2!99) (size!5128 (buf!5669 b2!99))))))

(declare-fun bs!19115 () Bool)

(assert (= bs!19115 d!78040))

(assert (=> bs!19115 m!353405))

(assert (=> start!48508 d!78040))

(declare-fun d!78042 () Bool)

(assert (=> d!78042 (= (array_inv!4869 (buf!5669 b1!101)) (bvsge (size!5128 (buf!5669 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!229762 d!78042))

(declare-fun d!78044 () Bool)

(assert (=> d!78044 (= (remainingBits!0 ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) ((_ sign_extend 32) (currentByte!10608 b1!101)) ((_ sign_extend 32) (currentBit!10603 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5128 (buf!5669 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10608 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10603 b1!101)))))))

(assert (=> b!229768 d!78044))

(push 1)

(assert (not d!78038))

(assert (not d!78036))

(assert (not d!78032))

(assert (not d!78040))

(assert (not d!78030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

