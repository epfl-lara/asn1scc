; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19026 () Bool)

(assert start!19026)

(declare-fun b!95141 () Bool)

(declare-fun res!78338 () Bool)

(declare-fun e!62351 () Bool)

(assert (=> b!95141 (=> (not res!78338) (not e!62351))))

(declare-datatypes ((array!4444 0))(
  ( (array!4445 (arr!2630 (Array (_ BitVec 32) (_ BitVec 8))) (size!2025 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3548 0))(
  ( (BitStream!3549 (buf!2383 array!4444) (currentByte!4752 (_ BitVec 32)) (currentBit!4747 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3548)

(declare-fun bitStream2!8 () BitStream!3548)

(declare-fun isPrefixOf!0 (BitStream!3548 BitStream!3548) Bool)

(assert (=> b!95141 (= res!78338 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95142 () Bool)

(declare-fun res!78337 () Bool)

(assert (=> b!95142 (=> (not res!78337) (not e!62351))))

(declare-fun base!8 () BitStream!3548)

(assert (=> b!95142 (= res!78337 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95143 () Bool)

(declare-fun e!62358 () Bool)

(declare-fun array_inv!1839 (array!4444) Bool)

(assert (=> b!95143 (= e!62358 (array_inv!1839 (buf!2383 bitStream2!8)))))

(declare-fun b!95144 () Bool)

(declare-fun e!62354 () Bool)

(declare-fun thiss!1534 () BitStream!3548)

(assert (=> b!95144 (= e!62354 (array_inv!1839 (buf!2383 thiss!1534)))))

(declare-fun b!95145 () Bool)

(declare-fun res!78339 () Bool)

(assert (=> b!95145 (=> (not res!78339) (not e!62351))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!95145 (= res!78339 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95146 () Bool)

(declare-datatypes ((List!880 0))(
  ( (Nil!877) (Cons!876 (h!995 Bool) (t!1630 List!880)) )
))
(declare-fun listBits!13 () List!880)

(declare-datatypes ((tuple2!7688 0))(
  ( (tuple2!7689 (_1!4091 BitStream!3548) (_2!4091 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3548) tuple2!7688)

(declare-fun head!592 (List!880) Bool)

(assert (=> b!95146 (= e!62351 (not (= (_2!4091 (readBitPure!0 bitStream1!8)) (head!592 listBits!13))))))

(declare-fun b!95148 () Bool)

(declare-fun res!78334 () Bool)

(assert (=> b!95148 (=> (not res!78334) (not e!62351))))

(declare-fun length!471 (List!880) Int)

(assert (=> b!95148 (= res!78334 (> (length!471 listBits!13) 0))))

(declare-fun b!95149 () Bool)

(declare-fun res!78336 () Bool)

(assert (=> b!95149 (=> (not res!78336) (not e!62351))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95149 (= res!78336 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8))) (bitIndex!0 (size!2025 (buf!2383 bitStream2!8)) (currentByte!4752 bitStream2!8) (currentBit!4747 bitStream2!8))))))

(declare-fun b!95150 () Bool)

(declare-fun res!78331 () Bool)

(assert (=> b!95150 (=> (not res!78331) (not e!62351))))

(assert (=> b!95150 (= res!78331 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95151 () Bool)

(declare-fun res!78341 () Bool)

(assert (=> b!95151 (=> (not res!78341) (not e!62351))))

(assert (=> b!95151 (= res!78341 (and (= (buf!2383 bitStream1!8) (buf!2383 bitStream2!8)) (= (buf!2383 bitStream1!8) (buf!2383 base!8))))))

(declare-fun b!95152 () Bool)

(declare-fun e!62353 () Bool)

(assert (=> b!95152 (= e!62353 (array_inv!1839 (buf!2383 bitStream1!8)))))

(declare-fun res!78335 () Bool)

(assert (=> start!19026 (=> (not res!78335) (not e!62351))))

(assert (=> start!19026 (= res!78335 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19026 e!62351))

(assert (=> start!19026 true))

(declare-fun inv!12 (BitStream!3548) Bool)

(assert (=> start!19026 (and (inv!12 bitStream1!8) e!62353)))

(assert (=> start!19026 (and (inv!12 bitStream2!8) e!62358)))

(declare-fun e!62352 () Bool)

(assert (=> start!19026 (and (inv!12 base!8) e!62352)))

(assert (=> start!19026 (and (inv!12 thiss!1534) e!62354)))

(declare-fun b!95147 () Bool)

(assert (=> b!95147 (= e!62352 (array_inv!1839 (buf!2383 base!8)))))

(declare-fun b!95153 () Bool)

(declare-fun res!78333 () Bool)

(assert (=> b!95153 (=> (not res!78333) (not e!62351))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3548 BitStream!3548 (_ BitVec 64)) List!880)

(assert (=> b!95153 (= res!78333 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95154 () Bool)

(declare-fun res!78340 () Bool)

(assert (=> b!95154 (=> (not res!78340) (not e!62351))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95154 (= res!78340 (validate_offset_bits!1 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))) ((_ sign_extend 32) (currentByte!4752 bitStream1!8)) ((_ sign_extend 32) (currentBit!4747 bitStream1!8)) nBits!484))))

(declare-fun b!95155 () Bool)

(declare-fun res!78342 () Bool)

(assert (=> b!95155 (=> (not res!78342) (not e!62351))))

(assert (=> b!95155 (= res!78342 (bvslt (bitIndex!0 (size!2025 (buf!2383 base!8)) (currentByte!4752 base!8) (currentBit!4747 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95156 () Bool)

(declare-fun res!78332 () Bool)

(assert (=> b!95156 (=> (not res!78332) (not e!62351))))

(assert (=> b!95156 (= res!78332 (validate_offset_bits!1 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))) ((_ sign_extend 32) (currentByte!4752 bitStream2!8)) ((_ sign_extend 32) (currentBit!4747 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!19026 res!78335) b!95148))

(assert (= (and b!95148 res!78334) b!95150))

(assert (= (and b!95150 res!78331) b!95142))

(assert (= (and b!95142 res!78337) b!95141))

(assert (= (and b!95141 res!78338) b!95151))

(assert (= (and b!95151 res!78341) b!95155))

(assert (= (and b!95155 res!78342) b!95149))

(assert (= (and b!95149 res!78336) b!95154))

(assert (= (and b!95154 res!78340) b!95156))

(assert (= (and b!95156 res!78332) b!95153))

(assert (= (and b!95153 res!78333) b!95145))

(assert (= (and b!95145 res!78339) b!95146))

(assert (= start!19026 b!95152))

(assert (= start!19026 b!95143))

(assert (= start!19026 b!95147))

(assert (= start!19026 b!95144))

(declare-fun m!138595 () Bool)

(assert (=> b!95156 m!138595))

(declare-fun m!138597 () Bool)

(assert (=> b!95141 m!138597))

(declare-fun m!138599 () Bool)

(assert (=> b!95146 m!138599))

(declare-fun m!138601 () Bool)

(assert (=> b!95146 m!138601))

(declare-fun m!138603 () Bool)

(assert (=> b!95152 m!138603))

(declare-fun m!138605 () Bool)

(assert (=> start!19026 m!138605))

(declare-fun m!138607 () Bool)

(assert (=> start!19026 m!138607))

(declare-fun m!138609 () Bool)

(assert (=> start!19026 m!138609))

(declare-fun m!138611 () Bool)

(assert (=> start!19026 m!138611))

(declare-fun m!138613 () Bool)

(assert (=> b!95144 m!138613))

(declare-fun m!138615 () Bool)

(assert (=> b!95147 m!138615))

(declare-fun m!138617 () Bool)

(assert (=> b!95150 m!138617))

(declare-fun m!138619 () Bool)

(assert (=> b!95155 m!138619))

(declare-fun m!138621 () Bool)

(assert (=> b!95153 m!138621))

(declare-fun m!138623 () Bool)

(assert (=> b!95142 m!138623))

(declare-fun m!138625 () Bool)

(assert (=> b!95154 m!138625))

(declare-fun m!138627 () Bool)

(assert (=> b!95149 m!138627))

(declare-fun m!138629 () Bool)

(assert (=> b!95149 m!138629))

(declare-fun m!138631 () Bool)

(assert (=> b!95148 m!138631))

(declare-fun m!138633 () Bool)

(assert (=> b!95143 m!138633))

(push 1)

(assert (not b!95143))

(assert (not b!95144))

(assert (not b!95142))

(assert (not start!19026))

(assert (not b!95156))

(assert (not b!95148))

(assert (not b!95147))

(assert (not b!95146))

(assert (not b!95149))

(assert (not b!95141))

(assert (not b!95153))

(assert (not b!95152))

(assert (not b!95155))

(assert (not b!95154))

(assert (not b!95150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29604 () Bool)

(declare-fun e!62394 () Bool)

(assert (=> d!29604 e!62394))

(declare-fun res!78382 () Bool)

(assert (=> d!29604 (=> (not res!78382) (not e!62394))))

(declare-fun lt!139042 () (_ BitVec 64))

(declare-fun lt!139039 () (_ BitVec 64))

(declare-fun lt!139040 () (_ BitVec 64))

(assert (=> d!29604 (= res!78382 (= lt!139042 (bvsub lt!139039 lt!139040)))))

(assert (=> d!29604 (or (= (bvand lt!139039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139039 lt!139040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29604 (= lt!139040 (remainingBits!0 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))) ((_ sign_extend 32) (currentByte!4752 bitStream1!8)) ((_ sign_extend 32) (currentBit!4747 bitStream1!8))))))

(declare-fun lt!139044 () (_ BitVec 64))

(declare-fun lt!139041 () (_ BitVec 64))

(assert (=> d!29604 (= lt!139039 (bvmul lt!139044 lt!139041))))

(assert (=> d!29604 (or (= lt!139044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139041 (bvsdiv (bvmul lt!139044 lt!139041) lt!139044)))))

(assert (=> d!29604 (= lt!139041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29604 (= lt!139044 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))))))

(assert (=> d!29604 (= lt!139042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4752 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4747 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29604 (invariant!0 (currentBit!4747 bitStream1!8) (currentByte!4752 bitStream1!8) (size!2025 (buf!2383 bitStream1!8)))))

(assert (=> d!29604 (= (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8)) lt!139042)))

(declare-fun b!95219 () Bool)

(declare-fun res!78381 () Bool)

(assert (=> b!95219 (=> (not res!78381) (not e!62394))))

(assert (=> b!95219 (= res!78381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139042))))

(declare-fun b!95220 () Bool)

(declare-fun lt!139043 () (_ BitVec 64))

(assert (=> b!95220 (= e!62394 (bvsle lt!139042 (bvmul lt!139043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95220 (or (= lt!139043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139043)))))

(assert (=> b!95220 (= lt!139043 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))))))

(assert (= (and d!29604 res!78382) b!95219))

(assert (= (and b!95219 res!78381) b!95220))

(declare-fun m!138675 () Bool)

(assert (=> d!29604 m!138675))

(declare-fun m!138677 () Bool)

(assert (=> d!29604 m!138677))

(assert (=> b!95149 d!29604))

(declare-fun d!29610 () Bool)

(declare-fun e!62395 () Bool)

(assert (=> d!29610 e!62395))

(declare-fun res!78384 () Bool)

(assert (=> d!29610 (=> (not res!78384) (not e!62395))))

(declare-fun lt!139046 () (_ BitVec 64))

(declare-fun lt!139048 () (_ BitVec 64))

(declare-fun lt!139045 () (_ BitVec 64))

(assert (=> d!29610 (= res!78384 (= lt!139048 (bvsub lt!139045 lt!139046)))))

(assert (=> d!29610 (or (= (bvand lt!139045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139045 lt!139046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29610 (= lt!139046 (remainingBits!0 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))) ((_ sign_extend 32) (currentByte!4752 bitStream2!8)) ((_ sign_extend 32) (currentBit!4747 bitStream2!8))))))

(declare-fun lt!139050 () (_ BitVec 64))

(declare-fun lt!139047 () (_ BitVec 64))

(assert (=> d!29610 (= lt!139045 (bvmul lt!139050 lt!139047))))

(assert (=> d!29610 (or (= lt!139050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139047 (bvsdiv (bvmul lt!139050 lt!139047) lt!139050)))))

(assert (=> d!29610 (= lt!139047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29610 (= lt!139050 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))))))

(assert (=> d!29610 (= lt!139048 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4752 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4747 bitStream2!8))))))

(assert (=> d!29610 (invariant!0 (currentBit!4747 bitStream2!8) (currentByte!4752 bitStream2!8) (size!2025 (buf!2383 bitStream2!8)))))

(assert (=> d!29610 (= (bitIndex!0 (size!2025 (buf!2383 bitStream2!8)) (currentByte!4752 bitStream2!8) (currentBit!4747 bitStream2!8)) lt!139048)))

(declare-fun b!95221 () Bool)

(declare-fun res!78383 () Bool)

(assert (=> b!95221 (=> (not res!78383) (not e!62395))))

(assert (=> b!95221 (= res!78383 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139048))))

(declare-fun b!95222 () Bool)

(declare-fun lt!139049 () (_ BitVec 64))

(assert (=> b!95222 (= e!62395 (bvsle lt!139048 (bvmul lt!139049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95222 (or (= lt!139049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139049)))))

(assert (=> b!95222 (= lt!139049 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))))))

(assert (= (and d!29610 res!78384) b!95221))

(assert (= (and b!95221 res!78383) b!95222))

(declare-fun m!138679 () Bool)

(assert (=> d!29610 m!138679))

(declare-fun m!138681 () Bool)

(assert (=> d!29610 m!138681))

(assert (=> b!95149 d!29610))

(declare-fun d!29612 () Bool)

(declare-fun res!78397 () Bool)

(declare-fun e!62404 () Bool)

(assert (=> d!29612 (=> (not res!78397) (not e!62404))))

(assert (=> d!29612 (= res!78397 (= (size!2025 (buf!2383 bitStream1!8)) (size!2025 (buf!2383 base!8))))))

(assert (=> d!29612 (= (isPrefixOf!0 bitStream1!8 base!8) e!62404)))

(declare-fun b!95235 () Bool)

(declare-fun res!78398 () Bool)

(assert (=> b!95235 (=> (not res!78398) (not e!62404))))

(assert (=> b!95235 (= res!78398 (bvsle (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8)) (bitIndex!0 (size!2025 (buf!2383 base!8)) (currentByte!4752 base!8) (currentBit!4747 base!8))))))

(declare-fun b!95236 () Bool)

(declare-fun e!62405 () Bool)

(assert (=> b!95236 (= e!62404 e!62405)))

(declare-fun res!78399 () Bool)

(assert (=> b!95236 (=> res!78399 e!62405)))

(assert (=> b!95236 (= res!78399 (= (size!2025 (buf!2383 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95237 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4444 array!4444 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95237 (= e!62405 (arrayBitRangesEq!0 (buf!2383 bitStream1!8) (buf!2383 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8))))))

(assert (= (and d!29612 res!78397) b!95235))

(assert (= (and b!95235 res!78398) b!95236))

(assert (= (and b!95236 (not res!78399)) b!95237))

(assert (=> b!95235 m!138627))

(assert (=> b!95235 m!138619))

(assert (=> b!95237 m!138627))

(assert (=> b!95237 m!138627))

(declare-fun m!138699 () Bool)

(assert (=> b!95237 m!138699))

(assert (=> b!95150 d!29612))

(declare-fun d!29638 () Bool)

(declare-fun res!78400 () Bool)

(declare-fun e!62406 () Bool)

(assert (=> d!29638 (=> (not res!78400) (not e!62406))))

(assert (=> d!29638 (= res!78400 (= (size!2025 (buf!2383 bitStream1!8)) (size!2025 (buf!2383 bitStream2!8))))))

(assert (=> d!29638 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62406)))

(declare-fun b!95238 () Bool)

(declare-fun res!78401 () Bool)

(assert (=> b!95238 (=> (not res!78401) (not e!62406))))

(assert (=> b!95238 (= res!78401 (bvsle (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8)) (bitIndex!0 (size!2025 (buf!2383 bitStream2!8)) (currentByte!4752 bitStream2!8) (currentBit!4747 bitStream2!8))))))

(declare-fun b!95239 () Bool)

(declare-fun e!62407 () Bool)

(assert (=> b!95239 (= e!62406 e!62407)))

(declare-fun res!78402 () Bool)

(assert (=> b!95239 (=> res!78402 e!62407)))

(assert (=> b!95239 (= res!78402 (= (size!2025 (buf!2383 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95240 () Bool)

(assert (=> b!95240 (= e!62407 (arrayBitRangesEq!0 (buf!2383 bitStream1!8) (buf!2383 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2025 (buf!2383 bitStream1!8)) (currentByte!4752 bitStream1!8) (currentBit!4747 bitStream1!8))))))

(assert (= (and d!29638 res!78400) b!95238))

(assert (= (and b!95238 res!78401) b!95239))

(assert (= (and b!95239 (not res!78402)) b!95240))

(assert (=> b!95238 m!138627))

(assert (=> b!95238 m!138629))

(assert (=> b!95240 m!138627))

(assert (=> b!95240 m!138627))

(declare-fun m!138701 () Bool)

(assert (=> b!95240 m!138701))

(assert (=> b!95141 d!29638))

(declare-fun d!29640 () Bool)

(assert (=> d!29640 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4747 bitStream1!8) (currentByte!4752 bitStream1!8) (size!2025 (buf!2383 bitStream1!8))))))

(declare-fun bs!7289 () Bool)

(assert (= bs!7289 d!29640))

(assert (=> bs!7289 m!138677))

(assert (=> start!19026 d!29640))

(declare-fun d!29642 () Bool)

(assert (=> d!29642 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4747 bitStream2!8) (currentByte!4752 bitStream2!8) (size!2025 (buf!2383 bitStream2!8))))))

(declare-fun bs!7290 () Bool)

(assert (= bs!7290 d!29642))

(assert (=> bs!7290 m!138681))

(assert (=> start!19026 d!29642))

(declare-fun d!29644 () Bool)

(assert (=> d!29644 (= (inv!12 base!8) (invariant!0 (currentBit!4747 base!8) (currentByte!4752 base!8) (size!2025 (buf!2383 base!8))))))

(declare-fun bs!7291 () Bool)

(assert (= bs!7291 d!29644))

(declare-fun m!138703 () Bool)

(assert (=> bs!7291 m!138703))

(assert (=> start!19026 d!29644))

(declare-fun d!29646 () Bool)

(assert (=> d!29646 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4747 thiss!1534) (currentByte!4752 thiss!1534) (size!2025 (buf!2383 thiss!1534))))))

(declare-fun bs!7292 () Bool)

(assert (= bs!7292 d!29646))

(declare-fun m!138705 () Bool)

(assert (=> bs!7292 m!138705))

(assert (=> start!19026 d!29646))

(declare-fun d!29648 () Bool)

(assert (=> d!29648 (= (array_inv!1839 (buf!2383 bitStream1!8)) (bvsge (size!2025 (buf!2383 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95152 d!29648))

(declare-fun d!29650 () Bool)

(declare-fun res!78403 () Bool)

(declare-fun e!62408 () Bool)

(assert (=> d!29650 (=> (not res!78403) (not e!62408))))

(assert (=> d!29650 (= res!78403 (= (size!2025 (buf!2383 bitStream2!8)) (size!2025 (buf!2383 base!8))))))

(assert (=> d!29650 (= (isPrefixOf!0 bitStream2!8 base!8) e!62408)))

(declare-fun b!95241 () Bool)

(declare-fun res!78404 () Bool)

(assert (=> b!95241 (=> (not res!78404) (not e!62408))))

(assert (=> b!95241 (= res!78404 (bvsle (bitIndex!0 (size!2025 (buf!2383 bitStream2!8)) (currentByte!4752 bitStream2!8) (currentBit!4747 bitStream2!8)) (bitIndex!0 (size!2025 (buf!2383 base!8)) (currentByte!4752 base!8) (currentBit!4747 base!8))))))

(declare-fun b!95242 () Bool)

(declare-fun e!62409 () Bool)

(assert (=> b!95242 (= e!62408 e!62409)))

(declare-fun res!78405 () Bool)

(assert (=> b!95242 (=> res!78405 e!62409)))

(assert (=> b!95242 (= res!78405 (= (size!2025 (buf!2383 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95243 () Bool)

(assert (=> b!95243 (= e!62409 (arrayBitRangesEq!0 (buf!2383 bitStream2!8) (buf!2383 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2025 (buf!2383 bitStream2!8)) (currentByte!4752 bitStream2!8) (currentBit!4747 bitStream2!8))))))

(assert (= (and d!29650 res!78403) b!95241))

(assert (= (and b!95241 res!78404) b!95242))

(assert (= (and b!95242 (not res!78405)) b!95243))

(assert (=> b!95241 m!138629))

(assert (=> b!95241 m!138619))

(assert (=> b!95243 m!138629))

(assert (=> b!95243 m!138629))

(declare-fun m!138707 () Bool)

(assert (=> b!95243 m!138707))

(assert (=> b!95142 d!29650))

(declare-fun d!29652 () Bool)

(declare-fun e!62420 () Bool)

(assert (=> d!29652 e!62420))

(declare-fun c!5991 () Bool)

(assert (=> d!29652 (= c!5991 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139091 () List!880)

(declare-datatypes ((tuple2!7698 0))(
  ( (tuple2!7699 (_1!4096 List!880) (_2!4096 BitStream!3548)) )
))
(declare-fun e!62419 () tuple2!7698)

(assert (=> d!29652 (= lt!139091 (_1!4096 e!62419))))

(declare-fun c!5990 () Bool)

(assert (=> d!29652 (= c!5990 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29652 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29652 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139091)))

(declare-fun b!95264 () Bool)

(declare-fun isEmpty!261 (List!880) Bool)

(assert (=> b!95264 (= e!62420 (isEmpty!261 lt!139091))))

(declare-datatypes ((tuple2!7700 0))(
  ( (tuple2!7701 (_1!4097 Bool) (_2!4097 BitStream!3548)) )
))
(declare-fun lt!139092 () tuple2!7700)

(declare-fun b!95263 () Bool)

(declare-fun lt!139090 () (_ BitVec 64))

(assert (=> b!95263 (= e!62419 (tuple2!7699 (Cons!876 (_1!4097 lt!139092) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4097 lt!139092) (bvsub nBits!484 lt!139090))) (_2!4097 lt!139092)))))

(declare-fun readBit!0 (BitStream!3548) tuple2!7700)

(assert (=> b!95263 (= lt!139092 (readBit!0 bitStream1!8))))

(assert (=> b!95263 (= lt!139090 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!95262 () Bool)

(assert (=> b!95262 (= e!62419 (tuple2!7699 Nil!877 bitStream1!8))))

(declare-fun b!95265 () Bool)

(assert (=> b!95265 (= e!62420 (> (length!471 lt!139091) 0))))

(assert (= (and d!29652 c!5990) b!95262))

(assert (= (and d!29652 (not c!5990)) b!95263))

(assert (= (and d!29652 c!5991) b!95264))

(assert (= (and d!29652 (not c!5991)) b!95265))

(declare-fun m!138713 () Bool)

(assert (=> b!95264 m!138713))

(declare-fun m!138715 () Bool)

(assert (=> b!95263 m!138715))

(declare-fun m!138717 () Bool)

(assert (=> b!95263 m!138717))

(declare-fun m!138719 () Bool)

(assert (=> b!95265 m!138719))

(assert (=> b!95153 d!29652))

(declare-fun d!29662 () Bool)

(assert (=> d!29662 (= (array_inv!1839 (buf!2383 bitStream2!8)) (bvsge (size!2025 (buf!2383 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95143 d!29662))

(declare-fun d!29664 () Bool)

(assert (=> d!29664 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))) ((_ sign_extend 32) (currentByte!4752 bitStream1!8)) ((_ sign_extend 32) (currentBit!4747 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream1!8))) ((_ sign_extend 32) (currentByte!4752 bitStream1!8)) ((_ sign_extend 32) (currentBit!4747 bitStream1!8))) nBits!484))))

(declare-fun bs!7294 () Bool)

(assert (= bs!7294 d!29664))

(assert (=> bs!7294 m!138675))

(assert (=> b!95154 d!29664))

(declare-fun d!29666 () Bool)

(assert (=> d!29666 (= (array_inv!1839 (buf!2383 thiss!1534)) (bvsge (size!2025 (buf!2383 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95144 d!29666))

(declare-fun d!29668 () Bool)

(declare-fun e!62421 () Bool)

(assert (=> d!29668 e!62421))

(declare-fun res!78417 () Bool)

(assert (=> d!29668 (=> (not res!78417) (not e!62421))))

(declare-fun lt!139096 () (_ BitVec 64))

(declare-fun lt!139094 () (_ BitVec 64))

(declare-fun lt!139093 () (_ BitVec 64))

(assert (=> d!29668 (= res!78417 (= lt!139096 (bvsub lt!139093 lt!139094)))))

(assert (=> d!29668 (or (= (bvand lt!139093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139094 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139093 lt!139094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29668 (= lt!139094 (remainingBits!0 ((_ sign_extend 32) (size!2025 (buf!2383 base!8))) ((_ sign_extend 32) (currentByte!4752 base!8)) ((_ sign_extend 32) (currentBit!4747 base!8))))))

(declare-fun lt!139098 () (_ BitVec 64))

(declare-fun lt!139095 () (_ BitVec 64))

(assert (=> d!29668 (= lt!139093 (bvmul lt!139098 lt!139095))))

(assert (=> d!29668 (or (= lt!139098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139095 (bvsdiv (bvmul lt!139098 lt!139095) lt!139098)))))

(assert (=> d!29668 (= lt!139095 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29668 (= lt!139098 ((_ sign_extend 32) (size!2025 (buf!2383 base!8))))))

(assert (=> d!29668 (= lt!139096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4752 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4747 base!8))))))

(assert (=> d!29668 (invariant!0 (currentBit!4747 base!8) (currentByte!4752 base!8) (size!2025 (buf!2383 base!8)))))

(assert (=> d!29668 (= (bitIndex!0 (size!2025 (buf!2383 base!8)) (currentByte!4752 base!8) (currentBit!4747 base!8)) lt!139096)))

(declare-fun b!95266 () Bool)

(declare-fun res!78416 () Bool)

(assert (=> b!95266 (=> (not res!78416) (not e!62421))))

(assert (=> b!95266 (= res!78416 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139096))))

(declare-fun b!95267 () Bool)

(declare-fun lt!139097 () (_ BitVec 64))

(assert (=> b!95267 (= e!62421 (bvsle lt!139096 (bvmul lt!139097 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95267 (or (= lt!139097 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139097 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139097)))))

(assert (=> b!95267 (= lt!139097 ((_ sign_extend 32) (size!2025 (buf!2383 base!8))))))

(assert (= (and d!29668 res!78417) b!95266))

(assert (= (and b!95266 res!78416) b!95267))

(declare-fun m!138721 () Bool)

(assert (=> d!29668 m!138721))

(assert (=> d!29668 m!138703))

(assert (=> b!95155 d!29668))

(declare-fun d!29670 () Bool)

(assert (=> d!29670 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))) ((_ sign_extend 32) (currentByte!4752 bitStream2!8)) ((_ sign_extend 32) (currentBit!4747 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2025 (buf!2383 bitStream2!8))) ((_ sign_extend 32) (currentByte!4752 bitStream2!8)) ((_ sign_extend 32) (currentBit!4747 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7295 () Bool)

(assert (= bs!7295 d!29670))

(assert (=> bs!7295 m!138679))

(assert (=> b!95156 d!29670))

(declare-fun d!29672 () Bool)

(declare-fun lt!139101 () tuple2!7700)

(assert (=> d!29672 (= lt!139101 (readBit!0 bitStream1!8))))

(assert (=> d!29672 (= (readBitPure!0 bitStream1!8) (tuple2!7689 (_2!4097 lt!139101) (_1!4097 lt!139101)))))

(declare-fun bs!7296 () Bool)

(assert (= bs!7296 d!29672))

(assert (=> bs!7296 m!138717))

(assert (=> b!95146 d!29672))

(declare-fun d!29674 () Bool)

(assert (=> d!29674 (= (head!592 listBits!13) (h!995 listBits!13))))

(assert (=> b!95146 d!29674))

(declare-fun d!29676 () Bool)

(assert (=> d!29676 (= (array_inv!1839 (buf!2383 base!8)) (bvsge (size!2025 (buf!2383 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95147 d!29676))

(declare-fun d!29678 () Bool)

(declare-fun size!2028 (List!880) Int)

(assert (=> d!29678 (= (length!471 listBits!13) (size!2028 listBits!13))))

(declare-fun bs!7297 () Bool)

(assert (= bs!7297 d!29678))

(declare-fun m!138723 () Bool)

(assert (=> bs!7297 m!138723))

(assert (=> b!95148 d!29678))

(push 1)

(assert (not b!95238))

(assert (not d!29664))

(assert (not b!95235))

(assert (not d!29610))

(assert (not d!29668))

(assert (not d!29642))

(assert (not d!29678))

(assert (not b!95265))

(assert (not b!95263))

(assert (not b!95241))

(assert (not d!29644))

(assert (not d!29604))

(assert (not d!29670))

(assert (not d!29640))

(assert (not b!95237))

(assert (not b!95240))

(assert (not b!95264))

(assert (not d!29672))

(assert (not b!95243))

(assert (not d!29646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

