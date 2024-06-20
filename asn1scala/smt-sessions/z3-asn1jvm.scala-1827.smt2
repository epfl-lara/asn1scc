; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49106 () Bool)

(assert start!49106)

(declare-fun b!233281 () Bool)

(declare-fun res!195163 () Bool)

(declare-fun e!160725 () Bool)

(assert (=> b!233281 (=> (not res!195163) (not e!160725))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!12048 0))(
  ( (array!12049 (arr!6275 (Array (_ BitVec 32) (_ BitVec 8))) (size!5288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9672 0))(
  ( (BitStream!9673 (buf!5829 array!12048) (currentByte!10845 (_ BitVec 32)) (currentBit!10840 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9672)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233281 (= res!195163 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233282 () Bool)

(declare-fun e!160723 () Bool)

(declare-fun array_inv!5029 (array!12048) Bool)

(assert (=> b!233282 (= e!160723 (array_inv!5029 (buf!5829 b1!101)))))

(declare-fun b!233283 () Bool)

(declare-fun res!195164 () Bool)

(assert (=> b!233283 (=> (not res!195164) (not e!160725))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369243 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233283 (= res!195164 (= lt!369243 (bvadd (bitIndex!0 (size!5288 (buf!5829 b1!101)) (currentByte!10845 b1!101) (currentBit!10840 b1!101)) bits!86)))))

(declare-fun b!233284 () Bool)

(declare-fun e!160722 () Bool)

(declare-fun e!160727 () Bool)

(assert (=> b!233284 (= e!160722 e!160727)))

(declare-fun res!195166 () Bool)

(assert (=> b!233284 (=> (not res!195166) (not e!160727))))

(assert (=> b!233284 (= res!195166 (bvsle bits!86 lt!369243))))

(declare-fun b2!99 () BitStream!9672)

(assert (=> b!233284 (= lt!369243 (bitIndex!0 (size!5288 (buf!5829 b2!99)) (currentByte!10845 b2!99) (currentBit!10840 b2!99)))))

(declare-fun lt!369241 () (_ BitVec 64))

(declare-fun lt!369242 () (_ BitVec 32))

(declare-fun b!233285 () Bool)

(declare-fun lt!369240 () (_ BitVec 64))

(assert (=> b!233285 (= e!160725 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101)))) lt!369241) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14408 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10845 b2!99))) ((_ sign_extend 32) (currentBit!10840 b2!99))))) (and (= lt!369243 bdg!14408) (= (bvsub lt!369243 bits!86) lt!369241) (let ((bdg!14409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5288 (buf!5829 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14409 (bvsub bdg!14408 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14409 bdg!14408) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369240)) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369242 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand (bvsub bytes!19 lt!369242) #b10000000000000000000000000000000)))))))))))

(assert (=> b!233285 (= lt!369241 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10845 b1!101))) ((_ sign_extend 32) (currentBit!10840 b1!101))))))

(declare-fun res!195165 () Bool)

(assert (=> start!49106 (=> (not res!195165) (not e!160722))))

