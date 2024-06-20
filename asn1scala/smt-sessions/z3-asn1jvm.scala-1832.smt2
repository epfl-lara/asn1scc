; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49196 () Bool)

(assert start!49196)

(declare-fun b!233736 () Bool)

(declare-fun e!161100 () Bool)

(declare-fun e!161098 () Bool)

(assert (=> b!233736 (= e!161100 e!161098)))

(declare-fun res!195537 () Bool)

(assert (=> b!233736 (=> (not res!195537) (not e!161098))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369561 () (_ BitVec 64))

(assert (=> b!233736 (= res!195537 (bvsle bits!86 lt!369561))))

(declare-datatypes ((array!12084 0))(
  ( (array!12085 (arr!6290 (Array (_ BitVec 32) (_ BitVec 8))) (size!5303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9702 0))(
  ( (BitStream!9703 (buf!5844 array!12084) (currentByte!10878 (_ BitVec 32)) (currentBit!10873 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9702)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233736 (= lt!369561 (bitIndex!0 (size!5303 (buf!5844 b2!99)) (currentByte!10878 b2!99) (currentBit!10873 b2!99)))))

(declare-fun b!233737 () Bool)

(declare-fun e!161102 () Bool)

(declare-fun e!161094 () Bool)

(assert (=> b!233737 (= e!161102 e!161094)))

(declare-fun res!195532 () Bool)

(assert (=> b!233737 (=> (not res!195532) (not e!161094))))

(declare-fun lt!369560 () (_ BitVec 64))

(declare-fun lt!369559 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!369557 () (_ BitVec 64))

(assert (=> b!233737 (= res!195532 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369559 (bvsub lt!369557 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369559 lt!369557) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369560))))))

(assert (=> b!233737 (= lt!369559 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99)))))))

(declare-fun b!233738 () Bool)

(declare-fun e!161099 () Bool)

(assert (=> b!233738 (= e!161098 e!161099)))

(declare-fun res!195536 () Bool)

(assert (=> b!233738 (=> (not res!195536) (not e!161099))))

(declare-fun lt!369558 () (_ BitVec 32))

(assert (=> b!233738 (= res!195536 (bvsle lt!369558 bytes!19))))

(assert (=> b!233738 (= lt!369558 ((_ extract 31 0) lt!369560))))

(assert (=> b!233738 (= lt!369560 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233739 () Bool)

(declare-fun e!161096 () Bool)

(declare-fun b1!101 () BitStream!9702)

(declare-fun array_inv!5044 (array!12084) Bool)

(assert (=> b!233739 (= e!161096 (array_inv!5044 (buf!5844 b1!101)))))

(declare-fun b!233740 () Bool)

(declare-fun e!161093 () Bool)

(assert (=> b!233740 (= e!161093 e!161102)))

(declare-fun res!195533 () Bool)

(assert (=> b!233740 (=> (not res!195533) (not e!161102))))

(declare-fun lt!369556 () (_ BitVec 64))

(assert (=> b!233740 (= res!195533 (and (= lt!369561 lt!369557) (= (bvsub lt!369561 bits!86) lt!369556)))))

(assert (=> b!233740 (= lt!369557 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10878 b2!99))) ((_ sign_extend 32) (currentBit!10873 b2!99))))))

(declare-fun b!233741 () Bool)

(assert (=> b!233741 (= e!161094 (bvsge lt!369560 #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!233742 () Bool)

(declare-fun res!195534 () Bool)

(assert (=> b!233742 (=> (not res!195534) (not e!161099))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233742 (= res!195534 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101)) bytes!19))))

(declare-fun res!195535 () Bool)

(assert (=> start!49196 (=> (not res!195535) (not e!161100))))

(assert (=> start!49196 (= res!195535 (and (= (size!5303 (buf!5844 b1!101)) (size!5303 (buf!5844 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49196 e!161100))

(declare-fun inv!12 (BitStream!9702) Bool)

(assert (=> start!49196 (and (inv!12 b1!101) e!161096)))

(declare-fun e!161097 () Bool)

(assert (=> start!49196 (and (inv!12 b2!99) e!161097)))

(assert (=> start!49196 true))

(declare-fun b!233743 () Bool)

(assert (=> b!233743 (= e!161097 (array_inv!5044 (buf!5844 b2!99)))))

(declare-fun b!233744 () Bool)

(declare-fun res!195528 () Bool)

(assert (=> b!233744 (=> (not res!195528) (not e!161099))))

(assert (=> b!233744 (= res!195528 (= lt!369561 (bvadd (bitIndex!0 (size!5303 (buf!5844 b1!101)) (currentByte!10878 b1!101) (currentBit!10873 b1!101)) bits!86)))))

(declare-fun b!233745 () Bool)

(declare-fun res!195530 () Bool)

(assert (=> b!233745 (=> (not res!195530) (not e!161094))))

(assert (=> b!233745 (= res!195530 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))) ((_ sign_extend 32) (currentByte!10878 b2!99)) ((_ sign_extend 32) (currentBit!10873 b2!99)) (bvsub bytes!19 lt!369558)))))

(declare-fun b!233746 () Bool)

(declare-fun res!195529 () Bool)

(assert (=> b!233746 (=> (not res!195529) (not e!161099))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233746 (= res!195529 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233747 () Bool)

(assert (=> b!233747 (= e!161099 e!161093)))

(declare-fun res!195531 () Bool)

(assert (=> b!233747 (=> (not res!195531) (not e!161093))))

(assert (=> b!233747 (= res!195531 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101)))) lt!369556) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233747 (= lt!369556 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10878 b1!101))) ((_ sign_extend 32) (currentBit!10873 b1!101))))))

