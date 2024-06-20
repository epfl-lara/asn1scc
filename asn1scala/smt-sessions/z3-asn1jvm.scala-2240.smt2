; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56940 () Bool)

(assert start!56940)

(declare-fun res!218837 () Bool)

(declare-fun e!181927 () Bool)

(assert (=> start!56940 (=> (not res!218837) (not e!181927))))

(declare-datatypes ((array!14495 0))(
  ( (array!14496 (arr!7313 (Array (_ BitVec 32) (_ BitVec 8))) (size!6326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11574 0))(
  ( (BitStream!11575 (buf!6848 array!14495) (currentByte!12664 (_ BitVec 32)) (currentBit!12659 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11574)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56940 (= res!218837 (validate_offset_bit!0 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))) ((_ sign_extend 32) (currentByte!12664 thiss!914)) ((_ sign_extend 32) (currentBit!12659 thiss!914))))))

(assert (=> start!56940 e!181927))

(declare-fun e!181928 () Bool)

(declare-fun inv!12 (BitStream!11574) Bool)

(assert (=> start!56940 (and (inv!12 thiss!914) e!181928)))

(assert (=> start!56940 true))

(declare-fun b!261456 () Bool)

(declare-fun e!181929 () Bool)

(assert (=> b!261456 (= e!181927 (not e!181929))))

(declare-fun res!218836 () Bool)

(assert (=> b!261456 (=> res!218836 e!181929)))

(declare-datatypes ((Unit!18637 0))(
  ( (Unit!18638) )
))
(declare-datatypes ((tuple2!22378 0))(
  ( (tuple2!22379 (_1!12125 Unit!18637) (_2!12125 BitStream!11574)) )
))
(declare-fun lt!403375 () tuple2!22378)

(declare-fun increaseBitIndex!0 (BitStream!11574) tuple2!22378)

(assert (=> b!261456 (= res!218836 (not (= (size!6326 (buf!6848 thiss!914)) (size!6326 (buf!6848 (_2!12125 (increaseBitIndex!0 (_2!12125 lt!403375))))))))))

(declare-fun arrayRangesEq!951 (array!14495 array!14495 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261456 (arrayRangesEq!951 (buf!6848 thiss!914) (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) (size!6326 (buf!6848 thiss!914))) #b00000000000000000000000000000000 (currentByte!12664 (_2!12125 lt!403375)))))

(declare-fun lt!403374 () Unit!18637)

(declare-fun arrayUpdatedAtPrefixLemma!467 (array!14495 (_ BitVec 32) (_ BitVec 8)) Unit!18637)

(assert (=> b!261456 (= lt!403374 (arrayUpdatedAtPrefixLemma!467 (buf!6848 thiss!914) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18639 () Unit!18637)

(declare-fun Unit!18640 () Unit!18637)

(assert (=> b!261456 (= lt!403375 (ite b!187 (tuple2!22379 Unit!18639 (BitStream!11575 (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12659 thiss!914)))))) (size!6326 (buf!6848 thiss!914))) (currentByte!12664 thiss!914) (currentBit!12659 thiss!914))) (tuple2!22379 Unit!18640 (BitStream!11575 (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12659 thiss!914))))))) (size!6326 (buf!6848 thiss!914))) (currentByte!12664 thiss!914) (currentBit!12659 thiss!914)))))))

(declare-fun b!261457 () Bool)

(declare-fun lt!403373 () (_ BitVec 64))

(declare-fun lt!403376 () (_ BitVec 64))

