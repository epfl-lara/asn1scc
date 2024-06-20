; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49194 () Bool)

(assert start!49194)

(declare-fun b!233700 () Bool)

(declare-fun e!161071 () Bool)

(declare-fun e!161072 () Bool)

(assert (=> b!233700 (= e!161071 e!161072)))

(declare-fun res!195506 () Bool)

(assert (=> b!233700 (=> (not res!195506) (not e!161072))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369540 () (_ BitVec 64))

(declare-fun lt!369543 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!369539 () (_ BitVec 64))

(assert (=> b!233700 (= res!195506 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369543 (bvsub lt!369540 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369543 lt!369540) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369539))))))

(declare-datatypes ((array!12082 0))(
  ( (array!12083 (arr!6289 (Array (_ BitVec 32) (_ BitVec 8))) (size!5302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9700 0))(
  ( (BitStream!9701 (buf!5843 array!12082) (currentByte!10877 (_ BitVec 32)) (currentBit!10872 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9700)

(assert (=> b!233700 (= lt!369543 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99)))))))

(declare-fun b!233701 () Bool)

(declare-fun e!161070 () Bool)

(assert (=> b!233701 (= e!161070 e!161071)))

(declare-fun res!195507 () Bool)

(assert (=> b!233701 (=> (not res!195507) (not e!161071))))

(declare-fun lt!369542 () (_ BitVec 64))

(declare-fun lt!369538 () (_ BitVec 64))

(assert (=> b!233701 (= res!195507 (and (= lt!369538 lt!369540) (= (bvsub lt!369538 bits!86) lt!369542)))))

(assert (=> b!233701 (= lt!369540 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10877 b2!99))) ((_ sign_extend 32) (currentBit!10872 b2!99))))))

(declare-fun b!233702 () Bool)

(assert (=> b!233702 (= e!161072 (bvsge lt!369539 #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!233703 () Bool)

(declare-fun e!161067 () Bool)

(declare-fun b1!101 () BitStream!9700)

(declare-fun array_inv!5043 (array!12082) Bool)

(assert (=> b!233703 (= e!161067 (array_inv!5043 (buf!5843 b1!101)))))

(declare-fun b!233704 () Bool)

(declare-fun e!161063 () Bool)

(declare-fun e!161068 () Bool)

(assert (=> b!233704 (= e!161063 e!161068)))

(declare-fun res!195500 () Bool)

(assert (=> b!233704 (=> (not res!195500) (not e!161068))))

(declare-fun lt!369541 () (_ BitVec 32))

(assert (=> b!233704 (= res!195500 (bvsle lt!369541 bytes!19))))

(assert (=> b!233704 (= lt!369541 ((_ extract 31 0) lt!369539))))

(assert (=> b!233704 (= lt!369539 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233705 () Bool)

(assert (=> b!233705 (= e!161068 e!161070)))

(declare-fun res!195504 () Bool)

(assert (=> b!233705 (=> (not res!195504) (not e!161070))))

(assert (=> b!233705 (= res!195504 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101)))) lt!369542) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233705 (= lt!369542 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10877 b1!101))) ((_ sign_extend 32) (currentBit!10872 b1!101))))))

(declare-fun b!233706 () Bool)

(declare-fun res!195505 () Bool)

(assert (=> b!233706 (=> (not res!195505) (not e!161068))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233706 (= res!195505 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233707 () Bool)

(declare-fun e!161064 () Bool)

(assert (=> b!233707 (= e!161064 (array_inv!5043 (buf!5843 b2!99)))))

(declare-fun res!195503 () Bool)

(declare-fun e!161065 () Bool)

(assert (=> start!49194 (=> (not res!195503) (not e!161065))))

(assert (=> start!49194 (= res!195503 (and (= (size!5302 (buf!5843 b1!101)) (size!5302 (buf!5843 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49194 e!161065))

(declare-fun inv!12 (BitStream!9700) Bool)

(assert (=> start!49194 (and (inv!12 b1!101) e!161067)))

(assert (=> start!49194 (and (inv!12 b2!99) e!161064)))

(assert (=> start!49194 true))

(declare-fun b!233708 () Bool)

(declare-fun res!195502 () Bool)

(assert (=> b!233708 (=> (not res!195502) (not e!161068))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233708 (= res!195502 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101)) bytes!19))))

(declare-fun b!233709 () Bool)

(declare-fun res!195501 () Bool)

(assert (=> b!233709 (=> (not res!195501) (not e!161068))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233709 (= res!195501 (= lt!369538 (bvadd (bitIndex!0 (size!5302 (buf!5843 b1!101)) (currentByte!10877 b1!101) (currentBit!10872 b1!101)) bits!86)))))

(declare-fun b!233710 () Bool)

(assert (=> b!233710 (= e!161065 e!161063)))

(declare-fun res!195498 () Bool)

(assert (=> b!233710 (=> (not res!195498) (not e!161063))))

(assert (=> b!233710 (= res!195498 (bvsle bits!86 lt!369538))))

(assert (=> b!233710 (= lt!369538 (bitIndex!0 (size!5302 (buf!5843 b2!99)) (currentByte!10877 b2!99) (currentBit!10872 b2!99)))))

(declare-fun b!233711 () Bool)

(declare-fun res!195499 () Bool)

(assert (=> b!233711 (=> (not res!195499) (not e!161072))))

(assert (=> b!233711 (= res!195499 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))) ((_ sign_extend 32) (currentByte!10877 b2!99)) ((_ sign_extend 32) (currentBit!10872 b2!99)) (bvsub bytes!19 lt!369541)))))

