; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32456 () Bool)

(assert start!32456)

(declare-fun b!159964 () Bool)

(declare-fun e!109417 () Bool)

(declare-fun e!109415 () Bool)

(assert (=> b!159964 (= e!109417 (not e!109415))))

(declare-fun res!133512 () Bool)

(assert (=> b!159964 (=> res!133512 e!109415)))

(declare-datatypes ((array!7631 0))(
  ( (array!7632 (arr!4374 (Array (_ BitVec 32) (_ BitVec 8))) (size!3453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6074 0))(
  ( (BitStream!6075 (buf!3911 array!7631) (currentByte!7160 (_ BitVec 32)) (currentBit!7155 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6074)

(declare-datatypes ((Unit!10919 0))(
  ( (Unit!10920) )
))
(declare-datatypes ((tuple3!808 0))(
  ( (tuple3!809 (_1!7752 Unit!10919) (_2!7752 (_ BitVec 8)) (_3!521 BitStream!6074)) )
))
(declare-fun lt!252418 () tuple3!808)

(declare-fun lt!252413 () array!7631)

(declare-fun arrayRangesEq!504 (array!7631 array!7631 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159964 (= res!133512 (not (arrayRangesEq!504 (buf!3911 thiss!1602) lt!252413 #b00000000000000000000000000000000 (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001))))))

(declare-fun lt!252407 () (_ BitVec 8))

(assert (=> b!159964 (arrayRangesEq!504 (buf!3911 thiss!1602) (array!7632 (store (arr!4374 (buf!3911 thiss!1602)) (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001) lt!252407) (size!3453 (buf!3911 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001))))

(declare-fun lt!252414 () Unit!10919)

(declare-fun arrayUpdatedAtPrefixLemma!112 (array!7631 (_ BitVec 32) (_ BitVec 8)) Unit!10919)

(assert (=> b!159964 (= lt!252414 (arrayUpdatedAtPrefixLemma!112 (buf!3911 thiss!1602) (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001) lt!252407))))

(assert (=> b!159964 (= lt!252407 (select (arr!4374 (buf!3911 (_3!521 lt!252418))) (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252410 () (_ BitVec 8))

(declare-fun lt!252408 () (_ BitVec 32))

(declare-fun lt!252412 () Bool)

(declare-fun lt!252415 () (_ BitVec 8))

(declare-fun lt!252405 () (_ BitVec 8))

(declare-fun lt!252419 () (_ BitVec 32))

(declare-fun Unit!10921 () Unit!10919)

(declare-fun Unit!10922 () Unit!10919)

(assert (=> b!159964 (= lt!252418 (ite lt!252412 (let ((bdg!9454 ((_ extract 7 0) (bvnot lt!252419)))) (let ((bdg!9455 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602) lt!252410) (currentByte!7160 thiss!1602) lt!252405) (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)))) ((_ sign_extend 24) bdg!9454))))) (tuple3!809 Unit!10921 bdg!9454 (BitStream!6075 (array!7632 (store (arr!4374 (array!7632 (store (arr!4374 lt!252413) (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)) bdg!9455) (size!3453 lt!252413))) (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9455) (bvshl ((_ sign_extend 24) v!222) lt!252408)))) (size!3453 (array!7632 (store (arr!4374 lt!252413) (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)) bdg!9455) (size!3453 lt!252413)))) (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)) (currentBit!7155 thiss!1602))))) (tuple3!809 Unit!10922 lt!252415 (BitStream!6075 lt!252413 (bvadd #b00000000000000000000000000000001 (currentByte!7160 thiss!1602)) (currentBit!7155 thiss!1602)))))))

(declare-fun lt!252411 () (_ BitVec 32))

(assert (=> b!159964 (= lt!252412 (bvsgt lt!252411 #b00000000000000000000000000000000))))

(declare-fun e!109422 () Bool)

(assert (=> b!159964 e!109422))

(declare-fun res!133514 () Bool)

(assert (=> b!159964 (=> res!133514 e!109422)))

(assert (=> b!159964 (= res!133514 (bvsge (currentByte!7160 thiss!1602) (size!3453 (buf!3911 thiss!1602))))))

(assert (=> b!159964 (= lt!252413 (array!7632 (store (store (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602) lt!252410) (currentByte!7160 thiss!1602) lt!252405) (size!3453 (buf!3911 thiss!1602))))))

(assert (=> b!159964 (= lt!252405 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252410) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252411))))))

(assert (=> b!159964 (= lt!252410 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602))) lt!252419)))))

(assert (=> b!159964 (= lt!252419 ((_ sign_extend 24) lt!252415))))

(assert (=> b!159964 (= lt!252415 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252408)))))))

(assert (=> b!159964 (= lt!252408 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252411))))))

(assert (=> b!159964 (= lt!252411 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7155 thiss!1602))))))

