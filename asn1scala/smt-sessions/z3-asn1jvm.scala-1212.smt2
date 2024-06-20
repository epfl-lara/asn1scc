; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34478 () Bool)

(assert start!34478)

(declare-fun b!163635 () Bool)

(declare-fun e!113023 () Bool)

(declare-datatypes ((array!8150 0))(
  ( (array!8151 (arr!4571 (Array (_ BitVec 32) (_ BitVec 8))) (size!3650 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6456 0))(
  ( (BitStream!6457 (buf!4102 array!8150) (currentByte!7655 (_ BitVec 32)) (currentBit!7650 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6456)

(declare-fun array_inv!3391 (array!8150) Bool)

(assert (=> b!163635 (= e!113023 (array_inv!3391 (buf!4102 thiss!1577)))))

(declare-fun b!163636 () Bool)

(declare-fun e!113025 () Bool)

(declare-fun e!113026 () Bool)

(assert (=> b!163636 (= e!113025 (not e!113026))))

(declare-fun res!136356 () Bool)

(assert (=> b!163636 (=> res!136356 e!113026)))

(declare-fun lt!256744 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163636 (= res!136356 (not (byteRangesEq!0 (select (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577)) lt!256744 #b00000000000000000000000000000000 (currentBit!7650 thiss!1577))))))

(declare-fun lt!256746 () array!8150)

(declare-fun arrayRangesEq!584 (array!8150 array!8150 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163636 (arrayRangesEq!584 (buf!4102 thiss!1577) lt!256746 #b00000000000000000000000000000000 (currentByte!7655 thiss!1577))))

(declare-datatypes ((Unit!11356 0))(
  ( (Unit!11357) )
))
(declare-fun lt!256743 () Unit!11356)

(declare-fun arrayUpdatedAtPrefixLemma!192 (array!8150 (_ BitVec 32) (_ BitVec 8)) Unit!11356)

(assert (=> b!163636 (= lt!256743 (arrayUpdatedAtPrefixLemma!192 (buf!4102 thiss!1577) (currentByte!7655 thiss!1577) lt!256744))))

(assert (=> b!163636 (= lt!256746 (array!8151 (store (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) lt!256744) (size!3650 (buf!4102 thiss!1577))))))

(declare-fun lt!256741 () (_ BitVec 32))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163636 (= lt!256744 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7650 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256741)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256741))))))

(assert (=> b!163636 (= lt!256741 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7650 thiss!1577) nBits!511)))))

(declare-fun b!163637 () Bool)

(declare-fun res!136355 () Bool)

(assert (=> b!163637 (=> (not res!136355) (not e!113025))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163637 (= res!136355 (validate_offset_bits!1 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))) ((_ sign_extend 32) (currentByte!7655 thiss!1577)) ((_ sign_extend 32) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163638 () Bool)

(declare-fun e!113024 () Bool)

(declare-datatypes ((tuple2!14532 0))(
  ( (tuple2!14533 (_1!7857 BitStream!6456) (_2!7857 BitStream!6456)) )
))
(declare-fun lt!256742 () tuple2!14532)

(assert (=> b!163638 (= e!113024 (validate_offset_bits!1 ((_ sign_extend 32) (size!3650 (buf!4102 (_1!7857 lt!256742)))) ((_ sign_extend 32) (currentByte!7655 (_1!7857 lt!256742))) ((_ sign_extend 32) (currentBit!7650 (_1!7857 lt!256742))) ((_ sign_extend 32) nBits!511)))))

(declare-datatypes ((tuple2!14534 0))(
  ( (tuple2!14535 (_1!7858 Unit!11356) (_2!7858 BitStream!6456)) )
))
(declare-fun lt!256745 () tuple2!14534)

(declare-fun reader!0 (BitStream!6456 BitStream!6456) tuple2!14532)

(assert (=> b!163638 (= lt!256742 (reader!0 thiss!1577 (_2!7858 lt!256745)))))

(declare-fun b!163639 () Bool)

(declare-fun res!136359 () Bool)

(assert (=> b!163639 (=> (not res!136359) (not e!113025))))

(assert (=> b!163639 (= res!136359 (bvsle (bvadd (currentBit!7650 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163640 () Bool)

(declare-fun res!136353 () Bool)

(assert (=> b!163640 (=> res!136353 e!113024)))

(declare-fun isPrefixOf!0 (BitStream!6456 BitStream!6456) Bool)

(assert (=> b!163640 (= res!136353 (not (isPrefixOf!0 thiss!1577 (_2!7858 lt!256745))))))

(declare-fun res!136358 () Bool)

(assert (=> start!34478 (=> (not res!136358) (not e!113025))))

(assert (=> start!34478 (= res!136358 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34478 e!113025))

(assert (=> start!34478 true))

(declare-fun inv!12 (BitStream!6456) Bool)

(assert (=> start!34478 (and (inv!12 thiss!1577) e!113023)))

(declare-fun b!163641 () Bool)

(assert (=> b!163641 (= e!113026 e!113024)))

(declare-fun res!136357 () Bool)

(assert (=> b!163641 (=> res!136357 e!113024)))

(assert (=> b!163641 (= res!136357 (not (= (size!3650 (buf!4102 thiss!1577)) (size!3650 (buf!4102 (_2!7858 lt!256745))))))))

(declare-fun moveBitIndex!0 (BitStream!6456 (_ BitVec 64)) tuple2!14534)

(assert (=> b!163641 (= lt!256745 (moveBitIndex!0 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163642 () Bool)

(declare-fun res!136354 () Bool)

(assert (=> b!163642 (=> res!136354 e!113024)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163642 (= res!136354 (not (= (bitIndex!0 (size!3650 (buf!4102 (_2!7858 lt!256745))) (currentByte!7655 (_2!7858 lt!256745)) (currentBit!7650 (_2!7858 lt!256745))) (bvadd (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(assert (= (and start!34478 res!136358) b!163637))

(assert (= (and b!163637 res!136355) b!163639))

(assert (= (and b!163639 res!136359) b!163636))

(assert (= (and b!163636 (not res!136356)) b!163641))

(assert (= (and b!163641 (not res!136357)) b!163642))

(assert (= (and b!163642 (not res!136354)) b!163640))

(assert (= (and b!163640 (not res!136353)) b!163638))

(assert (= start!34478 b!163635))

(declare-fun m!259723 () Bool)

(assert (=> b!163638 m!259723))

(declare-fun m!259725 () Bool)

(assert (=> b!163638 m!259725))

(declare-fun m!259727 () Bool)

(assert (=> b!163637 m!259727))

(declare-fun m!259729 () Bool)

(assert (=> b!163635 m!259729))

(declare-fun m!259731 () Bool)

(assert (=> b!163640 m!259731))

(declare-fun m!259733 () Bool)

(assert (=> b!163641 m!259733))

(declare-fun m!259735 () Bool)

(assert (=> b!163636 m!259735))

(assert (=> b!163636 m!259735))

(declare-fun m!259737 () Bool)

(assert (=> b!163636 m!259737))

(declare-fun m!259739 () Bool)

(assert (=> b!163636 m!259739))

(declare-fun m!259741 () Bool)

(assert (=> b!163636 m!259741))

(declare-fun m!259743 () Bool)

(assert (=> b!163636 m!259743))

(declare-fun m!259745 () Bool)

(assert (=> b!163636 m!259745))

(declare-fun m!259747 () Bool)

(assert (=> b!163636 m!259747))

(declare-fun m!259749 () Bool)

(assert (=> b!163636 m!259749))

(declare-fun m!259751 () Bool)

(assert (=> start!34478 m!259751))

(declare-fun m!259753 () Bool)

(assert (=> b!163642 m!259753))

(declare-fun m!259755 () Bool)

(assert (=> b!163642 m!259755))

(check-sat (not b!163641) (not b!163638) (not start!34478) (not b!163637) (not b!163635) (not b!163636) (not b!163642) (not b!163640))
(check-sat)
(get-model)

(declare-fun d!56465 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56465 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7650 thiss!1577) (currentByte!7655 thiss!1577) (size!3650 (buf!4102 thiss!1577))))))

(declare-fun bs!13983 () Bool)

(assert (= bs!13983 d!56465))

(declare-fun m!259803 () Bool)

(assert (=> bs!13983 m!259803))

(assert (=> start!34478 d!56465))

(declare-fun d!56467 () Bool)

(declare-fun lt!256802 () (_ BitVec 32))

(assert (=> d!56467 (= lt!256802 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256801 () (_ BitVec 32))

(assert (=> d!56467 (= lt!256801 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!113076 () Bool)

(assert (=> d!56467 e!113076))

(declare-fun res!136418 () Bool)

(assert (=> d!56467 (=> (not res!136418) (not e!113076))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6456 (_ BitVec 64)) Bool)

(assert (=> d!56467 (= res!136418 (moveBitIndexPrecond!0 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11367 () Unit!11356)

(declare-fun Unit!11368 () Unit!11356)

(declare-fun Unit!11369 () Unit!11356)

(assert (=> d!56467 (= (moveBitIndex!0 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256802) #b00000000000000000000000000000000) (tuple2!14535 Unit!11367 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvsub (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256801) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256802 (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256802) #b00000000000000000000000000001000) (tuple2!14535 Unit!11368 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256801 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256802) #b00000000000000000000000000001000))) (tuple2!14535 Unit!11369 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256801) (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256802))))))))

(declare-fun b!163703 () Bool)

(declare-fun e!113075 () Bool)

(assert (=> b!163703 (= e!113076 e!113075)))

(declare-fun res!136417 () Bool)

(assert (=> b!163703 (=> (not res!136417) (not e!113075))))

(declare-fun lt!256805 () tuple2!14534)

(declare-fun lt!256804 () (_ BitVec 64))

(assert (=> b!163703 (= res!136417 (= (bvadd lt!256804 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3650 (buf!4102 (_2!7858 lt!256805))) (currentByte!7655 (_2!7858 lt!256805)) (currentBit!7650 (_2!7858 lt!256805)))))))

(assert (=> b!163703 (or (not (= (bvand lt!256804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256804 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163703 (= lt!256804 (bitIndex!0 (size!3650 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))) (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))))

(declare-fun lt!256800 () (_ BitVec 32))

(declare-fun lt!256803 () (_ BitVec 32))

(declare-fun Unit!11370 () Unit!11356)

(declare-fun Unit!11371 () Unit!11356)

(declare-fun Unit!11372 () Unit!11356)

(assert (=> b!163703 (= lt!256805 (ite (bvslt (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256803) #b00000000000000000000000000000000) (tuple2!14535 Unit!11370 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvsub (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256800) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256803 (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256803) #b00000000000000000000000000001000) (tuple2!14535 Unit!11371 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256800 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256803) #b00000000000000000000000000001000))) (tuple2!14535 Unit!11372 (BitStream!6457 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (bvadd (currentByte!7655 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256800) (bvadd (currentBit!7650 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) lt!256803))))))))

(assert (=> b!163703 (= lt!256803 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163703 (= lt!256800 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163704 () Bool)

(assert (=> b!163704 (= e!113075 (and (= (size!3650 (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))) (size!3650 (buf!4102 (_2!7858 lt!256805)))) (= (buf!4102 (BitStream!6457 lt!256746 (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))) (buf!4102 (_2!7858 lt!256805)))))))

(assert (= (and d!56467 res!136418) b!163703))

(assert (= (and b!163703 res!136417) b!163704))

(declare-fun m!259835 () Bool)

(assert (=> d!56467 m!259835))

(declare-fun m!259837 () Bool)

(assert (=> b!163703 m!259837))

(declare-fun m!259839 () Bool)

(assert (=> b!163703 m!259839))

(assert (=> b!163641 d!56467))

(declare-fun d!56493 () Bool)

(declare-fun res!136435 () Bool)

(declare-fun e!113087 () Bool)

(assert (=> d!56493 (=> (not res!136435) (not e!113087))))

(assert (=> d!56493 (= res!136435 (= (size!3650 (buf!4102 thiss!1577)) (size!3650 (buf!4102 (_2!7858 lt!256745)))))))

(assert (=> d!56493 (= (isPrefixOf!0 thiss!1577 (_2!7858 lt!256745)) e!113087)))

(declare-fun b!163720 () Bool)

(declare-fun res!136434 () Bool)

(assert (=> b!163720 (=> (not res!136434) (not e!113087))))

(assert (=> b!163720 (= res!136434 (bvsle (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) (bitIndex!0 (size!3650 (buf!4102 (_2!7858 lt!256745))) (currentByte!7655 (_2!7858 lt!256745)) (currentBit!7650 (_2!7858 lt!256745)))))))

(declare-fun b!163721 () Bool)

(declare-fun e!113086 () Bool)

(assert (=> b!163721 (= e!113087 e!113086)))

(declare-fun res!136436 () Bool)

(assert (=> b!163721 (=> res!136436 e!113086)))

(assert (=> b!163721 (= res!136436 (= (size!3650 (buf!4102 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!163722 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8150 array!8150 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163722 (= e!113086 (arrayBitRangesEq!0 (buf!4102 thiss!1577) (buf!4102 (_2!7858 lt!256745)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577))))))

(assert (= (and d!56493 res!136435) b!163720))

(assert (= (and b!163720 res!136434) b!163721))

(assert (= (and b!163721 (not res!136436)) b!163722))

(assert (=> b!163720 m!259755))

(assert (=> b!163720 m!259753))

(assert (=> b!163722 m!259755))

(assert (=> b!163722 m!259755))

(declare-fun m!259849 () Bool)

(assert (=> b!163722 m!259849))

(assert (=> b!163640 d!56493))

(declare-fun d!56505 () Bool)

(assert (=> d!56505 (= (array_inv!3391 (buf!4102 thiss!1577)) (bvsge (size!3650 (buf!4102 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163635 d!56505))

(declare-fun d!56507 () Bool)

(declare-fun e!113090 () Bool)

(assert (=> d!56507 e!113090))

(declare-fun res!136441 () Bool)

(assert (=> d!56507 (=> (not res!136441) (not e!113090))))

(declare-fun lt!256847 () (_ BitVec 64))

(declare-fun lt!256845 () (_ BitVec 64))

(declare-fun lt!256848 () (_ BitVec 64))

(assert (=> d!56507 (= res!136441 (= lt!256848 (bvsub lt!256845 lt!256847)))))

(assert (=> d!56507 (or (= (bvand lt!256845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256845 lt!256847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56507 (= lt!256847 (remainingBits!0 ((_ sign_extend 32) (size!3650 (buf!4102 (_2!7858 lt!256745)))) ((_ sign_extend 32) (currentByte!7655 (_2!7858 lt!256745))) ((_ sign_extend 32) (currentBit!7650 (_2!7858 lt!256745)))))))

(declare-fun lt!256843 () (_ BitVec 64))

(declare-fun lt!256846 () (_ BitVec 64))

(assert (=> d!56507 (= lt!256845 (bvmul lt!256843 lt!256846))))

(assert (=> d!56507 (or (= lt!256843 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256846 (bvsdiv (bvmul lt!256843 lt!256846) lt!256843)))))

(assert (=> d!56507 (= lt!256846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56507 (= lt!256843 ((_ sign_extend 32) (size!3650 (buf!4102 (_2!7858 lt!256745)))))))

(assert (=> d!56507 (= lt!256848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7655 (_2!7858 lt!256745))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7650 (_2!7858 lt!256745)))))))

(assert (=> d!56507 (invariant!0 (currentBit!7650 (_2!7858 lt!256745)) (currentByte!7655 (_2!7858 lt!256745)) (size!3650 (buf!4102 (_2!7858 lt!256745))))))

(assert (=> d!56507 (= (bitIndex!0 (size!3650 (buf!4102 (_2!7858 lt!256745))) (currentByte!7655 (_2!7858 lt!256745)) (currentBit!7650 (_2!7858 lt!256745))) lt!256848)))

(declare-fun b!163727 () Bool)

(declare-fun res!136442 () Bool)

(assert (=> b!163727 (=> (not res!136442) (not e!113090))))

(assert (=> b!163727 (= res!136442 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256848))))

(declare-fun b!163728 () Bool)

(declare-fun lt!256844 () (_ BitVec 64))

(assert (=> b!163728 (= e!113090 (bvsle lt!256848 (bvmul lt!256844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163728 (or (= lt!256844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256844)))))

(assert (=> b!163728 (= lt!256844 ((_ sign_extend 32) (size!3650 (buf!4102 (_2!7858 lt!256745)))))))

(assert (= (and d!56507 res!136441) b!163727))

(assert (= (and b!163727 res!136442) b!163728))

(declare-fun m!259851 () Bool)

(assert (=> d!56507 m!259851))

(declare-fun m!259853 () Bool)

(assert (=> d!56507 m!259853))

(assert (=> b!163642 d!56507))

(declare-fun d!56509 () Bool)

(declare-fun e!113091 () Bool)

(assert (=> d!56509 e!113091))

(declare-fun res!136443 () Bool)

(assert (=> d!56509 (=> (not res!136443) (not e!113091))))

(declare-fun lt!256851 () (_ BitVec 64))

(declare-fun lt!256853 () (_ BitVec 64))

(declare-fun lt!256854 () (_ BitVec 64))

(assert (=> d!56509 (= res!136443 (= lt!256854 (bvsub lt!256851 lt!256853)))))

(assert (=> d!56509 (or (= (bvand lt!256851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256851 lt!256853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56509 (= lt!256853 (remainingBits!0 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))) ((_ sign_extend 32) (currentByte!7655 thiss!1577)) ((_ sign_extend 32) (currentBit!7650 thiss!1577))))))

(declare-fun lt!256849 () (_ BitVec 64))

(declare-fun lt!256852 () (_ BitVec 64))

(assert (=> d!56509 (= lt!256851 (bvmul lt!256849 lt!256852))))

(assert (=> d!56509 (or (= lt!256849 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256852 (bvsdiv (bvmul lt!256849 lt!256852) lt!256849)))))

(assert (=> d!56509 (= lt!256852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56509 (= lt!256849 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))))))

(assert (=> d!56509 (= lt!256854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7655 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7650 thiss!1577))))))

(assert (=> d!56509 (invariant!0 (currentBit!7650 thiss!1577) (currentByte!7655 thiss!1577) (size!3650 (buf!4102 thiss!1577)))))

(assert (=> d!56509 (= (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)) lt!256854)))

(declare-fun b!163729 () Bool)

(declare-fun res!136444 () Bool)

(assert (=> b!163729 (=> (not res!136444) (not e!113091))))

(assert (=> b!163729 (= res!136444 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256854))))

(declare-fun b!163730 () Bool)

(declare-fun lt!256850 () (_ BitVec 64))

(assert (=> b!163730 (= e!113091 (bvsle lt!256854 (bvmul lt!256850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163730 (or (= lt!256850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256850)))))

(assert (=> b!163730 (= lt!256850 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))))))

(assert (= (and d!56509 res!136443) b!163729))

(assert (= (and b!163729 res!136444) b!163730))

(declare-fun m!259855 () Bool)

(assert (=> d!56509 m!259855))

(assert (=> d!56509 m!259803))

(assert (=> b!163642 d!56509))

(declare-fun d!56511 () Bool)

(assert (=> d!56511 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))) ((_ sign_extend 32) (currentByte!7655 thiss!1577)) ((_ sign_extend 32) (currentBit!7650 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3650 (buf!4102 thiss!1577))) ((_ sign_extend 32) (currentByte!7655 thiss!1577)) ((_ sign_extend 32) (currentBit!7650 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13990 () Bool)

(assert (= bs!13990 d!56511))

(assert (=> bs!13990 m!259855))

(assert (=> b!163637 d!56511))

(declare-fun d!56513 () Bool)

(assert (=> d!56513 (= (byteRangesEq!0 (select (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577)) lt!256744 #b00000000000000000000000000000000 (currentBit!7650 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7650 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7650 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256744) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7650 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13991 () Bool)

(assert (= bs!13991 d!56513))

(declare-fun m!259857 () Bool)

(assert (=> bs!13991 m!259857))

(declare-fun m!259859 () Bool)

(assert (=> bs!13991 m!259859))

(assert (=> b!163636 d!56513))

(declare-fun d!56515 () Bool)

(declare-fun res!136453 () Bool)

(declare-fun e!113100 () Bool)

(assert (=> d!56515 (=> res!136453 e!113100)))

(assert (=> d!56515 (= res!136453 (= #b00000000000000000000000000000000 (currentByte!7655 thiss!1577)))))

(assert (=> d!56515 (= (arrayRangesEq!584 (buf!4102 thiss!1577) lt!256746 #b00000000000000000000000000000000 (currentByte!7655 thiss!1577)) e!113100)))

(declare-fun b!163739 () Bool)

(declare-fun e!113101 () Bool)

(assert (=> b!163739 (= e!113100 e!113101)))

(declare-fun res!136454 () Bool)

(assert (=> b!163739 (=> (not res!136454) (not e!113101))))

(assert (=> b!163739 (= res!136454 (= (select (arr!4571 (buf!4102 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4571 lt!256746) #b00000000000000000000000000000000)))))

(declare-fun b!163740 () Bool)

(assert (=> b!163740 (= e!113101 (arrayRangesEq!584 (buf!4102 thiss!1577) lt!256746 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7655 thiss!1577)))))

(assert (= (and d!56515 (not res!136453)) b!163739))

(assert (= (and b!163739 res!136454) b!163740))

(declare-fun m!259861 () Bool)

(assert (=> b!163739 m!259861))

(declare-fun m!259863 () Bool)

(assert (=> b!163739 m!259863))

(declare-fun m!259865 () Bool)

(assert (=> b!163740 m!259865))

(assert (=> b!163636 d!56515))

(declare-fun d!56517 () Bool)

(declare-fun e!113110 () Bool)

(assert (=> d!56517 e!113110))

(declare-fun res!136465 () Bool)

(assert (=> d!56517 (=> (not res!136465) (not e!113110))))

(assert (=> d!56517 (= res!136465 (and (bvsge (currentByte!7655 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7655 thiss!1577) (size!3650 (buf!4102 thiss!1577)))))))

(declare-fun lt!256915 () Unit!11356)

(declare-fun choose!194 (array!8150 (_ BitVec 32) (_ BitVec 8)) Unit!11356)

(assert (=> d!56517 (= lt!256915 (choose!194 (buf!4102 thiss!1577) (currentByte!7655 thiss!1577) lt!256744))))

(assert (=> d!56517 (and (bvsle #b00000000000000000000000000000000 (currentByte!7655 thiss!1577)) (bvslt (currentByte!7655 thiss!1577) (size!3650 (buf!4102 thiss!1577))))))

(assert (=> d!56517 (= (arrayUpdatedAtPrefixLemma!192 (buf!4102 thiss!1577) (currentByte!7655 thiss!1577) lt!256744) lt!256915)))

(declare-fun b!163755 () Bool)

(assert (=> b!163755 (= e!113110 (arrayRangesEq!584 (buf!4102 thiss!1577) (array!8151 (store (arr!4571 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) lt!256744) (size!3650 (buf!4102 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7655 thiss!1577)))))

(assert (= (and d!56517 res!136465) b!163755))

(declare-fun m!259875 () Bool)

(assert (=> d!56517 m!259875))

(assert (=> b!163755 m!259749))

(declare-fun m!259877 () Bool)

(assert (=> b!163755 m!259877))

(assert (=> b!163636 d!56517))

(declare-fun d!56523 () Bool)

(assert (=> d!56523 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3650 (buf!4102 (_1!7857 lt!256742)))) ((_ sign_extend 32) (currentByte!7655 (_1!7857 lt!256742))) ((_ sign_extend 32) (currentBit!7650 (_1!7857 lt!256742))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3650 (buf!4102 (_1!7857 lt!256742)))) ((_ sign_extend 32) (currentByte!7655 (_1!7857 lt!256742))) ((_ sign_extend 32) (currentBit!7650 (_1!7857 lt!256742)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13993 () Bool)

(assert (= bs!13993 d!56523))

(declare-fun m!259879 () Bool)

(assert (=> bs!13993 m!259879))

(assert (=> b!163638 d!56523))

(declare-fun b!163803 () Bool)

(declare-fun res!136501 () Bool)

(declare-fun e!113134 () Bool)

(assert (=> b!163803 (=> (not res!136501) (not e!113134))))

(declare-fun lt!257074 () tuple2!14532)

(assert (=> b!163803 (= res!136501 (isPrefixOf!0 (_1!7857 lt!257074) thiss!1577))))

(declare-fun b!163804 () Bool)

(declare-fun e!113133 () Unit!11356)

(declare-fun Unit!11380 () Unit!11356)

(assert (=> b!163804 (= e!113133 Unit!11380)))

(declare-fun b!163805 () Bool)

(declare-fun res!136502 () Bool)

(assert (=> b!163805 (=> (not res!136502) (not e!113134))))

(assert (=> b!163805 (= res!136502 (isPrefixOf!0 (_2!7857 lt!257074) (_2!7858 lt!256745)))))

(declare-fun lt!257073 () (_ BitVec 64))

(declare-fun lt!257065 () (_ BitVec 64))

(declare-fun b!163806 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!6456 (_ BitVec 64)) BitStream!6456)

(assert (=> b!163806 (= e!113134 (= (_1!7857 lt!257074) (withMovedBitIndex!0 (_2!7857 lt!257074) (bvsub lt!257065 lt!257073))))))

(assert (=> b!163806 (or (= (bvand lt!257065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!257073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!257065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!257065 lt!257073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163806 (= lt!257073 (bitIndex!0 (size!3650 (buf!4102 (_2!7858 lt!256745))) (currentByte!7655 (_2!7858 lt!256745)) (currentBit!7650 (_2!7858 lt!256745))))))

(assert (=> b!163806 (= lt!257065 (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))

(declare-fun d!56525 () Bool)

(assert (=> d!56525 e!113134))

(declare-fun res!136503 () Bool)

(assert (=> d!56525 (=> (not res!136503) (not e!113134))))

(assert (=> d!56525 (= res!136503 (isPrefixOf!0 (_1!7857 lt!257074) (_2!7857 lt!257074)))))

(declare-fun lt!257061 () BitStream!6456)

(assert (=> d!56525 (= lt!257074 (tuple2!14533 lt!257061 (_2!7858 lt!256745)))))

(declare-fun lt!257067 () Unit!11356)

(declare-fun lt!257071 () Unit!11356)

(assert (=> d!56525 (= lt!257067 lt!257071)))

(assert (=> d!56525 (isPrefixOf!0 lt!257061 (_2!7858 lt!256745))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6456 BitStream!6456 BitStream!6456) Unit!11356)

(assert (=> d!56525 (= lt!257071 (lemmaIsPrefixTransitive!0 lt!257061 (_2!7858 lt!256745) (_2!7858 lt!256745)))))

(declare-fun lt!257069 () Unit!11356)

(declare-fun lt!257078 () Unit!11356)

(assert (=> d!56525 (= lt!257069 lt!257078)))

(assert (=> d!56525 (isPrefixOf!0 lt!257061 (_2!7858 lt!256745))))

(assert (=> d!56525 (= lt!257078 (lemmaIsPrefixTransitive!0 lt!257061 thiss!1577 (_2!7858 lt!256745)))))

(declare-fun lt!257066 () Unit!11356)

(assert (=> d!56525 (= lt!257066 e!113133)))

(declare-fun c!8576 () Bool)

(assert (=> d!56525 (= c!8576 (not (= (size!3650 (buf!4102 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!257064 () Unit!11356)

(declare-fun lt!257063 () Unit!11356)

(assert (=> d!56525 (= lt!257064 lt!257063)))

(assert (=> d!56525 (isPrefixOf!0 (_2!7858 lt!256745) (_2!7858 lt!256745))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6456) Unit!11356)

(assert (=> d!56525 (= lt!257063 (lemmaIsPrefixRefl!0 (_2!7858 lt!256745)))))

(declare-fun lt!257076 () Unit!11356)

(declare-fun lt!257077 () Unit!11356)

(assert (=> d!56525 (= lt!257076 lt!257077)))

(assert (=> d!56525 (= lt!257077 (lemmaIsPrefixRefl!0 (_2!7858 lt!256745)))))

(declare-fun lt!257068 () Unit!11356)

(declare-fun lt!257079 () Unit!11356)

(assert (=> d!56525 (= lt!257068 lt!257079)))

(assert (=> d!56525 (isPrefixOf!0 lt!257061 lt!257061)))

(assert (=> d!56525 (= lt!257079 (lemmaIsPrefixRefl!0 lt!257061))))

(declare-fun lt!257062 () Unit!11356)

(declare-fun lt!257060 () Unit!11356)

(assert (=> d!56525 (= lt!257062 lt!257060)))

(assert (=> d!56525 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56525 (= lt!257060 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56525 (= lt!257061 (BitStream!6457 (buf!4102 (_2!7858 lt!256745)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))

(assert (=> d!56525 (isPrefixOf!0 thiss!1577 (_2!7858 lt!256745))))

(assert (=> d!56525 (= (reader!0 thiss!1577 (_2!7858 lt!256745)) lt!257074)))

(declare-fun b!163807 () Bool)

(declare-fun lt!257070 () Unit!11356)

(assert (=> b!163807 (= e!113133 lt!257070)))

(declare-fun lt!257075 () (_ BitVec 64))

(assert (=> b!163807 (= lt!257075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!257072 () (_ BitVec 64))

(assert (=> b!163807 (= lt!257072 (bitIndex!0 (size!3650 (buf!4102 thiss!1577)) (currentByte!7655 thiss!1577) (currentBit!7650 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8150 array!8150 (_ BitVec 64) (_ BitVec 64)) Unit!11356)

(assert (=> b!163807 (= lt!257070 (arrayBitRangesEqSymmetric!0 (buf!4102 thiss!1577) (buf!4102 (_2!7858 lt!256745)) lt!257075 lt!257072))))

(assert (=> b!163807 (arrayBitRangesEq!0 (buf!4102 (_2!7858 lt!256745)) (buf!4102 thiss!1577) lt!257075 lt!257072)))

(assert (= (and d!56525 c!8576) b!163807))

(assert (= (and d!56525 (not c!8576)) b!163804))

(assert (= (and d!56525 res!136503) b!163803))

(assert (= (and b!163803 res!136501) b!163805))

(assert (= (and b!163805 res!136502) b!163806))

(declare-fun m!259947 () Bool)

(assert (=> b!163803 m!259947))

(assert (=> b!163807 m!259755))

(declare-fun m!259949 () Bool)

(assert (=> b!163807 m!259949))

(declare-fun m!259951 () Bool)

(assert (=> b!163807 m!259951))

(declare-fun m!259953 () Bool)

(assert (=> b!163805 m!259953))

(declare-fun m!259955 () Bool)

(assert (=> d!56525 m!259955))

(declare-fun m!259957 () Bool)

(assert (=> d!56525 m!259957))

(declare-fun m!259959 () Bool)

(assert (=> d!56525 m!259959))

(declare-fun m!259961 () Bool)

(assert (=> d!56525 m!259961))

(assert (=> d!56525 m!259731))

(declare-fun m!259963 () Bool)

(assert (=> d!56525 m!259963))

(declare-fun m!259965 () Bool)

(assert (=> d!56525 m!259965))

(declare-fun m!259967 () Bool)

(assert (=> d!56525 m!259967))

(declare-fun m!259969 () Bool)

(assert (=> d!56525 m!259969))

(declare-fun m!259971 () Bool)

(assert (=> d!56525 m!259971))

(declare-fun m!259973 () Bool)

(assert (=> d!56525 m!259973))

(declare-fun m!259975 () Bool)

(assert (=> b!163806 m!259975))

(assert (=> b!163806 m!259753))

(assert (=> b!163806 m!259755))

(assert (=> b!163638 d!56525))

(check-sat (not d!56467) (not b!163703) (not d!56517) (not d!56523) (not b!163803) (not d!56465) (not b!163720) (not b!163805) (not b!163806) (not d!56525) (not b!163755) (not b!163740) (not b!163722) (not b!163807) (not d!56507) (not d!56509) (not d!56511))
(check-sat)
