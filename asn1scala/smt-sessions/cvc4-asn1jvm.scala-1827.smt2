; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49108 () Bool)

(assert start!49108)

(declare-fun b!233305 () Bool)

(declare-fun e!160744 () Bool)

(declare-fun e!160748 () Bool)

(assert (=> b!233305 (= e!160744 e!160748)))

(declare-fun res!195183 () Bool)

(assert (=> b!233305 (=> (not res!195183) (not e!160748))))

(declare-fun lt!369252 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233305 (= res!195183 (bvsle lt!369252 bytes!19))))

(declare-fun lt!369254 () (_ BitVec 64))

(assert (=> b!233305 (= lt!369252 ((_ extract 31 0) lt!369254))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233305 (= lt!369254 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!195185 () Bool)

(declare-fun e!160746 () Bool)

(assert (=> start!49108 (=> (not res!195185) (not e!160746))))

(declare-datatypes ((array!12050 0))(
  ( (array!12051 (arr!6276 (Array (_ BitVec 32) (_ BitVec 8))) (size!5289 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9674 0))(
  ( (BitStream!9675 (buf!5830 array!12050) (currentByte!10846 (_ BitVec 32)) (currentBit!10841 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9674)

(declare-fun b2!99 () BitStream!9674)

(assert (=> start!49108 (= res!195185 (and (= (size!5289 (buf!5830 b1!101)) (size!5289 (buf!5830 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49108 e!160746))

(declare-fun e!160743 () Bool)

(declare-fun inv!12 (BitStream!9674) Bool)

(assert (=> start!49108 (and (inv!12 b1!101) e!160743)))

(declare-fun e!160742 () Bool)

(assert (=> start!49108 (and (inv!12 b2!99) e!160742)))

(assert (=> start!49108 true))

(declare-fun lt!369255 () (_ BitVec 64))

(declare-fun lt!369253 () (_ BitVec 64))

(declare-fun b!233306 () Bool)

(assert (=> b!233306 (= e!160748 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101)))) lt!369253) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14408 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10846 b2!99))) ((_ sign_extend 32) (currentBit!10841 b2!99))))) (and (= lt!369255 bdg!14408) (= (bvsub lt!369255 bits!86) lt!369253) (let ((bdg!14409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5289 (buf!5830 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14409 (bvsub bdg!14408 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14409 bdg!14408) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369254)) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369252 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand (bvsub bytes!19 lt!369252) #b10000000000000000000000000000000)))))))))))

(assert (=> b!233306 (= lt!369253 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10846 b1!101))) ((_ sign_extend 32) (currentBit!10841 b1!101))))))

(declare-fun b!233307 () Bool)

(assert (=> b!233307 (= e!160746 e!160744)))

(declare-fun res!195186 () Bool)

(assert (=> b!233307 (=> (not res!195186) (not e!160744))))

(assert (=> b!233307 (= res!195186 (bvsle bits!86 lt!369255))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233307 (= lt!369255 (bitIndex!0 (size!5289 (buf!5830 b2!99)) (currentByte!10846 b2!99) (currentBit!10841 b2!99)))))

(declare-fun b!233308 () Bool)

(declare-fun res!195181 () Bool)

(assert (=> b!233308 (=> (not res!195181) (not e!160748))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233308 (= res!195181 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233309 () Bool)

(declare-fun res!195184 () Bool)

(assert (=> b!233309 (=> (not res!195184) (not e!160748))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233309 (= res!195184 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101)) bytes!19))))

(declare-fun b!233310 () Bool)

(declare-fun array_inv!5030 (array!12050) Bool)

(assert (=> b!233310 (= e!160742 (array_inv!5030 (buf!5830 b2!99)))))

(declare-fun b!233311 () Bool)

(declare-fun res!195182 () Bool)

(assert (=> b!233311 (=> (not res!195182) (not e!160748))))

(assert (=> b!233311 (= res!195182 (= lt!369255 (bvadd (bitIndex!0 (size!5289 (buf!5830 b1!101)) (currentByte!10846 b1!101) (currentBit!10841 b1!101)) bits!86)))))

(declare-fun b!233312 () Bool)

(assert (=> b!233312 (= e!160743 (array_inv!5030 (buf!5830 b1!101)))))

(assert (= (and start!49108 res!195185) b!233307))

(assert (= (and b!233307 res!195186) b!233305))

(assert (= (and b!233305 res!195183) b!233309))

(assert (= (and b!233309 res!195184) b!233311))

(assert (= (and b!233311 res!195182) b!233308))

(assert (= (and b!233308 res!195181) b!233306))

(assert (= start!49108 b!233312))

(assert (= start!49108 b!233310))

(declare-fun m!355957 () Bool)

(assert (=> b!233311 m!355957))

(declare-fun m!355959 () Bool)

(assert (=> b!233307 m!355959))

(declare-fun m!355961 () Bool)

(assert (=> b!233309 m!355961))

(declare-fun m!355963 () Bool)

(assert (=> b!233312 m!355963))

(declare-fun m!355965 () Bool)

(assert (=> b!233308 m!355965))

(declare-fun m!355967 () Bool)

(assert (=> start!49108 m!355967))

(declare-fun m!355969 () Bool)

(assert (=> start!49108 m!355969))

(declare-fun m!355971 () Bool)

(assert (=> b!233310 m!355971))

(push 1)

(assert (not b!233311))

(assert (not b!233312))

(assert (not start!49108))

(assert (not b!233307))

(assert (not b!233310))

(assert (not b!233308))

(assert (not b!233309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78604 () Bool)

(assert (=> d!78604 (= (array_inv!5030 (buf!5830 b1!101)) (bvsge (size!5289 (buf!5830 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233312 d!78604))

(declare-fun d!78606 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78606 (= (inv!12 b1!101) (invariant!0 (currentBit!10841 b1!101) (currentByte!10846 b1!101) (size!5289 (buf!5830 b1!101))))))

(declare-fun bs!19363 () Bool)

(assert (= bs!19363 d!78606))

(declare-fun m!355985 () Bool)

(assert (=> bs!19363 m!355985))

(assert (=> start!49108 d!78606))

(declare-fun d!78608 () Bool)

(assert (=> d!78608 (= (inv!12 b2!99) (invariant!0 (currentBit!10841 b2!99) (currentByte!10846 b2!99) (size!5289 (buf!5830 b2!99))))))

(declare-fun bs!19364 () Bool)

(assert (= bs!19364 d!78608))

(declare-fun m!355987 () Bool)

(assert (=> bs!19364 m!355987))

(assert (=> start!49108 d!78608))

(declare-fun d!78610 () Bool)

(declare-fun e!160759 () Bool)

(assert (=> d!78610 e!160759))

(declare-fun res!195208 () Bool)

(assert (=> d!78610 (=> (not res!195208) (not e!160759))))

(declare-fun lt!369319 () (_ BitVec 64))

(declare-fun lt!369321 () (_ BitVec 64))

(declare-fun lt!369318 () (_ BitVec 64))

(assert (=> d!78610 (= res!195208 (= lt!369318 (bvsub lt!369319 lt!369321)))))

(assert (=> d!78610 (or (= (bvand lt!369319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369319 lt!369321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78610 (= lt!369321 (remainingBits!0 ((_ sign_extend 32) (size!5289 (buf!5830 b2!99))) ((_ sign_extend 32) (currentByte!10846 b2!99)) ((_ sign_extend 32) (currentBit!10841 b2!99))))))

(declare-fun lt!369317 () (_ BitVec 64))

(declare-fun lt!369316 () (_ BitVec 64))

(assert (=> d!78610 (= lt!369319 (bvmul lt!369317 lt!369316))))

(assert (=> d!78610 (or (= lt!369317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369316 (bvsdiv (bvmul lt!369317 lt!369316) lt!369317)))))

(assert (=> d!78610 (= lt!369316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78610 (= lt!369317 ((_ sign_extend 32) (size!5289 (buf!5830 b2!99))))))

(assert (=> d!78610 (= lt!369318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10846 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10841 b2!99))))))

(assert (=> d!78610 (invariant!0 (currentBit!10841 b2!99) (currentByte!10846 b2!99) (size!5289 (buf!5830 b2!99)))))

(assert (=> d!78610 (= (bitIndex!0 (size!5289 (buf!5830 b2!99)) (currentByte!10846 b2!99) (currentBit!10841 b2!99)) lt!369318)))

(declare-fun b!233333 () Bool)

(declare-fun res!195207 () Bool)

(assert (=> b!233333 (=> (not res!195207) (not e!160759))))

(assert (=> b!233333 (= res!195207 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369318))))

(declare-fun b!233334 () Bool)

(declare-fun lt!369320 () (_ BitVec 64))

(assert (=> b!233334 (= e!160759 (bvsle lt!369318 (bvmul lt!369320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233334 (or (= lt!369320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369320)))))

(assert (=> b!233334 (= lt!369320 ((_ sign_extend 32) (size!5289 (buf!5830 b2!99))))))

(assert (= (and d!78610 res!195208) b!233333))

(assert (= (and b!233333 res!195207) b!233334))

(declare-fun m!355989 () Bool)

(assert (=> d!78610 m!355989))

(assert (=> d!78610 m!355987))

(assert (=> b!233307 d!78610))

(declare-fun d!78612 () Bool)

(declare-fun e!160760 () Bool)

(assert (=> d!78612 e!160760))

(declare-fun res!195210 () Bool)

(assert (=> d!78612 (=> (not res!195210) (not e!160760))))

(declare-fun lt!369327 () (_ BitVec 64))

(declare-fun lt!369325 () (_ BitVec 64))

(declare-fun lt!369324 () (_ BitVec 64))

(assert (=> d!78612 (= res!195210 (= lt!369324 (bvsub lt!369325 lt!369327)))))

(assert (=> d!78612 (or (= (bvand lt!369325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369325 lt!369327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78612 (= lt!369327 (remainingBits!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101))))))

(declare-fun lt!369323 () (_ BitVec 64))

(declare-fun lt!369322 () (_ BitVec 64))

(assert (=> d!78612 (= lt!369325 (bvmul lt!369323 lt!369322))))

(assert (=> d!78612 (or (= lt!369323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369322 (bvsdiv (bvmul lt!369323 lt!369322) lt!369323)))))

(assert (=> d!78612 (= lt!369322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78612 (= lt!369323 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))))))

(assert (=> d!78612 (= lt!369324 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10846 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10841 b1!101))))))

(assert (=> d!78612 (invariant!0 (currentBit!10841 b1!101) (currentByte!10846 b1!101) (size!5289 (buf!5830 b1!101)))))

(assert (=> d!78612 (= (bitIndex!0 (size!5289 (buf!5830 b1!101)) (currentByte!10846 b1!101) (currentBit!10841 b1!101)) lt!369324)))

(declare-fun b!233335 () Bool)

(declare-fun res!195209 () Bool)

(assert (=> b!233335 (=> (not res!195209) (not e!160760))))

(assert (=> b!233335 (= res!195209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369324))))

(declare-fun b!233336 () Bool)

(declare-fun lt!369326 () (_ BitVec 64))

(assert (=> b!233336 (= e!160760 (bvsle lt!369324 (bvmul lt!369326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233336 (or (= lt!369326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369326)))))

(assert (=> b!233336 (= lt!369326 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))))))

(assert (= (and d!78612 res!195210) b!233335))

(assert (= (and b!233335 res!195209) b!233336))

(assert (=> d!78612 m!355965))

(assert (=> d!78612 m!355985))

(assert (=> b!233311 d!78612))

(declare-fun d!78614 () Bool)

(assert (=> d!78614 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19365 () Bool)

(assert (= bs!19365 d!78614))

(assert (=> bs!19365 m!355965))

(assert (=> b!233309 d!78614))

(declare-fun d!78616 () Bool)

(assert (=> d!78616 (= (array_inv!5030 (buf!5830 b2!99)) (bvsge (size!5289 (buf!5830 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233310 d!78616))

(declare-fun d!78618 () Bool)

(assert (=> d!78618 (= (remainingBits!0 ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) ((_ sign_extend 32) (currentByte!10846 b1!101)) ((_ sign_extend 32) (currentBit!10841 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5289 (buf!5830 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10846 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10841 b1!101)))))))

(assert (=> b!233308 d!78618))

(push 1)

(assert (not d!78614))

(assert (not d!78612))

(assert (not d!78608))

(assert (not d!78610))

(assert (not d!78606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

