; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49142 () Bool)

(assert start!49142)

(declare-fun b!233392 () Bool)

(declare-fun res!195260 () Bool)

(declare-fun e!160818 () Bool)

(assert (=> b!233392 (=> (not res!195260) (not e!160818))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!12057 0))(
  ( (array!12058 (arr!6278 (Array (_ BitVec 32) (_ BitVec 8))) (size!5291 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9678 0))(
  ( (BitStream!9679 (buf!5832 array!12057) (currentByte!10857 (_ BitVec 32)) (currentBit!10852 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9678)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233392 (= res!195260 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!160820 () Bool)

(declare-fun b!233394 () Bool)

(declare-fun lt!369362 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9678)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233394 (= e!160820 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))) ((_ sign_extend 32) (currentByte!10857 b2!99)) ((_ sign_extend 32) (currentBit!10852 b2!99)) (bvsub bytes!19 lt!369362))))))

(declare-fun b!233395 () Bool)

(declare-fun e!160816 () Bool)

(declare-fun array_inv!5032 (array!12057) Bool)

(assert (=> b!233395 (= e!160816 (array_inv!5032 (buf!5832 b1!101)))))

(declare-fun b!233396 () Bool)

(declare-fun e!160811 () Bool)

(assert (=> b!233396 (= e!160811 e!160818)))

(declare-fun res!195261 () Bool)

(assert (=> b!233396 (=> (not res!195261) (not e!160818))))

(assert (=> b!233396 (= res!195261 (bvsle lt!369362 bytes!19))))

(declare-fun lt!369361 () (_ BitVec 64))

(assert (=> b!233396 (= lt!369362 ((_ extract 31 0) lt!369361))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233396 (= lt!369361 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233397 () Bool)

(declare-fun e!160817 () Bool)

(assert (=> b!233397 (= e!160818 e!160817)))

(declare-fun res!195264 () Bool)

(assert (=> b!233397 (=> (not res!195264) (not e!160817))))

(declare-fun lt!369363 () (_ BitVec 64))

(assert (=> b!233397 (= res!195264 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101)))) lt!369363) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233397 (= lt!369363 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10857 b1!101))) ((_ sign_extend 32) (currentBit!10852 b1!101))))))

(declare-fun b!233398 () Bool)

(declare-fun e!160812 () Bool)

(assert (=> b!233398 (= e!160812 (array_inv!5032 (buf!5832 b2!99)))))

(declare-fun b!233399 () Bool)

(declare-fun e!160813 () Bool)

(assert (=> b!233399 (= e!160817 e!160813)))

(declare-fun res!195256 () Bool)

(assert (=> b!233399 (=> (not res!195256) (not e!160813))))

(declare-fun lt!369360 () (_ BitVec 64))

(declare-fun lt!369358 () (_ BitVec 64))

(assert (=> b!233399 (= res!195256 (and (= lt!369358 lt!369360) (= (bvsub lt!369358 bits!86) lt!369363)))))

(assert (=> b!233399 (= lt!369360 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10857 b2!99))) ((_ sign_extend 32) (currentBit!10852 b2!99))))))

(declare-fun b!233400 () Bool)

(declare-fun res!195262 () Bool)

(assert (=> b!233400 (=> (not res!195262) (not e!160818))))

(assert (=> b!233400 (= res!195262 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101)) bytes!19))))

(declare-fun b!233393 () Bool)

(declare-fun res!195258 () Bool)

(assert (=> b!233393 (=> (not res!195258) (not e!160818))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233393 (= res!195258 (= lt!369358 (bvadd (bitIndex!0 (size!5291 (buf!5832 b1!101)) (currentByte!10857 b1!101) (currentBit!10852 b1!101)) bits!86)))))

(declare-fun res!195257 () Bool)

(declare-fun e!160819 () Bool)

(assert (=> start!49142 (=> (not res!195257) (not e!160819))))

(assert (=> start!49142 (= res!195257 (and (= (size!5291 (buf!5832 b1!101)) (size!5291 (buf!5832 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49142 e!160819))

(declare-fun inv!12 (BitStream!9678) Bool)

(assert (=> start!49142 (and (inv!12 b1!101) e!160816)))

(assert (=> start!49142 (and (inv!12 b2!99) e!160812)))

(assert (=> start!49142 true))

(declare-fun b!233401 () Bool)

(assert (=> b!233401 (= e!160813 e!160820)))

(declare-fun res!195259 () Bool)

(assert (=> b!233401 (=> (not res!195259) (not e!160820))))

(declare-fun lt!369359 () (_ BitVec 64))

(assert (=> b!233401 (= res!195259 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369359 (bvsub lt!369360 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369359 lt!369360) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369361))))))

(assert (=> b!233401 (= lt!369359 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99)))))))

(declare-fun b!233402 () Bool)

