; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18620 () Bool)

(assert start!18620)

(declare-fun b!92401 () Bool)

(declare-fun res!76279 () Bool)

(declare-fun e!60743 () Bool)

(assert (=> b!92401 (=> (not res!76279) (not e!60743))))

(declare-datatypes ((array!4325 0))(
  ( (array!4326 (arr!2581 (Array (_ BitVec 32) (_ BitVec 8))) (size!1956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3450 0))(
  ( (BitStream!3451 (buf!2334 array!4325) (currentByte!4653 (_ BitVec 32)) (currentBit!4648 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3450)

(assert (=> b!92401 (= res!76279 (and (bvsle ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4653 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4648 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4653 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4648 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92402 () Bool)

(declare-fun res!76274 () Bool)

(assert (=> b!92402 (=> (not res!76274) (not e!60743))))

(declare-fun bitStream2!8 () BitStream!3450)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92402 (= res!76274 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8))) (bitIndex!0 (size!1956 (buf!2334 bitStream2!8)) (currentByte!4653 bitStream2!8) (currentBit!4648 bitStream2!8))))))

(declare-fun b!92403 () Bool)

(declare-fun res!76276 () Bool)

(assert (=> b!92403 (=> (not res!76276) (not e!60743))))

(declare-fun base!8 () BitStream!3450)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!92403 (= res!76276 (bvslt (bitIndex!0 (size!1956 (buf!2334 base!8)) (currentByte!4653 base!8) (currentBit!4648 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92405 () Bool)

(declare-fun res!76272 () Bool)

(assert (=> b!92405 (=> (not res!76272) (not e!60743))))

(declare-datatypes ((List!831 0))(
  ( (Nil!828) (Cons!827 (h!946 Bool) (t!1581 List!831)) )
))
(declare-fun listBits!13 () List!831)

(declare-fun length!422 (List!831) Int)

(assert (=> b!92405 (= res!76272 (> (length!422 listBits!13) 0))))

(declare-fun b!92406 () Bool)

(declare-fun e!60745 () Bool)

(declare-fun array_inv!1790 (array!4325) Bool)

(assert (=> b!92406 (= e!60745 (array_inv!1790 (buf!2334 base!8)))))

(declare-fun b!92407 () Bool)

(declare-fun res!76278 () Bool)

(assert (=> b!92407 (=> (not res!76278) (not e!60743))))

(declare-fun isPrefixOf!0 (BitStream!3450 BitStream!3450) Bool)

(assert (=> b!92407 (= res!76278 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92408 () Bool)

(declare-fun res!76273 () Bool)

(assert (=> b!92408 (=> (not res!76273) (not e!60743))))

(assert (=> b!92408 (= res!76273 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92409 () Bool)

(declare-fun e!60742 () Bool)

(assert (=> b!92409 (= e!60742 (array_inv!1790 (buf!2334 bitStream2!8)))))

(declare-fun b!92410 () Bool)

(declare-fun e!60741 () Bool)

(assert (=> b!92410 (= e!60741 (array_inv!1790 (buf!2334 bitStream1!8)))))

(declare-fun b!92411 () Bool)

(declare-fun res!76280 () Bool)

(assert (=> b!92411 (=> (not res!76280) (not e!60743))))

(assert (=> b!92411 (= res!76280 (and (= (buf!2334 bitStream1!8) (buf!2334 bitStream2!8)) (= (buf!2334 bitStream1!8) (buf!2334 base!8))))))

(declare-fun b!92412 () Bool)

(declare-fun res!76277 () Bool)

(assert (=> b!92412 (=> (not res!76277) (not e!60743))))

(assert (=> b!92412 (= res!76277 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92404 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92404 (= e!60743 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4653 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8)))))))))

(declare-fun res!76275 () Bool)

(assert (=> start!18620 (=> (not res!76275) (not e!60743))))

(assert (=> start!18620 (= res!76275 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18620 e!60743))

(assert (=> start!18620 true))

(declare-fun inv!12 (BitStream!3450) Bool)

(assert (=> start!18620 (and (inv!12 bitStream1!8) e!60741)))

(assert (=> start!18620 (and (inv!12 bitStream2!8) e!60742)))

(assert (=> start!18620 (and (inv!12 base!8) e!60745)))

(assert (= (and start!18620 res!76275) b!92405))

(assert (= (and b!92405 res!76272) b!92408))

(assert (= (and b!92408 res!76273) b!92407))

(assert (= (and b!92407 res!76278) b!92412))

(assert (= (and b!92412 res!76277) b!92411))

(assert (= (and b!92411 res!76280) b!92403))

(assert (= (and b!92403 res!76276) b!92402))

(assert (= (and b!92402 res!76274) b!92401))

(assert (= (and b!92401 res!76279) b!92404))

(assert (= start!18620 b!92410))

(assert (= start!18620 b!92409))

(assert (= start!18620 b!92406))

(declare-fun m!136389 () Bool)

(assert (=> b!92404 m!136389))

(declare-fun m!136391 () Bool)

(assert (=> b!92406 m!136391))

(declare-fun m!136393 () Bool)

(assert (=> b!92403 m!136393))

(declare-fun m!136395 () Bool)

(assert (=> b!92410 m!136395))

(declare-fun m!136397 () Bool)

(assert (=> b!92408 m!136397))

(declare-fun m!136399 () Bool)

(assert (=> start!18620 m!136399))

(declare-fun m!136401 () Bool)

(assert (=> start!18620 m!136401))

(declare-fun m!136403 () Bool)

(assert (=> start!18620 m!136403))

(declare-fun m!136405 () Bool)

(assert (=> b!92407 m!136405))

(declare-fun m!136407 () Bool)

(assert (=> b!92409 m!136407))

(declare-fun m!136409 () Bool)

(assert (=> b!92405 m!136409))

(declare-fun m!136411 () Bool)

(assert (=> b!92402 m!136411))

(declare-fun m!136413 () Bool)

(assert (=> b!92402 m!136413))

(declare-fun m!136415 () Bool)

(assert (=> b!92412 m!136415))

(check-sat (not b!92412) (not b!92409) (not b!92410) (not b!92405) (not b!92404) (not b!92406) (not b!92402) (not b!92403) (not start!18620) (not b!92408) (not b!92407))
(check-sat)
(get-model)

(declare-fun d!28800 () Bool)

(assert (=> d!28800 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4653 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4653 bitStream1!8))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4653 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4653 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8)))))))))))

