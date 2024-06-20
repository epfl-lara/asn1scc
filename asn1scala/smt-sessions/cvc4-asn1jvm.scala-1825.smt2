; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49066 () Bool)

(assert start!49066)

(declare-fun b!233137 () Bool)

(declare-fun e!160609 () Bool)

(declare-datatypes ((array!12035 0))(
  ( (array!12036 (arr!6270 (Array (_ BitVec 32) (_ BitVec 8))) (size!5283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9662 0))(
  ( (BitStream!9663 (buf!5824 array!12035) (currentByte!10831 (_ BitVec 32)) (currentBit!10826 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9662)

(declare-fun array_inv!5024 (array!12035) Bool)

(assert (=> b!233137 (= e!160609 (array_inv!5024 (buf!5824 b1!101)))))

(declare-fun b!233138 () Bool)

(declare-fun e!160610 () Bool)

(declare-fun e!160604 () Bool)

(assert (=> b!233138 (= e!160610 e!160604)))

(declare-fun res!195054 () Bool)

(assert (=> b!233138 (=> (not res!195054) (not e!160604))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369118 () (_ BitVec 64))

(assert (=> b!233138 (= res!195054 (bvsle bits!86 lt!369118))))

(declare-fun b2!99 () BitStream!9662)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233138 (= lt!369118 (bitIndex!0 (size!5283 (buf!5824 b2!99)) (currentByte!10831 b2!99) (currentBit!10826 b2!99)))))

(declare-fun b!233139 () Bool)

(declare-fun res!195051 () Bool)

(declare-fun e!160606 () Bool)

(assert (=> b!233139 (=> (not res!195051) (not e!160606))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233139 (= res!195051 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101)) bytes!19))))

(declare-fun b!233140 () Bool)

(assert (=> b!233140 (= e!160604 e!160606)))

(declare-fun res!195053 () Bool)

(assert (=> b!233140 (=> (not res!195053) (not e!160606))))

(declare-fun lt!369119 () (_ BitVec 64))

(assert (=> b!233140 (= res!195053 (bvsle ((_ extract 31 0) lt!369119) bytes!19))))

(assert (=> b!233140 (= lt!369119 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233141 () Bool)

(declare-fun e!160607 () Bool)

(assert (=> b!233141 (= e!160607 (array_inv!5024 (buf!5824 b2!99)))))

(declare-fun res!195050 () Bool)

(assert (=> start!49066 (=> (not res!195050) (not e!160610))))

(assert (=> start!49066 (= res!195050 (and (= (size!5283 (buf!5824 b1!101)) (size!5283 (buf!5824 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49066 e!160610))

(declare-fun inv!12 (BitStream!9662) Bool)

(assert (=> start!49066 (and (inv!12 b1!101) e!160609)))

(assert (=> start!49066 (and (inv!12 b2!99) e!160607)))

(assert (=> start!49066 true))

(declare-fun lt!369120 () (_ BitVec 64))

(declare-fun b!233142 () Bool)

(assert (=> b!233142 (= e!160606 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101)))) lt!369120) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14397 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10831 b2!99))) ((_ sign_extend 32) (currentBit!10826 b2!99))))) (and (= lt!369118 bdg!14397) (= (bvsub lt!369118 bits!86) lt!369120) (let ((bdg!14398 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5283 (buf!5824 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14398 (bvsub bdg!14397 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14398 bdg!14397) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369119)) (bvsge lt!369119 #b0000000000000000000000000000000010000000000000000000000000000000)))))))))

(assert (=> b!233142 (= lt!369120 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10831 b1!101))) ((_ sign_extend 32) (currentBit!10826 b1!101))))))

(declare-fun b!233143 () Bool)

(declare-fun res!195052 () Bool)

(assert (=> b!233143 (=> (not res!195052) (not e!160606))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233143 (= res!195052 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233144 () Bool)

(declare-fun res!195049 () Bool)

(assert (=> b!233144 (=> (not res!195049) (not e!160606))))

(assert (=> b!233144 (= res!195049 (= lt!369118 (bvadd (bitIndex!0 (size!5283 (buf!5824 b1!101)) (currentByte!10831 b1!101) (currentBit!10826 b1!101)) bits!86)))))

(assert (= (and start!49066 res!195050) b!233138))

(assert (= (and b!233138 res!195054) b!233140))

(assert (= (and b!233140 res!195053) b!233139))

(assert (= (and b!233139 res!195051) b!233144))

(assert (= (and b!233144 res!195049) b!233143))

(assert (= (and b!233143 res!195052) b!233142))

(assert (= start!49066 b!233137))

(assert (= start!49066 b!233141))

(declare-fun m!355843 () Bool)

(assert (=> b!233137 m!355843))

(declare-fun m!355845 () Bool)

(assert (=> start!49066 m!355845))

(declare-fun m!355847 () Bool)

(assert (=> start!49066 m!355847))

(declare-fun m!355849 () Bool)

(assert (=> b!233138 m!355849))

(declare-fun m!355851 () Bool)

(assert (=> b!233143 m!355851))

(declare-fun m!355853 () Bool)

(assert (=> b!233141 m!355853))

(declare-fun m!355855 () Bool)

(assert (=> b!233139 m!355855))

(declare-fun m!355857 () Bool)

(assert (=> b!233144 m!355857))

(push 1)

(assert (not b!233138))

(assert (not b!233139))

(assert (not start!49066))

(assert (not b!233143))

(assert (not b!233137))

(assert (not b!233141))

(assert (not b!233144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78552 () Bool)

(declare-fun e!160621 () Bool)

(assert (=> d!78552 e!160621))

(declare-fun res!195075 () Bool)

(assert (=> d!78552 (=> (not res!195075) (not e!160621))))

(declare-fun lt!369182 () (_ BitVec 64))

(declare-fun lt!369184 () (_ BitVec 64))

(declare-fun lt!369181 () (_ BitVec 64))

(assert (=> d!78552 (= res!195075 (= lt!369182 (bvsub lt!369181 lt!369184)))))

(assert (=> d!78552 (or (= (bvand lt!369181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369181 lt!369184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78552 (= lt!369184 (remainingBits!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101))))))

(declare-fun lt!369186 () (_ BitVec 64))

(declare-fun lt!369185 () (_ BitVec 64))

(assert (=> d!78552 (= lt!369181 (bvmul lt!369186 lt!369185))))

(assert (=> d!78552 (or (= lt!369186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369185 (bvsdiv (bvmul lt!369186 lt!369185) lt!369186)))))

(assert (=> d!78552 (= lt!369185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78552 (= lt!369186 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))))))

(assert (=> d!78552 (= lt!369182 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10831 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10826 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78552 (invariant!0 (currentBit!10826 b1!101) (currentByte!10831 b1!101) (size!5283 (buf!5824 b1!101)))))

(assert (=> d!78552 (= (bitIndex!0 (size!5283 (buf!5824 b1!101)) (currentByte!10831 b1!101) (currentBit!10826 b1!101)) lt!369182)))

(declare-fun b!233165 () Bool)

(declare-fun res!195076 () Bool)

(assert (=> b!233165 (=> (not res!195076) (not e!160621))))

(assert (=> b!233165 (= res!195076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369182))))

(declare-fun b!233166 () Bool)

(declare-fun lt!369183 () (_ BitVec 64))

(assert (=> b!233166 (= e!160621 (bvsle lt!369182 (bvmul lt!369183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233166 (or (= lt!369183 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369183 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369183)))))

(assert (=> b!233166 (= lt!369183 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))))))

(assert (= (and d!78552 res!195075) b!233165))

(assert (= (and b!233165 res!195076) b!233166))

(assert (=> d!78552 m!355851))

(declare-fun m!355871 () Bool)

(assert (=> d!78552 m!355871))

(assert (=> b!233144 d!78552))

(declare-fun d!78554 () Bool)

(assert (=> d!78554 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19348 () Bool)

(assert (= bs!19348 d!78554))

(assert (=> bs!19348 m!355851))

(assert (=> b!233139 d!78554))

(declare-fun d!78556 () Bool)

(declare-fun e!160622 () Bool)

(assert (=> d!78556 e!160622))

(declare-fun res!195077 () Bool)

(assert (=> d!78556 (=> (not res!195077) (not e!160622))))

(declare-fun lt!369190 () (_ BitVec 64))

(declare-fun lt!369187 () (_ BitVec 64))

(declare-fun lt!369188 () (_ BitVec 64))

(assert (=> d!78556 (= res!195077 (= lt!369188 (bvsub lt!369187 lt!369190)))))

(assert (=> d!78556 (or (= (bvand lt!369187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369187 lt!369190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78556 (= lt!369190 (remainingBits!0 ((_ sign_extend 32) (size!5283 (buf!5824 b2!99))) ((_ sign_extend 32) (currentByte!10831 b2!99)) ((_ sign_extend 32) (currentBit!10826 b2!99))))))

(declare-fun lt!369192 () (_ BitVec 64))

(declare-fun lt!369191 () (_ BitVec 64))

(assert (=> d!78556 (= lt!369187 (bvmul lt!369192 lt!369191))))

(assert (=> d!78556 (or (= lt!369192 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369191 (bvsdiv (bvmul lt!369192 lt!369191) lt!369192)))))

(assert (=> d!78556 (= lt!369191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78556 (= lt!369192 ((_ sign_extend 32) (size!5283 (buf!5824 b2!99))))))

(assert (=> d!78556 (= lt!369188 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10831 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10826 b2!99))))))

(assert (=> d!78556 (invariant!0 (currentBit!10826 b2!99) (currentByte!10831 b2!99) (size!5283 (buf!5824 b2!99)))))

(assert (=> d!78556 (= (bitIndex!0 (size!5283 (buf!5824 b2!99)) (currentByte!10831 b2!99) (currentBit!10826 b2!99)) lt!369188)))

(declare-fun b!233167 () Bool)

(declare-fun res!195078 () Bool)

(assert (=> b!233167 (=> (not res!195078) (not e!160622))))

(assert (=> b!233167 (= res!195078 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369188))))

(declare-fun b!233168 () Bool)

(declare-fun lt!369189 () (_ BitVec 64))

(assert (=> b!233168 (= e!160622 (bvsle lt!369188 (bvmul lt!369189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233168 (or (= lt!369189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369189)))))

(assert (=> b!233168 (= lt!369189 ((_ sign_extend 32) (size!5283 (buf!5824 b2!99))))))

(assert (= (and d!78556 res!195077) b!233167))

(assert (= (and b!233167 res!195078) b!233168))

(declare-fun m!355873 () Bool)

(assert (=> d!78556 m!355873))

(declare-fun m!355875 () Bool)

(assert (=> d!78556 m!355875))

(assert (=> b!233138 d!78556))

(declare-fun d!78558 () Bool)

(assert (=> d!78558 (= (remainingBits!0 ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) ((_ sign_extend 32) (currentByte!10831 b1!101)) ((_ sign_extend 32) (currentBit!10826 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5283 (buf!5824 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10831 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10826 b1!101)))))))

(assert (=> b!233143 d!78558))

(declare-fun d!78560 () Bool)

(assert (=> d!78560 (= (array_inv!5024 (buf!5824 b1!101)) (bvsge (size!5283 (buf!5824 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233137 d!78560))

(declare-fun d!78562 () Bool)

(assert (=> d!78562 (= (inv!12 b1!101) (invariant!0 (currentBit!10826 b1!101) (currentByte!10831 b1!101) (size!5283 (buf!5824 b1!101))))))

(declare-fun bs!19349 () Bool)

(assert (= bs!19349 d!78562))

(assert (=> bs!19349 m!355871))

(assert (=> start!49066 d!78562))

(declare-fun d!78564 () Bool)

(assert (=> d!78564 (= (inv!12 b2!99) (invariant!0 (currentBit!10826 b2!99) (currentByte!10831 b2!99) (size!5283 (buf!5824 b2!99))))))

(declare-fun bs!19350 () Bool)

(assert (= bs!19350 d!78564))

(assert (=> bs!19350 m!355875))

(assert (=> start!49066 d!78564))

(declare-fun d!78566 () Bool)

(assert (=> d!78566 (= (array_inv!5024 (buf!5824 b2!99)) (bvsge (size!5283 (buf!5824 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233141 d!78566))

(push 1)

(assert (not d!78564))

(assert (not d!78554))

(assert (not d!78556))

(assert (not d!78552))

(assert (not d!78562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