(assert (=> start!49106 (= res!195165 (and (= (size!5288 (buf!5829 b1!101)) (size!5288 (buf!5829 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49106 e!160722))

(declare-fun inv!12 (BitStream!9672) Bool)

(assert (=> start!49106 (and (inv!12 b1!101) e!160723)))

(declare-fun e!160724 () Bool)

(assert (=> start!49106 (and (inv!12 b2!99) e!160724)))

(assert (=> start!49106 true))

(declare-fun b!233286 () Bool)

(assert (=> b!233286 (= e!160727 e!160725)))

(declare-fun res!195167 () Bool)

(assert (=> b!233286 (=> (not res!195167) (not e!160725))))

(assert (=> b!233286 (= res!195167 (bvsle lt!369242 bytes!19))))

(assert (=> b!233286 (= lt!369242 ((_ extract 31 0) lt!369240))))

(assert (=> b!233286 (= lt!369240 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233287 () Bool)

(declare-fun res!195168 () Bool)

(assert (=> b!233287 (=> (not res!195168) (not e!160725))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233287 (= res!195168 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101)) bytes!19))))

(declare-fun b!233288 () Bool)

(assert (=> b!233288 (= e!160724 (array_inv!5029 (buf!5829 b2!99)))))

(assert (= (and start!49106 res!195165) b!233284))

(assert (= (and b!233284 res!195166) b!233286))

(assert (= (and b!233286 res!195167) b!233287))

(assert (= (and b!233287 res!195168) b!233283))

(assert (= (and b!233283 res!195164) b!233281))

(assert (= (and b!233281 res!195163) b!233285))

(assert (= start!49106 b!233282))

(assert (= start!49106 b!233288))

(declare-fun m!355941 () Bool)

(assert (=> b!233281 m!355941))

(declare-fun m!355943 () Bool)

(assert (=> b!233283 m!355943))

(declare-fun m!355945 () Bool)

(assert (=> b!233284 m!355945))

(declare-fun m!355947 () Bool)

(assert (=> start!49106 m!355947))

(declare-fun m!355949 () Bool)

(assert (=> start!49106 m!355949))

(declare-fun m!355951 () Bool)

(assert (=> b!233287 m!355951))

(declare-fun m!355953 () Bool)

(assert (=> b!233282 m!355953))

(declare-fun m!355955 () Bool)

(assert (=> b!233288 m!355955))

(check-sat (not b!233281) (not b!233284) (not b!233282) (not start!49106) (not b!233287) (not b!233288) (not b!233283))
(check-sat)
(get-model)

(declare-fun d!78572 () Bool)

(declare-fun e!160751 () Bool)

(assert (=> d!78572 e!160751))

(declare-fun res!195192 () Bool)

(assert (=> d!78572 (=> (not res!195192) (not e!160751))))

(declare-fun lt!369269 () (_ BitVec 64))

(declare-fun lt!369271 () (_ BitVec 64))

(declare-fun lt!369272 () (_ BitVec 64))

(assert (=> d!78572 (= res!195192 (= lt!369271 (bvsub lt!369269 lt!369272)))))

(assert (=> d!78572 (or (= (bvand lt!369269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369272 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369269 lt!369272) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78572 (= lt!369272 (remainingBits!0 ((_ sign_extend 32) (size!5288 (buf!5829 b2!99))) ((_ sign_extend 32) (currentByte!10845 b2!99)) ((_ sign_extend 32) (currentBit!10840 b2!99))))))

(declare-fun lt!369268 () (_ BitVec 64))

(declare-fun lt!369270 () (_ BitVec 64))

(assert (=> d!78572 (= lt!369269 (bvmul lt!369268 lt!369270))))

(assert (=> d!78572 (or (= lt!369268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369270 (bvsdiv (bvmul lt!369268 lt!369270) lt!369268)))))

(assert (=> d!78572 (= lt!369270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78572 (= lt!369268 ((_ sign_extend 32) (size!5288 (buf!5829 b2!99))))))

(assert (=> d!78572 (= lt!369271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10845 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10840 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78572 (invariant!0 (currentBit!10840 b2!99) (currentByte!10845 b2!99) (size!5288 (buf!5829 b2!99)))))

(assert (=> d!78572 (= (bitIndex!0 (size!5288 (buf!5829 b2!99)) (currentByte!10845 b2!99) (currentBit!10840 b2!99)) lt!369271)))

(declare-fun b!233317 () Bool)

(declare-fun res!195191 () Bool)

(assert (=> b!233317 (=> (not res!195191) (not e!160751))))

(assert (=> b!233317 (= res!195191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369271))))

(declare-fun b!233318 () Bool)

(declare-fun lt!369273 () (_ BitVec 64))

(assert (=> b!233318 (= e!160751 (bvsle lt!369271 (bvmul lt!369273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233318 (or (= lt!369273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369273)))))

(assert (=> b!233318 (= lt!369273 ((_ sign_extend 32) (size!5288 (buf!5829 b2!99))))))

(assert (= (and d!78572 res!195192) b!233317))

(assert (= (and b!233317 res!195191) b!233318))

(declare-fun m!355973 () Bool)

(assert (=> d!78572 m!355973))

(declare-fun m!355975 () Bool)

(assert (=> d!78572 m!355975))

(assert (=> b!233284 d!78572))

(declare-fun d!78574 () Bool)

(declare-fun e!160752 () Bool)

(assert (=> d!78574 e!160752))

(declare-fun res!195194 () Bool)

(assert (=> d!78574 (=> (not res!195194) (not e!160752))))

(declare-fun lt!369277 () (_ BitVec 64))

(declare-fun lt!369278 () (_ BitVec 64))

(declare-fun lt!369275 () (_ BitVec 64))

(assert (=> d!78574 (= res!195194 (= lt!369277 (bvsub lt!369275 lt!369278)))))

(assert (=> d!78574 (or (= (bvand lt!369275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369275 lt!369278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78574 (= lt!369278 (remainingBits!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101))))))

(declare-fun lt!369274 () (_ BitVec 64))

(declare-fun lt!369276 () (_ BitVec 64))

(assert (=> d!78574 (= lt!369275 (bvmul lt!369274 lt!369276))))

(assert (=> d!78574 (or (= lt!369274 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369276 (bvsdiv (bvmul lt!369274 lt!369276) lt!369274)))))

(assert (=> d!78574 (= lt!369276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78574 (= lt!369274 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))))))

(assert (=> d!78574 (= lt!369277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10845 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10840 b1!101))))))

(assert (=> d!78574 (invariant!0 (currentBit!10840 b1!101) (currentByte!10845 b1!101) (size!5288 (buf!5829 b1!101)))))

(assert (=> d!78574 (= (bitIndex!0 (size!5288 (buf!5829 b1!101)) (currentByte!10845 b1!101) (currentBit!10840 b1!101)) lt!369277)))

(declare-fun b!233319 () Bool)

(declare-fun res!195193 () Bool)

(assert (=> b!233319 (=> (not res!195193) (not e!160752))))

(assert (=> b!233319 (= res!195193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369277))))

(declare-fun b!233320 () Bool)

(declare-fun lt!369279 () (_ BitVec 64))

(assert (=> b!233320 (= e!160752 (bvsle lt!369277 (bvmul lt!369279 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233320 (or (= lt!369279 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369279 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369279)))))

(assert (=> b!233320 (= lt!369279 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))))))

(assert (= (and d!78574 res!195194) b!233319))

(assert (= (and b!233319 res!195193) b!233320))

(assert (=> d!78574 m!355941))

(declare-fun m!355977 () Bool)

(assert (=> d!78574 m!355977))

(assert (=> b!233283 d!78574))

(declare-fun d!78576 () Bool)

(assert (=> d!78576 (= (array_inv!5029 (buf!5829 b2!99)) (bvsge (size!5288 (buf!5829 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233288 d!78576))

(declare-fun d!78578 () Bool)

(assert (=> d!78578 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19357 () Bool)

(assert (= bs!19357 d!78578))

(assert (=> bs!19357 m!355941))

(assert (=> b!233287 d!78578))

(declare-fun d!78580 () Bool)

(assert (=> d!78580 (= (inv!12 b1!101) (invariant!0 (currentBit!10840 b1!101) (currentByte!10845 b1!101) (size!5288 (buf!5829 b1!101))))))

(declare-fun bs!19358 () Bool)

(assert (= bs!19358 d!78580))

(assert (=> bs!19358 m!355977))

(assert (=> start!49106 d!78580))

(declare-fun d!78582 () Bool)

(assert (=> d!78582 (= (inv!12 b2!99) (invariant!0 (currentBit!10840 b2!99) (currentByte!10845 b2!99) (size!5288 (buf!5829 b2!99))))))

(declare-fun bs!19359 () Bool)

(assert (= bs!19359 d!78582))

(assert (=> bs!19359 m!355975))

(assert (=> start!49106 d!78582))

(declare-fun d!78584 () Bool)

(assert (=> d!78584 (= (array_inv!5029 (buf!5829 b1!101)) (bvsge (size!5288 (buf!5829 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233282 d!78584))

(declare-fun d!78586 () Bool)

(assert (=> d!78586 (= (remainingBits!0 ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) ((_ sign_extend 32) (currentByte!10845 b1!101)) ((_ sign_extend 32) (currentBit!10840 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5288 (buf!5829 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10845 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10840 b1!101)))))))

(assert (=> b!233281 d!78586))

(check-sat (not d!78580) (not d!78572) (not d!78578) (not d!78582) (not d!78574))
