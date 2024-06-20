; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48552 () Bool)

(assert start!48552)

(declare-fun b!230077 () Bool)

(declare-fun e!157988 () Bool)

(declare-fun e!157987 () Bool)

(assert (=> b!230077 (= e!157988 e!157987)))

(declare-fun res!192866 () Bool)

(assert (=> b!230077 (=> (not res!192866) (not e!157987))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367795 () (_ BitVec 64))

(assert (=> b!230077 (= res!192866 (bvsle bits!86 lt!367795))))

(declare-datatypes ((array!11719 0))(
  ( (array!11720 (arr!6125 (Array (_ BitVec 32) (_ BitVec 8))) (size!5138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9372 0))(
  ( (BitStream!9373 (buf!5679 array!11719) (currentByte!10626 (_ BitVec 32)) (currentBit!10621 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9372)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230077 (= lt!367795 (bitIndex!0 (size!5138 (buf!5679 b2!99)) (currentByte!10626 b2!99) (currentBit!10621 b2!99)))))

(declare-fun b!230078 () Bool)

(declare-fun res!192863 () Bool)

(declare-fun e!157981 () Bool)

(assert (=> b!230078 (=> (not res!192863) (not e!157981))))

(declare-fun lt!367799 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230078 (= res!192863 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) ((_ sign_extend 32) (currentByte!10626 b2!99)) ((_ sign_extend 32) (currentBit!10621 b2!99)) (bvsub bytes!19 lt!367799)))))

(declare-fun res!192868 () Bool)

(assert (=> start!48552 (=> (not res!192868) (not e!157988))))

(declare-fun b1!101 () BitStream!9372)

(assert (=> start!48552 (= res!192868 (and (= (size!5138 (buf!5679 b1!101)) (size!5138 (buf!5679 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48552 e!157988))

(declare-fun e!157984 () Bool)

(declare-fun inv!12 (BitStream!9372) Bool)

(assert (=> start!48552 (and (inv!12 b1!101) e!157984)))

(declare-fun e!157983 () Bool)

(assert (=> start!48552 (and (inv!12 b2!99) e!157983)))

(assert (=> start!48552 true))

(declare-fun b!230079 () Bool)

(declare-fun e!157986 () Bool)

(assert (=> b!230079 (= e!157987 e!157986)))

(declare-fun res!192862 () Bool)

(assert (=> b!230079 (=> (not res!192862) (not e!157986))))

(assert (=> b!230079 (= res!192862 (bvsle lt!367799 bytes!19))))

(declare-fun lt!367796 () (_ BitVec 64))

(assert (=> b!230079 (= lt!367799 ((_ extract 31 0) lt!367796))))

(assert (=> b!230079 (= lt!367796 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!230080 () Bool)

(declare-fun e!157985 () Bool)

(assert (=> b!230080 (= e!157986 e!157985)))

(declare-fun res!192864 () Bool)

(assert (=> b!230080 (=> (not res!192864) (not e!157985))))

(declare-fun lt!367800 () (_ BitVec 64))

(assert (=> b!230080 (= res!192864 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101)))) lt!367800) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230080 (= lt!367800 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10626 b1!101))) ((_ sign_extend 32) (currentBit!10621 b1!101))))))

(declare-fun b!230081 () Bool)

(declare-fun res!192859 () Bool)

(assert (=> b!230081 (=> (not res!192859) (not e!157986))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230081 (= res!192859 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230082 () Bool)

(declare-fun res!192865 () Bool)

(assert (=> b!230082 (=> (not res!192865) (not e!157986))))

(assert (=> b!230082 (= res!192865 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101)) bytes!19))))

(declare-fun b!230083 () Bool)

(declare-fun res!192860 () Bool)

(assert (=> b!230083 (=> (not res!192860) (not e!157986))))

(assert (=> b!230083 (= res!192860 (= lt!367795 (bvadd (bitIndex!0 (size!5138 (buf!5679 b1!101)) (currentByte!10626 b1!101) (currentBit!10621 b1!101)) bits!86)))))

(declare-fun b!230084 () Bool)

(declare-fun e!157989 () Bool)

(assert (=> b!230084 (= e!157989 e!157981)))