(assert (=> b!92404 d!28800))

(declare-fun d!28802 () Bool)

(declare-fun e!60771 () Bool)

(assert (=> d!28802 e!60771))

(declare-fun res!76313 () Bool)

(assert (=> d!28802 (=> (not res!76313) (not e!60771))))

(declare-fun lt!138151 () (_ BitVec 64))

(declare-fun lt!138153 () (_ BitVec 64))

(declare-fun lt!138154 () (_ BitVec 64))

(assert (=> d!28802 (= res!76313 (= lt!138151 (bvsub lt!138154 lt!138153)))))

(assert (=> d!28802 (or (= (bvand lt!138154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138153 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138154 lt!138153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28802 (= lt!138153 (remainingBits!0 ((_ sign_extend 32) (size!1956 (buf!2334 base!8))) ((_ sign_extend 32) (currentByte!4653 base!8)) ((_ sign_extend 32) (currentBit!4648 base!8))))))

(declare-fun lt!138155 () (_ BitVec 64))

(declare-fun lt!138152 () (_ BitVec 64))

(assert (=> d!28802 (= lt!138154 (bvmul lt!138155 lt!138152))))

(assert (=> d!28802 (or (= lt!138155 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138152 (bvsdiv (bvmul lt!138155 lt!138152) lt!138155)))))

(assert (=> d!28802 (= lt!138152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28802 (= lt!138155 ((_ sign_extend 32) (size!1956 (buf!2334 base!8))))))

(assert (=> d!28802 (= lt!138151 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4653 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4648 base!8))))))

(assert (=> d!28802 (invariant!0 (currentBit!4648 base!8) (currentByte!4653 base!8) (size!1956 (buf!2334 base!8)))))

(assert (=> d!28802 (= (bitIndex!0 (size!1956 (buf!2334 base!8)) (currentByte!4653 base!8) (currentBit!4648 base!8)) lt!138151)))

(declare-fun b!92453 () Bool)

(declare-fun res!76312 () Bool)

(assert (=> b!92453 (=> (not res!76312) (not e!60771))))

(assert (=> b!92453 (= res!76312 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138151))))

(declare-fun b!92454 () Bool)

(declare-fun lt!138156 () (_ BitVec 64))

(assert (=> b!92454 (= e!60771 (bvsle lt!138151 (bvmul lt!138156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92454 (or (= lt!138156 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138156 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138156)))))

(assert (=> b!92454 (= lt!138156 ((_ sign_extend 32) (size!1956 (buf!2334 base!8))))))

(assert (= (and d!28802 res!76313) b!92453))

(assert (= (and b!92453 res!76312) b!92454))

(declare-fun m!136445 () Bool)

(assert (=> d!28802 m!136445))

(declare-fun m!136447 () Bool)

(assert (=> d!28802 m!136447))

(assert (=> b!92403 d!28802))

(declare-fun d!28804 () Bool)

(assert (=> d!28804 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4648 bitStream1!8) (currentByte!4653 bitStream1!8) (size!1956 (buf!2334 bitStream1!8))))))