(assert (= (and start!49194 res!195503) b!233710))

(assert (= (and b!233710 res!195498) b!233704))

(assert (= (and b!233704 res!195500) b!233708))

(assert (= (and b!233708 res!195502) b!233709))

(assert (= (and b!233709 res!195501) b!233706))

(assert (= (and b!233706 res!195505) b!233705))

(assert (= (and b!233705 res!195504) b!233701))

(assert (= (and b!233701 res!195507) b!233700))

(assert (= (and b!233700 res!195506) b!233711))

(assert (= (and b!233711 res!195499) b!233702))

(assert (= start!49194 b!233703))

(assert (= start!49194 b!233707))

(declare-fun m!356201 () Bool)

(assert (=> b!233711 m!356201))

(declare-fun m!356203 () Bool)

(assert (=> b!233708 m!356203))

(declare-fun m!356205 () Bool)

(assert (=> b!233710 m!356205))

(declare-fun m!356207 () Bool)

(assert (=> b!233703 m!356207))

(declare-fun m!356209 () Bool)

(assert (=> b!233709 m!356209))

(declare-fun m!356211 () Bool)

(assert (=> b!233706 m!356211))

(declare-fun m!356213 () Bool)

(assert (=> b!233707 m!356213))

(declare-fun m!356215 () Bool)

(assert (=> start!49194 m!356215))

(declare-fun m!356217 () Bool)

(assert (=> start!49194 m!356217))

(push 1)

(assert (not b!233706))

(assert (not b!233703))

(assert (not b!233707))

(assert (not b!233709))

(assert (not start!49194))

(assert (not b!233708))

(assert (not b!233710))

(assert (not b!233711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78702 () Bool)

(assert (=> d!78702 (= (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10877 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10872 b1!101)))))))

(assert (=> b!233706 d!78702))

(declare-fun d!78704 () Bool)