(declare-fun res!192867 () Bool)

(assert (=> b!230084 (=> (not res!192867) (not e!157981))))

(declare-fun lt!367797 () (_ BitVec 64))

(declare-fun lt!367798 () (_ BitVec 64))

(assert (=> b!230084 (= res!192867 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367797 (bvsub lt!367798 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367797 lt!367798) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367796))))))

(assert (=> b!230084 (= lt!367797 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99)))))))

(declare-fun b!230085 () Bool)

(assert (=> b!230085 (= e!157981 (and (bvsle ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10626 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10621 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10626 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10621 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230086 () Bool)

(assert (=> b!230086 (= e!157985 e!157989)))

(declare-fun res!192861 () Bool)

(assert (=> b!230086 (=> (not res!192861) (not e!157989))))

(assert (=> b!230086 (= res!192861 (and (= lt!367795 lt!367798) (= (bvsub lt!367795 bits!86) lt!367800)))))

(assert (=> b!230086 (= lt!367798 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10626 b2!99))) ((_ sign_extend 32) (currentBit!10621 b2!99))))))

(declare-fun b!230087 () Bool)

(declare-fun array_inv!4879 (array!11719) Bool)

(assert (=> b!230087 (= e!157983 (array_inv!4879 (buf!5679 b2!99)))))

(declare-fun b!230088 () Bool)

(assert (=> b!230088 (= e!157984 (array_inv!4879 (buf!5679 b1!101)))))

(assert (= (and start!48552 res!192868) b!230077))

(assert (= (and b!230077 res!192866) b!230079))

(assert (= (and b!230079 res!192862) b!230082))

(assert (= (and b!230082 res!192865) b!230083))

(assert (= (and b!230083 res!192860) b!230081))

(assert (= (and b!230081 res!192859) b!230080))

(assert (= (and b!230080 res!192864) b!230086))

(assert (= (and b!230086 res!192861) b!230084))

(assert (= (and b!230084 res!192867) b!230078))

(assert (= (and b!230078 res!192863) b!230085))

(assert (= start!48552 b!230088))

(assert (= start!48552 b!230087))

(declare-fun m!353521 () Bool)

(assert (=> b!230082 m!353521))

(declare-fun m!353523 () Bool)

(assert (=> b!230088 m!353523))

(declare-fun m!353525 () Bool)

(assert (=> b!230077 m!353525))

(declare-fun m!353527 () Bool)

(assert (=> b!230087 m!353527))

(declare-fun m!353529 () Bool)

(assert (=> b!230081 m!353529))

(declare-fun m!353531 () Bool)

(assert (=> b!230078 m!353531))

(declare-fun m!353533 () Bool)

(assert (=> start!48552 m!353533))

(declare-fun m!353535 () Bool)

(assert (=> start!48552 m!353535))

(declare-fun m!353537 () Bool)

(assert (=> b!230083 m!353537))

(check-sat (not b!230087) (not b!230077) (not b!230078) (not start!48552) (not b!230083) (not b!230081) (not b!230088) (not b!230082))
(check-sat)
(get-model)

(declare-fun d!78052 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78052 (= (inv!12 b1!101) (invariant!0 (currentBit!10621 b1!101) (currentByte!10626 b1!101) (size!5138 (buf!5679 b1!101))))))

(declare-fun bs!19125 () Bool)

(assert (= bs!19125 d!78052))

(declare-fun m!353557 () Bool)

(assert (=> bs!19125 m!353557))

(assert (=> start!48552 d!78052))

(declare-fun d!78054 () Bool)

(assert (=> d!78054 (= (inv!12 b2!99) (invariant!0 (currentBit!10621 b2!99) (currentByte!10626 b2!99) (size!5138 (buf!5679 b2!99))))))

(declare-fun bs!19126 () Bool)

(assert (= bs!19126 d!78054))

(declare-fun m!353559 () Bool)

(assert (=> bs!19126 m!353559))

(assert (=> start!48552 d!78054))

(declare-fun d!78056 () Bool)

(assert (=> d!78056 (= (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10626 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10621 b1!101)))))))

(assert (=> b!230081 d!78056))

(declare-fun d!78058 () Bool)