(declare-fun b!159965 () Bool)

(declare-fun res!133511 () Bool)

(declare-fun e!109421 () Bool)

(assert (=> b!159965 (=> res!133511 e!109421)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!159965 (= res!133511 (not (= (bitIndex!0 (size!3453 (buf!3911 (_3!521 lt!252418))) (currentByte!7160 (_3!521 lt!252418)) (currentBit!7155 (_3!521 lt!252418))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3453 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602) (currentBit!7155 thiss!1602))))))))

(declare-fun b!159967 () Bool)

(assert (=> b!159967 (= e!109421 true)))

(declare-fun lt!252417 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6074 BitStream!6074) Bool)

(assert (=> b!159967 (= lt!252417 (isPrefixOf!0 thiss!1602 (_3!521 lt!252418)))))

(declare-fun b!159968 () Bool)

(declare-fun e!109418 () Unit!10919)

(declare-fun Unit!10923 () Unit!10919)

(assert (=> b!159968 (= e!109418 Unit!10923)))

(declare-fun call!2714 () Bool)

(assert (=> b!159968 call!2714))

(declare-fun b!159969 () Bool)

(assert (=> b!159969 (= e!109415 e!109421)))

(declare-fun res!133510 () Bool)

(assert (=> b!159969 (=> res!133510 e!109421)))

(assert (=> b!159969 (= res!133510 (not (= (size!3453 (buf!3911 thiss!1602)) (size!3453 (buf!3911 (_3!521 lt!252418))))))))

(declare-fun lt!252409 () Unit!10919)

(assert (=> b!159969 (= lt!252409 e!109418)))

(declare-fun c!8444 () Bool)

(assert (=> b!159969 (= c!8444 lt!252412)))

(declare-fun b!159970 () Bool)

(declare-fun e!109420 () Bool)

