; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32452 () Bool)

(assert start!32452)

(declare-fun b!159910 () Bool)

(declare-datatypes ((Unit!10907 0))(
  ( (Unit!10908) )
))
(declare-fun e!109368 () Unit!10907)

(declare-fun Unit!10909 () Unit!10907)

(assert (=> b!159910 (= e!109368 Unit!10909)))

(declare-fun call!2708 () Bool)

(assert (=> b!159910 call!2708))

(declare-fun b!159911 () Bool)

(declare-fun e!109367 () Bool)

(declare-datatypes ((array!7627 0))(
  ( (array!7628 (arr!4372 (Array (_ BitVec 32) (_ BitVec 8))) (size!3451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6070 0))(
  ( (BitStream!6071 (buf!3909 array!7627) (currentByte!7158 (_ BitVec 32)) (currentBit!7153 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6070)

(declare-fun lt!252314 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159911 (= e!109367 (byteRangesEq!0 (select (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602)) lt!252314 #b00000000000000000000000000000000 (currentBit!7153 thiss!1602)))))

(declare-fun b!159912 () Bool)

(declare-fun e!109372 () Bool)

(declare-fun array_inv!3198 (array!7627) Bool)

(assert (=> b!159912 (= e!109372 (array_inv!3198 (buf!3909 thiss!1602)))))

(declare-fun b!159913 () Bool)

(declare-fun e!109370 () Bool)

(declare-fun e!109374 () Bool)

(assert (=> b!159913 (= e!109370 (not e!109374))))

(declare-fun res!133474 () Bool)

(assert (=> b!159913 (=> res!133474 e!109374)))

(declare-fun lt!252312 () array!7627)

(declare-datatypes ((tuple3!804 0))(
  ( (tuple3!805 (_1!7750 Unit!10907) (_2!7750 (_ BitVec 8)) (_3!519 BitStream!6070)) )
))
(declare-fun lt!252315 () tuple3!804)

(declare-fun arrayRangesEq!502 (array!7627 array!7627 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159913 (= res!133474 (not (arrayRangesEq!502 (buf!3909 thiss!1602) lt!252312 #b00000000000000000000000000000000 (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001))))))

(declare-fun lt!252317 () (_ BitVec 8))

(assert (=> b!159913 (arrayRangesEq!502 (buf!3909 thiss!1602) (array!7628 (store (arr!4372 (buf!3909 thiss!1602)) (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001) lt!252317) (size!3451 (buf!3909 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001))))

(declare-fun lt!252322 () Unit!10907)

(declare-fun arrayUpdatedAtPrefixLemma!110 (array!7627 (_ BitVec 32) (_ BitVec 8)) Unit!10907)

(assert (=> b!159913 (= lt!252322 (arrayUpdatedAtPrefixLemma!110 (buf!3909 thiss!1602) (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001) lt!252317))))

(assert (=> b!159913 (= lt!252317 (select (arr!4372 (buf!3909 (_3!519 lt!252315))) (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252309 () (_ BitVec 32))

(declare-fun lt!252323 () Bool)

(declare-fun lt!252321 () (_ BitVec 32))

(declare-fun lt!252311 () (_ BitVec 8))

(declare-fun lt!252319 () (_ BitVec 8))

(declare-fun Unit!10910 () Unit!10907)

(declare-fun Unit!10911 () Unit!10907)

(assert (=> b!159913 (= lt!252315 (ite lt!252323 (let ((bdg!9454 ((_ extract 7 0) (bvnot lt!252309)))) (let ((bdg!9455 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602) lt!252319) (currentByte!7158 thiss!1602) lt!252314) (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)))) ((_ sign_extend 24) bdg!9454))))) (tuple3!805 Unit!10910 bdg!9454 (BitStream!6071 (array!7628 (store (arr!4372 (array!7628 (store (arr!4372 lt!252312) (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)) bdg!9455) (size!3451 lt!252312))) (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9455) (bvshl ((_ sign_extend 24) v!222) lt!252321)))) (size!3451 (array!7628 (store (arr!4372 lt!252312) (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)) bdg!9455) (size!3451 lt!252312)))) (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)) (currentBit!7153 thiss!1602))))) (tuple3!805 Unit!10911 lt!252311 (BitStream!6071 lt!252312 (bvadd #b00000000000000000000000000000001 (currentByte!7158 thiss!1602)) (currentBit!7153 thiss!1602)))))))

(declare-fun lt!252320 () (_ BitVec 32))

(assert (=> b!159913 (= lt!252323 (bvsgt lt!252320 #b00000000000000000000000000000000))))

(assert (=> b!159913 e!109367))

(declare-fun res!133476 () Bool)

(assert (=> b!159913 (=> res!133476 e!109367)))

(assert (=> b!159913 (= res!133476 (bvsge (currentByte!7158 thiss!1602) (size!3451 (buf!3909 thiss!1602))))))

(assert (=> b!159913 (= lt!252312 (array!7628 (store (store (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602) lt!252319) (currentByte!7158 thiss!1602) lt!252314) (size!3451 (buf!3909 thiss!1602))))))

(assert (=> b!159913 (= lt!252314 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252319) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252320))))))

(assert (=> b!159913 (= lt!252319 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602))) lt!252309)))))

(assert (=> b!159913 (= lt!252309 ((_ sign_extend 24) lt!252311))))

(assert (=> b!159913 (= lt!252311 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252321)))))))

(assert (=> b!159913 (= lt!252321 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252320))))))

(assert (=> b!159913 (= lt!252320 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7153 thiss!1602))))))