(assert (=> d!78058 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19127 () Bool)

(assert (= bs!19127 d!78058))

(assert (=> bs!19127 m!353529))

(assert (=> b!230082 d!78058))

(declare-fun d!78060 () Bool)

(declare-fun e!158023 () Bool)

(assert (=> d!78060 e!158023))

(declare-fun res!192904 () Bool)

(assert (=> d!78060 (=> (not res!192904) (not e!158023))))

(declare-fun lt!367831 () (_ BitVec 64))

(declare-fun lt!367833 () (_ BitVec 64))

(declare-fun lt!367834 () (_ BitVec 64))

(assert (=> d!78060 (= res!192904 (= lt!367833 (bvsub lt!367831 lt!367834)))))

(assert (=> d!78060 (or (= (bvand lt!367831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367831 lt!367834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78060 (= lt!367834 (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) ((_ sign_extend 32) (currentByte!10626 b2!99)) ((_ sign_extend 32) (currentBit!10621 b2!99))))))

(declare-fun lt!367832 () (_ BitVec 64))

(declare-fun lt!367835 () (_ BitVec 64))

(assert (=> d!78060 (= lt!367831 (bvmul lt!367832 lt!367835))))

(assert (=> d!78060 (or (= lt!367832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367835 (bvsdiv (bvmul lt!367832 lt!367835) lt!367832)))))

(assert (=> d!78060 (= lt!367835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78060 (= lt!367832 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))))))

(assert (=> d!78060 (= lt!367833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10626 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10621 b2!99))))))

(assert (=> d!78060 (invariant!0 (currentBit!10621 b2!99) (currentByte!10626 b2!99) (size!5138 (buf!5679 b2!99)))))

(assert (=> d!78060 (= (bitIndex!0 (size!5138 (buf!5679 b2!99)) (currentByte!10626 b2!99) (currentBit!10621 b2!99)) lt!367833)))

(declare-fun b!230129 () Bool)

(declare-fun res!192903 () Bool)

(assert (=> b!230129 (=> (not res!192903) (not e!158023))))

(assert (=> b!230129 (= res!192903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367833))))

(declare-fun b!230130 () Bool)

(declare-fun lt!367836 () (_ BitVec 64))

(assert (=> b!230130 (= e!158023 (bvsle lt!367833 (bvmul lt!367836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230130 (or (= lt!367836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367836)))))

(assert (=> b!230130 (= lt!367836 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))))))

(assert (= (and d!78060 res!192904) b!230129))

(assert (= (and b!230129 res!192903) b!230130))

(declare-fun m!353561 () Bool)

(assert (=> d!78060 m!353561))

(assert (=> d!78060 m!353559))

(assert (=> b!230077 d!78060))

(declare-fun d!78062 () Bool)

