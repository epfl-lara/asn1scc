; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47750 () Bool)

(assert start!47750)

(declare-fun e!155544 () Bool)

(declare-datatypes ((array!11417 0))(
  ( (array!11418 (arr!5983 (Array (_ BitVec 32) (_ BitVec 8))) (size!5008 (_ BitVec 32))) )
))
(declare-fun lt!363205 () array!11417)

(declare-fun b!227309 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((BitStream!9112 0))(
  ( (BitStream!9113 (buf!5549 array!11417) (currentByte!10387 (_ BitVec 32)) (currentBit!10382 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16959 0))(
  ( (Unit!16960) )
))
(declare-datatypes ((tuple3!1398 0))(
  ( (tuple3!1399 (_1!10610 Unit!16959) (_2!10610 BitStream!9112) (_3!841 array!11417)) )
))
(declare-fun lt!363202 () tuple3!1398)

(declare-fun arrayRangesEq!844 (array!11417 array!11417 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227309 (= e!155544 (arrayRangesEq!844 lt!363205 (_3!841 lt!363202) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227310 () Bool)

(declare-fun res!190699 () Bool)

(declare-fun e!155542 () Bool)

(assert (=> b!227310 (=> (not res!190699) (not e!155542))))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227310 (= res!190699 (bvslt i!761 to!496))))

(declare-fun b!227311 () Bool)

(assert (=> b!227311 (= e!155542 (not e!155544))))

(declare-fun res!190702 () Bool)

(assert (=> b!227311 (=> res!190702 e!155544)))

(declare-fun arr!308 () array!11417)

(assert (=> b!227311 (= res!190702 (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt i!761 (size!5008 arr!308)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5008 arr!308))))))

(assert (=> b!227311 (arrayRangesEq!844 arr!308 lt!363205 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19538 0))(
  ( (tuple2!19539 (_1!10611 (_ BitVec 8)) (_2!10611 BitStream!9112)) )
))
(declare-fun lt!363207 () tuple2!19538)

(declare-fun lt!363209 () Unit!16959)

(declare-fun arrayUpdatedAtPrefixLemma!403 (array!11417 (_ BitVec 32) (_ BitVec 8)) Unit!16959)

(assert (=> b!227311 (= lt!363209 (arrayUpdatedAtPrefixLemma!403 arr!308 i!761 (_1!10611 lt!363207)))))

(declare-fun thiss!1870 () BitStream!9112)

(declare-fun lt!363208 () (_ BitVec 64))

(declare-fun lt!363204 () (_ BitVec 64))

(declare-fun lt!363203 () (_ BitVec 64))

(declare-fun lt!363206 () (_ BitVec 32))

(assert (=> b!227311 (and (= (bvadd lt!363208 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363206))) lt!363204) (= (bvadd lt!363203 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363204) (= (buf!5549 thiss!1870) (buf!5549 (_2!10610 lt!363202))) (= (size!5008 arr!308) (size!5008 (_3!841 lt!363202))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227311 (= lt!363204 (bitIndex!0 (size!5008 (buf!5549 (_2!10610 lt!363202))) (currentByte!10387 (_2!10610 lt!363202)) (currentBit!10382 (_2!10610 lt!363202))))))

(assert (=> b!227311 (= lt!363208 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363203))))

(assert (=> b!227311 (= lt!363208 (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363207))) (currentByte!10387 (_2!10611 lt!363207)) (currentBit!10382 (_2!10611 lt!363207))))))

(assert (=> b!227311 (= lt!363203 (bitIndex!0 (size!5008 (buf!5549 thiss!1870)) (currentByte!10387 thiss!1870) (currentBit!10382 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9112 array!11417 (_ BitVec 32) (_ BitVec 32)) tuple3!1398)

(assert (=> b!227311 (= lt!363202 (readByteArrayLoop!0 (_2!10611 lt!363207) lt!363205 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227311 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207))) lt!363206)))

(assert (=> b!227311 (= lt!363206 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363210 () Unit!16959)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9112 BitStream!9112 (_ BitVec 64) (_ BitVec 32)) Unit!16959)

(assert (=> b!227311 (= lt!363210 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10611 lt!363207) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227311 (= lt!363205 (array!11418 (store (arr!5983 arr!308) i!761 (_1!10611 lt!363207)) (size!5008 arr!308)))))

(declare-fun readByte!0 (BitStream!9112) tuple2!19538)

(assert (=> b!227311 (= lt!363207 (readByte!0 thiss!1870))))

(declare-fun b!227312 () Bool)

(declare-fun res!190700 () Bool)

(assert (=> b!227312 (=> (not res!190700) (not e!155542))))

(assert (=> b!227312 (= res!190700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))) ((_ sign_extend 32) (currentByte!10387 thiss!1870)) ((_ sign_extend 32) (currentBit!10382 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227313 () Bool)

(declare-fun e!155541 () Bool)

(declare-fun array_inv!4749 (array!11417) Bool)

(assert (=> b!227313 (= e!155541 (array_inv!4749 (buf!5549 thiss!1870)))))

(declare-fun res!190701 () Bool)

(assert (=> start!47750 (=> (not res!190701) (not e!155542))))

(assert (=> start!47750 (= res!190701 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5008 arr!308))))))

(assert (=> start!47750 e!155542))

