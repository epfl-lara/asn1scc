; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17546 () Bool)

(assert start!17546)

(declare-fun b!84529 () Bool)

(declare-datatypes ((Unit!5668 0))(
  ( (Unit!5669) )
))
(declare-datatypes ((array!4015 0))(
  ( (array!4016 (arr!2453 (Array (_ BitVec 32) (_ BitVec 8))) (size!1816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3194 0))(
  ( (BitStream!3195 (buf!2206 array!4015) (currentByte!4376 (_ BitVec 32)) (currentBit!4371 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!374 0))(
  ( (tuple3!375 (_1!3831 Unit!5668) (_2!3831 BitStream!3194) (_3!211 (_ BitVec 32))) )
))
(declare-fun e!56470 () tuple3!374)

(declare-fun thiss!1136 () BitStream!3194)

(declare-fun Unit!5670 () Unit!5668)

(assert (=> b!84529 (= e!56470 (tuple3!375 Unit!5670 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun res!69352 () Bool)

(declare-fun e!56471 () Bool)

(assert (=> start!17546 (=> (not res!69352) (not e!56471))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17546 (= res!69352 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17546 e!56471))

(assert (=> start!17546 true))

(declare-fun e!56469 () Bool)

(declare-fun inv!12 (BitStream!3194) Bool)

(assert (=> start!17546 (and (inv!12 thiss!1136) e!56469)))

(declare-fun b!84530 () Bool)

(declare-fun array_inv!1662 (array!4015) Bool)

(assert (=> b!84530 (= e!56469 (array_inv!1662 (buf!2206 thiss!1136)))))

(declare-fun b!84531 () Bool)

(declare-fun res!69355 () Bool)

(assert (=> b!84531 (=> (not res!69355) (not e!56471))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84531 (= res!69355 (validate_offset_bits!1 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))) ((_ sign_extend 32) (currentByte!4376 thiss!1136)) ((_ sign_extend 32) (currentBit!4371 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84532 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3194 (_ BitVec 64) BitStream!3194 (_ BitVec 32)) tuple3!374)

(assert (=> b!84532 (= e!56470 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun lt!134277 () (_ BitVec 64))

(declare-fun lt!134276 () (_ BitVec 64))

(declare-fun b!84533 () Bool)

(assert (=> b!84533 (= e!56471 (and (= lt!134276 (bvand ((_ sign_extend 32) nBits!333) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!134276 (bvand (bvadd lt!134277 ((_ sign_extend 32) nBits!333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!84533 (= lt!134276 (bvand lt!134277 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84533 (= lt!134277 (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)))))

(declare-fun b!84534 () Bool)

(declare-fun res!69354 () Bool)

(assert (=> b!84534 (=> (not res!69354) (not e!56471))))

(assert (=> b!84534 (= res!69354 (= (size!1816 (buf!2206 (_2!3831 e!56470))) (size!1816 (buf!2206 thiss!1136))))))

(declare-fun c!5822 () Bool)

(assert (=> b!84534 (= c!5822 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84535 () Bool)

(declare-fun res!69353 () Bool)

(assert (=> b!84535 (=> (not res!69353) (not e!56471))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84535 (= res!69353 (invariant!0 (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136))))))

(assert (= (and start!17546 res!69352) b!84531))

(assert (= (and b!84531 res!69355) b!84535))

(assert (= (and b!84535 res!69353) b!84534))

(assert (= (and b!84534 c!5822) b!84532))

(assert (= (and b!84534 (not c!5822)) b!84529))

(assert (= (and b!84534 res!69354) b!84533))

(assert (= start!17546 b!84530))

(declare-fun m!131075 () Bool)

(assert (=> b!84532 m!131075))

(declare-fun m!131077 () Bool)

(assert (=> b!84533 m!131077))

(declare-fun m!131079 () Bool)

(assert (=> b!84530 m!131079))

(declare-fun m!131081 () Bool)

(assert (=> start!17546 m!131081))

(declare-fun m!131083 () Bool)

(assert (=> b!84535 m!131083))

(declare-fun m!131085 () Bool)

(assert (=> b!84531 m!131085))

(push 1)

(assert (not b!84535))

(assert (not b!84531))

(assert (not start!17546))

(assert (not b!84530))

(assert (not b!84533))

(assert (not b!84532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27174 () Bool)

(assert (=> d!27174 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136))))))

(declare-fun bs!6728 () Bool)

(assert (= bs!6728 d!27174))

(assert (=> bs!6728 m!131083))

(assert (=> start!17546 d!27174))

(declare-fun d!27176 () Bool)

(declare-fun e!56475 () Bool)

(assert (=> d!27176 e!56475))

(declare-fun res!69361 () Bool)

(assert (=> d!27176 (=> (not res!69361) (not e!56475))))

(declare-fun lt!134293 () (_ BitVec 64))

(declare-fun lt!134291 () (_ BitVec 64))

(declare-fun lt!134294 () (_ BitVec 64))

(assert (=> d!27176 (= res!69361 (= lt!134294 (bvsub lt!134293 lt!134291)))))

(assert (=> d!27176 (or (= (bvand lt!134293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134293 lt!134291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27176 (= lt!134291 (remainingBits!0 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))) ((_ sign_extend 32) (currentByte!4376 thiss!1136)) ((_ sign_extend 32) (currentBit!4371 thiss!1136))))))

(declare-fun lt!134295 () (_ BitVec 64))

(declare-fun lt!134292 () (_ BitVec 64))

(assert (=> d!27176 (= lt!134293 (bvmul lt!134295 lt!134292))))

(assert (=> d!27176 (or (= lt!134295 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134292 (bvsdiv (bvmul lt!134295 lt!134292) lt!134295)))))

(assert (=> d!27176 (= lt!134292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27176 (= lt!134295 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))))))

(assert (=> d!27176 (= lt!134294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4376 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4371 thiss!1136))))))

(assert (=> d!27176 (invariant!0 (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136)))))

(assert (=> d!27176 (= (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)) lt!134294)))

(declare-fun b!84540 () Bool)

(declare-fun res!69360 () Bool)

(assert (=> b!84540 (=> (not res!69360) (not e!56475))))

(assert (=> b!84540 (= res!69360 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134294))))

(declare-fun b!84541 () Bool)

(declare-fun lt!134290 () (_ BitVec 64))

(assert (=> b!84541 (= e!56475 (bvsle lt!134294 (bvmul lt!134290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84541 (or (= lt!134290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134290)))))

(assert (=> b!84541 (= lt!134290 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))))))

(assert (= (and d!27176 res!69361) b!84540))

(assert (= (and b!84540 res!69360) b!84541))

(declare-fun m!131087 () Bool)

(assert (=> d!27176 m!131087))

(assert (=> d!27176 m!131083))

(assert (=> b!84533 d!27176))

(declare-fun d!27178 () Bool)

(assert (=> d!27178 (= (array_inv!1662 (buf!2206 thiss!1136)) (bvsge (size!1816 (buf!2206 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84530 d!27178))

(declare-fun d!27180 () Bool)

(assert (=> d!27180 (= (invariant!0 (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136))) (and (bvsge (currentBit!4371 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4371 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4376 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136))) (and (= (currentBit!4371 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136)))))))))

(assert (=> b!84535 d!27180))

(declare-fun d!27182 () Bool)

(assert (=> d!27182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))) ((_ sign_extend 32) (currentByte!4376 thiss!1136)) ((_ sign_extend 32) (currentBit!4371 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))) ((_ sign_extend 32) (currentByte!4376 thiss!1136)) ((_ sign_extend 32) (currentBit!4371 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6729 () Bool)

(assert (= bs!6729 d!27182))

(assert (=> bs!6729 m!131087))

(assert (=> b!84531 d!27182))

(declare-fun b!84682 () Bool)

(declare-fun res!69486 () Bool)

(declare-fun e!56523 () Bool)

(assert (=> b!84682 (=> (not res!69486) (not e!56523))))

(declare-datatypes ((tuple2!7248 0))(
  ( (tuple2!7249 (_1!3836 Unit!5668) (_2!3836 BitStream!3194)) )
))
(declare-fun lt!134399 () tuple2!7248)

(assert (=> b!84682 (= res!69486 (= (bitIndex!0 (size!1816 (buf!2206 (_2!3836 lt!134399))) (currentByte!4376 (_2!3836 lt!134399)) (currentBit!4371 (_2!3836 lt!134399))) (bvadd (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84683 () Bool)

(declare-fun e!56522 () Bool)

(assert (=> b!84683 (= e!56523 e!56522)))

(declare-fun res!69498 () Bool)

(assert (=> b!84683 (=> (not res!69498) (not e!56522))))

(declare-fun lt!134398 () Bool)

(declare-datatypes ((tuple2!7250 0))(
  ( (tuple2!7251 (_1!3837 BitStream!3194) (_2!3837 Bool)) )
))
(declare-fun lt!134400 () tuple2!7250)

(assert (=> b!84683 (= res!69498 (and (= (_2!3837 lt!134400) lt!134398) (= (_1!3837 lt!134400) (_2!3836 lt!134399))))))

(declare-fun readBitPure!0 (BitStream!3194) tuple2!7250)

(declare-fun readerFrom!0 (BitStream!3194 (_ BitVec 32) (_ BitVec 32)) BitStream!3194)

(assert (=> b!84683 (= lt!134400 (readBitPure!0 (readerFrom!0 (_2!3836 lt!134399) (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136))))))

(declare-fun b!84684 () Bool)

(declare-fun res!69496 () Bool)

(declare-fun e!56524 () Bool)

(assert (=> b!84684 (=> (not res!69496) (not e!56524))))

(declare-fun lt!134397 () tuple3!374)

(assert (=> b!84684 (= res!69496 (validate_offset_bits!1 ((_ sign_extend 32) (size!1816 (buf!2206 (_2!3831 lt!134397)))) ((_ sign_extend 32) (currentByte!4376 (_2!3831 lt!134397))) ((_ sign_extend 32) (currentBit!4371 (_2!3831 lt!134397))) ((_ sign_extend 32) (bvsub nBits!333 (_3!211 lt!134397)))))))

(assert (=> b!84684 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!211 lt!134397) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!211 lt!134397)) #b10000000000000000000000000000000)))))

(declare-fun b!84685 () Bool)

(declare-fun res!69488 () Bool)

(declare-fun e!56525 () Bool)

(assert (=> b!84685 (=> (not res!69488) (not e!56525))))

(assert (=> b!84685 (= res!69488 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1816 (buf!2206 thiss!1136)) (size!1816 (buf!2206 thiss!1136)))))))

(declare-fun b!84687 () Bool)

(declare-fun res!69491 () Bool)

(assert (=> b!84687 (=> (not res!69491) (not e!56524))))

(assert (=> b!84687 (= res!69491 (and (bvsle (_3!211 lt!134397) nBits!333) (= (size!1816 (buf!2206 (_2!3831 lt!134397))) (size!1816 (buf!2206 thiss!1136)))))))

(declare-fun b!84688 () Bool)

(declare-fun res!69492 () Bool)

(assert (=> b!84688 (=> (not res!69492) (not e!56524))))

(declare-fun lt!134401 () (_ BitVec 64))

(declare-fun lt!134403 () (_ BitVec 64))

(assert (=> b!84688 (= res!69492 (= (bitIndex!0 (size!1816 (buf!2206 (_2!3831 lt!134397))) (currentByte!4376 (_2!3831 lt!134397)) (currentBit!4371 (_2!3831 lt!134397))) (bvadd lt!134401 lt!134403)))))

(assert (=> b!84688 (or (not (= (bvand lt!134401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134401 lt!134403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84688 (= lt!134403 ((_ sign_extend 32) (_3!211 lt!134397)))))

(assert (=> b!84688 (= lt!134401 (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)))))

(declare-fun b!84689 () Bool)

(declare-fun res!69497 () Bool)

(assert (=> b!84689 (=> (not res!69497) (not e!56524))))

(assert (=> b!84689 (= res!69497 (invariant!0 (currentBit!4371 (_2!3831 lt!134397)) (currentByte!4376 (_2!3831 lt!134397)) (size!1816 (buf!2206 (_2!3831 lt!134397)))))))

(declare-fun b!84690 () Bool)

(declare-fun e!56526 () tuple3!374)

(declare-fun lt!134396 () tuple2!7248)

(declare-fun lt!134402 () (_ BitVec 32))

(declare-fun Unit!5673 () Unit!5668)

(assert (=> b!84690 (= e!56526 (tuple3!375 Unit!5673 (_2!3836 lt!134396) lt!134402))))

(declare-fun b!84691 () Bool)

(declare-fun res!69495 () Bool)

(assert (=> b!84691 (=> (not res!69495) (not e!56525))))

(assert (=> b!84691 (= res!69495 (invariant!0 (currentBit!4371 thiss!1136) (currentByte!4376 thiss!1136) (size!1816 (buf!2206 thiss!1136))))))

(declare-fun b!84692 () Bool)

(assert (=> b!84692 (= e!56525 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84693 () Bool)

(assert (=> b!84693 (= e!56526 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3836 lt!134396) lt!134402))))

(declare-fun b!84686 () Bool)

(assert (=> b!84686 (= e!56524 (bvsge (_3!211 lt!134397) nBits!333))))

(declare-fun d!27184 () Bool)

(assert (=> d!27184 e!56524))

(declare-fun res!69493 () Bool)

(assert (=> d!27184 (=> (not res!69493) (not e!56524))))

(assert (=> d!27184 (= res!69493 (bvsge (_3!211 lt!134397) #b00000000000000000000000000000000))))

(assert (=> d!27184 (= lt!134397 e!56526)))

(declare-fun c!5831 () Bool)

(assert (=> d!27184 (= c!5831 (bvslt lt!134402 nBits!333))))

(assert (=> d!27184 (= lt!134402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27184 (= lt!134396 lt!134399)))

(assert (=> d!27184 e!56523))

(declare-fun res!69494 () Bool)

(assert (=> d!27184 (=> (not res!69494) (not e!56523))))

(assert (=> d!27184 (= res!69494 (= (size!1816 (buf!2206 thiss!1136)) (size!1816 (buf!2206 (_2!3836 lt!134399)))))))

(declare-fun appendBit!0 (BitStream!3194 Bool) tuple2!7248)

(assert (=> d!27184 (= lt!134399 (appendBit!0 thiss!1136 lt!134398))))

(assert (=> d!27184 (= lt!134398 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27184 e!56525))

(declare-fun res!69487 () Bool)

(assert (=> d!27184 (=> (not res!69487) (not e!56525))))

(assert (=> d!27184 (= res!69487 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27184 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134397)))

(declare-fun b!84694 () Bool)

(declare-fun res!69489 () Bool)

(assert (=> b!84694 (=> (not res!69489) (not e!56525))))

(assert (=> b!84694 (= res!69489 (validate_offset_bits!1 ((_ sign_extend 32) (size!1816 (buf!2206 thiss!1136))) ((_ sign_extend 32) (currentByte!4376 thiss!1136)) ((_ sign_extend 32) (currentBit!4371 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84695 () Bool)

(declare-fun res!69499 () Bool)

(assert (=> b!84695 (=> (not res!69499) (not e!56525))))

(assert (=> b!84695 (= res!69499 (= (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)) (bvadd (bitIndex!0 (size!1816 (buf!2206 thiss!1136)) (currentByte!4376 thiss!1136) (currentBit!4371 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84696 () Bool)

(assert (=> b!84696 (= e!56522 (= (bitIndex!0 (size!1816 (buf!2206 (_1!3837 lt!134400))) (currentByte!4376 (_1!3837 lt!134400)) (currentBit!4371 (_1!3837 lt!134400))) (bitIndex!0 (size!1816 (buf!2206 (_2!3836 lt!134399))) (currentByte!4376 (_2!3836 lt!134399)) (currentBit!4371 (_2!3836 lt!134399)))))))

(declare-fun b!84697 () Bool)

(declare-fun res!69490 () Bool)

(assert (=> b!84697 (=> (not res!69490) (not e!56523))))

(declare-fun isPrefixOf!0 (BitStream!3194 BitStream!3194) Bool)

(assert (=> b!84697 (= res!69490 (isPrefixOf!0 thiss!1136 (_2!3836 lt!134399)))))

(assert (= (and d!27184 res!69487) b!84691))

(assert (= (and b!84691 res!69495) b!84685))

(assert (= (and b!84685 res!69488) b!84695))

(assert (= (and b!84695 res!69499) b!84694))

(assert (= (and b!84694 res!69489) b!84692))

(assert (= (and d!27184 res!69494) b!84682))

(assert (= (and b!84682 res!69486) b!84697))

(assert (= (and b!84697 res!69490) b!84683))

(assert (= (and b!84683 res!69498) b!84696))

(assert (= (and d!27184 c!5831) b!84693))

(assert (= (and d!27184 (not c!5831)) b!84690))

(assert (= (and d!27184 res!69493) b!84689))

(assert (= (and b!84689 res!69497) b!84687))

(assert (= (and b!84687 res!69491) b!84688))

(assert (= (and b!84688 res!69492) b!84684))

(assert (= (and b!84684 res!69496) b!84686))

(assert (=> b!84691 m!131083))

(declare-fun m!131137 () Bool)

(assert (=> b!84696 m!131137))

(declare-fun m!131139 () Bool)

(assert (=> b!84696 m!131139))

(declare-fun m!131141 () Bool)

(assert (=> d!27184 m!131141))

(declare-fun m!131143 () Bool)

(assert (=> b!84694 m!131143))

(declare-fun m!131145 () Bool)

(assert (=> b!84693 m!131145))

(declare-fun m!131147 () Bool)

(assert (=> b!84683 m!131147))

(assert (=> b!84683 m!131147))

(declare-fun m!131149 () Bool)

(assert (=> b!84683 m!131149))

(assert (=> b!84695 m!131077))

(assert (=> b!84695 m!131077))

(declare-fun m!131151 () Bool)

(assert (=> b!84689 m!131151))

(declare-fun m!131153 () Bool)

(assert (=> b!84684 m!131153))

(declare-fun m!131155 () Bool)

(assert (=> b!84688 m!131155))

(assert (=> b!84688 m!131077))

(declare-fun m!131157 () Bool)

(assert (=> b!84697 m!131157))

(assert (=> b!84682 m!131139))

(assert (=> b!84682 m!131077))

(assert (=> b!84532 d!27184))

(push 1)

(assert (not d!27174))

(assert (not b!84693))

(assert (not b!84695))

(assert (not d!27182))

(assert (not b!84689))

(assert (not b!84683))

(assert (not d!27176))

(assert (not b!84697))

(assert (not b!84682))

(assert (not b!84691))

(assert (not b!84696))

(assert (not d!27184))

(assert (not b!84684))

(assert (not b!84694))

(assert (not b!84688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