(declare-fun bs!7094 () Bool)

(assert (= bs!7094 d!28804))

(declare-fun m!136449 () Bool)

(assert (=> bs!7094 m!136449))

(assert (=> start!18620 d!28804))

(declare-fun d!28806 () Bool)

(assert (=> d!28806 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4648 bitStream2!8) (currentByte!4653 bitStream2!8) (size!1956 (buf!2334 bitStream2!8))))))

(declare-fun bs!7095 () Bool)

(assert (= bs!7095 d!28806))

(declare-fun m!136451 () Bool)

(assert (=> bs!7095 m!136451))

(assert (=> start!18620 d!28806))

(declare-fun d!28808 () Bool)

(assert (=> d!28808 (= (inv!12 base!8) (invariant!0 (currentBit!4648 base!8) (currentByte!4653 base!8) (size!1956 (buf!2334 base!8))))))

(declare-fun bs!7096 () Bool)

(assert (= bs!7096 d!28808))

(assert (=> bs!7096 m!136447))

(assert (=> start!18620 d!28808))

(declare-fun d!28810 () Bool)

(declare-fun e!60772 () Bool)

(assert (=> d!28810 e!60772))

(declare-fun res!76315 () Bool)

(assert (=> d!28810 (=> (not res!76315) (not e!60772))))

(declare-fun lt!138160 () (_ BitVec 64))

(declare-fun lt!138159 () (_ BitVec 64))

(declare-fun lt!138157 () (_ BitVec 64))

(assert (=> d!28810 (= res!76315 (= lt!138157 (bvsub lt!138160 lt!138159)))))

(assert (=> d!28810 (or (= (bvand lt!138160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138160 lt!138159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28810 (= lt!138159 (remainingBits!0 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))) ((_ sign_extend 32) (currentByte!4653 bitStream1!8)) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))))))

(declare-fun lt!138161 () (_ BitVec 64))

(declare-fun lt!138158 () (_ BitVec 64))

(assert (=> d!28810 (= lt!138160 (bvmul lt!138161 lt!138158))))

(assert (=> d!28810 (or (= lt!138161 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138158 (bvsdiv (bvmul lt!138161 lt!138158) lt!138161)))))

(assert (=> d!28810 (= lt!138158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28810 (= lt!138161 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))))))

(assert (=> d!28810 (= lt!138157 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4653 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4648 bitStream1!8))))))

(assert (=> d!28810 (invariant!0 (currentBit!4648 bitStream1!8) (currentByte!4653 bitStream1!8) (size!1956 (buf!2334 bitStream1!8)))))

(assert (=> d!28810 (= (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8)) lt!138157)))

(declare-fun b!92455 () Bool)

(declare-fun res!76314 () Bool)

(assert (=> b!92455 (=> (not res!76314) (not e!60772))))

(assert (=> b!92455 (= res!76314 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138157))))

(declare-fun b!92456 () Bool)

(declare-fun lt!138162 () (_ BitVec 64))

(assert (=> b!92456 (= e!60772 (bvsle lt!138157 (bvmul lt!138162 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92456 (or (= lt!138162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138162)))))

(assert (=> b!92456 (= lt!138162 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream1!8))))))

(assert (= (and d!28810 res!76315) b!92455))

(assert (= (and b!92455 res!76314) b!92456))

(declare-fun m!136453 () Bool)

(assert (=> d!28810 m!136453))

(assert (=> d!28810 m!136449))

(assert (=> b!92402 d!28810))

(declare-fun d!28812 () Bool)

(declare-fun e!60773 () Bool)

(assert (=> d!28812 e!60773))

(declare-fun res!76317 () Bool)

(assert (=> d!28812 (=> (not res!76317) (not e!60773))))

(declare-fun lt!138165 () (_ BitVec 64))

(declare-fun lt!138163 () (_ BitVec 64))

(declare-fun lt!138166 () (_ BitVec 64))

(assert (=> d!28812 (= res!76317 (= lt!138163 (bvsub lt!138166 lt!138165)))))

(assert (=> d!28812 (or (= (bvand lt!138166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138166 lt!138165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28812 (= lt!138165 (remainingBits!0 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream2!8))) ((_ sign_extend 32) (currentByte!4653 bitStream2!8)) ((_ sign_extend 32) (currentBit!4648 bitStream2!8))))))