(assert (=> start!47750 true))

(assert (=> start!47750 (array_inv!4749 arr!308)))

(declare-fun inv!12 (BitStream!9112) Bool)

(assert (=> start!47750 (and (inv!12 thiss!1870) e!155541)))

(assert (= (and start!47750 res!190701) b!227312))

(assert (= (and b!227312 res!190700) b!227310))

(assert (= (and b!227310 res!190699) b!227311))

(assert (= (and b!227311 (not res!190702)) b!227309))

(assert (= start!47750 b!227313))

(declare-fun m!349555 () Bool)

(assert (=> b!227313 m!349555))

(declare-fun m!349557 () Bool)

(assert (=> b!227309 m!349557))

(declare-fun m!349559 () Bool)

(assert (=> start!47750 m!349559))

(declare-fun m!349561 () Bool)

(assert (=> start!47750 m!349561))

(declare-fun m!349563 () Bool)

(assert (=> b!227312 m!349563))

(declare-fun m!349565 () Bool)

(assert (=> b!227311 m!349565))

(declare-fun m!349567 () Bool)

(assert (=> b!227311 m!349567))

(declare-fun m!349569 () Bool)

(assert (=> b!227311 m!349569))

(declare-fun m!349571 () Bool)

(assert (=> b!227311 m!349571))

(declare-fun m!349573 () Bool)

(assert (=> b!227311 m!349573))

(declare-fun m!349575 () Bool)

(assert (=> b!227311 m!349575))

(declare-fun m!349577 () Bool)

(assert (=> b!227311 m!349577))

(declare-fun m!349579 () Bool)

(assert (=> b!227311 m!349579))

(declare-fun m!349581 () Bool)

(assert (=> b!227311 m!349581))

(declare-fun m!349583 () Bool)

(assert (=> b!227311 m!349583))

(push 1)

(assert (not b!227311))

(assert (not b!227312))

(assert (not b!227309))

(assert (not b!227313))

(assert (not start!47750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77130 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77130 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))) ((_ sign_extend 32) (currentByte!10387 thiss!1870)) ((_ sign_extend 32) (currentBit!10382 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))) ((_ sign_extend 32) (currentByte!10387 thiss!1870)) ((_ sign_extend 32) (currentBit!10382 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18861 () Bool)

(assert (= bs!18861 d!77130))

(declare-fun m!349645 () Bool)

(assert (=> bs!18861 m!349645))

(assert (=> b!227312 d!77130))

(declare-fun d!77132 () Bool)

(assert (=> d!77132 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207))) lt!363206) (bvsle ((_ sign_extend 32) lt!363206) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18862 () Bool)

(assert (= bs!18862 d!77132))

(declare-fun m!349647 () Bool)

(assert (=> bs!18862 m!349647))

(assert (=> b!227311 d!77132))

(declare-fun d!77134 () Bool)

(declare-fun e!155580 () Bool)

(assert (=> d!77134 e!155580))

(declare-fun res!190736 () Bool)

(assert (=> d!77134 (=> (not res!190736) (not e!155580))))

(declare-fun lt!363291 () (_ BitVec 64))

(declare-fun lt!363292 () (_ BitVec 64))

(declare-fun lt!363290 () (_ BitVec 64))

(assert (=> d!77134 (= res!190736 (= lt!363290 (bvsub lt!363292 lt!363291)))))

(assert (=> d!77134 (or (= (bvand lt!363292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363292 lt!363291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77134 (= lt!363291 (remainingBits!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207)))))))

(declare-fun lt!363294 () (_ BitVec 64))

(declare-fun lt!363289 () (_ BitVec 64))

(assert (=> d!77134 (= lt!363292 (bvmul lt!363294 lt!363289))))

(assert (=> d!77134 (or (= lt!363294 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363289 (bvsdiv (bvmul lt!363294 lt!363289) lt!363294)))))

(assert (=> d!77134 (= lt!363289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77134 (= lt!363294 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))))))

(assert (=> d!77134 (= lt!363290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77134 (invariant!0 (currentBit!10382 (_2!10611 lt!363207)) (currentByte!10387 (_2!10611 lt!363207)) (size!5008 (buf!5549 (_2!10611 lt!363207))))))

(assert (=> d!77134 (= (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363207))) (currentByte!10387 (_2!10611 lt!363207)) (currentBit!10382 (_2!10611 lt!363207))) lt!363290)))

(declare-fun b!227352 () Bool)

(declare-fun res!190735 () Bool)

(assert (=> b!227352 (=> (not res!190735) (not e!155580))))

(assert (=> b!227352 (= res!190735 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363290))))

(declare-fun b!227353 () Bool)

(declare-fun lt!363293 () (_ BitVec 64))

(assert (=> b!227353 (= e!155580 (bvsle lt!363290 (bvmul lt!363293 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227353 (or (= lt!363293 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363293 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363293)))))

(assert (=> b!227353 (= lt!363293 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))))))

(assert (= (and d!77134 res!190736) b!227352))

(assert (= (and b!227352 res!190735) b!227353))

(assert (=> d!77134 m!349647))

(declare-fun m!349649 () Bool)

(assert (=> d!77134 m!349649))

(assert (=> b!227311 d!77134))

(declare-fun d!77136 () Bool)

(declare-fun e!155581 () Bool)

