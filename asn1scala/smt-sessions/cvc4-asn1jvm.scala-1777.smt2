; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48554 () Bool)

(assert start!48554)

(declare-fun b!230113 () Bool)

(declare-fun e!158017 () Bool)

(declare-datatypes ((array!11721 0))(
  ( (array!11722 (arr!6126 (Array (_ BitVec 32) (_ BitVec 8))) (size!5139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9374 0))(
  ( (BitStream!9375 (buf!5680 array!11721) (currentByte!10627 (_ BitVec 32)) (currentBit!10622 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9374)

(declare-fun array_inv!4880 (array!11721) Bool)

(assert (=> b!230113 (= e!158017 (array_inv!4880 (buf!5680 b2!99)))))

(declare-fun b!230114 () Bool)

(declare-fun res!192891 () Bool)

(declare-fun e!158019 () Bool)

(assert (=> b!230114 (=> (not res!192891) (not e!158019))))

(declare-fun lt!367815 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230114 (= res!192891 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) ((_ sign_extend 32) (currentByte!10627 b2!99)) ((_ sign_extend 32) (currentBit!10622 b2!99)) (bvsub bytes!19 lt!367815)))))

(declare-fun b!230115 () Bool)

(declare-fun e!158012 () Bool)

(assert (=> b!230115 (= e!158012 e!158019)))

(declare-fun res!192895 () Bool)

(assert (=> b!230115 (=> (not res!192895) (not e!158019))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367816 () (_ BitVec 64))

(declare-fun lt!367818 () (_ BitVec 64))

(declare-fun lt!367817 () (_ BitVec 64))

(assert (=> b!230115 (= res!192895 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367818 (bvsub lt!367817 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367818 lt!367817) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367816))))))

(assert (=> b!230115 (= lt!367818 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99)))))))

(declare-fun b!230116 () Bool)

(declare-fun e!158016 () Bool)

(declare-fun b1!101 () BitStream!9374)

(assert (=> b!230116 (= e!158016 (array_inv!4880 (buf!5680 b1!101)))))

(declare-fun b!230117 () Bool)

(declare-fun e!158018 () Bool)

(declare-fun e!158013 () Bool)

(assert (=> b!230117 (= e!158018 e!158013)))

(declare-fun res!192890 () Bool)

(assert (=> b!230117 (=> (not res!192890) (not e!158013))))

(assert (=> b!230117 (= res!192890 (bvsle lt!367815 bytes!19))))

(assert (=> b!230117 (= lt!367815 ((_ extract 31 0) lt!367816))))

(assert (=> b!230117 (= lt!367816 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230118 () Bool)

(declare-fun res!192894 () Bool)

(assert (=> b!230118 (=> (not res!192894) (not e!158013))))

(assert (=> b!230118 (= res!192894 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101)) bytes!19))))

(declare-fun b!230119 () Bool)

(declare-fun e!158014 () Bool)

(assert (=> b!230119 (= e!158014 e!158018)))

(declare-fun res!192893 () Bool)

(assert (=> b!230119 (=> (not res!192893) (not e!158018))))

(declare-fun lt!367814 () (_ BitVec 64))

(assert (=> b!230119 (= res!192893 (bvsle bits!86 lt!367814))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230119 (= lt!367814 (bitIndex!0 (size!5139 (buf!5680 b2!99)) (currentByte!10627 b2!99) (currentBit!10622 b2!99)))))

(declare-fun b!230120 () Bool)

(declare-fun e!158011 () Bool)

(assert (=> b!230120 (= e!158013 e!158011)))

(declare-fun res!192897 () Bool)

(assert (=> b!230120 (=> (not res!192897) (not e!158011))))

(declare-fun lt!367813 () (_ BitVec 64))

(assert (=> b!230120 (= res!192897 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101)))) lt!367813) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230120 (= lt!367813 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10627 b1!101))) ((_ sign_extend 32) (currentBit!10622 b1!101))))))

(declare-fun b!230121 () Bool)