(declare-fun lt!138167 () (_ BitVec 64))

(declare-fun lt!138164 () (_ BitVec 64))

(assert (=> d!28812 (= lt!138166 (bvmul lt!138167 lt!138164))))

(assert (=> d!28812 (or (= lt!138167 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138164 (bvsdiv (bvmul lt!138167 lt!138164) lt!138167)))))

(assert (=> d!28812 (= lt!138164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28812 (= lt!138167 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream2!8))))))

(assert (=> d!28812 (= lt!138163 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4653 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4648 bitStream2!8))))))

(assert (=> d!28812 (invariant!0 (currentBit!4648 bitStream2!8) (currentByte!4653 bitStream2!8) (size!1956 (buf!2334 bitStream2!8)))))

(assert (=> d!28812 (= (bitIndex!0 (size!1956 (buf!2334 bitStream2!8)) (currentByte!4653 bitStream2!8) (currentBit!4648 bitStream2!8)) lt!138163)))

(declare-fun b!92457 () Bool)

(declare-fun res!76316 () Bool)

(assert (=> b!92457 (=> (not res!76316) (not e!60773))))

(assert (=> b!92457 (= res!76316 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138163))))

(declare-fun b!92458 () Bool)

(declare-fun lt!138168 () (_ BitVec 64))

(assert (=> b!92458 (= e!60773 (bvsle lt!138163 (bvmul lt!138168 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92458 (or (= lt!138168 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138168 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138168)))))

(assert (=> b!92458 (= lt!138168 ((_ sign_extend 32) (size!1956 (buf!2334 bitStream2!8))))))

(assert (= (and d!28812 res!76317) b!92457))

(assert (= (and b!92457 res!76316) b!92458))

(declare-fun m!136455 () Bool)

(assert (=> d!28812 m!136455))

(assert (=> d!28812 m!136451))

(assert (=> b!92402 d!28812))

(declare-fun d!28814 () Bool)

(declare-fun res!76324 () Bool)

(declare-fun e!60779 () Bool)

(assert (=> d!28814 (=> (not res!76324) (not e!60779))))

(assert (=> d!28814 (= res!76324 (= (size!1956 (buf!2334 bitStream1!8)) (size!1956 (buf!2334 bitStream2!8))))))

(assert (=> d!28814 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60779)))

(declare-fun b!92465 () Bool)

(declare-fun res!76326 () Bool)

(assert (=> b!92465 (=> (not res!76326) (not e!60779))))

(assert (=> b!92465 (= res!76326 (bvsle (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8)) (bitIndex!0 (size!1956 (buf!2334 bitStream2!8)) (currentByte!4653 bitStream2!8) (currentBit!4648 bitStream2!8))))))

(declare-fun b!92466 () Bool)

(declare-fun e!60778 () Bool)

(assert (=> b!92466 (= e!60779 e!60778)))

(declare-fun res!76325 () Bool)

(assert (=> b!92466 (=> res!76325 e!60778)))

