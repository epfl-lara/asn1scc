; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56302 () Bool)

(assert start!56302)

(declare-fun res!218133 () Bool)

(declare-fun e!181072 () Bool)

(assert (=> start!56302 (=> (not res!218133) (not e!181072))))

(declare-datatypes ((array!14334 0))(
  ( (array!14335 (arr!7255 (Array (_ BitVec 32) (_ BitVec 8))) (size!6268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11458 0))(
  ( (BitStream!11459 (buf!6790 array!14334) (currentByte!12493 (_ BitVec 32)) (currentBit!12488 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11458)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56302 (= res!218133 (validate_offset_bit!0 ((_ sign_extend 32) (size!6268 (buf!6790 thiss!914))) ((_ sign_extend 32) (currentByte!12493 thiss!914)) ((_ sign_extend 32) (currentBit!12488 thiss!914))))))

(assert (=> start!56302 e!181072))

(declare-fun e!181075 () Bool)

(declare-fun inv!12 (BitStream!11458) Bool)

(assert (=> start!56302 (and (inv!12 thiss!914) e!181075)))

(assert (=> start!56302 true))

(declare-fun b!260582 () Bool)

(declare-fun e!181073 () Bool)

(assert (=> b!260582 (= e!181072 (not e!181073))))

(declare-fun res!218134 () Bool)

(assert (=> b!260582 (=> res!218134 e!181073)))

(declare-datatypes ((Unit!18519 0))(
  ( (Unit!18520) )
))
(declare-datatypes ((tuple2!22334 0))(
  ( (tuple2!22335 (_1!12103 Unit!18519) (_2!12103 BitStream!11458)) )
))
(declare-fun lt!402696 () tuple2!22334)

(assert (=> b!260582 (= res!218134 (not (= (size!6268 (buf!6790 thiss!914)) (size!6268 (buf!6790 (_2!12103 lt!402696))))))))

(declare-fun lt!402697 () tuple2!22334)

(declare-fun increaseBitIndex!0 (BitStream!11458) tuple2!22334)

(assert (=> b!260582 (= lt!402696 (increaseBitIndex!0 (_2!12103 lt!402697)))))

(declare-fun arrayRangesEq!935 (array!14334 array!14334 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260582 (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697)))))

(declare-fun lt!402698 () Unit!18519)

(declare-fun arrayUpdatedAtPrefixLemma!451 (array!14334 (_ BitVec 32) (_ BitVec 8)) Unit!18519)

(assert (=> b!260582 (= lt!402698 (arrayUpdatedAtPrefixLemma!451 (buf!6790 thiss!914) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18521 () Unit!18519)

(declare-fun Unit!18522 () Unit!18519)

(assert (=> b!260582 (= lt!402697 (ite b!187 (tuple2!22335 Unit!18521 (BitStream!11459 (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12488 thiss!914)))))) (size!6268 (buf!6790 thiss!914))) (currentByte!12493 thiss!914) (currentBit!12488 thiss!914))) (tuple2!22335 Unit!18522 (BitStream!11459 (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12488 thiss!914))))))) (size!6268 (buf!6790 thiss!914))) (currentByte!12493 thiss!914) (currentBit!12488 thiss!914)))))))

(declare-fun b!260583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260583 (= e!181073 (invariant!0 (currentBit!12488 (_2!12103 lt!402696)) (currentByte!12493 (_2!12103 lt!402696)) (size!6268 (buf!6790 (_2!12103 lt!402696)))))))

(declare-fun b!260584 () Bool)

(declare-fun array_inv!6009 (array!14334) Bool)

(assert (=> b!260584 (= e!181075 (array_inv!6009 (buf!6790 thiss!914)))))

(assert (= (and start!56302 res!218133) b!260582))

(assert (= (and b!260582 (not res!218134)) b!260583))

(assert (= start!56302 b!260584))

(declare-fun m!389961 () Bool)

(assert (=> start!56302 m!389961))

(declare-fun m!389963 () Bool)

(assert (=> start!56302 m!389963))

(declare-fun m!389965 () Bool)

(assert (=> b!260582 m!389965))

(declare-fun m!389967 () Bool)

(assert (=> b!260582 m!389967))

(declare-fun m!389969 () Bool)

(assert (=> b!260582 m!389969))

(declare-fun m!389971 () Bool)

(assert (=> b!260582 m!389971))

(declare-fun m!389973 () Bool)

(assert (=> b!260582 m!389973))

(assert (=> b!260582 m!389969))