(assert (= (and start!49196 res!195535) b!233736))

(assert (= (and b!233736 res!195537) b!233738))

(assert (= (and b!233738 res!195536) b!233742))

(assert (= (and b!233742 res!195534) b!233744))

(assert (= (and b!233744 res!195528) b!233746))

(assert (= (and b!233746 res!195529) b!233747))

(assert (= (and b!233747 res!195531) b!233740))

(assert (= (and b!233740 res!195533) b!233737))

(assert (= (and b!233737 res!195532) b!233745))

(assert (= (and b!233745 res!195530) b!233741))

(assert (= start!49196 b!233739))

(assert (= start!49196 b!233743))

(declare-fun m!356219 () Bool)

(assert (=> b!233743 m!356219))

(declare-fun m!356221 () Bool)

(assert (=> b!233744 m!356221))

(declare-fun m!356223 () Bool)

(assert (=> b!233745 m!356223))

(declare-fun m!356225 () Bool)

(assert (=> b!233739 m!356225))

(declare-fun m!356227 () Bool)

(assert (=> start!49196 m!356227))

(declare-fun m!356229 () Bool)

(assert (=> start!49196 m!356229))

(declare-fun m!356231 () Bool)

(assert (=> b!233746 m!356231))

(declare-fun m!356233 () Bool)

(assert (=> b!233736 m!356233))

(declare-fun m!356235 () Bool)

(assert (=> b!233742 m!356235))

(check-sat (not b!233745) (not b!233739) (not b!233744) (not start!49196) (not b!233742) (not b!233746) (not b!233736) (not b!233743))
(check-sat)
(get-model)

(declare-fun d!78684 () Bool)

(assert (=> d!78684 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19393 () Bool)

(assert (= bs!19393 d!78684))

(assert (=> bs!19393 m!356231))

(assert (=> b!233742 d!78684))

(declare-fun d!78686 () Bool)

(declare-fun e!161135 () Bool)

(assert (=> d!78686 e!161135))

(declare-fun res!195572 () Bool)

(assert (=> d!78686 (=> (not res!195572) (not e!161135))))

(declare-fun lt!369595 () (_ BitVec 64))

(declare-fun lt!369592 () (_ BitVec 64))

(declare-fun lt!369596 () (_ BitVec 64))

(assert (=> d!78686 (= res!195572 (= lt!369595 (bvsub lt!369596 lt!369592)))))

(assert (=> d!78686 (or (= (bvand lt!369596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369596 lt!369592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78686 (= lt!369592 (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101))))))

(declare-fun lt!369593 () (_ BitVec 64))

(declare-fun lt!369594 () (_ BitVec 64))

(assert (=> d!78686 (= lt!369596 (bvmul lt!369593 lt!369594))))

(assert (=> d!78686 (or (= lt!369593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369594 (bvsdiv (bvmul lt!369593 lt!369594) lt!369593)))))

(assert (=> d!78686 (= lt!369594 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78686 (= lt!369593 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))))))

(assert (=> d!78686 (= lt!369595 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10878 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10873 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78686 (invariant!0 (currentBit!10873 b1!101) (currentByte!10878 b1!101) (size!5303 (buf!5844 b1!101)))))

(assert (=> d!78686 (= (bitIndex!0 (size!5303 (buf!5844 b1!101)) (currentByte!10878 b1!101) (currentBit!10873 b1!101)) lt!369595)))

(declare-fun b!233788 () Bool)

(declare-fun res!195573 () Bool)

(assert (=> b!233788 (=> (not res!195573) (not e!161135))))

(assert (=> b!233788 (= res!195573 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369595))))

(declare-fun b!233789 () Bool)

(declare-fun lt!369597 () (_ BitVec 64))

(assert (=> b!233789 (= e!161135 (bvsle lt!369595 (bvmul lt!369597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233789 (or (= lt!369597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369597)))))

(assert (=> b!233789 (= lt!369597 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))))))

(assert (= (and d!78686 res!195572) b!233788))

(assert (= (and b!233788 res!195573) b!233789))

(assert (=> d!78686 m!356231))

(declare-fun m!356255 () Bool)

(assert (=> d!78686 m!356255))

(assert (=> b!233744 d!78686))

