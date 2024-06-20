; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32454 () Bool)

(assert start!32454)

(declare-fun b!159937 () Bool)

(declare-fun res!133492 () Bool)

(declare-fun e!109397 () Bool)

(assert (=> b!159937 (=> res!133492 e!109397)))

(declare-datatypes ((array!7629 0))(
  ( (array!7630 (arr!4373 (Array (_ BitVec 32) (_ BitVec 8))) (size!3452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6072 0))(
  ( (BitStream!6073 (buf!3910 array!7629) (currentByte!7159 (_ BitVec 32)) (currentBit!7154 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10913 0))(
  ( (Unit!10914) )
))
(declare-datatypes ((tuple3!806 0))(
  ( (tuple3!807 (_1!7751 Unit!10913) (_2!7751 (_ BitVec 8)) (_3!520 BitStream!6072)) )
))
(declare-fun lt!252366 () tuple3!806)

(declare-fun thiss!1602 () BitStream!6072)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!159937 (= res!133492 (not (= (bitIndex!0 (size!3452 (buf!3910 (_3!520 lt!252366))) (currentByte!7159 (_3!520 lt!252366)) (currentBit!7154 (_3!520 lt!252366))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3452 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602) (currentBit!7154 thiss!1602))))))))

(declare-fun c!8441 () Bool)

(declare-fun call!2711 () Bool)

(declare-fun bm!2708 () Bool)

(declare-fun arrayRangesEq!503 (array!7629 array!7629 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2708 (= call!2711 (arrayRangesEq!503 (buf!3910 thiss!1602) (buf!3910 (_3!520 lt!252366)) #b00000000000000000000000000000000 (ite c!8441 (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001) (currentByte!7159 thiss!1602))))))

(declare-fun b!159938 () Bool)

(declare-fun e!109393 () Unit!10913)

(declare-fun Unit!10915 () Unit!10913)

(assert (=> b!159938 (= e!109393 Unit!10915)))

(assert (=> b!159938 call!2711))

(declare-fun b!159939 () Bool)

(assert (=> b!159939 (= e!109397 true)))

(declare-fun lt!252367 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6072 BitStream!6072) Bool)

(assert (=> b!159939 (= lt!252367 (isPrefixOf!0 thiss!1602 (_3!520 lt!252366)))))

(declare-fun b!159940 () Bool)

(declare-fun e!109392 () Bool)

(assert (=> b!159940 (= e!109392 (arrayRangesEq!503 (buf!3910 thiss!1602) (buf!3910 (_3!520 lt!252366)) #b00000000000000000000000000000000 (currentByte!7159 thiss!1602)))))

(declare-fun b!159941 () Bool)

(declare-fun e!109391 () Bool)

(declare-fun e!109396 () Bool)

(assert (=> b!159941 (= e!109391 (not e!109396))))

(declare-fun res!133495 () Bool)

(assert (=> b!159941 (=> res!133495 e!109396)))

(declare-fun lt!252363 () array!7629)

(assert (=> b!159941 (= res!133495 (not (arrayRangesEq!503 (buf!3910 thiss!1602) lt!252363 #b00000000000000000000000000000000 (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001))))))

(declare-fun lt!252361 () (_ BitVec 8))

(assert (=> b!159941 (arrayRangesEq!503 (buf!3910 thiss!1602) (array!7630 (store (arr!4373 (buf!3910 thiss!1602)) (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001) lt!252361) (size!3452 (buf!3910 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001))))

(declare-fun lt!252359 () Unit!10913)

(declare-fun arrayUpdatedAtPrefixLemma!111 (array!7629 (_ BitVec 32) (_ BitVec 8)) Unit!10913)

(assert (=> b!159941 (= lt!252359 (arrayUpdatedAtPrefixLemma!111 (buf!3910 thiss!1602) (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001) lt!252361))))

(assert (=> b!159941 (= lt!252361 (select (arr!4373 (buf!3910 (_3!520 lt!252366))) (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001)))))

(declare-fun lt!252370 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252360 () Bool)

(declare-fun lt!252365 () (_ BitVec 8))

(declare-fun lt!252358 () (_ BitVec 8))

(declare-fun lt!252371 () (_ BitVec 8))

(declare-fun lt!252368 () (_ BitVec 32))

(declare-fun Unit!10916 () Unit!10913)

(declare-fun Unit!10917 () Unit!10913)

(assert (=> b!159941 (= lt!252366 (ite lt!252360 (let ((bdg!9454 ((_ extract 7 0) (bvnot lt!252370)))) (let ((bdg!9455 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602) lt!252371) (currentByte!7159 thiss!1602) lt!252365) (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)))) ((_ sign_extend 24) bdg!9454))))) (tuple3!807 Unit!10916 bdg!9454 (BitStream!6073 (array!7630 (store (arr!4373 (array!7630 (store (arr!4373 lt!252363) (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)) bdg!9455) (size!3452 lt!252363))) (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9455) (bvshl ((_ sign_extend 24) v!222) lt!252368)))) (size!3452 (array!7630 (store (arr!4373 lt!252363) (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)) bdg!9455) (size!3452 lt!252363)))) (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)) (currentBit!7154 thiss!1602))))) (tuple3!807 Unit!10917 lt!252358 (BitStream!6073 lt!252363 (bvadd #b00000000000000000000000000000001 (currentByte!7159 thiss!1602)) (currentBit!7154 thiss!1602)))))))

(declare-fun lt!252372 () (_ BitVec 32))

(assert (=> b!159941 (= lt!252360 (bvsgt lt!252372 #b00000000000000000000000000000000))))

(declare-fun e!109395 () Bool)

(assert (=> b!159941 e!109395))

(declare-fun res!133496 () Bool)

(assert (=> b!159941 (=> res!133496 e!109395)))

(assert (=> b!159941 (= res!133496 (bvsge (currentByte!7159 thiss!1602) (size!3452 (buf!3910 thiss!1602))))))

(assert (=> b!159941 (= lt!252363 (array!7630 (store (store (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602) lt!252371) (currentByte!7159 thiss!1602) lt!252365) (size!3452 (buf!3910 thiss!1602))))))

(assert (=> b!159941 (= lt!252365 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252371) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252372))))))

(assert (=> b!159941 (= lt!252371 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602))) lt!252370)))))

(assert (=> b!159941 (= lt!252370 ((_ sign_extend 24) lt!252358))))

(assert (=> b!159941 (= lt!252358 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252368)))))))