(declare-fun m!389975 () Bool)

(assert (=> b!260582 m!389975))

(declare-fun m!389977 () Bool)

(assert (=> b!260582 m!389977))

(declare-fun m!389979 () Bool)

(assert (=> b!260582 m!389979))

(declare-fun m!389981 () Bool)

(assert (=> b!260582 m!389981))

(declare-fun m!389983 () Bool)

(assert (=> b!260583 m!389983))

(declare-fun m!389985 () Bool)

(assert (=> b!260584 m!389985))

(push 1)

(assert (not b!260582))

(assert (not b!260583))

(assert (not start!56302))

(assert (not b!260584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87520 () Bool)

(declare-fun e!181102 () Bool)

(assert (=> d!87520 e!181102))

(declare-fun res!218151 () Bool)

(assert (=> d!87520 (=> (not res!218151) (not e!181102))))

(declare-fun lt!402727 () (_ BitVec 64))

(declare-fun lt!402730 () tuple2!22334)

(declare-fun lt!402729 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87520 (= res!218151 (= (bvadd lt!402729 lt!402727) (bitIndex!0 (size!6268 (buf!6790 (_2!12103 lt!402730))) (currentByte!12493 (_2!12103 lt!402730)) (currentBit!12488 (_2!12103 lt!402730)))))))