(declare-fun d!78688 () Bool)

(assert (=> d!78688 (= (array_inv!5044 (buf!5844 b2!99)) (bvsge (size!5303 (buf!5844 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233743 d!78688))

(declare-fun d!78690 () Bool)

(assert (=> d!78690 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))) ((_ sign_extend 32) (currentByte!10878 b2!99)) ((_ sign_extend 32) (currentBit!10873 b2!99)) (bvsub bytes!19 lt!369558)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369558)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))) ((_ sign_extend 32) (currentByte!10878 b2!99)) ((_ sign_extend 32) (currentBit!10873 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19394 () Bool)

(assert (= bs!19394 d!78690))

(declare-fun m!356257 () Bool)

(assert (=> bs!19394 m!356257))

(assert (=> b!233745 d!78690))

(declare-fun d!78692 () Bool)

(assert (=> d!78692 (= (inv!12 b1!101) (invariant!0 (currentBit!10873 b1!101) (currentByte!10878 b1!101) (size!5303 (buf!5844 b1!101))))))

(declare-fun bs!19395 () Bool)

(assert (= bs!19395 d!78692))

(assert (=> bs!19395 m!356255))

(assert (=> start!49196 d!78692))

(declare-fun d!78694 () Bool)

(assert (=> d!78694 (= (inv!12 b2!99) (invariant!0 (currentBit!10873 b2!99) (currentByte!10878 b2!99) (size!5303 (buf!5844 b2!99))))))

(declare-fun bs!19396 () Bool)

(assert (= bs!19396 d!78694))

(declare-fun m!356259 () Bool)

(assert (=> bs!19396 m!356259))

(assert (=> start!49196 d!78694))

(declare-fun d!78696 () Bool)

(assert (=> d!78696 (= (array_inv!5044 (buf!5844 b1!101)) (bvsge (size!5303 (buf!5844 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233739 d!78696))

(declare-fun d!78698 () Bool)

(declare-fun e!161136 () Bool)

(assert (=> d!78698 e!161136))

(declare-fun res!195574 () Bool)

(assert (=> d!78698 (=> (not res!195574) (not e!161136))))

(declare-fun lt!369598 () (_ BitVec 64))

(declare-fun lt!369602 () (_ BitVec 64))

(declare-fun lt!369601 () (_ BitVec 64))

(assert (=> d!78698 (= res!195574 (= lt!369601 (bvsub lt!369602 lt!369598)))))

(assert (=> d!78698 (or (= (bvand lt!369602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369598 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369602 lt!369598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78698 (= lt!369598 (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))) ((_ sign_extend 32) (currentByte!10878 b2!99)) ((_ sign_extend 32) (currentBit!10873 b2!99))))))

(declare-fun lt!369599 () (_ BitVec 64))

(declare-fun lt!369600 () (_ BitVec 64))

(assert (=> d!78698 (= lt!369602 (bvmul lt!369599 lt!369600))))

(assert (=> d!78698 (or (= lt!369599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369600 (bvsdiv (bvmul lt!369599 lt!369600) lt!369599)))))

(assert (=> d!78698 (= lt!369600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78698 (= lt!369599 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))))))

(assert (=> d!78698 (= lt!369601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10878 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10873 b2!99))))))

(assert (=> d!78698 (invariant!0 (currentBit!10873 b2!99) (currentByte!10878 b2!99) (size!5303 (buf!5844 b2!99)))))

(assert (=> d!78698 (= (bitIndex!0 (size!5303 (buf!5844 b2!99)) (currentByte!10878 b2!99) (currentBit!10873 b2!99)) lt!369601)))

(declare-fun b!233790 () Bool)

(declare-fun res!195575 () Bool)

(assert (=> b!233790 (=> (not res!195575) (not e!161136))))

(assert (=> b!233790 (= res!195575 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369601))))

(declare-fun b!233791 () Bool)

(declare-fun lt!369603 () (_ BitVec 64))

(assert (=> b!233791 (= e!161136 (bvsle lt!369601 (bvmul lt!369603 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233791 (or (= lt!369603 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369603 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369603)))))

(assert (=> b!233791 (= lt!369603 ((_ sign_extend 32) (size!5303 (buf!5844 b2!99))))))

(assert (= (and d!78698 res!195574) b!233790))

(assert (= (and b!233790 res!195575) b!233791))

(assert (=> d!78698 m!356257))

(assert (=> d!78698 m!356259))

(assert (=> b!233736 d!78698))

(declare-fun d!78700 () Bool)

(assert (=> d!78700 (= (remainingBits!0 ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) ((_ sign_extend 32) (currentByte!10878 b1!101)) ((_ sign_extend 32) (currentBit!10873 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5303 (buf!5844 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10878 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10873 b1!101)))))))

(assert (=> b!233746 d!78700))

(check-sat (not d!78692) (not d!78698) (not d!78686) (not d!78684) (not d!78690) (not d!78694))