(assert (=> b!261457 (= e!181929 (or (not (= lt!403373 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!403373 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403376) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261457 (= lt!403373 (bvand lt!403376 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261457 (= lt!403376 (bitIndex!0 (size!6326 (buf!6848 thiss!914)) (currentByte!12664 thiss!914) (currentBit!12659 thiss!914)))))

(declare-fun b!261458 () Bool)

(declare-fun array_inv!6067 (array!14495) Bool)

(assert (=> b!261458 (= e!181928 (array_inv!6067 (buf!6848 thiss!914)))))

(assert (= (and start!56940 res!218837) b!261456))

(assert (= (and b!261456 (not res!218836)) b!261457))

(assert (= start!56940 b!261458))

(declare-fun m!391323 () Bool)

(assert (=> start!56940 m!391323))

(declare-fun m!391325 () Bool)

(assert (=> start!56940 m!391325))

(declare-fun m!391327 () Bool)

(assert (=> b!261456 m!391327))

(declare-fun m!391329 () Bool)

(assert (=> b!261456 m!391329))

(declare-fun m!391331 () Bool)

(assert (=> b!261456 m!391331))

(declare-fun m!391333 () Bool)

(assert (=> b!261456 m!391333))

(declare-fun m!391335 () Bool)

(assert (=> b!261456 m!391335))

(declare-fun m!391337 () Bool)

(assert (=> b!261456 m!391337))

(declare-fun m!391339 () Bool)

(assert (=> b!261456 m!391339))

(declare-fun m!391341 () Bool)

(assert (=> b!261456 m!391341))

(assert (=> b!261456 m!391339))

(declare-fun m!391343 () Bool)

(assert (=> b!261456 m!391343))

(declare-fun m!391345 () Bool)

(assert (=> b!261457 m!391345))

(declare-fun m!391347 () Bool)

(assert (=> b!261458 m!391347))

(check-sat (not b!261457) (not b!261458) (not start!56940) (not b!261456))
(check-sat)
(get-model)

(declare-fun d!88132 () Bool)

(declare-fun e!181948 () Bool)

(assert (=> d!88132 e!181948))

(declare-fun res!218854 () Bool)

(assert (=> d!88132 (=> (not res!218854) (not e!181948))))

(declare-fun lt!403417 () (_ BitVec 64))

(declare-fun lt!403418 () (_ BitVec 64))

(declare-fun lt!403420 () (_ BitVec 64))

(assert (=> d!88132 (= res!218854 (= lt!403418 (bvsub lt!403420 lt!403417)))))

(assert (=> d!88132 (or (= (bvand lt!403420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403417 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403420 lt!403417) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88132 (= lt!403417 (remainingBits!0 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))) ((_ sign_extend 32) (currentByte!12664 thiss!914)) ((_ sign_extend 32) (currentBit!12659 thiss!914))))))

(declare-fun lt!403416 () (_ BitVec 64))

(declare-fun lt!403419 () (_ BitVec 64))

(assert (=> d!88132 (= lt!403420 (bvmul lt!403416 lt!403419))))

(assert (=> d!88132 (or (= lt!403416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403419 (bvsdiv (bvmul lt!403416 lt!403419) lt!403416)))))

(assert (=> d!88132 (= lt!403419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88132 (= lt!403416 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))))))

(assert (=> d!88132 (= lt!403418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12664 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12659 thiss!914))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88132 (invariant!0 (currentBit!12659 thiss!914) (currentByte!12664 thiss!914) (size!6326 (buf!6848 thiss!914)))))

(assert (=> d!88132 (= (bitIndex!0 (size!6326 (buf!6848 thiss!914)) (currentByte!12664 thiss!914) (currentBit!12659 thiss!914)) lt!403418)))

(declare-fun b!261478 () Bool)

(declare-fun res!218855 () Bool)

(assert (=> b!261478 (=> (not res!218855) (not e!181948))))

(assert (=> b!261478 (= res!218855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403418))))

(declare-fun b!261479 () Bool)

(declare-fun lt!403421 () (_ BitVec 64))

(assert (=> b!261479 (= e!181948 (bvsle lt!403418 (bvmul lt!403421 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261479 (or (= lt!403421 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403421 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403421)))))

(assert (=> b!261479 (= lt!403421 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))))))

(assert (= (and d!88132 res!218854) b!261478))

(assert (= (and b!261478 res!218855) b!261479))

(declare-fun m!391387 () Bool)

(assert (=> d!88132 m!391387))

(declare-fun m!391389 () Bool)

(assert (=> d!88132 m!391389))

(assert (=> b!261457 d!88132))

(declare-fun d!88140 () Bool)