(assert (=> b!159941 (= lt!252368 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252372))))))

(assert (=> b!159941 (= lt!252372 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7154 thiss!1602))))))

(declare-fun b!159942 () Bool)

(assert (=> b!159942 (= e!109396 e!109397)))

(declare-fun res!133493 () Bool)

(assert (=> b!159942 (=> res!133493 e!109397)))

(assert (=> b!159942 (= res!133493 (not (= (size!3452 (buf!3910 thiss!1602)) (size!3452 (buf!3910 (_3!520 lt!252366))))))))

(declare-fun lt!252364 () Unit!10913)

(assert (=> b!159942 (= lt!252364 e!109393)))

(assert (=> b!159942 (= c!8441 lt!252360)))

(declare-fun res!133494 () Bool)

(assert (=> start!32454 (=> (not res!133494) (not e!109391))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32454 (= res!133494 (validate_offset_byte!0 ((_ sign_extend 32) (size!3452 (buf!3910 thiss!1602))) ((_ sign_extend 32) (currentByte!7159 thiss!1602)) ((_ sign_extend 32) (currentBit!7154 thiss!1602))))))

(assert (=> start!32454 e!109391))

(declare-fun e!109398 () Bool)

(declare-fun inv!12 (BitStream!6072) Bool)

(assert (=> start!32454 (and (inv!12 thiss!1602) e!109398)))

(assert (=> start!32454 true))

(declare-fun b!159943 () Bool)

(declare-fun array_inv!3199 (array!7629) Bool)

(assert (=> b!159943 (= e!109398 (array_inv!3199 (buf!3910 thiss!1602)))))

(declare-fun b!159944 () Bool)

(declare-fun Unit!10918 () Unit!10913)

(assert (=> b!159944 (= e!109393 Unit!10918)))

(declare-fun lt!252369 () Unit!10913)

(assert (=> b!159944 (= lt!252369 (arrayUpdatedAtPrefixLemma!111 (buf!3910 thiss!1602) (currentByte!7159 (_3!520 lt!252366)) (select (arr!4373 (buf!3910 (_3!520 lt!252366))) (currentByte!7159 (_3!520 lt!252366)))))))