(assert (=> d!87520 (or (not (= (bvand lt!402729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402727 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402729 lt!402727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87520 (= lt!402727 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87520 (= lt!402729 (bitIndex!0 (size!6268 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)) (currentBit!12488 (_2!12103 lt!402697))))))

(declare-fun Unit!18531 () Unit!18519)

(declare-fun Unit!18532 () Unit!18519)

(assert (=> d!87520 (= lt!402730 (ite (bvslt (currentBit!12488 (_2!12103 lt!402697)) #b00000000000000000000000000000111) (tuple2!22335 Unit!18531 (BitStream!11459 (buf!6790 (_2!12103 lt!402697)) (currentByte!12493 (_2!12103 lt!402697)) (bvadd (currentBit!12488 (_2!12103 lt!402697)) #b00000000000000000000000000000001))) (tuple2!22335 Unit!18532 (BitStream!11459 (buf!6790 (_2!12103 lt!402697)) (bvadd (currentByte!12493 (_2!12103 lt!402697)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87520 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87520 (= (increaseBitIndex!0 (_2!12103 lt!402697)) lt!402730)))

(declare-fun b!260607 () Bool)

(declare-fun res!218152 () Bool)

(assert (=> b!260607 (=> (not res!218152) (not e!181102))))

(declare-fun lt!402731 () (_ BitVec 64))

(declare-fun lt!402728 () (_ BitVec 64))

(assert (=> b!260607 (= res!218152 (= (bvsub lt!402731 lt!402728) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260607 (or (= (bvand lt!402731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402731 lt!402728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260607 (= lt!402728 (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402730))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402730)))))))

(assert (=> b!260607 (= lt!402731 (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697)))))))

(declare-fun b!260608 () Bool)

(assert (=> b!260608 (= e!181102 (= (size!6268 (buf!6790 (_2!12103 lt!402697))) (size!6268 (buf!6790 (_2!12103 lt!402730)))))))

(assert (= (and d!87520 res!218151) b!260607))

(assert (= (and b!260607 res!218152) b!260608))

(declare-fun m!390039 () Bool)

(assert (=> d!87520 m!390039))

(declare-fun m!390041 () Bool)

(assert (=> d!87520 m!390041))

(declare-fun m!390043 () Bool)

(assert (=> d!87520 m!390043))

(declare-fun m!390045 () Bool)

(assert (=> b!260607 m!390045))

(assert (=> b!260607 m!390043))

(assert (=> b!260582 d!87520))

(declare-fun d!87528 () Bool)

(declare-fun res!218159 () Bool)

(declare-fun e!181109 () Bool)

(assert (=> d!87528 (=> res!218159 e!181109)))

(assert (=> d!87528 (= res!218159 (= #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697))))))

(assert (=> d!87528 (= (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697))) e!181109)))

(declare-fun b!260615 () Bool)

(declare-fun e!181110 () Bool)

(assert (=> b!260615 (= e!181109 e!181110)))

(declare-fun res!218160 () Bool)

(assert (=> b!260615 (=> (not res!218160) (not e!181110))))

(assert (=> b!260615 (= res!218160 (= (select (arr!7255 (buf!6790 thiss!914)) #b00000000000000000000000000000000) (select (arr!7255 (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260616 () Bool)

(assert (=> b!260616 (= e!181110 (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12493 (_2!12103 lt!402697))))))

(assert (= (and d!87528 (not res!218159)) b!260615))

(assert (= (and b!260615 res!218160) b!260616))

(declare-fun m!390047 () Bool)

(assert (=> b!260615 m!390047))

(declare-fun m!390049 () Bool)

(assert (=> b!260615 m!390049))

(declare-fun m!390051 () Bool)

(assert (=> b!260616 m!390051))

(assert (=> b!260582 d!87528))

(declare-fun d!87530 () Bool)

(declare-fun e!181114 () Bool)

(assert (=> d!87530 e!181114))

(declare-fun res!218167 () Bool)

(assert (=> d!87530 (=> (not res!218167) (not e!181114))))

(assert (=> d!87530 (= res!218167 (and (bvsge (currentByte!12493 (_2!12103 lt!402697)) #b00000000000000000000000000000000) (bvslt (currentByte!12493 (_2!12103 lt!402697)) (size!6268 (buf!6790 thiss!914)))))))

(declare-fun lt!402749 () Unit!18519)

(declare-fun choose!345 (array!14334 (_ BitVec 32) (_ BitVec 8)) Unit!18519)

(assert (=> d!87530 (= lt!402749 (choose!345 (buf!6790 thiss!914) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))))))

(assert (=> d!87530 (and (bvsle #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697))) (bvslt (currentByte!12493 (_2!12103 lt!402697)) (size!6268 (buf!6790 thiss!914))))))

(assert (=> d!87530 (= (arrayUpdatedAtPrefixLemma!451 (buf!6790 thiss!914) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) lt!402749)))

(declare-fun b!260623 () Bool)

(assert (=> b!260623 (= e!181114 (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697))))))

(assert (= (and d!87530 res!218167) b!260623))

(assert (=> d!87530 m!389969))

(declare-fun m!390061 () Bool)

(assert (=> d!87530 m!390061))

(assert (=> b!260623 m!389975))

(assert (=> b!260623 m!389977))

(assert (=> b!260582 d!87530))

(declare-fun d!87534 () Bool)

(assert (=> d!87534 (= (invariant!0 (currentBit!12488 (_2!12103 lt!402696)) (currentByte!12493 (_2!12103 lt!402696)) (size!6268 (buf!6790 (_2!12103 lt!402696)))) (and (bvsge (currentBit!12488 (_2!12103 lt!402696)) #b00000000000000000000000000000000) (bvslt (currentBit!12488 (_2!12103 lt!402696)) #b00000000000000000000000000001000) (bvsge (currentByte!12493 (_2!12103 lt!402696)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12493 (_2!12103 lt!402696)) (size!6268 (buf!6790 (_2!12103 lt!402696)))) (and (= (currentBit!12488 (_2!12103 lt!402696)) #b00000000000000000000000000000000) (= (currentByte!12493 (_2!12103 lt!402696)) (size!6268 (buf!6790 (_2!12103 lt!402696))))))))))

(assert (=> b!260583 d!87534))

(declare-fun d!87538 () Bool)

(assert (=> d!87538 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6268 (buf!6790 thiss!914))) ((_ sign_extend 32) (currentByte!12493 thiss!914)) ((_ sign_extend 32) (currentBit!12488 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 thiss!914))) ((_ sign_extend 32) (currentByte!12493 thiss!914)) ((_ sign_extend 32) (currentBit!12488 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22187 () Bool)

(assert (= bs!22187 d!87538))

(declare-fun m!390069 () Bool)

(assert (=> bs!22187 m!390069))

(assert (=> start!56302 d!87538))

(declare-fun d!87540 () Bool)

(assert (=> d!87540 (= (inv!12 thiss!914) (invariant!0 (currentBit!12488 thiss!914) (currentByte!12493 thiss!914) (size!6268 (buf!6790 thiss!914))))))

(declare-fun bs!22188 () Bool)

(assert (= bs!22188 d!87540))

(declare-fun m!390071 () Bool)

(assert (=> bs!22188 m!390071))

(assert (=> start!56302 d!87540))

(declare-fun d!87542 () Bool)

(assert (=> d!87542 (= (array_inv!6009 (buf!6790 thiss!914)) (bvsge (size!6268 (buf!6790 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260584 d!87542))

(push 1)

(assert (not d!87530))

(assert (not d!87538))

(assert (not b!260607))

(assert (not d!87540))

(assert (not b!260623))

(assert (not d!87520))

(assert (not b!260616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87562 () Bool)

(assert (=> d!87562 (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) #b00000000000000000000000000000000 (currentByte!12493 (_2!12103 lt!402697)))))

(assert (=> d!87562 true))

(declare-fun _$8!220 () Unit!18519)

(assert (=> d!87562 (= (choose!345 (buf!6790 thiss!914) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) _$8!220)))

(declare-fun bs!22193 () Bool)

(assert (= bs!22193 d!87562))

(assert (=> bs!22193 m!389975))

(assert (=> bs!22193 m!389977))

(assert (=> d!87530 d!87562))

(declare-fun d!87564 () Bool)

(declare-fun res!218192 () Bool)

(declare-fun e!181136 () Bool)

(assert (=> d!87564 (=> res!218192 e!181136)))

(assert (=> d!87564 (= res!218192 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12493 (_2!12103 lt!402697))))))

(assert (=> d!87564 (= (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12493 (_2!12103 lt!402697))) e!181136)))

(declare-fun b!260648 () Bool)

(declare-fun e!181137 () Bool)

(assert (=> b!260648 (= e!181136 e!181137)))

(declare-fun res!218193 () Bool)

(assert (=> b!260648 (=> (not res!218193) (not e!181137))))

(assert (=> b!260648 (= res!218193 (= (select (arr!7255 (buf!6790 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7255 (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260649 () Bool)

(assert (=> b!260649 (= e!181137 (arrayRangesEq!935 (buf!6790 thiss!914) (array!14335 (store (arr!7255 (buf!6790 thiss!914)) (currentByte!12493 (_2!12103 lt!402697)) (select (arr!7255 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)))) (size!6268 (buf!6790 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12493 (_2!12103 lt!402697))))))

(assert (= (and d!87564 (not res!218192)) b!260648))

(assert (= (and b!260648 res!218193) b!260649))

(declare-fun m!390099 () Bool)

(assert (=> b!260648 m!390099))

(declare-fun m!390101 () Bool)

(assert (=> b!260648 m!390101))

(declare-fun m!390103 () Bool)

(assert (=> b!260649 m!390103))

(assert (=> b!260616 d!87564))

(declare-fun d!87566 () Bool)

(declare-fun e!181140 () Bool)

(assert (=> d!87566 e!181140))

(declare-fun res!218199 () Bool)

(assert (=> d!87566 (=> (not res!218199) (not e!181140))))

(declare-fun lt!402783 () (_ BitVec 64))

(declare-fun lt!402786 () (_ BitVec 64))

(declare-fun lt!402788 () (_ BitVec 64))

(assert (=> d!87566 (= res!218199 (= lt!402788 (bvsub lt!402786 lt!402783)))))

(assert (=> d!87566 (or (= (bvand lt!402786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402786 lt!402783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87566 (= lt!402783 (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402730))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402730)))))))

(declare-fun lt!402785 () (_ BitVec 64))

(declare-fun lt!402784 () (_ BitVec 64))

(assert (=> d!87566 (= lt!402786 (bvmul lt!402785 lt!402784))))

(assert (=> d!87566 (or (= lt!402785 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402784 (bvsdiv (bvmul lt!402785 lt!402784) lt!402785)))))

(assert (=> d!87566 (= lt!402784 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87566 (= lt!402785 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))))))

(assert (=> d!87566 (= lt!402788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402730)))))))

(assert (=> d!87566 (invariant!0 (currentBit!12488 (_2!12103 lt!402730)) (currentByte!12493 (_2!12103 lt!402730)) (size!6268 (buf!6790 (_2!12103 lt!402730))))))

(assert (=> d!87566 (= (bitIndex!0 (size!6268 (buf!6790 (_2!12103 lt!402730))) (currentByte!12493 (_2!12103 lt!402730)) (currentBit!12488 (_2!12103 lt!402730))) lt!402788)))

(declare-fun b!260654 () Bool)

(declare-fun res!218198 () Bool)

(assert (=> b!260654 (=> (not res!218198) (not e!181140))))

(assert (=> b!260654 (= res!218198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402788))))

(declare-fun b!260655 () Bool)

(declare-fun lt!402787 () (_ BitVec 64))

(assert (=> b!260655 (= e!181140 (bvsle lt!402788 (bvmul lt!402787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260655 (or (= lt!402787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402787)))))

(assert (=> b!260655 (= lt!402787 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))))))

(assert (= (and d!87566 res!218199) b!260654))

(assert (= (and b!260654 res!218198) b!260655))

(assert (=> d!87566 m!390045))

(declare-fun m!390105 () Bool)

(assert (=> d!87566 m!390105))

(assert (=> d!87520 d!87566))

(declare-fun d!87568 () Bool)

(declare-fun e!181141 () Bool)

(assert (=> d!87568 e!181141))

(declare-fun res!218201 () Bool)

(assert (=> d!87568 (=> (not res!218201) (not e!181141))))

(declare-fun lt!402794 () (_ BitVec 64))

(declare-fun lt!402792 () (_ BitVec 64))

(declare-fun lt!402789 () (_ BitVec 64))

(assert (=> d!87568 (= res!218201 (= lt!402794 (bvsub lt!402792 lt!402789)))))

(assert (=> d!87568 (or (= (bvand lt!402792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402792 lt!402789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87568 (= lt!402789 (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697)))))))

(declare-fun lt!402791 () (_ BitVec 64))

(declare-fun lt!402790 () (_ BitVec 64))

(assert (=> d!87568 (= lt!402792 (bvmul lt!402791 lt!402790))))

(assert (=> d!87568 (or (= lt!402791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402790 (bvsdiv (bvmul lt!402791 lt!402790) lt!402791)))))

(assert (=> d!87568 (= lt!402790 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87568 (= lt!402791 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))))))

(assert (=> d!87568 (= lt!402794 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697)))))))

(assert (=> d!87568 (invariant!0 (currentBit!12488 (_2!12103 lt!402697)) (currentByte!12493 (_2!12103 lt!402697)) (size!6268 (buf!6790 (_2!12103 lt!402697))))))

(assert (=> d!87568 (= (bitIndex!0 (size!6268 (buf!6790 (_2!12103 lt!402697))) (currentByte!12493 (_2!12103 lt!402697)) (currentBit!12488 (_2!12103 lt!402697))) lt!402794)))

(declare-fun b!260656 () Bool)

(declare-fun res!218200 () Bool)

(assert (=> b!260656 (=> (not res!218200) (not e!181141))))

(assert (=> b!260656 (= res!218200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402794))))

(declare-fun b!260657 () Bool)

(declare-fun lt!402793 () (_ BitVec 64))

(assert (=> b!260657 (= e!181141 (bvsle lt!402794 (bvmul lt!402793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260657 (or (= lt!402793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402793)))))

(assert (=> b!260657 (= lt!402793 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))))))

(assert (= (and d!87568 res!218201) b!260656))

(assert (= (and b!260656 res!218200) b!260657))

(assert (=> d!87568 m!390043))

(declare-fun m!390107 () Bool)

(assert (=> d!87568 m!390107))

(assert (=> d!87520 d!87568))

(declare-fun d!87570 () Bool)

(assert (=> d!87570 (= (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697)))) (bvsub (bvmul ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402697)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402697))))))))

(assert (=> d!87520 d!87570))

(declare-fun d!87572 () Bool)

(assert (=> d!87572 (= (invariant!0 (currentBit!12488 thiss!914) (currentByte!12493 thiss!914) (size!6268 (buf!6790 thiss!914))) (and (bvsge (currentBit!12488 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12488 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12493 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12493 thiss!914) (size!6268 (buf!6790 thiss!914))) (and (= (currentBit!12488 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12493 thiss!914) (size!6268 (buf!6790 thiss!914)))))))))

(assert (=> d!87540 d!87572))

(assert (=> b!260623 d!87528))

(declare-fun d!87574 () Bool)

(assert (=> d!87574 (= (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 thiss!914))) ((_ sign_extend 32) (currentByte!12493 thiss!914)) ((_ sign_extend 32) (currentBit!12488 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6268 (buf!6790 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12493 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12488 thiss!914)))))))

(assert (=> d!87538 d!87574))

(declare-fun d!87576 () Bool)

(assert (=> d!87576 (= (remainingBits!0 ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))) ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402730))) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402730)))) (bvsub (bvmul ((_ sign_extend 32) (size!6268 (buf!6790 (_2!12103 lt!402730)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12493 (_2!12103 lt!402730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12488 (_2!12103 lt!402730))))))))

(assert (=> b!260607 d!87576))

(assert (=> b!260607 d!87570))

(push 1)

(assert (not d!87562))

(assert (not b!260649))

(assert (not d!87568))

(assert (not d!87566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