(assert (=> b!233402 (= e!160819 e!160811)))

(declare-fun res!195263 () Bool)

(assert (=> b!233402 (=> (not res!195263) (not e!160811))))

(assert (=> b!233402 (= res!195263 (bvsle bits!86 lt!369358))))

(assert (=> b!233402 (= lt!369358 (bitIndex!0 (size!5291 (buf!5832 b2!99)) (currentByte!10857 b2!99) (currentBit!10852 b2!99)))))

(assert (= (and start!49142 res!195257) b!233402))

(assert (= (and b!233402 res!195263) b!233396))

(assert (= (and b!233396 res!195261) b!233400))

(assert (= (and b!233400 res!195262) b!233393))

(assert (= (and b!233393 res!195258) b!233392))

(assert (= (and b!233392 res!195260) b!233397))

(assert (= (and b!233397 res!195264) b!233399))

(assert (= (and b!233399 res!195256) b!233401))

(assert (= (and b!233401 res!195259) b!233394))

(assert (= start!49142 b!233395))

(assert (= start!49142 b!233398))

(declare-fun m!356009 () Bool)

(assert (=> b!233394 m!356009))

(declare-fun m!356011 () Bool)

(assert (=> b!233395 m!356011))

(declare-fun m!356013 () Bool)

(assert (=> b!233400 m!356013))

(declare-fun m!356015 () Bool)

(assert (=> start!49142 m!356015))

(declare-fun m!356017 () Bool)

(assert (=> start!49142 m!356017))

(declare-fun m!356019 () Bool)

(assert (=> b!233402 m!356019))

(declare-fun m!356021 () Bool)

(assert (=> b!233393 m!356021))

(declare-fun m!356023 () Bool)

(assert (=> b!233398 m!356023))

(declare-fun m!356025 () Bool)

(assert (=> b!233392 m!356025))

(check-sat (not b!233400) (not b!233394) (not b!233392) (not start!49142) (not b!233398) (not b!233393) (not b!233395) (not b!233402))
(check-sat)
(get-model)

(declare-fun d!78622 () Bool)

(assert (=> d!78622 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))) ((_ sign_extend 32) (currentByte!10857 b2!99)) ((_ sign_extend 32) (currentBit!10852 b2!99)) (bvsub bytes!19 lt!369362)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369362)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))) ((_ sign_extend 32) (currentByte!10857 b2!99)) ((_ sign_extend 32) (currentBit!10852 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19369 () Bool)

(assert (= bs!19369 d!78622))

(declare-fun m!356045 () Bool)

(assert (=> bs!19369 m!356045))

(assert (=> b!233394 d!78622))

(declare-fun d!78624 () Bool)

(assert (=> d!78624 (= (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10857 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10852 b1!101)))))))

(assert (=> b!233392 d!78624))

(declare-fun d!78626 () Bool)

(declare-fun e!160853 () Bool)

(assert (=> d!78626 e!160853))

(declare-fun res!195297 () Bool)

(assert (=> d!78626 (=> (not res!195297) (not e!160853))))

(declare-fun lt!369399 () (_ BitVec 64))

(declare-fun lt!369397 () (_ BitVec 64))

(declare-fun lt!369394 () (_ BitVec 64))

(assert (=> d!78626 (= res!195297 (= lt!369394 (bvsub lt!369399 lt!369397)))))

(assert (=> d!78626 (or (= (bvand lt!369399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369397 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369399 lt!369397) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78626 (= lt!369397 (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101))))))

(declare-fun lt!369398 () (_ BitVec 64))

(declare-fun lt!369395 () (_ BitVec 64))

(assert (=> d!78626 (= lt!369399 (bvmul lt!369398 lt!369395))))

(assert (=> d!78626 (or (= lt!369398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369395 (bvsdiv (bvmul lt!369398 lt!369395) lt!369398)))))

(assert (=> d!78626 (= lt!369395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78626 (= lt!369398 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))))))

(assert (=> d!78626 (= lt!369394 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10857 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10852 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78626 (invariant!0 (currentBit!10852 b1!101) (currentByte!10857 b1!101) (size!5291 (buf!5832 b1!101)))))

(assert (=> d!78626 (= (bitIndex!0 (size!5291 (buf!5832 b1!101)) (currentByte!10857 b1!101) (currentBit!10852 b1!101)) lt!369394)))

(declare-fun b!233440 () Bool)

(declare-fun res!195296 () Bool)

(assert (=> b!233440 (=> (not res!195296) (not e!160853))))

(assert (=> b!233440 (= res!195296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369394))))

(declare-fun b!233441 () Bool)

(declare-fun lt!369396 () (_ BitVec 64))