(assert (=> d!77136 e!155581))

(declare-fun res!190738 () Bool)

(assert (=> d!77136 (=> (not res!190738) (not e!155581))))

(declare-fun lt!363298 () (_ BitVec 64))

(declare-fun lt!363296 () (_ BitVec 64))

(declare-fun lt!363297 () (_ BitVec 64))

(assert (=> d!77136 (= res!190738 (= lt!363296 (bvsub lt!363298 lt!363297)))))

(assert (=> d!77136 (or (= (bvand lt!363298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363298 lt!363297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77136 (= lt!363297 (remainingBits!0 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))) ((_ sign_extend 32) (currentByte!10387 thiss!1870)) ((_ sign_extend 32) (currentBit!10382 thiss!1870))))))

(declare-fun lt!363300 () (_ BitVec 64))

(declare-fun lt!363295 () (_ BitVec 64))

(assert (=> d!77136 (= lt!363298 (bvmul lt!363300 lt!363295))))

(assert (=> d!77136 (or (= lt!363300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363295 (bvsdiv (bvmul lt!363300 lt!363295) lt!363300)))))

(assert (=> d!77136 (= lt!363295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77136 (= lt!363300 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))))))

(assert (=> d!77136 (= lt!363296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10387 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10382 thiss!1870))))))

(assert (=> d!77136 (invariant!0 (currentBit!10382 thiss!1870) (currentByte!10387 thiss!1870) (size!5008 (buf!5549 thiss!1870)))))

(assert (=> d!77136 (= (bitIndex!0 (size!5008 (buf!5549 thiss!1870)) (currentByte!10387 thiss!1870) (currentBit!10382 thiss!1870)) lt!363296)))

(declare-fun b!227354 () Bool)

(declare-fun res!190737 () Bool)

(assert (=> b!227354 (=> (not res!190737) (not e!155581))))

(assert (=> b!227354 (= res!190737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363296))))

(declare-fun b!227355 () Bool)

(declare-fun lt!363299 () (_ BitVec 64))

(assert (=> b!227355 (= e!155581 (bvsle lt!363296 (bvmul lt!363299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227355 (or (= lt!363299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363299)))))

(assert (=> b!227355 (= lt!363299 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))))))

(assert (= (and d!77136 res!190738) b!227354))

(assert (= (and b!227354 res!190737) b!227355))

(assert (=> d!77136 m!349645))

(declare-fun m!349651 () Bool)

(assert (=> d!77136 m!349651))

(assert (=> b!227311 d!77136))

(declare-fun d!77138 () Bool)

(declare-fun e!155583 () Bool)

(assert (=> d!77138 e!155583))

(declare-fun res!190742 () Bool)

(assert (=> d!77138 (=> (not res!190742) (not e!155583))))

(declare-fun lt!363308 () (_ BitVec 64))

(declare-fun lt!363310 () (_ BitVec 64))

(declare-fun lt!363309 () (_ BitVec 64))

(assert (=> d!77138 (= res!190742 (= lt!363308 (bvsub lt!363310 lt!363309)))))

(assert (=> d!77138 (or (= (bvand lt!363310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363310 lt!363309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77138 (= lt!363309 (remainingBits!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10610 lt!363202)))) ((_ sign_extend 32) (currentByte!10387 (_2!10610 lt!363202))) ((_ sign_extend 32) (currentBit!10382 (_2!10610 lt!363202)))))))

(declare-fun lt!363312 () (_ BitVec 64))

(declare-fun lt!363307 () (_ BitVec 64))

(assert (=> d!77138 (= lt!363310 (bvmul lt!363312 lt!363307))))

(assert (=> d!77138 (or (= lt!363312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363307 (bvsdiv (bvmul lt!363312 lt!363307) lt!363312)))))

(assert (=> d!77138 (= lt!363307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77138 (= lt!363312 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10610 lt!363202)))))))

(assert (=> d!77138 (= lt!363308 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10387 (_2!10610 lt!363202))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10382 (_2!10610 lt!363202)))))))

(assert (=> d!77138 (invariant!0 (currentBit!10382 (_2!10610 lt!363202)) (currentByte!10387 (_2!10610 lt!363202)) (size!5008 (buf!5549 (_2!10610 lt!363202))))))

(assert (=> d!77138 (= (bitIndex!0 (size!5008 (buf!5549 (_2!10610 lt!363202))) (currentByte!10387 (_2!10610 lt!363202)) (currentBit!10382 (_2!10610 lt!363202))) lt!363308)))

(declare-fun b!227358 () Bool)

(declare-fun res!190741 () Bool)

(assert (=> b!227358 (=> (not res!190741) (not e!155583))))

(assert (=> b!227358 (= res!190741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363308))))

(declare-fun b!227359 () Bool)

(declare-fun lt!363311 () (_ BitVec 64))

(assert (=> b!227359 (= e!155583 (bvsle lt!363308 (bvmul lt!363311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227359 (or (= lt!363311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363311)))))

(assert (=> b!227359 (= lt!363311 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10610 lt!363202)))))))

(assert (= (and d!77138 res!190742) b!227358))

(assert (= (and b!227358 res!190741) b!227359))

(declare-fun m!349657 () Bool)

(assert (=> d!77138 m!349657))

(declare-fun m!349659 () Bool)