(assert (=> b!159944 (arrayRangesEq!503 (buf!3910 thiss!1602) (array!7630 (store (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 (_3!520 lt!252366)) (select (arr!4373 (buf!3910 (_3!520 lt!252366))) (currentByte!7159 (_3!520 lt!252366)))) (size!3452 (buf!3910 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7159 (_3!520 lt!252366)))))

(declare-fun lt!252362 () Unit!10913)

(assert (=> b!159944 (= lt!252362 (arrayUpdatedAtPrefixLemma!111 lt!252363 (currentByte!7159 (_3!520 lt!252366)) (select (arr!4373 (buf!3910 (_3!520 lt!252366))) (currentByte!7159 (_3!520 lt!252366)))))))

(assert (=> b!159944 (arrayRangesEq!503 lt!252363 (array!7630 (store (store (store (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602) lt!252371) (currentByte!7159 thiss!1602) lt!252365) (currentByte!7159 (_3!520 lt!252366)) (select (arr!4373 (buf!3910 (_3!520 lt!252366))) (currentByte!7159 (_3!520 lt!252366)))) (size!3452 (buf!3910 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7159 (_3!520 lt!252366)))))

(declare-fun lt!252357 () Unit!10913)

(declare-fun arrayRangesEqTransitive!137 (array!7629 array!7629 array!7629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10913)

(assert (=> b!159944 (= lt!252357 (arrayRangesEqTransitive!137 (buf!3910 thiss!1602) lt!252363 (buf!3910 (_3!520 lt!252366)) #b00000000000000000000000000000000 (bvsub (currentByte!7159 (_3!520 lt!252366)) #b00000000000000000000000000000001) (currentByte!7159 (_3!520 lt!252366))))))

(declare-fun res!133491 () Bool)

(assert (=> b!159944 (= res!133491 call!2711)))

(assert (=> b!159944 (=> (not res!133491) (not e!109392))))

(assert (=> b!159944 e!109392))

(declare-fun b!159945 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159945 (= e!109395 (byteRangesEq!0 (select (arr!4373 (buf!3910 thiss!1602)) (currentByte!7159 thiss!1602)) lt!252365 #b00000000000000000000000000000000 (currentBit!7154 thiss!1602)))))

(assert (= (and start!32454 res!133494) b!159941))

(assert (= (and b!159941 (not res!133496)) b!159945))

(assert (= (and b!159941 (not res!133495)) b!159942))

(assert (= (and b!159942 c!8441) b!159944))

(assert (= (and b!159942 (not c!8441)) b!159938))

(assert (= (and b!159944 res!133491) b!159940))

(assert (= (or b!159944 b!159938) bm!2708))

(assert (= (and b!159942 (not res!133493)) b!159937))

(assert (= (and b!159937 (not res!133492)) b!159939))

(assert (= start!32454 b!159943))

(declare-fun m!252353 () Bool)

(assert (=> b!159941 m!252353))

(declare-fun m!252355 () Bool)

(assert (=> b!159941 m!252355))

(declare-fun m!252357 () Bool)

(assert (=> b!159941 m!252357))

(declare-fun m!252359 () Bool)

(assert (=> b!159941 m!252359))

(declare-fun m!252361 () Bool)

(assert (=> b!159941 m!252361))

(declare-fun m!252363 () Bool)

(assert (=> b!159941 m!252363))

(declare-fun m!252365 () Bool)

(assert (=> b!159941 m!252365))

(declare-fun m!252367 () Bool)

(assert (=> b!159941 m!252367))

(declare-fun m!252369 () Bool)

(assert (=> b!159941 m!252369))

(declare-fun m!252371 () Bool)

(assert (=> b!159941 m!252371))

(declare-fun m!252373 () Bool)

(assert (=> b!159941 m!252373))

(declare-fun m!252375 () Bool)

(assert (=> b!159941 m!252375))

(declare-fun m!252377 () Bool)

(assert (=> b!159943 m!252377))

(declare-fun m!252379 () Bool)

(assert (=> b!159937 m!252379))

(declare-fun m!252381 () Bool)

(assert (=> b!159937 m!252381))

(declare-fun m!252383 () Bool)

(assert (=> b!159944 m!252383))

(declare-fun m!252385 () Bool)

(assert (=> b!159944 m!252385))

(assert (=> b!159944 m!252371))

(declare-fun m!252387 () Bool)

(assert (=> b!159944 m!252387))

(assert (=> b!159944 m!252373))

(assert (=> b!159944 m!252385))

(declare-fun m!252389 () Bool)

(assert (=> b!159944 m!252389))

(declare-fun m!252391 () Bool)

(assert (=> b!159944 m!252391))

(declare-fun m!252393 () Bool)

(assert (=> b!159944 m!252393))

(assert (=> b!159944 m!252385))

(declare-fun m!252395 () Bool)

(assert (=> b!159944 m!252395))

(declare-fun m!252397 () Bool)

(assert (=> b!159944 m!252397))

(declare-fun m!252399 () Bool)

(assert (=> start!32454 m!252399))

(declare-fun m!252401 () Bool)

(assert (=> start!32454 m!252401))

(declare-fun m!252403 () Bool)

(assert (=> b!159940 m!252403))

(declare-fun m!252405 () Bool)

(assert (=> b!159939 m!252405))

(assert (=> b!159945 m!252359))

(assert (=> b!159945 m!252359))

(declare-fun m!252407 () Bool)

(assert (=> b!159945 m!252407))

(declare-fun m!252409 () Bool)

(assert (=> bm!2708 m!252409))

(check-sat (not b!159940) (not bm!2708) (not b!159944) (not b!159939) (not start!32454) (not b!159937) (not b!159945) (not b!159941) (not b!159943))
(check-sat)