(assert (=> d!78062 (= (array_inv!4879 (buf!5679 b2!99)) (bvsge (size!5138 (buf!5679 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230087 d!78062))

(declare-fun d!78064 () Bool)

(assert (=> d!78064 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) ((_ sign_extend 32) (currentByte!10626 b2!99)) ((_ sign_extend 32) (currentBit!10621 b2!99)) (bvsub bytes!19 lt!367799)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!367799)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) ((_ sign_extend 32) (currentByte!10626 b2!99)) ((_ sign_extend 32) (currentBit!10621 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19128 () Bool)

(assert (= bs!19128 d!78064))

(assert (=> bs!19128 m!353561))

(assert (=> b!230078 d!78064))

(declare-fun d!78066 () Bool)

(assert (=> d!78066 (= (array_inv!4879 (buf!5679 b1!101)) (bvsge (size!5138 (buf!5679 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230088 d!78066))

(declare-fun d!78068 () Bool)

(declare-fun e!158024 () Bool)

(assert (=> d!78068 e!158024))

(declare-fun res!192906 () Bool)

(assert (=> d!78068 (=> (not res!192906) (not e!158024))))

(declare-fun lt!367837 () (_ BitVec 64))

(declare-fun lt!367840 () (_ BitVec 64))

(declare-fun lt!367839 () (_ BitVec 64))

(assert (=> d!78068 (= res!192906 (= lt!367839 (bvsub lt!367837 lt!367840)))))

(assert (=> d!78068 (or (= (bvand lt!367837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367837 lt!367840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78068 (= lt!367840 (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))) ((_ sign_extend 32) (currentByte!10626 b1!101)) ((_ sign_extend 32) (currentBit!10621 b1!101))))))

(declare-fun lt!367838 () (_ BitVec 64))

(declare-fun lt!367841 () (_ BitVec 64))

(assert (=> d!78068 (= lt!367837 (bvmul lt!367838 lt!367841))))

(assert (=> d!78068 (or (= lt!367838 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367841 (bvsdiv (bvmul lt!367838 lt!367841) lt!367838)))))

(assert (=> d!78068 (= lt!367841 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78068 (= lt!367838 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))))))

(assert (=> d!78068 (= lt!367839 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10626 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10621 b1!101))))))

(assert (=> d!78068 (invariant!0 (currentBit!10621 b1!101) (currentByte!10626 b1!101) (size!5138 (buf!5679 b1!101)))))

(assert (=> d!78068 (= (bitIndex!0 (size!5138 (buf!5679 b1!101)) (currentByte!10626 b1!101) (currentBit!10621 b1!101)) lt!367839)))

(declare-fun b!230131 () Bool)

(declare-fun res!192905 () Bool)

(assert (=> b!230131 (=> (not res!192905) (not e!158024))))

(assert (=> b!230131 (= res!192905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367839))))

(declare-fun b!230132 () Bool)

(declare-fun lt!367842 () (_ BitVec 64))

(assert (=> b!230132 (= e!158024 (bvsle lt!367839 (bvmul lt!367842 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230132 (or (= lt!367842 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367842 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367842)))))

(assert (=> b!230132 (= lt!367842 ((_ sign_extend 32) (size!5138 (buf!5679 b1!101))))))

(assert (= (and d!78068 res!192906) b!230131))

(assert (= (and b!230131 res!192905) b!230132))

(assert (=> d!78068 m!353529))

(assert (=> d!78068 m!353557))

(assert (=> b!230083 d!78068))

(check-sat (not d!78058) (not d!78060) (not d!78054) (not d!78064) (not d!78068) (not d!78052))
(check-sat)
(get-model)

(declare-fun d!78088 () Bool)

(assert (=> d!78088 (= (invariant!0 (currentBit!10621 b1!101) (currentByte!10626 b1!101) (size!5138 (buf!5679 b1!101))) (and (bvsge (currentBit!10621 b1!101) #b00000000000000000000000000000000) (bvslt (currentBit!10621 b1!101) #b00000000000000000000000000001000) (bvsge (currentByte!10626 b1!101) #b00000000000000000000000000000000) (or (bvslt (currentByte!10626 b1!101) (size!5138 (buf!5679 b1!101))) (and (= (currentBit!10621 b1!101) #b00000000000000000000000000000000) (= (currentByte!10626 b1!101) (size!5138 (buf!5679 b1!101)))))))))

(assert (=> d!78052 d!78088))

(declare-fun d!78090 () Bool)

(assert (=> d!78090 (= (remainingBits!0 ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) ((_ sign_extend 32) (currentByte!10626 b2!99)) ((_ sign_extend 32) (currentBit!10621 b2!99))) (bvsub (bvmul ((_ sign_extend 32) (size!5138 (buf!5679 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10626 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10621 b2!99)))))))

(assert (=> d!78064 d!78090))

(assert (=> d!78068 d!78056))

(assert (=> d!78068 d!78088))

(declare-fun d!78092 () Bool)

(assert (=> d!78092 (= (invariant!0 (currentBit!10621 b2!99) (currentByte!10626 b2!99) (size!5138 (buf!5679 b2!99))) (and (bvsge (currentBit!10621 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10621 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10626 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10626 b2!99) (size!5138 (buf!5679 b2!99))) (and (= (currentBit!10621 b2!99) #b00000000000000000000000000000000) (= (currentByte!10626 b2!99) (size!5138 (buf!5679 b2!99)))))))))

(assert (=> d!78054 d!78092))

(assert (=> d!78060 d!78090))

(assert (=> d!78060 d!78092))

(assert (=> d!78058 d!78056))

(check-sat)