(assert (=> b!159970 (= e!109420 (arrayRangesEq!504 (buf!3911 thiss!1602) (buf!3911 (_3!521 lt!252418)) #b00000000000000000000000000000000 (currentByte!7160 thiss!1602)))))

(declare-fun b!159971 () Bool)

(declare-fun e!109416 () Bool)

(declare-fun array_inv!3200 (array!7631) Bool)

(assert (=> b!159971 (= e!109416 (array_inv!3200 (buf!3911 thiss!1602)))))

(declare-fun bm!2711 () Bool)

(assert (=> bm!2711 (= call!2714 (arrayRangesEq!504 (ite c!8444 lt!252413 (buf!3911 thiss!1602)) (ite c!8444 (array!7632 (store (store (store (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602) lt!252410) (currentByte!7160 thiss!1602) lt!252405) (currentByte!7160 (_3!521 lt!252418)) (select (arr!4374 (buf!3911 (_3!521 lt!252418))) (currentByte!7160 (_3!521 lt!252418)))) (size!3453 (buf!3911 thiss!1602))) (buf!3911 (_3!521 lt!252418))) #b00000000000000000000000000000000 (ite c!8444 (currentByte!7160 (_3!521 lt!252418)) (currentByte!7160 thiss!1602))))))

(declare-fun b!159972 () Bool)

(declare-fun Unit!10924 () Unit!10919)

(assert (=> b!159972 (= e!109418 Unit!10924)))

(declare-fun lt!252406 () Unit!10919)

(assert (=> b!159972 (= lt!252406 (arrayUpdatedAtPrefixLemma!112 (buf!3911 thiss!1602) (currentByte!7160 (_3!521 lt!252418)) (select (arr!4374 (buf!3911 (_3!521 lt!252418))) (currentByte!7160 (_3!521 lt!252418)))))))

(assert (=> b!159972 (arrayRangesEq!504 (buf!3911 thiss!1602) (array!7632 (store (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 (_3!521 lt!252418)) (select (arr!4374 (buf!3911 (_3!521 lt!252418))) (currentByte!7160 (_3!521 lt!252418)))) (size!3453 (buf!3911 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7160 (_3!521 lt!252418)))))

(declare-fun lt!252420 () Unit!10919)

(assert (=> b!159972 (= lt!252420 (arrayUpdatedAtPrefixLemma!112 lt!252413 (currentByte!7160 (_3!521 lt!252418)) (select (arr!4374 (buf!3911 (_3!521 lt!252418))) (currentByte!7160 (_3!521 lt!252418)))))))

(assert (=> b!159972 call!2714))

(declare-fun lt!252416 () Unit!10919)

(declare-fun arrayRangesEqTransitive!138 (array!7631 array!7631 array!7631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10919)

(assert (=> b!159972 (= lt!252416 (arrayRangesEqTransitive!138 (buf!3911 thiss!1602) lt!252413 (buf!3911 (_3!521 lt!252418)) #b00000000000000000000000000000000 (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001) (currentByte!7160 (_3!521 lt!252418))))))

(declare-fun res!133509 () Bool)

(assert (=> b!159972 (= res!133509 (arrayRangesEq!504 (buf!3911 thiss!1602) (buf!3911 (_3!521 lt!252418)) #b00000000000000000000000000000000 (bvsub (currentByte!7160 (_3!521 lt!252418)) #b00000000000000000000000000000001)))))

(assert (=> b!159972 (=> (not res!133509) (not e!109420))))

(assert (=> b!159972 e!109420))

(declare-fun b!159966 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159966 (= e!109422 (byteRangesEq!0 (select (arr!4374 (buf!3911 thiss!1602)) (currentByte!7160 thiss!1602)) lt!252405 #b00000000000000000000000000000000 (currentBit!7155 thiss!1602)))))

(declare-fun res!133513 () Bool)

(assert (=> start!32456 (=> (not res!133513) (not e!109417))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32456 (= res!133513 (validate_offset_byte!0 ((_ sign_extend 32) (size!3453 (buf!3911 thiss!1602))) ((_ sign_extend 32) (currentByte!7160 thiss!1602)) ((_ sign_extend 32) (currentBit!7155 thiss!1602))))))

(assert (=> start!32456 e!109417))

(declare-fun inv!12 (BitStream!6074) Bool)

(assert (=> start!32456 (and (inv!12 thiss!1602) e!109416)))

(assert (=> start!32456 true))

(assert (= (and start!32456 res!133513) b!159964))

(assert (= (and b!159964 (not res!133514)) b!159966))

(assert (= (and b!159964 (not res!133512)) b!159969))

(assert (= (and b!159969 c!8444) b!159972))

(assert (= (and b!159969 (not c!8444)) b!159968))

(assert (= (and b!159972 res!133509) b!159970))

(assert (= (or b!159972 b!159968) bm!2711))

(assert (= (and b!159969 (not res!133510)) b!159965))

(assert (= (and b!159965 (not res!133511)) b!159967))

(assert (= start!32456 b!159971))

(declare-fun m!252411 () Bool)

(assert (=> start!32456 m!252411))

(declare-fun m!252413 () Bool)

(assert (=> start!32456 m!252413))

(declare-fun m!252415 () Bool)

(assert (=> b!159967 m!252415))

(declare-fun m!252417 () Bool)

(assert (=> b!159970 m!252417))

(declare-fun m!252419 () Bool)

(assert (=> bm!2711 m!252419))

(declare-fun m!252421 () Bool)

(assert (=> bm!2711 m!252421))

(declare-fun m!252423 () Bool)

(assert (=> bm!2711 m!252423))

(declare-fun m!252425 () Bool)

(assert (=> bm!2711 m!252425))

(declare-fun m!252427 () Bool)

(assert (=> bm!2711 m!252427))

(declare-fun m!252429 () Bool)

(assert (=> b!159972 m!252429))

(assert (=> b!159972 m!252425))

(declare-fun m!252431 () Bool)

(assert (=> b!159972 m!252431))

(assert (=> b!159972 m!252425))

(declare-fun m!252433 () Bool)

(assert (=> b!159972 m!252433))

(declare-fun m!252435 () Bool)

(assert (=> b!159972 m!252435))

(assert (=> b!159972 m!252425))

(declare-fun m!252437 () Bool)

(assert (=> b!159972 m!252437))

(declare-fun m!252439 () Bool)

(assert (=> b!159972 m!252439))

(declare-fun m!252441 () Bool)

(assert (=> b!159971 m!252441))

(declare-fun m!252443 () Bool)

(assert (=> b!159966 m!252443))

(assert (=> b!159966 m!252443))

(declare-fun m!252445 () Bool)

(assert (=> b!159966 m!252445))

(assert (=> b!159964 m!252419))

(assert (=> b!159964 m!252421))

(declare-fun m!252447 () Bool)

(assert (=> b!159964 m!252447))

(declare-fun m!252449 () Bool)

(assert (=> b!159964 m!252449))

(declare-fun m!252451 () Bool)

(assert (=> b!159964 m!252451))

(declare-fun m!252453 () Bool)

(assert (=> b!159964 m!252453))

(declare-fun m!252455 () Bool)

(assert (=> b!159964 m!252455))

(declare-fun m!252457 () Bool)

(assert (=> b!159964 m!252457))

(declare-fun m!252459 () Bool)

(assert (=> b!159964 m!252459))

(declare-fun m!252461 () Bool)

(assert (=> b!159964 m!252461))

(assert (=> b!159964 m!252443))

(declare-fun m!252463 () Bool)

(assert (=> b!159964 m!252463))

(declare-fun m!252465 () Bool)

(assert (=> b!159965 m!252465))

(declare-fun m!252467 () Bool)

(assert (=> b!159965 m!252467))

(push 1)