(assert (=> d!77138 m!349659))

(assert (=> b!227311 d!77138))

(declare-fun d!77142 () Bool)

(declare-fun e!155586 () Bool)

(assert (=> d!77142 e!155586))

(declare-fun res!190745 () Bool)

(assert (=> d!77142 (=> (not res!190745) (not e!155586))))

(assert (=> d!77142 (= res!190745 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5008 arr!308))))))

(declare-fun lt!363315 () Unit!16959)

(declare-fun choose!316 (array!11417 (_ BitVec 32) (_ BitVec 8)) Unit!16959)

(assert (=> d!77142 (= lt!363315 (choose!316 arr!308 i!761 (_1!10611 lt!363207)))))

(assert (=> d!77142 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5008 arr!308)))))

(assert (=> d!77142 (= (arrayUpdatedAtPrefixLemma!403 arr!308 i!761 (_1!10611 lt!363207)) lt!363315)))

(declare-fun b!227362 () Bool)

(assert (=> b!227362 (= e!155586 (arrayRangesEq!844 arr!308 (array!11418 (store (arr!5983 arr!308) i!761 (_1!10611 lt!363207)) (size!5008 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77142 res!190745) b!227362))

(declare-fun m!349665 () Bool)

(assert (=> d!77142 m!349665))

(assert (=> b!227362 m!349583))

(declare-fun m!349667 () Bool)

(assert (=> b!227362 m!349667))

(assert (=> b!227311 d!77142))

(declare-fun d!77154 () Bool)

(declare-fun res!190756 () Bool)

(declare-fun e!155597 () Bool)

(assert (=> d!77154 (=> res!190756 e!155597)))

(assert (=> d!77154 (= res!190756 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77154 (= (arrayRangesEq!844 arr!308 lt!363205 #b00000000000000000000000000000000 i!761) e!155597)))

(declare-fun b!227373 () Bool)

(declare-fun e!155598 () Bool)

(assert (=> b!227373 (= e!155597 e!155598)))

(declare-fun res!190757 () Bool)

(assert (=> b!227373 (=> (not res!190757) (not e!155598))))

(assert (=> b!227373 (= res!190757 (= (select (arr!5983 arr!308) #b00000000000000000000000000000000) (select (arr!5983 lt!363205) #b00000000000000000000000000000000)))))

(declare-fun b!227374 () Bool)

(assert (=> b!227374 (= e!155598 (arrayRangesEq!844 arr!308 lt!363205 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77154 (not res!190756)) b!227373))

(assert (= (and b!227373 res!190757) b!227374))

(declare-fun m!349675 () Bool)

(assert (=> b!227373 m!349675))

(declare-fun m!349677 () Bool)

(assert (=> b!227373 m!349677))

(declare-fun m!349679 () Bool)

(assert (=> b!227374 m!349679))

(assert (=> b!227311 d!77154))

(declare-fun d!77158 () Bool)

(declare-fun lt!363348 () (_ BitVec 8))

(declare-fun lt!363350 () (_ BitVec 8))

(assert (=> d!77158 (= lt!363348 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5983 (buf!5549 thiss!1870)) (currentByte!10387 thiss!1870))) ((_ sign_extend 24) lt!363350))))))

(assert (=> d!77158 (= lt!363350 ((_ extract 7 0) (currentBit!10382 thiss!1870)))))

(declare-fun e!155607 () Bool)

(assert (=> d!77158 e!155607))

(declare-fun res!190770 () Bool)

(assert (=> d!77158 (=> (not res!190770) (not e!155607))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77158 (= res!190770 (validate_offset_bits!1 ((_ sign_extend 32) (size!5008 (buf!5549 thiss!1870))) ((_ sign_extend 32) (currentByte!10387 thiss!1870)) ((_ sign_extend 32) (currentBit!10382 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19544 0))(
  ( (tuple2!19545 (_1!10616 Unit!16959) (_2!10616 (_ BitVec 8))) )
))
(declare-fun Unit!16965 () Unit!16959)

(declare-fun Unit!16966 () Unit!16959)

(assert (=> d!77158 (= (readByte!0 thiss!1870) (tuple2!19539 (_2!10616 (ite (bvsgt ((_ sign_extend 24) lt!363350) #b00000000000000000000000000000000) (tuple2!19545 Unit!16965 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!363348) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5983 (buf!5549 thiss!1870)) (bvadd (currentByte!10387 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!363350)))))))) (tuple2!19545 Unit!16966 lt!363348))) (BitStream!9113 (buf!5549 thiss!1870) (bvadd (currentByte!10387 thiss!1870) #b00000000000000000000000000000001) (currentBit!10382 thiss!1870))))))

(declare-fun b!227385 () Bool)

(declare-fun e!155606 () Bool)

(assert (=> b!227385 (= e!155607 e!155606)))

(declare-fun res!190771 () Bool)

(assert (=> b!227385 (=> (not res!190771) (not e!155606))))

(declare-fun lt!363353 () tuple2!19538)

(assert (=> b!227385 (= res!190771 (= (buf!5549 (_2!10611 lt!363353)) (buf!5549 thiss!1870)))))

(declare-fun lt!363351 () (_ BitVec 8))

(declare-fun lt!363354 () (_ BitVec 8))

(declare-fun Unit!16967 () Unit!16959)

(declare-fun Unit!16968 () Unit!16959)

(assert (=> b!227385 (= lt!363353 (tuple2!19539 (_2!10616 (ite (bvsgt ((_ sign_extend 24) lt!363351) #b00000000000000000000000000000000) (tuple2!19545 Unit!16967 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!363354) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5983 (buf!5549 thiss!1870)) (bvadd (currentByte!10387 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!363351)))))))) (tuple2!19545 Unit!16968 lt!363354))) (BitStream!9113 (buf!5549 thiss!1870) (bvadd (currentByte!10387 thiss!1870) #b00000000000000000000000000000001) (currentBit!10382 thiss!1870))))))

(assert (=> b!227385 (= lt!363354 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5983 (buf!5549 thiss!1870)) (currentByte!10387 thiss!1870))) ((_ sign_extend 24) lt!363351))))))

(assert (=> b!227385 (= lt!363351 ((_ extract 7 0) (currentBit!10382 thiss!1870)))))

(declare-fun b!227386 () Bool)

(declare-fun lt!363349 () (_ BitVec 64))

(declare-fun lt!363352 () (_ BitVec 64))

(assert (=> b!227386 (= e!155606 (= (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363353))) (currentByte!10387 (_2!10611 lt!363353)) (currentBit!10382 (_2!10611 lt!363353))) (bvadd lt!363349 lt!363352)))))

(assert (=> b!227386 (or (not (= (bvand lt!363349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363352 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!363349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!363349 lt!363352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227386 (= lt!363352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227386 (= lt!363349 (bitIndex!0 (size!5008 (buf!5549 thiss!1870)) (currentByte!10387 thiss!1870) (currentBit!10382 thiss!1870)))))

(assert (= (and d!77158 res!190770) b!227385))

(assert (= (and b!227385 res!190771) b!227386))

(declare-fun m!349685 () Bool)

(assert (=> d!77158 m!349685))

(declare-fun m!349687 () Bool)

(assert (=> d!77158 m!349687))

(declare-fun m!349689 () Bool)

(assert (=> d!77158 m!349689))

(assert (=> b!227385 m!349689))

(assert (=> b!227385 m!349685))

(declare-fun m!349691 () Bool)

(assert (=> b!227386 m!349691))

(assert (=> b!227386 m!349579))

(assert (=> b!227311 d!77158))

(declare-fun b!227409 () Bool)

(declare-fun e!155625 () tuple3!1398)

(declare-fun lt!363527 () Unit!16959)

(declare-fun lt!363553 () tuple3!1398)

(assert (=> b!227409 (= e!155625 (tuple3!1399 lt!363527 (_2!10610 lt!363553) (_3!841 lt!363553)))))

(declare-fun lt!363540 () tuple2!19538)

(assert (=> b!227409 (= lt!363540 (readByte!0 (_2!10611 lt!363207)))))

(declare-fun lt!363531 () array!11417)

(assert (=> b!227409 (= lt!363531 (array!11418 (store (arr!5983 lt!363205) (bvadd #b00000000000000000000000000000001 i!761) (_1!10611 lt!363540)) (size!5008 lt!363205)))))

(declare-fun lt!363547 () (_ BitVec 64))

(assert (=> b!227409 (= lt!363547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!363544 () (_ BitVec 32))

(assert (=> b!227409 (= lt!363544 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363551 () Unit!16959)

(assert (=> b!227409 (= lt!363551 (validateOffsetBytesFromBitIndexLemma!0 (_2!10611 lt!363207) (_2!10611 lt!363540) lt!363547 lt!363544))))

(assert (=> b!227409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363540)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363540))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363540))) (bvsub lt!363544 ((_ extract 31 0) (bvsdiv (bvadd lt!363547 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!363524 () Unit!16959)

(assert (=> b!227409 (= lt!363524 lt!363551)))

(assert (=> b!227409 (= lt!363553 (readByteArrayLoop!0 (_2!10611 lt!363540) lt!363531 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3842 () (_ BitVec 64))

(assert (=> b!227409 (= (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363540))) (currentByte!10387 (_2!10611 lt!363540)) (currentBit!10382 (_2!10611 lt!363540))) (bvadd call!3842 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!363528 () Unit!16959)

(declare-fun Unit!16973 () Unit!16959)

(assert (=> b!227409 (= lt!363528 Unit!16973)))

(assert (=> b!227409 (= (bvadd (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363540))) (currentByte!10387 (_2!10611 lt!363540)) (currentBit!10382 (_2!10611 lt!363540))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5008 (buf!5549 (_2!10610 lt!363553))) (currentByte!10387 (_2!10610 lt!363553)) (currentBit!10382 (_2!10610 lt!363553))))))

(declare-fun lt!363522 () Unit!16959)

(declare-fun Unit!16974 () Unit!16959)

(assert (=> b!227409 (= lt!363522 Unit!16974)))

(assert (=> b!227409 (= (bvadd call!3842 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5008 (buf!5549 (_2!10610 lt!363553))) (currentByte!10387 (_2!10610 lt!363553)) (currentBit!10382 (_2!10610 lt!363553))))))

(declare-fun lt!363549 () Unit!16959)

(declare-fun Unit!16975 () Unit!16959)

(assert (=> b!227409 (= lt!363549 Unit!16975)))

(assert (=> b!227409 (and (= (buf!5549 (_2!10611 lt!363207)) (buf!5549 (_2!10610 lt!363553))) (= (size!5008 lt!363205) (size!5008 (_3!841 lt!363553))))))

(declare-fun lt!363546 () Unit!16959)

(declare-fun Unit!16976 () Unit!16959)

(assert (=> b!227409 (= lt!363546 Unit!16976)))

(declare-fun lt!363532 () Unit!16959)

(assert (=> b!227409 (= lt!363532 (arrayUpdatedAtPrefixLemma!403 lt!363205 (bvadd #b00000000000000000000000000000001 i!761) (_1!10611 lt!363540)))))

(declare-fun call!3843 () Bool)

(assert (=> b!227409 call!3843))

(declare-fun lt!363523 () Unit!16959)

(assert (=> b!227409 (= lt!363523 lt!363532)))

(declare-fun lt!363535 () (_ BitVec 32))

(assert (=> b!227409 (= lt!363535 #b00000000000000000000000000000000)))

(declare-fun lt!363534 () Unit!16959)

(declare-fun arrayRangesEqTransitive!267 (array!11417 array!11417 array!11417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16959)

(assert (=> b!227409 (= lt!363534 (arrayRangesEqTransitive!267 lt!363205 lt!363531 (_3!841 lt!363553) lt!363535 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227409 (arrayRangesEq!844 lt!363205 (_3!841 lt!363553) lt!363535 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!363552 () Unit!16959)

(assert (=> b!227409 (= lt!363552 lt!363534)))

(declare-fun call!3841 () Bool)

(assert (=> b!227409 call!3841))

(declare-fun lt!363529 () Unit!16959)

(declare-fun Unit!16977 () Unit!16959)

(assert (=> b!227409 (= lt!363529 Unit!16977)))

(declare-fun lt!363526 () Unit!16959)

(declare-fun arrayRangesEqImpliesEq!118 (array!11417 array!11417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16959)

(assert (=> b!227409 (= lt!363526 (arrayRangesEqImpliesEq!118 lt!363531 (_3!841 lt!363553) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227409 (= (select (store (arr!5983 lt!363205) (bvadd #b00000000000000000000000000000001 i!761) (_1!10611 lt!363540)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5983 (_3!841 lt!363553)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363543 () Unit!16959)

(assert (=> b!227409 (= lt!363543 lt!363526)))

(declare-fun lt!363550 () Bool)

(assert (=> b!227409 (= lt!363550 (= (select (arr!5983 (_3!841 lt!363553)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10611 lt!363540)))))

(declare-fun Unit!16978 () Unit!16959)

(assert (=> b!227409 (= lt!363527 Unit!16978)))

(assert (=> b!227409 lt!363550))

(declare-fun b!227410 () Bool)

(declare-fun res!190788 () Bool)

(declare-fun e!155624 () Bool)

(assert (=> b!227410 (=> (not res!190788) (not e!155624))))

(declare-fun lt!363548 () tuple3!1398)

(assert (=> b!227410 (= res!190788 (and (= (buf!5549 (_2!10611 lt!363207)) (buf!5549 (_2!10610 lt!363548))) (= (size!5008 lt!363205) (size!5008 (_3!841 lt!363548)))))))

(declare-fun bm!3838 () Bool)

(assert (=> bm!3838 (= call!3842 (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363207))) (currentByte!10387 (_2!10611 lt!363207)) (currentBit!10382 (_2!10611 lt!363207))))))

(declare-fun bm!3839 () Bool)

(declare-fun c!11208 () Bool)

(assert (=> bm!3839 (= call!3843 (arrayRangesEq!844 lt!363205 (ite c!11208 (array!11418 (store (arr!5983 lt!363205) (bvadd #b00000000000000000000000000000001 i!761) (_1!10611 lt!363540)) (size!5008 lt!363205)) lt!363205) #b00000000000000000000000000000000 (ite c!11208 (bvadd #b00000000000000000000000000000001 i!761) (size!5008 lt!363205))))))

(declare-fun b!227411 () Bool)

(declare-fun lt!363554 () Unit!16959)

(assert (=> b!227411 (= e!155625 (tuple3!1399 lt!363554 (_2!10611 lt!363207) lt!363205))))

(assert (=> b!227411 (= call!3842 call!3842)))

(declare-fun lt!363539 () Unit!16959)

(declare-fun Unit!16979 () Unit!16959)

(assert (=> b!227411 (= lt!363539 Unit!16979)))

(declare-fun lt!363555 () Unit!16959)

(declare-fun arrayRangesEqReflexiveLemma!133 (array!11417) Unit!16959)

(assert (=> b!227411 (= lt!363555 (arrayRangesEqReflexiveLemma!133 lt!363205))))

(assert (=> b!227411 call!3843))

(declare-fun lt!363530 () Unit!16959)

(assert (=> b!227411 (= lt!363530 lt!363555)))

(declare-fun lt!363538 () array!11417)

(assert (=> b!227411 (= lt!363538 lt!363205)))

(declare-fun lt!363541 () array!11417)

(assert (=> b!227411 (= lt!363541 lt!363205)))

(declare-fun lt!363545 () (_ BitVec 32))

(assert (=> b!227411 (= lt!363545 #b00000000000000000000000000000000)))

(declare-fun lt!363556 () (_ BitVec 32))

(assert (=> b!227411 (= lt!363556 (size!5008 lt!363205))))

(declare-fun lt!363542 () (_ BitVec 32))

(assert (=> b!227411 (= lt!363542 #b00000000000000000000000000000000)))

(declare-fun lt!363525 () (_ BitVec 32))

(assert (=> b!227411 (= lt!363525 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!118 (array!11417 array!11417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16959)

(assert (=> b!227411 (= lt!363554 (arrayRangesEqSlicedLemma!118 lt!363538 lt!363541 lt!363545 lt!363556 lt!363542 lt!363525))))

(assert (=> b!227411 call!3841))

(declare-fun b!227412 () Bool)

(declare-fun e!155626 () Bool)

(declare-datatypes ((tuple2!19550 0))(
  ( (tuple2!19551 (_1!10619 BitStream!9112) (_2!10619 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9112) tuple2!19550)

(assert (=> b!227412 (= e!155626 (= (select (arr!5983 (_3!841 lt!363548)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10619 (readBytePure!0 (_2!10611 lt!363207)))))))

(assert (=> b!227412 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5008 (_3!841 lt!363548))))))

(declare-fun bm!3840 () Bool)

(assert (=> bm!3840 (= call!3841 (arrayRangesEq!844 (ite c!11208 lt!363205 lt!363538) (ite c!11208 (_3!841 lt!363553) lt!363541) (ite c!11208 #b00000000000000000000000000000000 lt!363542) (ite c!11208 (bvadd #b00000000000000000000000000000001 i!761) lt!363525)))))

(declare-fun b!227413 () Bool)

(assert (=> b!227413 (= e!155624 (arrayRangesEq!844 lt!363205 (_3!841 lt!363548) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!77162 () Bool)

(assert (=> d!77162 e!155626))

(declare-fun res!190786 () Bool)

(assert (=> d!77162 (=> res!190786 e!155626)))

(assert (=> d!77162 (= res!190786 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!363557 () Bool)

(assert (=> d!77162 (= lt!363557 e!155624)))

(declare-fun res!190787 () Bool)

(assert (=> d!77162 (=> (not res!190787) (not e!155624))))

(declare-fun lt!363533 () (_ BitVec 64))

(declare-fun lt!363537 () (_ BitVec 64))

(assert (=> d!77162 (= res!190787 (= (bvadd lt!363537 lt!363533) (bitIndex!0 (size!5008 (buf!5549 (_2!10610 lt!363548))) (currentByte!10387 (_2!10610 lt!363548)) (currentBit!10382 (_2!10610 lt!363548)))))))

(assert (=> d!77162 (or (not (= (bvand lt!363537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363533 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!363537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!363537 lt!363533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!363536 () (_ BitVec 64))

(assert (=> d!77162 (= lt!363533 (bvmul lt!363536 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77162 (or (= lt!363536 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363536 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363536)))))

(assert (=> d!77162 (= lt!363536 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77162 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77162 (= lt!363537 (bitIndex!0 (size!5008 (buf!5549 (_2!10611 lt!363207))) (currentByte!10387 (_2!10611 lt!363207)) (currentBit!10382 (_2!10611 lt!363207))))))

(assert (=> d!77162 (= lt!363548 e!155625)))

(assert (=> d!77162 (= c!11208 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77162 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5008 lt!363205)))))

(assert (=> d!77162 (= (readByteArrayLoop!0 (_2!10611 lt!363207) lt!363205 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!363548)))

(assert (= (and d!77162 c!11208) b!227409))

(assert (= (and d!77162 (not c!11208)) b!227411))

(assert (= (or b!227409 b!227411) bm!3840))

(assert (= (or b!227409 b!227411) bm!3839))

(assert (= (or b!227409 b!227411) bm!3838))

(assert (= (and d!77162 res!190787) b!227410))

(assert (= (and b!227410 res!190788) b!227413))

(assert (= (and d!77162 (not res!190786)) b!227412))

(declare-fun m!349701 () Bool)

(assert (=> b!227409 m!349701))

(declare-fun m!349703 () Bool)

(assert (=> b!227409 m!349703))

(declare-fun m!349705 () Bool)

(assert (=> b!227409 m!349705))

(declare-fun m!349707 () Bool)

(assert (=> b!227409 m!349707))

(declare-fun m!349709 () Bool)

(assert (=> b!227409 m!349709))

(declare-fun m!349711 () Bool)

(assert (=> b!227409 m!349711))

(declare-fun m!349713 () Bool)

(assert (=> b!227409 m!349713))

(declare-fun m!349715 () Bool)

(assert (=> b!227409 m!349715))

(declare-fun m!349717 () Bool)

(assert (=> b!227409 m!349717))

(declare-fun m!349719 () Bool)

(assert (=> b!227409 m!349719))

(declare-fun m!349721 () Bool)

(assert (=> b!227409 m!349721))

(declare-fun m!349723 () Bool)

(assert (=> b!227409 m!349723))

(declare-fun m!349725 () Bool)

(assert (=> b!227409 m!349725))

(assert (=> bm!3838 m!349581))

(declare-fun m!349727 () Bool)

(assert (=> b!227412 m!349727))

(declare-fun m!349729 () Bool)

(assert (=> b!227412 m!349729))

(declare-fun m!349731 () Bool)

(assert (=> bm!3840 m!349731))

(assert (=> bm!3839 m!349707))

(declare-fun m!349733 () Bool)

(assert (=> bm!3839 m!349733))

(declare-fun m!349735 () Bool)

(assert (=> d!77162 m!349735))

(assert (=> d!77162 m!349581))

(declare-fun m!349737 () Bool)

(assert (=> b!227411 m!349737))

(declare-fun m!349739 () Bool)

(assert (=> b!227411 m!349739))

(declare-fun m!349741 () Bool)

(assert (=> b!227413 m!349741))

(assert (=> b!227311 d!77162))

(declare-fun d!77166 () Bool)

(declare-fun e!155642 () Bool)

(assert (=> d!77166 e!155642))

(declare-fun res!190806 () Bool)

(assert (=> d!77166 (=> (not res!190806) (not e!155642))))

(assert (=> d!77166 (= res!190806 (and (or (let ((rhs!3961 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3961 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3961) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77167 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77167 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77167 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3960 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3960 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3960) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!363670 () Unit!16959)

(declare-fun choose!57 (BitStream!9112 BitStream!9112 (_ BitVec 64) (_ BitVec 32)) Unit!16959)

(assert (=> d!77166 (= lt!363670 (choose!57 thiss!1870 (_2!10611 lt!363207) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77166 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10611 lt!363207) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!363670)))

(declare-fun lt!363672 () (_ BitVec 32))

(declare-fun b!227437 () Bool)

(assert (=> b!227437 (= e!155642 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5008 (buf!5549 (_2!10611 lt!363207)))) ((_ sign_extend 32) (currentByte!10387 (_2!10611 lt!363207))) ((_ sign_extend 32) (currentBit!10382 (_2!10611 lt!363207))) (bvsub (bvsub to!496 i!761) lt!363672)))))

(assert (=> b!227437 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!363672 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!363672) #b10000000000000000000000000000000)))))

(declare-fun lt!363671 () (_ BitVec 64))

(assert (=> b!227437 (= lt!363672 ((_ extract 31 0) lt!363671))))

(assert (=> b!227437 (and (bvslt lt!363671 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!363671 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227437 (= lt!363671 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77166 res!190806) b!227437))

(declare-fun m!349789 () Bool)

(assert (=> d!77166 m!349789))

(declare-fun m!349791 () Bool)

(assert (=> b!227437 m!349791))

(assert (=> b!227311 d!77166))

(declare-fun d!77173 () Bool)

(declare-fun res!190807 () Bool)

(declare-fun e!155643 () Bool)

(assert (=> d!77173 (=> res!190807 e!155643)))

(assert (=> d!77173 (= res!190807 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77173 (= (arrayRangesEq!844 lt!363205 (_3!841 lt!363202) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!155643)))

(declare-fun b!227438 () Bool)

(declare-fun e!155644 () Bool)

(assert (=> b!227438 (= e!155643 e!155644)))

(declare-fun res!190808 () Bool)

(assert (=> b!227438 (=> (not res!190808) (not e!155644))))

(assert (=> b!227438 (= res!190808 (= (select (arr!5983 lt!363205) #b00000000000000000000000000000000) (select (arr!5983 (_3!841 lt!363202)) #b00000000000000000000000000000000)))))

(declare-fun b!227439 () Bool)

(assert (=> b!227439 (= e!155644 (arrayRangesEq!844 lt!363205 (_3!841 lt!363202) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77173 (not res!190807)) b!227438))

(assert (= (and b!227438 res!190808) b!227439))

(assert (=> b!227438 m!349677))

(declare-fun m!349793 () Bool)

(assert (=> b!227438 m!349793))

(declare-fun m!349795 () Bool)

(assert (=> b!227439 m!349795))

(assert (=> b!227309 d!77173))

(declare-fun d!77175 () Bool)

(assert (=> d!77175 (= (array_inv!4749 (buf!5549 thiss!1870)) (bvsge (size!5008 (buf!5549 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227313 d!77175))

(declare-fun d!77177 () Bool)

(assert (=> d!77177 (= (array_inv!4749 arr!308) (bvsge (size!5008 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47750 d!77177))

(declare-fun d!77179 () Bool)

(assert (=> d!77179 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10382 thiss!1870) (currentByte!10387 thiss!1870) (size!5008 (buf!5549 thiss!1870))))))

(declare-fun bs!18865 () Bool)

(assert (= bs!18865 d!77179))

(assert (=> bs!18865 m!349651))

(assert (=> start!47750 d!77179))

(push 1)

(assert (not b!227386))

(assert (not b!227374))

(assert (not bm!3840))

(assert (not d!77136))

(assert (not bm!3839))

(assert (not d!77162))

(assert (not bm!3838))

(assert (not d!77138))

(assert (not b!227409))

(assert (not b!227412))

(assert (not d!77142))

(assert (not d!77132))

(assert (not d!77134))

(assert (not b!227411))

(assert (not b!227362))

(assert (not b!227439))

(assert (not b!227413))

(assert (not d!77179))

(assert (not d!77166))

(assert (not d!77130))

(assert (not b!227437))

(assert (not d!77158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