(declare-fun res!133475 () Bool)

(assert (=> start!32452 (=> (not res!133475) (not e!109370))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32452 (= res!133475 (validate_offset_byte!0 ((_ sign_extend 32) (size!3451 (buf!3909 thiss!1602))) ((_ sign_extend 32) (currentByte!7158 thiss!1602)) ((_ sign_extend 32) (currentBit!7153 thiss!1602))))))

(assert (=> start!32452 e!109370))

(declare-fun inv!12 (BitStream!6070) Bool)

(assert (=> start!32452 (and (inv!12 thiss!1602) e!109372)))

(assert (=> start!32452 true))

(declare-fun bm!2705 () Bool)

(declare-fun c!8438 () Bool)

(assert (=> bm!2705 (= call!2708 (arrayRangesEq!502 (buf!3909 thiss!1602) (buf!3909 (_3!519 lt!252315)) #b00000000000000000000000000000000 (ite c!8438 (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001) (currentByte!7158 thiss!1602))))))

(declare-fun b!159914 () Bool)

(declare-fun e!109369 () Bool)

(assert (=> b!159914 (= e!109369 true)))

(declare-fun lt!252313 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6070 BitStream!6070) Bool)

(assert (=> b!159914 (= lt!252313 (isPrefixOf!0 thiss!1602 (_3!519 lt!252315)))))

(declare-fun b!159915 () Bool)

(declare-fun e!109371 () Bool)

(assert (=> b!159915 (= e!109371 (arrayRangesEq!502 (buf!3909 thiss!1602) (buf!3909 (_3!519 lt!252315)) #b00000000000000000000000000000000 (currentByte!7158 thiss!1602)))))

(declare-fun b!159916 () Bool)

(assert (=> b!159916 (= e!109374 e!109369)))

(declare-fun res!133473 () Bool)

(assert (=> b!159916 (=> res!133473 e!109369)))

(assert (=> b!159916 (= res!133473 (not (= (size!3451 (buf!3909 thiss!1602)) (size!3451 (buf!3909 (_3!519 lt!252315))))))))

(declare-fun lt!252310 () Unit!10907)

(assert (=> b!159916 (= lt!252310 e!109368)))

(assert (=> b!159916 (= c!8438 lt!252323)))

(declare-fun b!159917 () Bool)

(declare-fun Unit!10912 () Unit!10907)

(assert (=> b!159917 (= e!109368 Unit!10912)))

(declare-fun lt!252318 () Unit!10907)

(assert (=> b!159917 (= lt!252318 (arrayUpdatedAtPrefixLemma!110 (buf!3909 thiss!1602) (currentByte!7158 (_3!519 lt!252315)) (select (arr!4372 (buf!3909 (_3!519 lt!252315))) (currentByte!7158 (_3!519 lt!252315)))))))

(assert (=> b!159917 (arrayRangesEq!502 (buf!3909 thiss!1602) (array!7628 (store (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 (_3!519 lt!252315)) (select (arr!4372 (buf!3909 (_3!519 lt!252315))) (currentByte!7158 (_3!519 lt!252315)))) (size!3451 (buf!3909 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7158 (_3!519 lt!252315)))))

(declare-fun lt!252324 () Unit!10907)

(assert (=> b!159917 (= lt!252324 (arrayUpdatedAtPrefixLemma!110 lt!252312 (currentByte!7158 (_3!519 lt!252315)) (select (arr!4372 (buf!3909 (_3!519 lt!252315))) (currentByte!7158 (_3!519 lt!252315)))))))

(assert (=> b!159917 (arrayRangesEq!502 lt!252312 (array!7628 (store (store (store (arr!4372 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602) lt!252319) (currentByte!7158 thiss!1602) lt!252314) (currentByte!7158 (_3!519 lt!252315)) (select (arr!4372 (buf!3909 (_3!519 lt!252315))) (currentByte!7158 (_3!519 lt!252315)))) (size!3451 (buf!3909 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7158 (_3!519 lt!252315)))))

(declare-fun lt!252316 () Unit!10907)

(declare-fun arrayRangesEqTransitive!136 (array!7627 array!7627 array!7627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10907)

(assert (=> b!159917 (= lt!252316 (arrayRangesEqTransitive!136 (buf!3909 thiss!1602) lt!252312 (buf!3909 (_3!519 lt!252315)) #b00000000000000000000000000000000 (bvsub (currentByte!7158 (_3!519 lt!252315)) #b00000000000000000000000000000001) (currentByte!7158 (_3!519 lt!252315))))))

(declare-fun res!133478 () Bool)

(assert (=> b!159917 (= res!133478 call!2708)))

(assert (=> b!159917 (=> (not res!133478) (not e!109371))))

(assert (=> b!159917 e!109371))

(declare-fun b!159918 () Bool)

(declare-fun res!133477 () Bool)

(assert (=> b!159918 (=> res!133477 e!109369)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!159918 (= res!133477 (not (= (bitIndex!0 (size!3451 (buf!3909 (_3!519 lt!252315))) (currentByte!7158 (_3!519 lt!252315)) (currentBit!7153 (_3!519 lt!252315))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3451 (buf!3909 thiss!1602)) (currentByte!7158 thiss!1602) (currentBit!7153 thiss!1602))))))))

(assert (= (and start!32452 res!133475) b!159913))

(assert (= (and b!159913 (not res!133476)) b!159911))

(assert (= (and b!159913 (not res!133474)) b!159916))

(assert (= (and b!159916 c!8438) b!159917))

(assert (= (and b!159916 (not c!8438)) b!159910))

(assert (= (and b!159917 res!133478) b!159915))

(assert (= (or b!159917 b!159910) bm!2705))

(assert (= (and b!159916 (not res!133473)) b!159918))

(assert (= (and b!159918 (not res!133477)) b!159914))

(assert (= start!32452 b!159912))

(declare-fun m!252295 () Bool)

(assert (=> b!159911 m!252295))

(assert (=> b!159911 m!252295))

(declare-fun m!252297 () Bool)

(assert (=> b!159911 m!252297))

(declare-fun m!252299 () Bool)

(assert (=> b!159912 m!252299))

(declare-fun m!252301 () Bool)

(assert (=> b!159915 m!252301))

(declare-fun m!252303 () Bool)

(assert (=> b!159914 m!252303))

(declare-fun m!252305 () Bool)

(assert (=> start!32452 m!252305))

(declare-fun m!252307 () Bool)

(assert (=> start!32452 m!252307))

(declare-fun m!252309 () Bool)

(assert (=> bm!2705 m!252309))

(declare-fun m!252311 () Bool)

(assert (=> b!159913 m!252311))

(declare-fun m!252313 () Bool)

(assert (=> b!159913 m!252313))

(declare-fun m!252315 () Bool)

(assert (=> b!159913 m!252315))

(declare-fun m!252317 () Bool)

(assert (=> b!159913 m!252317))

(declare-fun m!252319 () Bool)

(assert (=> b!159913 m!252319))

(declare-fun m!252321 () Bool)

(assert (=> b!159913 m!252321))

(assert (=> b!159913 m!252295))

(declare-fun m!252323 () Bool)

(assert (=> b!159913 m!252323))

(declare-fun m!252325 () Bool)

(assert (=> b!159913 m!252325))

(declare-fun m!252327 () Bool)

(assert (=> b!159913 m!252327))

(declare-fun m!252329 () Bool)

(assert (=> b!159913 m!252329))

(declare-fun m!252331 () Bool)

(assert (=> b!159913 m!252331))

(declare-fun m!252333 () Bool)

(assert (=> b!159918 m!252333))

(declare-fun m!252335 () Bool)

(assert (=> b!159918 m!252335))

(declare-fun m!252337 () Bool)

(assert (=> b!159917 m!252337))

(declare-fun m!252339 () Bool)

(assert (=> b!159917 m!252339))

(declare-fun m!252341 () Bool)

(assert (=> b!159917 m!252341))

(declare-fun m!252343 () Bool)

(assert (=> b!159917 m!252343))

(assert (=> b!159917 m!252339))

(assert (=> b!159917 m!252329))

(assert (=> b!159917 m!252339))

(declare-fun m!252345 () Bool)

(assert (=> b!159917 m!252345))

(declare-fun m!252347 () Bool)

(assert (=> b!159917 m!252347))

(declare-fun m!252349 () Bool)

(assert (=> b!159917 m!252349))

(assert (=> b!159917 m!252321))

(declare-fun m!252351 () Bool)

(assert (=> b!159917 m!252351))

(push 1)