(assert (=> d!88140 (= (array_inv!6067 (buf!6848 thiss!914)) (bvsge (size!6326 (buf!6848 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261458 d!88140))

(declare-fun d!88142 () Bool)

(assert (=> d!88142 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))) ((_ sign_extend 32) (currentByte!12664 thiss!914)) ((_ sign_extend 32) (currentBit!12659 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6326 (buf!6848 thiss!914))) ((_ sign_extend 32) (currentByte!12664 thiss!914)) ((_ sign_extend 32) (currentBit!12659 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22343 () Bool)

(assert (= bs!22343 d!88142))

(assert (=> bs!22343 m!391387))

(assert (=> start!56940 d!88142))

(declare-fun d!88146 () Bool)

(assert (=> d!88146 (= (inv!12 thiss!914) (invariant!0 (currentBit!12659 thiss!914) (currentByte!12664 thiss!914) (size!6326 (buf!6848 thiss!914))))))

(declare-fun bs!22344 () Bool)

(assert (= bs!22344 d!88146))

(assert (=> bs!22344 m!391389))

(assert (=> start!56940 d!88146))

(declare-fun d!88148 () Bool)

(declare-fun e!181975 () Bool)

(assert (=> d!88148 e!181975))

(declare-fun res!218890 () Bool)

(assert (=> d!88148 (=> (not res!218890) (not e!181975))))

(declare-fun lt!403474 () (_ BitVec 64))

(declare-fun lt!403471 () tuple2!22378)

(declare-fun lt!403472 () (_ BitVec 64))

(assert (=> d!88148 (= res!218890 (= (bvadd lt!403474 lt!403472) (bitIndex!0 (size!6326 (buf!6848 (_2!12125 lt!403471))) (currentByte!12664 (_2!12125 lt!403471)) (currentBit!12659 (_2!12125 lt!403471)))))))

(assert (=> d!88148 (or (not (= (bvand lt!403474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403472 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403474 lt!403472) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88148 (= lt!403472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88148 (= lt!403474 (bitIndex!0 (size!6326 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)) (currentBit!12659 (_2!12125 lt!403375))))))

(declare-fun Unit!18649 () Unit!18637)

(declare-fun Unit!18650 () Unit!18637)

(assert (=> d!88148 (= lt!403471 (ite (bvslt (currentBit!12659 (_2!12125 lt!403375)) #b00000000000000000000000000000111) (tuple2!22379 Unit!18649 (BitStream!11575 (buf!6848 (_2!12125 lt!403375)) (currentByte!12664 (_2!12125 lt!403375)) (bvadd (currentBit!12659 (_2!12125 lt!403375)) #b00000000000000000000000000000001))) (tuple2!22379 Unit!18650 (BitStream!11575 (buf!6848 (_2!12125 lt!403375)) (bvadd (currentByte!12664 (_2!12125 lt!403375)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88148 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6326 (buf!6848 (_2!12125 lt!403375)))) ((_ sign_extend 32) (currentByte!12664 (_2!12125 lt!403375))) ((_ sign_extend 32) (currentBit!12659 (_2!12125 lt!403375)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88148 (= (increaseBitIndex!0 (_2!12125 lt!403375)) lt!403471)))

(declare-fun b!261514 () Bool)

(declare-fun res!218891 () Bool)

(assert (=> b!261514 (=> (not res!218891) (not e!181975))))

(declare-fun lt!403475 () (_ BitVec 64))

(declare-fun lt!403473 () (_ BitVec 64))

(assert (=> b!261514 (= res!218891 (= (bvsub lt!403475 lt!403473) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261514 (or (= (bvand lt!403475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403475 lt!403473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261514 (= lt!403473 (remainingBits!0 ((_ sign_extend 32) (size!6326 (buf!6848 (_2!12125 lt!403471)))) ((_ sign_extend 32) (currentByte!12664 (_2!12125 lt!403471))) ((_ sign_extend 32) (currentBit!12659 (_2!12125 lt!403471)))))))

(assert (=> b!261514 (= lt!403475 (remainingBits!0 ((_ sign_extend 32) (size!6326 (buf!6848 (_2!12125 lt!403375)))) ((_ sign_extend 32) (currentByte!12664 (_2!12125 lt!403375))) ((_ sign_extend 32) (currentBit!12659 (_2!12125 lt!403375)))))))

(declare-fun b!261515 () Bool)

(assert (=> b!261515 (= e!181975 (= (size!6326 (buf!6848 (_2!12125 lt!403375))) (size!6326 (buf!6848 (_2!12125 lt!403471)))))))

(assert (= (and d!88148 res!218890) b!261514))

(assert (= (and b!261514 res!218891) b!261515))

(declare-fun m!391419 () Bool)

(assert (=> d!88148 m!391419))

(declare-fun m!391421 () Bool)

(assert (=> d!88148 m!391421))

(declare-fun m!391423 () Bool)

(assert (=> d!88148 m!391423))

(declare-fun m!391425 () Bool)

(assert (=> b!261514 m!391425))

(assert (=> b!261514 m!391423))

(assert (=> b!261456 d!88148))

(declare-fun d!88164 () Bool)

(declare-fun res!218896 () Bool)

(declare-fun e!181980 () Bool)

(assert (=> d!88164 (=> res!218896 e!181980)))

(assert (=> d!88164 (= res!218896 (= #b00000000000000000000000000000000 (currentByte!12664 (_2!12125 lt!403375))))))

(assert (=> d!88164 (= (arrayRangesEq!951 (buf!6848 thiss!914) (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) (size!6326 (buf!6848 thiss!914))) #b00000000000000000000000000000000 (currentByte!12664 (_2!12125 lt!403375))) e!181980)))

(declare-fun b!261520 () Bool)

(declare-fun e!181981 () Bool)

(assert (=> b!261520 (= e!181980 e!181981)))

(declare-fun res!218897 () Bool)

(assert (=> b!261520 (=> (not res!218897) (not e!181981))))

(assert (=> b!261520 (= res!218897 (= (select (arr!7313 (buf!6848 thiss!914)) #b00000000000000000000000000000000) (select (arr!7313 (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) (size!6326 (buf!6848 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261521 () Bool)

(assert (=> b!261521 (= e!181981 (arrayRangesEq!951 (buf!6848 thiss!914) (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) (size!6326 (buf!6848 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12664 (_2!12125 lt!403375))))))

(assert (= (and d!88164 (not res!218896)) b!261520))

(assert (= (and b!261520 res!218897) b!261521))

(declare-fun m!391427 () Bool)

(assert (=> b!261520 m!391427))

(declare-fun m!391429 () Bool)

(assert (=> b!261520 m!391429))

(declare-fun m!391431 () Bool)

(assert (=> b!261521 m!391431))

(assert (=> b!261456 d!88164))

(declare-fun d!88166 () Bool)

(declare-fun e!181987 () Bool)

(assert (=> d!88166 e!181987))

(declare-fun res!218906 () Bool)

(assert (=> d!88166 (=> (not res!218906) (not e!181987))))

(assert (=> d!88166 (= res!218906 (and (bvsge (currentByte!12664 (_2!12125 lt!403375)) #b00000000000000000000000000000000) (bvslt (currentByte!12664 (_2!12125 lt!403375)) (size!6326 (buf!6848 thiss!914)))))))

(declare-fun lt!403496 () Unit!18637)

(declare-fun choose!361 (array!14495 (_ BitVec 32) (_ BitVec 8)) Unit!18637)

(assert (=> d!88166 (= lt!403496 (choose!361 (buf!6848 thiss!914) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))))))

(assert (=> d!88166 (and (bvsle #b00000000000000000000000000000000 (currentByte!12664 (_2!12125 lt!403375))) (bvslt (currentByte!12664 (_2!12125 lt!403375)) (size!6326 (buf!6848 thiss!914))))))

(assert (=> d!88166 (= (arrayUpdatedAtPrefixLemma!467 (buf!6848 thiss!914) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) lt!403496)))

(declare-fun b!261530 () Bool)

(assert (=> b!261530 (= e!181987 (arrayRangesEq!951 (buf!6848 thiss!914) (array!14496 (store (arr!7313 (buf!6848 thiss!914)) (currentByte!12664 (_2!12125 lt!403375)) (select (arr!7313 (buf!6848 (_2!12125 lt!403375))) (currentByte!12664 (_2!12125 lt!403375)))) (size!6326 (buf!6848 thiss!914))) #b00000000000000000000000000000000 (currentByte!12664 (_2!12125 lt!403375))))))

(assert (= (and d!88166 res!218906) b!261530))

(assert (=> d!88166 m!391339))

(declare-fun m!391433 () Bool)

(assert (=> d!88166 m!391433))

(assert (=> b!261530 m!391327))

(assert (=> b!261530 m!391331))

(assert (=> b!261456 d!88166))

(check-sat (not d!88132) (not b!261521) (not d!88166) (not b!261514) (not b!261530) (not d!88142) (not d!88146) (not d!88148))