(assert (=> d!78704 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))) ((_ sign_extend 32) (currentByte!10877 b2!99)) ((_ sign_extend 32) (currentBit!10872 b2!99)) (bvsub bytes!19 lt!369541)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369541)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))) ((_ sign_extend 32) (currentByte!10877 b2!99)) ((_ sign_extend 32) (currentBit!10872 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19397 () Bool)

(assert (= bs!19397 d!78704))

(declare-fun m!356261 () Bool)

(assert (=> bs!19397 m!356261))

(assert (=> b!233711 d!78704))

(declare-fun d!78706 () Bool)

(assert (=> d!78706 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19398 () Bool)

(assert (= bs!19398 d!78706))

(assert (=> bs!19398 m!356211))

(assert (=> b!233708 d!78706))

(declare-fun d!78708 () Bool)

(assert (=> d!78708 (= (array_inv!5043 (buf!5843 b2!99)) (bvsge (size!5302 (buf!5843 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233707 d!78708))

(declare-fun d!78710 () Bool)

(declare-fun e!161139 () Bool)

(assert (=> d!78710 e!161139))

(declare-fun res!195580 () Bool)

(assert (=> d!78710 (=> (not res!195580) (not e!161139))))

(declare-fun lt!369617 () (_ BitVec 64))

(declare-fun lt!369618 () (_ BitVec 64))

(declare-fun lt!369619 () (_ BitVec 64))

(assert (=> d!78710 (= res!195580 (= lt!369619 (bvsub lt!369617 lt!369618)))))

(assert (=> d!78710 (or (= (bvand lt!369617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369617 lt!369618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78710 (= lt!369618 (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))) ((_ sign_extend 32) (currentByte!10877 b1!101)) ((_ sign_extend 32) (currentBit!10872 b1!101))))))

(declare-fun lt!369621 () (_ BitVec 64))

(declare-fun lt!369620 () (_ BitVec 64))

(assert (=> d!78710 (= lt!369617 (bvmul lt!369621 lt!369620))))

(assert (=> d!78710 (or (= lt!369621 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369620 (bvsdiv (bvmul lt!369621 lt!369620) lt!369621)))))

(assert (=> d!78710 (= lt!369620 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78710 (= lt!369621 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))))))

(assert (=> d!78710 (= lt!369619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10877 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10872 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78710 (invariant!0 (currentBit!10872 b1!101) (currentByte!10877 b1!101) (size!5302 (buf!5843 b1!101)))))

(assert (=> d!78710 (= (bitIndex!0 (size!5302 (buf!5843 b1!101)) (currentByte!10877 b1!101) (currentBit!10872 b1!101)) lt!369619)))

(declare-fun b!233796 () Bool)

(declare-fun res!195581 () Bool)

(assert (=> b!233796 (=> (not res!195581) (not e!161139))))

(assert (=> b!233796 (= res!195581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369619))))

(declare-fun b!233797 () Bool)

(declare-fun lt!369616 () (_ BitVec 64))

(assert (=> b!233797 (= e!161139 (bvsle lt!369619 (bvmul lt!369616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233797 (or (= lt!369616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369616)))))

(assert (=> b!233797 (= lt!369616 ((_ sign_extend 32) (size!5302 (buf!5843 b1!101))))))

(assert (= (and d!78710 res!195580) b!233796))

(assert (= (and b!233796 res!195581) b!233797))

(assert (=> d!78710 m!356211))

(declare-fun m!356263 () Bool)

(assert (=> d!78710 m!356263))

(assert (=> b!233709 d!78710))

(declare-fun d!78712 () Bool)

(assert (=> d!78712 (= (inv!12 b1!101) (invariant!0 (currentBit!10872 b1!101) (currentByte!10877 b1!101) (size!5302 (buf!5843 b1!101))))))

(declare-fun bs!19399 () Bool)

(assert (= bs!19399 d!78712))

(assert (=> bs!19399 m!356263))

(assert (=> start!49194 d!78712))

(declare-fun d!78714 () Bool)

(assert (=> d!78714 (= (inv!12 b2!99) (invariant!0 (currentBit!10872 b2!99) (currentByte!10877 b2!99) (size!5302 (buf!5843 b2!99))))))

(declare-fun bs!19400 () Bool)

(assert (= bs!19400 d!78714))

(declare-fun m!356265 () Bool)

(assert (=> bs!19400 m!356265))

(assert (=> start!49194 d!78714))

(declare-fun d!78716 () Bool)

(assert (=> d!78716 (= (array_inv!5043 (buf!5843 b1!101)) (bvsge (size!5302 (buf!5843 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233703 d!78716))

(declare-fun d!78718 () Bool)

(declare-fun e!161140 () Bool)

(assert (=> d!78718 e!161140))

(declare-fun res!195582 () Bool)

(assert (=> d!78718 (=> (not res!195582) (not e!161140))))

(declare-fun lt!369625 () (_ BitVec 64))

(declare-fun lt!369624 () (_ BitVec 64))

(declare-fun lt!369623 () (_ BitVec 64))

(assert (=> d!78718 (= res!195582 (= lt!369625 (bvsub lt!369623 lt!369624)))))

(assert (=> d!78718 (or (= (bvand lt!369623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369623 lt!369624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78718 (= lt!369624 (remainingBits!0 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))) ((_ sign_extend 32) (currentByte!10877 b2!99)) ((_ sign_extend 32) (currentBit!10872 b2!99))))))

(declare-fun lt!369627 () (_ BitVec 64))

(declare-fun lt!369626 () (_ BitVec 64))

(assert (=> d!78718 (= lt!369623 (bvmul lt!369627 lt!369626))))

(assert (=> d!78718 (or (= lt!369627 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369626 (bvsdiv (bvmul lt!369627 lt!369626) lt!369627)))))

(assert (=> d!78718 (= lt!369626 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78718 (= lt!369627 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))))))

(assert (=> d!78718 (= lt!369625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10877 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10872 b2!99))))))

(assert (=> d!78718 (invariant!0 (currentBit!10872 b2!99) (currentByte!10877 b2!99) (size!5302 (buf!5843 b2!99)))))

(assert (=> d!78718 (= (bitIndex!0 (size!5302 (buf!5843 b2!99)) (currentByte!10877 b2!99) (currentBit!10872 b2!99)) lt!369625)))

(declare-fun b!233798 () Bool)

(declare-fun res!195583 () Bool)

(assert (=> b!233798 (=> (not res!195583) (not e!161140))))

(assert (=> b!233798 (= res!195583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369625))))

(declare-fun b!233799 () Bool)

(declare-fun lt!369622 () (_ BitVec 64))

(assert (=> b!233799 (= e!161140 (bvsle lt!369625 (bvmul lt!369622 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233799 (or (= lt!369622 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369622 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369622)))))

(assert (=> b!233799 (= lt!369622 ((_ sign_extend 32) (size!5302 (buf!5843 b2!99))))))

(assert (= (and d!78718 res!195582) b!233798))

(assert (= (and b!233798 res!195583) b!233799))

(assert (=> d!78718 m!356261))

(assert (=> d!78718 m!356265))

(assert (=> b!233710 d!78718))

(push 1)

(assert (not d!78714))

(assert (not d!78704))

(assert (not d!78712))

(assert (not d!78706))

(assert (not d!78718))

(assert (not d!78710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