(assert (=> b!230121 (= e!158019 (and (bvsle ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10627 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10622 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10627 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10622 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230123 () Bool)

(declare-fun res!192889 () Bool)

(assert (=> b!230123 (=> (not res!192889) (not e!158013))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230123 (= res!192889 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230124 () Bool)

(declare-fun res!192892 () Bool)

(assert (=> b!230124 (=> (not res!192892) (not e!158013))))

(assert (=> b!230124 (= res!192892 (= lt!367814 (bvadd (bitIndex!0 (size!5139 (buf!5680 b1!101)) (currentByte!10627 b1!101) (currentBit!10622 b1!101)) bits!86)))))

(declare-fun res!192898 () Bool)

(assert (=> start!48554 (=> (not res!192898) (not e!158014))))

(assert (=> start!48554 (= res!192898 (and (= (size!5139 (buf!5680 b1!101)) (size!5139 (buf!5680 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48554 e!158014))

(declare-fun inv!12 (BitStream!9374) Bool)

(assert (=> start!48554 (and (inv!12 b1!101) e!158016)))

(assert (=> start!48554 (and (inv!12 b2!99) e!158017)))

(assert (=> start!48554 true))

(declare-fun b!230122 () Bool)

(assert (=> b!230122 (= e!158011 e!158012)))

(declare-fun res!192896 () Bool)

(assert (=> b!230122 (=> (not res!192896) (not e!158012))))

(assert (=> b!230122 (= res!192896 (and (= lt!367814 lt!367817) (= (bvsub lt!367814 bits!86) lt!367813)))))

(assert (=> b!230122 (= lt!367817 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10627 b2!99))) ((_ sign_extend 32) (currentBit!10622 b2!99))))))

(assert (= (and start!48554 res!192898) b!230119))

(assert (= (and b!230119 res!192893) b!230117))

(assert (= (and b!230117 res!192890) b!230118))

(assert (= (and b!230118 res!192894) b!230124))

(assert (= (and b!230124 res!192892) b!230123))

(assert (= (and b!230123 res!192889) b!230120))

(assert (= (and b!230120 res!192897) b!230122))

(assert (= (and b!230122 res!192896) b!230115))

(assert (= (and b!230115 res!192895) b!230114))

(assert (= (and b!230114 res!192891) b!230121))

(assert (= start!48554 b!230116))

(assert (= start!48554 b!230113))

(declare-fun m!353539 () Bool)

(assert (=> b!230114 m!353539))

(declare-fun m!353541 () Bool)

(assert (=> b!230113 m!353541))

(declare-fun m!353543 () Bool)

(assert (=> b!230124 m!353543))

(declare-fun m!353545 () Bool)

(assert (=> b!230118 m!353545))

(declare-fun m!353547 () Bool)

(assert (=> start!48554 m!353547))

(declare-fun m!353549 () Bool)

(assert (=> start!48554 m!353549))

(declare-fun m!353551 () Bool)

(assert (=> b!230119 m!353551))

(declare-fun m!353553 () Bool)

(assert (=> b!230123 m!353553))

(declare-fun m!353555 () Bool)

(assert (=> b!230116 m!353555))

(push 1)

(assert (not b!230119))

(assert (not start!48554))

(assert (not b!230123))

(assert (not b!230113))

(assert (not b!230124))

(assert (not b!230116))

(assert (not b!230118))

(assert (not b!230114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78070 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78070 (= (inv!12 b1!101) (invariant!0 (currentBit!10622 b1!101) (currentByte!10627 b1!101) (size!5139 (buf!5680 b1!101))))))

(declare-fun bs!19129 () Bool)

(assert (= bs!19129 d!78070))

(declare-fun m!353563 () Bool)

(assert (=> bs!19129 m!353563))

(assert (=> start!48554 d!78070))

(declare-fun d!78072 () Bool)

(assert (=> d!78072 (= (inv!12 b2!99) (invariant!0 (currentBit!10622 b2!99) (currentByte!10627 b2!99) (size!5139 (buf!5680 b2!99))))))

(declare-fun bs!19130 () Bool)

(assert (= bs!19130 d!78072))

(declare-fun m!353565 () Bool)

(assert (=> bs!19130 m!353565))

(assert (=> start!48554 d!78072))

(declare-fun d!78074 () Bool)

(assert (=> d!78074 (= (array_inv!4880 (buf!5680 b1!101)) (bvsge (size!5139 (buf!5680 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230116 d!78074))

(declare-fun d!78076 () Bool)

(assert (=> d!78076 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19131 () Bool)

(assert (= bs!19131 d!78076))

(assert (=> bs!19131 m!353553))

(assert (=> b!230118 d!78076))

(declare-fun d!78078 () Bool)

(assert (=> d!78078 (= (array_inv!4880 (buf!5680 b2!99)) (bvsge (size!5139 (buf!5680 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230113 d!78078))

(declare-fun d!78080 () Bool)

(assert (=> d!78080 (= (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10627 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10622 b1!101)))))))

(assert (=> b!230123 d!78080))

(declare-fun d!78082 () Bool)

(assert (=> d!78082 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) ((_ sign_extend 32) (currentByte!10627 b2!99)) ((_ sign_extend 32) (currentBit!10622 b2!99)) (bvsub bytes!19 lt!367815)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!367815)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) ((_ sign_extend 32) (currentByte!10627 b2!99)) ((_ sign_extend 32) (currentBit!10622 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19132 () Bool)

(assert (= bs!19132 d!78082))

(declare-fun m!353567 () Bool)

(assert (=> bs!19132 m!353567))

(assert (=> b!230114 d!78082))

(declare-fun d!78084 () Bool)

(declare-fun e!158027 () Bool)

(assert (=> d!78084 e!158027))

(declare-fun res!192911 () Bool)

(assert (=> d!78084 (=> (not res!192911) (not e!158027))))

(declare-fun lt!367856 () (_ BitVec 64))

(declare-fun lt!367859 () (_ BitVec 64))

(declare-fun lt!367855 () (_ BitVec 64))

(assert (=> d!78084 (= res!192911 (= lt!367856 (bvsub lt!367855 lt!367859)))))

(assert (=> d!78084 (or (= (bvand lt!367855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367855 lt!367859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78084 (= lt!367859 (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))) ((_ sign_extend 32) (currentByte!10627 b1!101)) ((_ sign_extend 32) (currentBit!10622 b1!101))))))

(declare-fun lt!367858 () (_ BitVec 64))

(declare-fun lt!367857 () (_ BitVec 64))

(assert (=> d!78084 (= lt!367855 (bvmul lt!367858 lt!367857))))

(assert (=> d!78084 (or (= lt!367858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367857 (bvsdiv (bvmul lt!367858 lt!367857) lt!367858)))))

(assert (=> d!78084 (= lt!367857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78084 (= lt!367858 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))))))

(assert (=> d!78084 (= lt!367856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10627 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10622 b1!101))))))

(assert (=> d!78084 (invariant!0 (currentBit!10622 b1!101) (currentByte!10627 b1!101) (size!5139 (buf!5680 b1!101)))))

(assert (=> d!78084 (= (bitIndex!0 (size!5139 (buf!5680 b1!101)) (currentByte!10627 b1!101) (currentBit!10622 b1!101)) lt!367856)))

(declare-fun b!230137 () Bool)

(declare-fun res!192912 () Bool)

(assert (=> b!230137 (=> (not res!192912) (not e!158027))))

(assert (=> b!230137 (= res!192912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367856))))

(declare-fun b!230138 () Bool)

(declare-fun lt!367860 () (_ BitVec 64))

(assert (=> b!230138 (= e!158027 (bvsle lt!367856 (bvmul lt!367860 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230138 (or (= lt!367860 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367860 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367860)))))

(assert (=> b!230138 (= lt!367860 ((_ sign_extend 32) (size!5139 (buf!5680 b1!101))))))

(assert (= (and d!78084 res!192911) b!230137))

(assert (= (and b!230137 res!192912) b!230138))

(assert (=> d!78084 m!353553))

(assert (=> d!78084 m!353563))

(assert (=> b!230124 d!78084))

(declare-fun d!78086 () Bool)

(declare-fun e!158028 () Bool)

(assert (=> d!78086 e!158028))

(declare-fun res!192913 () Bool)

(assert (=> d!78086 (=> (not res!192913) (not e!158028))))

(declare-fun lt!367861 () (_ BitVec 64))

(declare-fun lt!367865 () (_ BitVec 64))

(declare-fun lt!367862 () (_ BitVec 64))

(assert (=> d!78086 (= res!192913 (= lt!367862 (bvsub lt!367861 lt!367865)))))

(assert (=> d!78086 (or (= (bvand lt!367861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367861 lt!367865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78086 (= lt!367865 (remainingBits!0 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))) ((_ sign_extend 32) (currentByte!10627 b2!99)) ((_ sign_extend 32) (currentBit!10622 b2!99))))))

(declare-fun lt!367864 () (_ BitVec 64))

(declare-fun lt!367863 () (_ BitVec 64))

(assert (=> d!78086 (= lt!367861 (bvmul lt!367864 lt!367863))))

(assert (=> d!78086 (or (= lt!367864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367863 (bvsdiv (bvmul lt!367864 lt!367863) lt!367864)))))

(assert (=> d!78086 (= lt!367863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78086 (= lt!367864 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))))))

(assert (=> d!78086 (= lt!367862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10627 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10622 b2!99))))))

(assert (=> d!78086 (invariant!0 (currentBit!10622 b2!99) (currentByte!10627 b2!99) (size!5139 (buf!5680 b2!99)))))

(assert (=> d!78086 (= (bitIndex!0 (size!5139 (buf!5680 b2!99)) (currentByte!10627 b2!99) (currentBit!10622 b2!99)) lt!367862)))

(declare-fun b!230139 () Bool)

(declare-fun res!192914 () Bool)

(assert (=> b!230139 (=> (not res!192914) (not e!158028))))

(assert (=> b!230139 (= res!192914 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367862))))

(declare-fun b!230140 () Bool)

(declare-fun lt!367866 () (_ BitVec 64))

(assert (=> b!230140 (= e!158028 (bvsle lt!367862 (bvmul lt!367866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230140 (or (= lt!367866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367866)))))

(assert (=> b!230140 (= lt!367866 ((_ sign_extend 32) (size!5139 (buf!5680 b2!99))))))

(assert (= (and d!78086 res!192913) b!230139))

(assert (= (and b!230139 res!192914) b!230140))

(assert (=> d!78086 m!353567))

(assert (=> d!78086 m!353565))

(assert (=> b!230119 d!78086))

(push 1)

(assert (not d!78082))

(assert (not d!78076))

(assert (not d!78086))

(assert (not d!78084))

(assert (not d!78070))

(assert (not d!78072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