(assert (=> b!92466 (= res!76325 (= (size!1956 (buf!2334 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92467 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4325 array!4325 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92467 (= e!60778 (arrayBitRangesEq!0 (buf!2334 bitStream1!8) (buf!2334 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8))))))

(assert (= (and d!28814 res!76324) b!92465))

(assert (= (and b!92465 res!76326) b!92466))

(assert (= (and b!92466 (not res!76325)) b!92467))

(assert (=> b!92465 m!136411))

(assert (=> b!92465 m!136413))

(assert (=> b!92467 m!136411))

(assert (=> b!92467 m!136411))

(declare-fun m!136457 () Bool)

(assert (=> b!92467 m!136457))

(assert (=> b!92412 d!28814))

(declare-fun d!28816 () Bool)

(assert (=> d!28816 (= (array_inv!1790 (buf!2334 bitStream1!8)) (bvsge (size!1956 (buf!2334 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92410 d!28816))

(declare-fun d!28818 () Bool)

(assert (=> d!28818 (= (array_inv!1790 (buf!2334 bitStream2!8)) (bvsge (size!1956 (buf!2334 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92409 d!28818))

(declare-fun d!28820 () Bool)

(declare-fun res!76327 () Bool)

(declare-fun e!60781 () Bool)

(assert (=> d!28820 (=> (not res!76327) (not e!60781))))

(assert (=> d!28820 (= res!76327 (= (size!1956 (buf!2334 bitStream1!8)) (size!1956 (buf!2334 base!8))))))

(assert (=> d!28820 (= (isPrefixOf!0 bitStream1!8 base!8) e!60781)))

(declare-fun b!92468 () Bool)

(declare-fun res!76329 () Bool)

(assert (=> b!92468 (=> (not res!76329) (not e!60781))))

(assert (=> b!92468 (= res!76329 (bvsle (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8)) (bitIndex!0 (size!1956 (buf!2334 base!8)) (currentByte!4653 base!8) (currentBit!4648 base!8))))))

(declare-fun b!92469 () Bool)

(declare-fun e!60780 () Bool)

(assert (=> b!92469 (= e!60781 e!60780)))

(declare-fun res!76328 () Bool)

(assert (=> b!92469 (=> res!76328 e!60780)))

(assert (=> b!92469 (= res!76328 (= (size!1956 (buf!2334 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92470 () Bool)

(assert (=> b!92470 (= e!60780 (arrayBitRangesEq!0 (buf!2334 bitStream1!8) (buf!2334 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1956 (buf!2334 bitStream1!8)) (currentByte!4653 bitStream1!8) (currentBit!4648 bitStream1!8))))))

(assert (= (and d!28820 res!76327) b!92468))

(assert (= (and b!92468 res!76329) b!92469))

(assert (= (and b!92469 (not res!76328)) b!92470))

(assert (=> b!92468 m!136411))

(assert (=> b!92468 m!136393))

(assert (=> b!92470 m!136411))

(assert (=> b!92470 m!136411))

(declare-fun m!136459 () Bool)

(assert (=> b!92470 m!136459))

(assert (=> b!92408 d!28820))

(declare-fun d!28822 () Bool)

(declare-fun res!76330 () Bool)

(declare-fun e!60783 () Bool)

(assert (=> d!28822 (=> (not res!76330) (not e!60783))))

(assert (=> d!28822 (= res!76330 (= (size!1956 (buf!2334 bitStream2!8)) (size!1956 (buf!2334 base!8))))))

(assert (=> d!28822 (= (isPrefixOf!0 bitStream2!8 base!8) e!60783)))

(declare-fun b!92471 () Bool)

(declare-fun res!76332 () Bool)

(assert (=> b!92471 (=> (not res!76332) (not e!60783))))

(assert (=> b!92471 (= res!76332 (bvsle (bitIndex!0 (size!1956 (buf!2334 bitStream2!8)) (currentByte!4653 bitStream2!8) (currentBit!4648 bitStream2!8)) (bitIndex!0 (size!1956 (buf!2334 base!8)) (currentByte!4653 base!8) (currentBit!4648 base!8))))))

(declare-fun b!92472 () Bool)

(declare-fun e!60782 () Bool)

(assert (=> b!92472 (= e!60783 e!60782)))

(declare-fun res!76331 () Bool)

(assert (=> b!92472 (=> res!76331 e!60782)))

(assert (=> b!92472 (= res!76331 (= (size!1956 (buf!2334 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92473 () Bool)

(assert (=> b!92473 (= e!60782 (arrayBitRangesEq!0 (buf!2334 bitStream2!8) (buf!2334 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1956 (buf!2334 bitStream2!8)) (currentByte!4653 bitStream2!8) (currentBit!4648 bitStream2!8))))))

(assert (= (and d!28822 res!76330) b!92471))

(assert (= (and b!92471 res!76332) b!92472))

(assert (= (and b!92472 (not res!76331)) b!92473))

(assert (=> b!92471 m!136413))

(assert (=> b!92471 m!136393))

(assert (=> b!92473 m!136413))

(assert (=> b!92473 m!136413))

(declare-fun m!136461 () Bool)

(assert (=> b!92473 m!136461))

(assert (=> b!92407 d!28822))

(declare-fun d!28824 () Bool)

(assert (=> d!28824 (= (array_inv!1790 (buf!2334 base!8)) (bvsge (size!1956 (buf!2334 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92406 d!28824))

(declare-fun d!28826 () Bool)

(declare-fun size!1958 (List!831) Int)

(assert (=> d!28826 (= (length!422 listBits!13) (size!1958 listBits!13))))

(declare-fun bs!7097 () Bool)

(assert (= bs!7097 d!28826))

(declare-fun m!136463 () Bool)

(assert (=> bs!7097 m!136463))

(assert (=> b!92405 d!28826))

(check-sat (not d!28808) (not b!92473) (not b!92471) (not d!28806) (not d!28826) (not d!28810) (not d!28812) (not b!92470) (not b!92467) (not d!28802) (not b!92468) (not d!28804) (not b!92465))