(assert (=> b!233441 (= e!160853 (bvsle lt!369394 (bvmul lt!369396 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233441 (or (= lt!369396 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369396 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369396)))))

(assert (=> b!233441 (= lt!369396 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))))))

(assert (= (and d!78626 res!195297) b!233440))

(assert (= (and b!233440 res!195296) b!233441))

(assert (=> d!78626 m!356025))

(declare-fun m!356047 () Bool)

(assert (=> d!78626 m!356047))

(assert (=> b!233393 d!78626))

(declare-fun d!78628 () Bool)

(assert (=> d!78628 (= (array_inv!5032 (buf!5832 b2!99)) (bvsge (size!5291 (buf!5832 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233398 d!78628))

(declare-fun d!78630 () Bool)

(declare-fun e!160854 () Bool)

(assert (=> d!78630 e!160854))

(declare-fun res!195299 () Bool)

(assert (=> d!78630 (=> (not res!195299) (not e!160854))))

(declare-fun lt!369405 () (_ BitVec 64))

(declare-fun lt!369403 () (_ BitVec 64))

(declare-fun lt!369400 () (_ BitVec 64))

(assert (=> d!78630 (= res!195299 (= lt!369400 (bvsub lt!369405 lt!369403)))))

(assert (=> d!78630 (or (= (bvand lt!369405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369405 lt!369403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78630 (= lt!369403 (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))) ((_ sign_extend 32) (currentByte!10857 b2!99)) ((_ sign_extend 32) (currentBit!10852 b2!99))))))

(declare-fun lt!369404 () (_ BitVec 64))

(declare-fun lt!369401 () (_ BitVec 64))

(assert (=> d!78630 (= lt!369405 (bvmul lt!369404 lt!369401))))

(assert (=> d!78630 (or (= lt!369404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369401 (bvsdiv (bvmul lt!369404 lt!369401) lt!369404)))))

(assert (=> d!78630 (= lt!369401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78630 (= lt!369404 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))))))

(assert (=> d!78630 (= lt!369400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10857 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10852 b2!99))))))

(assert (=> d!78630 (invariant!0 (currentBit!10852 b2!99) (currentByte!10857 b2!99) (size!5291 (buf!5832 b2!99)))))

(assert (=> d!78630 (= (bitIndex!0 (size!5291 (buf!5832 b2!99)) (currentByte!10857 b2!99) (currentBit!10852 b2!99)) lt!369400)))

(declare-fun b!233442 () Bool)

(declare-fun res!195298 () Bool)

(assert (=> b!233442 (=> (not res!195298) (not e!160854))))

(assert (=> b!233442 (= res!195298 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369400))))

(declare-fun b!233443 () Bool)

(declare-fun lt!369402 () (_ BitVec 64))

(assert (=> b!233443 (= e!160854 (bvsle lt!369400 (bvmul lt!369402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233443 (or (= lt!369402 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369402 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369402)))))

(assert (=> b!233443 (= lt!369402 ((_ sign_extend 32) (size!5291 (buf!5832 b2!99))))))

(assert (= (and d!78630 res!195299) b!233442))

(assert (= (and b!233442 res!195298) b!233443))

(assert (=> d!78630 m!356045))

(declare-fun m!356049 () Bool)

(assert (=> d!78630 m!356049))

(assert (=> b!233402 d!78630))

(declare-fun d!78632 () Bool)

(assert (=> d!78632 (= (array_inv!5032 (buf!5832 b1!101)) (bvsge (size!5291 (buf!5832 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233395 d!78632))

(declare-fun d!78634 () Bool)

(assert (=> d!78634 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5291 (buf!5832 b1!101))) ((_ sign_extend 32) (currentByte!10857 b1!101)) ((_ sign_extend 32) (currentBit!10852 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19370 () Bool)

(assert (= bs!19370 d!78634))

(assert (=> bs!19370 m!356025))

(assert (=> b!233400 d!78634))

(declare-fun d!78636 () Bool)

(assert (=> d!78636 (= (inv!12 b1!101) (invariant!0 (currentBit!10852 b1!101) (currentByte!10857 b1!101) (size!5291 (buf!5832 b1!101))))))

(declare-fun bs!19371 () Bool)

(assert (= bs!19371 d!78636))

(assert (=> bs!19371 m!356047))

(assert (=> start!49142 d!78636))

(declare-fun d!78638 () Bool)

(assert (=> d!78638 (= (inv!12 b2!99) (invariant!0 (currentBit!10852 b2!99) (currentByte!10857 b2!99) (size!5291 (buf!5832 b2!99))))))

(declare-fun bs!19372 () Bool)

(assert (= bs!19372 d!78638))

(assert (=> bs!19372 m!356049))

(assert (=> start!49142 d!78638))

(check-sat (not d!78630) (not d!78622) (not d!78638) (not d!78626) (not d!78634) (not d!78636))
(check-sat)
