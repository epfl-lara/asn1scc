; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2090 () Bool)

(assert start!2090)

(declare-fun b!9910 () Bool)

(declare-fun res!10031 () Bool)

(declare-fun e!6072 () Bool)

(assert (=> b!9910 (=> (not res!10031) (not e!6072))))

(declare-datatypes ((array!588 0))(
  ( (array!589 (arr!667 (Array (_ BitVec 32) (_ BitVec 8))) (size!253 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!478 0))(
  ( (BitStream!479 (buf!595 array!588) (currentByte!1646 (_ BitVec 32)) (currentBit!1641 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!478)

(declare-datatypes ((Unit!845 0))(
  ( (Unit!846) )
))
(declare-datatypes ((tuple2!1222 0))(
  ( (tuple2!1223 (_1!651 Unit!845) (_2!651 BitStream!478)) )
))
(declare-fun lt!15306 () tuple2!1222)

(declare-fun isPrefixOf!0 (BitStream!478 BitStream!478) Bool)

(assert (=> b!9910 (= res!10031 (isPrefixOf!0 thiss!1486 (_2!651 lt!15306)))))

(declare-fun res!10030 () Bool)

(declare-fun e!6070 () Bool)

(assert (=> start!2090 (=> (not res!10030) (not e!6070))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!588)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2090 (= res!10030 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!253 srcBuffer!6))))))))

(assert (=> start!2090 e!6070))

(assert (=> start!2090 true))

(declare-fun array_inv!245 (array!588) Bool)

(assert (=> start!2090 (array_inv!245 srcBuffer!6)))

(declare-fun e!6069 () Bool)

(declare-fun inv!12 (BitStream!478) Bool)

(assert (=> start!2090 (and (inv!12 thiss!1486) e!6069)))

(declare-fun b!9911 () Bool)

(declare-fun res!10026 () Bool)

(assert (=> b!9911 (=> (not res!10026) (not e!6070))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9911 (= res!10026 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) nBits!460))))

(declare-fun b!9912 () Bool)

(declare-fun e!6073 () Bool)

(assert (=> b!9912 (= e!6072 (not e!6073))))

(declare-fun res!10033 () Bool)

(assert (=> b!9912 (=> res!10033 e!6073)))

(declare-datatypes ((tuple2!1224 0))(
  ( (tuple2!1225 (_1!652 array!588) (_2!652 BitStream!478)) )
))
(declare-fun lt!15308 () tuple2!1224)

(declare-datatypes ((List!147 0))(
  ( (Nil!144) (Cons!143 (h!262 Bool) (t!897 List!147)) )
))
(declare-fun lt!15304 () List!147)

(declare-fun byteArrayBitContentToList!0 (BitStream!478 array!588 (_ BitVec 64) (_ BitVec 64)) List!147)

(assert (=> b!9912 (= res!10033 (not (= (byteArrayBitContentToList!0 (_2!651 lt!15306) (_1!652 lt!15308) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!15304)))))

(declare-datatypes ((tuple2!1226 0))(
  ( (tuple2!1227 (_1!653 BitStream!478) (_2!653 BitStream!478)) )
))
(declare-fun lt!15307 () tuple2!1226)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!478 BitStream!478 (_ BitVec 64)) List!147)

(assert (=> b!9912 (= lt!15304 (bitStreamReadBitsIntoList!0 (_2!651 lt!15306) (_1!653 lt!15307) nBits!460))))

(declare-fun readBits!0 (BitStream!478 (_ BitVec 64)) tuple2!1224)

(assert (=> b!9912 (= lt!15308 (readBits!0 (_1!653 lt!15307) nBits!460))))

(assert (=> b!9912 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) nBits!460)))

(declare-fun lt!15305 () Unit!845)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!478 array!588 (_ BitVec 64)) Unit!845)

(assert (=> b!9912 (= lt!15305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!595 (_2!651 lt!15306)) nBits!460))))

(declare-fun reader!0 (BitStream!478 BitStream!478) tuple2!1226)

(assert (=> b!9912 (= lt!15307 (reader!0 thiss!1486 (_2!651 lt!15306)))))

(declare-fun b!9913 () Bool)

(declare-fun res!10029 () Bool)

(assert (=> b!9913 (=> (not res!10029) (not e!6072))))

(assert (=> b!9913 (= res!10029 (= (size!253 (buf!595 thiss!1486)) (size!253 (buf!595 (_2!651 lt!15306)))))))

(declare-fun b!9914 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!478 array!588 array!588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9914 (= e!6073 (checkByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun lt!15303 () Unit!845)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!478 array!588 array!588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!845)

(assert (=> b!9914 (= lt!15303 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!9915 () Bool)

(declare-fun res!10027 () Bool)

(assert (=> b!9915 (=> res!10027 e!6073)))

(assert (=> b!9915 (= res!10027 (not (= lt!15304 (byteArrayBitContentToList!0 (_2!651 lt!15306) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!9916 () Bool)

(assert (=> b!9916 (= e!6069 (array_inv!245 (buf!595 thiss!1486)))))

(declare-fun b!9917 () Bool)

(assert (=> b!9917 (= e!6070 e!6072)))

(declare-fun res!10032 () Bool)

(assert (=> b!9917 (=> (not res!10032) (not e!6072))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9917 (= res!10032 (invariant!0 (currentBit!1641 (_2!651 lt!15306)) (currentByte!1646 (_2!651 lt!15306)) (size!253 (buf!595 (_2!651 lt!15306)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!478 array!588 (_ BitVec 64) (_ BitVec 64)) tuple2!1222)

(assert (=> b!9917 (= lt!15306 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!9918 () Bool)

(declare-fun res!10028 () Bool)

(assert (=> b!9918 (=> (not res!10028) (not e!6072))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9918 (= res!10028 (= (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15306))) (currentByte!1646 (_2!651 lt!15306)) (currentBit!1641 (_2!651 lt!15306))) (bvadd (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)) nBits!460)))))

(assert (= (and start!2090 res!10030) b!9911))

(assert (= (and b!9911 res!10026) b!9917))

(assert (= (and b!9917 res!10032) b!9913))

(assert (= (and b!9913 res!10029) b!9918))

(assert (= (and b!9918 res!10028) b!9910))

(assert (= (and b!9910 res!10031) b!9912))

(assert (= (and b!9912 (not res!10033)) b!9915))

(assert (= (and b!9915 (not res!10027)) b!9914))

(assert (= start!2090 b!9916))

(declare-fun m!14405 () Bool)

(assert (=> b!9918 m!14405))

(declare-fun m!14407 () Bool)

(assert (=> b!9918 m!14407))

(declare-fun m!14409 () Bool)

(assert (=> b!9916 m!14409))

(declare-fun m!14411 () Bool)

(assert (=> start!2090 m!14411))

(declare-fun m!14413 () Bool)

(assert (=> start!2090 m!14413))

(declare-fun m!14415 () Bool)

(assert (=> b!9915 m!14415))

(declare-fun m!14417 () Bool)

(assert (=> b!9917 m!14417))

(declare-fun m!14419 () Bool)

(assert (=> b!9917 m!14419))

(declare-fun m!14421 () Bool)

(assert (=> b!9911 m!14421))

(declare-fun m!14423 () Bool)

(assert (=> b!9912 m!14423))

(declare-fun m!14425 () Bool)

(assert (=> b!9912 m!14425))

(declare-fun m!14427 () Bool)

(assert (=> b!9912 m!14427))

(declare-fun m!14429 () Bool)

(assert (=> b!9912 m!14429))

(declare-fun m!14431 () Bool)

(assert (=> b!9912 m!14431))

(declare-fun m!14433 () Bool)

(assert (=> b!9912 m!14433))

(declare-fun m!14435 () Bool)

(assert (=> b!9910 m!14435))

(declare-fun m!14437 () Bool)

(assert (=> b!9914 m!14437))

(declare-fun m!14439 () Bool)

(assert (=> b!9914 m!14439))

(push 1)

(assert (not b!9912))

(assert (not b!9911))

(assert (not b!9914))

(assert (not b!9918))

(assert (not b!9915))

(assert (not b!9917))

(assert (not b!9910))

(assert (not start!2090))

(assert (not b!9916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3176 () Bool)

(declare-fun c!665 () Bool)

(assert (=> d!3176 (= c!665 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6113 () List!147)

(assert (=> d!3176 (= (byteArrayBitContentToList!0 (_2!651 lt!15306) srcBuffer!6 from!367 nBits!460) e!6113)))

(declare-fun b!9977 () Bool)

(assert (=> b!9977 (= e!6113 Nil!144)))

(declare-fun b!9978 () Bool)

(assert (=> b!9978 (= e!6113 (Cons!143 (not (= (bvand ((_ sign_extend 24) (select (arr!667 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!651 lt!15306) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3176 c!665) b!9977))

(assert (= (and d!3176 (not c!665)) b!9978))

(declare-fun m!14513 () Bool)

(assert (=> b!9978 m!14513))

(declare-fun m!14515 () Bool)

(assert (=> b!9978 m!14515))

(declare-fun m!14517 () Bool)

(assert (=> b!9978 m!14517))

(assert (=> b!9915 d!3176))

(declare-fun d!3178 () Bool)

(declare-fun res!10089 () Bool)

(declare-fun e!6118 () Bool)

(assert (=> d!3178 (=> (not res!10089) (not e!6118))))

(assert (=> d!3178 (= res!10089 (= (size!253 (buf!595 thiss!1486)) (size!253 (buf!595 (_2!651 lt!15306)))))))

(assert (=> d!3178 (= (isPrefixOf!0 thiss!1486 (_2!651 lt!15306)) e!6118)))

(declare-fun b!9985 () Bool)

(declare-fun res!10088 () Bool)

(assert (=> b!9985 (=> (not res!10088) (not e!6118))))

(assert (=> b!9985 (= res!10088 (bvsle (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)) (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15306))) (currentByte!1646 (_2!651 lt!15306)) (currentBit!1641 (_2!651 lt!15306)))))))

(declare-fun b!9986 () Bool)

(declare-fun e!6119 () Bool)

(assert (=> b!9986 (= e!6118 e!6119)))

(declare-fun res!10090 () Bool)

(assert (=> b!9986 (=> res!10090 e!6119)))

(assert (=> b!9986 (= res!10090 (= (size!253 (buf!595 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9987 () Bool)

(declare-fun arrayBitRangesEq!0 (array!588 array!588 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9987 (= e!6119 (arrayBitRangesEq!0 (buf!595 thiss!1486) (buf!595 (_2!651 lt!15306)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486))))))

(assert (= (and d!3178 res!10089) b!9985))

(assert (= (and b!9985 res!10088) b!9986))

(assert (= (and b!9986 (not res!10090)) b!9987))

(assert (=> b!9985 m!14407))

(assert (=> b!9985 m!14405))

(assert (=> b!9987 m!14407))

(assert (=> b!9987 m!14407))

(declare-fun m!14519 () Bool)

(assert (=> b!9987 m!14519))

(assert (=> b!9910 d!3178))

(declare-fun d!3184 () Bool)

(assert (=> d!3184 (= (array_inv!245 (buf!595 thiss!1486)) (bvsge (size!253 (buf!595 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9916 d!3184))

(declare-fun d!3186 () Bool)

(declare-fun res!10112 () Bool)

(declare-fun e!6134 () Bool)

(assert (=> d!3186 (=> res!10112 e!6134)))

(assert (=> d!3186 (= res!10112 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3186 (= (checkByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6134)))

(declare-fun b!10009 () Bool)

(declare-fun e!6135 () Bool)

(assert (=> b!10009 (= e!6134 e!6135)))

(declare-fun res!10113 () Bool)

(assert (=> b!10009 (=> (not res!10113) (not e!6135))))

(assert (=> b!10009 (= res!10113 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!667 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!667 (_1!652 lt!15308)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10010 () Bool)

(assert (=> b!10010 (= e!6135 (checkByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3186 (not res!10112)) b!10009))

(assert (= (and b!10009 res!10113) b!10010))

(assert (=> b!10009 m!14513))

(assert (=> b!10009 m!14515))

(declare-fun m!14531 () Bool)

(assert (=> b!10009 m!14531))

(declare-fun m!14533 () Bool)

(assert (=> b!10009 m!14533))

(declare-fun m!14535 () Bool)

(assert (=> b!10010 m!14535))

(assert (=> b!9914 d!3186))

(declare-fun d!3198 () Bool)

(assert (=> d!3198 (checkByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!15371 () Unit!845)

(declare-fun choose!65 (BitStream!478 array!588 array!588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!845)

(assert (=> d!3198 (= lt!15371 (choose!65 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3198 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3198 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!651 lt!15306) srcBuffer!6 (_1!652 lt!15308) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!15371)))

(declare-fun bs!948 () Bool)

(assert (= bs!948 d!3198))

(assert (=> bs!948 m!14437))

(declare-fun m!14537 () Bool)

(assert (=> bs!948 m!14537))

(assert (=> b!9914 d!3198))

(declare-fun d!3200 () Bool)

(declare-fun e!6141 () Bool)

(assert (=> d!3200 e!6141))

(declare-fun res!10118 () Bool)

(assert (=> d!3200 (=> (not res!10118) (not e!6141))))

(declare-fun lt!15387 () (_ BitVec 64))

(declare-fun lt!15388 () (_ BitVec 64))

(declare-fun lt!15384 () (_ BitVec 64))

(assert (=> d!3200 (= res!10118 (= lt!15387 (bvsub lt!15384 lt!15388)))))

(assert (=> d!3200 (or (= (bvand lt!15384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15384 lt!15388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3200 (= lt!15388 (remainingBits!0 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))) ((_ sign_extend 32) (currentByte!1646 (_2!651 lt!15306))) ((_ sign_extend 32) (currentBit!1641 (_2!651 lt!15306)))))))

(declare-fun lt!15385 () (_ BitVec 64))

(declare-fun lt!15386 () (_ BitVec 64))

(assert (=> d!3200 (= lt!15384 (bvmul lt!15385 lt!15386))))

(assert (=> d!3200 (or (= lt!15385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15386 (bvsdiv (bvmul lt!15385 lt!15386) lt!15385)))))

(assert (=> d!3200 (= lt!15386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3200 (= lt!15385 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))))))

(assert (=> d!3200 (= lt!15387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1646 (_2!651 lt!15306))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1641 (_2!651 lt!15306)))))))

(assert (=> d!3200 (invariant!0 (currentBit!1641 (_2!651 lt!15306)) (currentByte!1646 (_2!651 lt!15306)) (size!253 (buf!595 (_2!651 lt!15306))))))

(assert (=> d!3200 (= (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15306))) (currentByte!1646 (_2!651 lt!15306)) (currentBit!1641 (_2!651 lt!15306))) lt!15387)))

(declare-fun b!10021 () Bool)

(declare-fun res!10119 () Bool)

(assert (=> b!10021 (=> (not res!10119) (not e!6141))))

(assert (=> b!10021 (= res!10119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15387))))

(declare-fun b!10022 () Bool)

(declare-fun lt!15389 () (_ BitVec 64))

(assert (=> b!10022 (= e!6141 (bvsle lt!15387 (bvmul lt!15389 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10022 (or (= lt!15389 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15389 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15389)))))

(assert (=> b!10022 (= lt!15389 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))))))

(assert (= (and d!3200 res!10118) b!10021))

(assert (= (and b!10021 res!10119) b!10022))

(declare-fun m!14545 () Bool)

(assert (=> d!3200 m!14545))

(assert (=> d!3200 m!14417))

(assert (=> b!9918 d!3200))

(declare-fun d!3210 () Bool)

(declare-fun e!6142 () Bool)

(assert (=> d!3210 e!6142))

(declare-fun res!10120 () Bool)

(assert (=> d!3210 (=> (not res!10120) (not e!6142))))

(declare-fun lt!15394 () (_ BitVec 64))

(declare-fun lt!15393 () (_ BitVec 64))

(declare-fun lt!15390 () (_ BitVec 64))

(assert (=> d!3210 (= res!10120 (= lt!15393 (bvsub lt!15390 lt!15394)))))

(assert (=> d!3210 (or (= (bvand lt!15390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15390 lt!15394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3210 (= lt!15394 (remainingBits!0 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486))))))

(declare-fun lt!15391 () (_ BitVec 64))

(declare-fun lt!15392 () (_ BitVec 64))

(assert (=> d!3210 (= lt!15390 (bvmul lt!15391 lt!15392))))

(assert (=> d!3210 (or (= lt!15391 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15392 (bvsdiv (bvmul lt!15391 lt!15392) lt!15391)))))

(assert (=> d!3210 (= lt!15392 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3210 (= lt!15391 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))))))

(assert (=> d!3210 (= lt!15393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1646 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1641 thiss!1486))))))

(assert (=> d!3210 (invariant!0 (currentBit!1641 thiss!1486) (currentByte!1646 thiss!1486) (size!253 (buf!595 thiss!1486)))))

(assert (=> d!3210 (= (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)) lt!15393)))

(declare-fun b!10023 () Bool)

(declare-fun res!10121 () Bool)

(assert (=> b!10023 (=> (not res!10121) (not e!6142))))

(assert (=> b!10023 (= res!10121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15393))))

(declare-fun b!10024 () Bool)

(declare-fun lt!15395 () (_ BitVec 64))

(assert (=> b!10024 (= e!6142 (bvsle lt!15393 (bvmul lt!15395 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10024 (or (= lt!15395 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15395 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15395)))))

(assert (=> b!10024 (= lt!15395 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))))))

(assert (= (and d!3210 res!10120) b!10023))

(assert (= (and b!10023 res!10121) b!10024))

(declare-fun m!14547 () Bool)

(assert (=> d!3210 m!14547))

(declare-fun m!14549 () Bool)

(assert (=> d!3210 m!14549))

(assert (=> b!9918 d!3210))

(declare-fun d!3212 () Bool)

(assert (=> d!3212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486))) nBits!460))))

(declare-fun bs!950 () Bool)

(assert (= bs!950 d!3212))

(assert (=> bs!950 m!14547))

(assert (=> b!9911 d!3212))

(declare-fun d!3214 () Bool)

(assert (=> d!3214 (= (array_inv!245 srcBuffer!6) (bvsge (size!253 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2090 d!3214))

(declare-fun d!3216 () Bool)

(assert (=> d!3216 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1641 thiss!1486) (currentByte!1646 thiss!1486) (size!253 (buf!595 thiss!1486))))))

(declare-fun bs!951 () Bool)

(assert (= bs!951 d!3216))

(assert (=> bs!951 m!14549))

(assert (=> start!2090 d!3216))

(declare-fun d!3218 () Bool)

(assert (=> d!3218 (= (invariant!0 (currentBit!1641 (_2!651 lt!15306)) (currentByte!1646 (_2!651 lt!15306)) (size!253 (buf!595 (_2!651 lt!15306)))) (and (bvsge (currentBit!1641 (_2!651 lt!15306)) #b00000000000000000000000000000000) (bvslt (currentBit!1641 (_2!651 lt!15306)) #b00000000000000000000000000001000) (bvsge (currentByte!1646 (_2!651 lt!15306)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1646 (_2!651 lt!15306)) (size!253 (buf!595 (_2!651 lt!15306)))) (and (= (currentBit!1641 (_2!651 lt!15306)) #b00000000000000000000000000000000) (= (currentByte!1646 (_2!651 lt!15306)) (size!253 (buf!595 (_2!651 lt!15306))))))))))

(assert (=> b!9917 d!3218))

(declare-fun b!10119 () Bool)

(declare-fun e!6184 () tuple2!1222)

(declare-fun Unit!852 () Unit!845)

(assert (=> b!10119 (= e!6184 (tuple2!1223 Unit!852 thiss!1486))))

(assert (=> b!10119 (= (size!253 (buf!595 thiss!1486)) (size!253 (buf!595 thiss!1486)))))

(declare-fun lt!15761 () Unit!845)

(declare-fun Unit!853 () Unit!845)

(assert (=> b!10119 (= lt!15761 Unit!853)))

(declare-fun call!185 () tuple2!1226)

(assert (=> b!10119 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!652 (readBits!0 (_1!653 call!185) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10120 () Bool)

(declare-fun res!10183 () Bool)

(declare-fun e!6182 () Bool)

(assert (=> b!10120 (=> (not res!10183) (not e!6182))))

(declare-fun lt!15753 () tuple2!1222)

(assert (=> b!10120 (= res!10183 (= (size!253 (buf!595 thiss!1486)) (size!253 (buf!595 (_2!651 lt!15753)))))))

(declare-fun b!10121 () Bool)

(declare-fun res!10186 () Bool)

(assert (=> b!10121 (=> (not res!10186) (not e!6182))))

(assert (=> b!10121 (= res!10186 (= (size!253 (buf!595 (_2!651 lt!15753))) (size!253 (buf!595 thiss!1486))))))

(declare-fun b!10122 () Bool)

(declare-fun lt!15745 () tuple2!1222)

(declare-fun Unit!854 () Unit!845)

(assert (=> b!10122 (= e!6184 (tuple2!1223 Unit!854 (_2!651 lt!15745)))))

(declare-fun lt!15757 () tuple2!1222)

(declare-fun appendBitFromByte!0 (BitStream!478 (_ BitVec 8) (_ BitVec 32)) tuple2!1222)

(assert (=> b!10122 (= lt!15757 (appendBitFromByte!0 thiss!1486 (select (arr!667 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!15752 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15752 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15744 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15744 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15739 () Unit!845)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!478 BitStream!478 (_ BitVec 64) (_ BitVec 64)) Unit!845)

(assert (=> b!10122 (= lt!15739 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!651 lt!15757) lt!15752 lt!15744))))

(assert (=> b!10122 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15757)))) ((_ sign_extend 32) (currentByte!1646 (_2!651 lt!15757))) ((_ sign_extend 32) (currentBit!1641 (_2!651 lt!15757))) (bvsub lt!15752 lt!15744))))

(declare-fun lt!15723 () Unit!845)

(assert (=> b!10122 (= lt!15723 lt!15739)))

(declare-fun lt!15736 () tuple2!1226)

(assert (=> b!10122 (= lt!15736 (reader!0 thiss!1486 (_2!651 lt!15757)))))

(declare-fun lt!15734 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15734 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15718 () Unit!845)

(assert (=> b!10122 (= lt!15718 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!595 (_2!651 lt!15757)) lt!15734))))

(assert (=> b!10122 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15757)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) lt!15734)))

(declare-fun lt!15730 () Unit!845)

(assert (=> b!10122 (= lt!15730 lt!15718)))

(declare-fun head!53 (List!147) Bool)

(assert (=> b!10122 (= (head!53 (byteArrayBitContentToList!0 (_2!651 lt!15757) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!53 (bitStreamReadBitsIntoList!0 (_2!651 lt!15757) (_1!653 lt!15736) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15733 () Unit!845)

(declare-fun Unit!855 () Unit!845)

(assert (=> b!10122 (= lt!15733 Unit!855)))

(assert (=> b!10122 (= lt!15745 (appendBitsMSBFirstLoop!0 (_2!651 lt!15757) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!15735 () Unit!845)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!478 BitStream!478 BitStream!478) Unit!845)

(assert (=> b!10122 (= lt!15735 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!651 lt!15757) (_2!651 lt!15745)))))

(assert (=> b!10122 (isPrefixOf!0 thiss!1486 (_2!651 lt!15745))))

(declare-fun lt!15755 () Unit!845)

(assert (=> b!10122 (= lt!15755 lt!15735)))

(assert (=> b!10122 (= (size!253 (buf!595 (_2!651 lt!15745))) (size!253 (buf!595 thiss!1486)))))

(declare-fun lt!15724 () Unit!845)

(declare-fun Unit!856 () Unit!845)

(assert (=> b!10122 (= lt!15724 Unit!856)))

(assert (=> b!10122 (= (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15745))) (currentByte!1646 (_2!651 lt!15745)) (currentBit!1641 (_2!651 lt!15745))) (bvsub (bvadd (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!15738 () Unit!845)

(declare-fun Unit!857 () Unit!845)

(assert (=> b!10122 (= lt!15738 Unit!857)))

(assert (=> b!10122 (= (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15745))) (currentByte!1646 (_2!651 lt!15745)) (currentBit!1641 (_2!651 lt!15745))) (bvsub (bvsub (bvadd (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15757))) (currentByte!1646 (_2!651 lt!15757)) (currentBit!1641 (_2!651 lt!15757))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15731 () Unit!845)

(declare-fun Unit!858 () Unit!845)

(assert (=> b!10122 (= lt!15731 Unit!858)))

(declare-fun lt!15750 () tuple2!1226)

(assert (=> b!10122 (= lt!15750 (reader!0 thiss!1486 (_2!651 lt!15745)))))

(declare-fun lt!15754 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15754 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15727 () Unit!845)

(assert (=> b!10122 (= lt!15727 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!595 (_2!651 lt!15745)) lt!15754))))

(assert (=> b!10122 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15745)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) lt!15754)))

(declare-fun lt!15747 () Unit!845)

(assert (=> b!10122 (= lt!15747 lt!15727)))

(declare-fun lt!15741 () tuple2!1226)

(assert (=> b!10122 (= lt!15741 call!185)))

(declare-fun lt!15742 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15742 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15760 () Unit!845)

(assert (=> b!10122 (= lt!15760 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!651 lt!15757) (buf!595 (_2!651 lt!15745)) lt!15742))))

(assert (=> b!10122 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15745)))) ((_ sign_extend 32) (currentByte!1646 (_2!651 lt!15757))) ((_ sign_extend 32) (currentBit!1641 (_2!651 lt!15757))) lt!15742)))

(declare-fun lt!15743 () Unit!845)

(assert (=> b!10122 (= lt!15743 lt!15760)))

(declare-fun lt!15722 () List!147)

(assert (=> b!10122 (= lt!15722 (byteArrayBitContentToList!0 (_2!651 lt!15745) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15740 () List!147)

(assert (=> b!10122 (= lt!15740 (byteArrayBitContentToList!0 (_2!651 lt!15745) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15751 () List!147)

(assert (=> b!10122 (= lt!15751 (bitStreamReadBitsIntoList!0 (_2!651 lt!15745) (_1!653 lt!15750) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15725 () List!147)

(assert (=> b!10122 (= lt!15725 (bitStreamReadBitsIntoList!0 (_2!651 lt!15745) (_1!653 lt!15741) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15746 () (_ BitVec 64))

(assert (=> b!10122 (= lt!15746 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15732 () Unit!845)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!478 BitStream!478 BitStream!478 BitStream!478 (_ BitVec 64) List!147) Unit!845)

(assert (=> b!10122 (= lt!15732 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!651 lt!15745) (_2!651 lt!15745) (_1!653 lt!15750) (_1!653 lt!15741) lt!15746 lt!15751))))

(declare-fun tail!61 (List!147) List!147)

(assert (=> b!10122 (= (bitStreamReadBitsIntoList!0 (_2!651 lt!15745) (_1!653 lt!15741) (bvsub lt!15746 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!61 lt!15751))))

(declare-fun lt!15720 () Unit!845)

(assert (=> b!10122 (= lt!15720 lt!15732)))

(declare-fun lt!15728 () (_ BitVec 64))

(declare-fun lt!15726 () Unit!845)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!588 array!588 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!845)

(assert (=> b!10122 (= lt!15726 (arrayBitRangesEqImpliesEq!0 (buf!595 (_2!651 lt!15757)) (buf!595 (_2!651 lt!15745)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!15728 (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15757))) (currentByte!1646 (_2!651 lt!15757)) (currentBit!1641 (_2!651 lt!15757)))))))

(declare-fun bitAt!0 (array!588 (_ BitVec 64)) Bool)

(assert (=> b!10122 (= (bitAt!0 (buf!595 (_2!651 lt!15757)) lt!15728) (bitAt!0 (buf!595 (_2!651 lt!15745)) lt!15728))))

(declare-fun lt!15758 () Unit!845)

(assert (=> b!10122 (= lt!15758 lt!15726)))

(declare-fun bm!182 () Bool)

(declare-fun c!686 () Bool)

(assert (=> bm!182 (= call!185 (reader!0 (ite c!686 (_2!651 lt!15757) thiss!1486) (ite c!686 (_2!651 lt!15745) thiss!1486)))))

(declare-fun lt!15729 () tuple2!1226)

(declare-fun b!10123 () Bool)

(assert (=> b!10123 (= e!6182 (= (bitStreamReadBitsIntoList!0 (_2!651 lt!15753) (_1!653 lt!15729) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!651 lt!15753) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10123 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10123 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15748 () Unit!845)

(declare-fun lt!15721 () Unit!845)

(assert (=> b!10123 (= lt!15748 lt!15721)))

(declare-fun lt!15719 () (_ BitVec 64))

(assert (=> b!10123 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15753)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) lt!15719)))

(assert (=> b!10123 (= lt!15721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!595 (_2!651 lt!15753)) lt!15719))))

(declare-fun e!6183 () Bool)

(assert (=> b!10123 e!6183))

(declare-fun res!10184 () Bool)

(assert (=> b!10123 (=> (not res!10184) (not e!6183))))

(assert (=> b!10123 (= res!10184 (and (= (size!253 (buf!595 thiss!1486)) (size!253 (buf!595 (_2!651 lt!15753)))) (bvsge lt!15719 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10123 (= lt!15719 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10123 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10123 (= lt!15729 (reader!0 thiss!1486 (_2!651 lt!15753)))))

(declare-fun b!10124 () Bool)

(assert (=> b!10124 (= e!6183 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 thiss!1486))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) lt!15719))))

(declare-fun b!10125 () Bool)

(declare-fun res!10185 () Bool)

(assert (=> b!10125 (=> (not res!10185) (not e!6182))))

(assert (=> b!10125 (= res!10185 (invariant!0 (currentBit!1641 (_2!651 lt!15753)) (currentByte!1646 (_2!651 lt!15753)) (size!253 (buf!595 (_2!651 lt!15753)))))))

(declare-fun d!3222 () Bool)

(assert (=> d!3222 e!6182))

(declare-fun res!10182 () Bool)

(assert (=> d!3222 (=> (not res!10182) (not e!6182))))

(declare-fun lt!15737 () (_ BitVec 64))

(assert (=> d!3222 (= res!10182 (= (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15753))) (currentByte!1646 (_2!651 lt!15753)) (currentBit!1641 (_2!651 lt!15753))) (bvsub lt!15737 from!367)))))

(assert (=> d!3222 (or (= (bvand lt!15737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15737 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15749 () (_ BitVec 64))

(assert (=> d!3222 (= lt!15737 (bvadd lt!15749 from!367 nBits!460))))

(assert (=> d!3222 (or (not (= (bvand lt!15749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15749 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3222 (= lt!15749 (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)))))

(assert (=> d!3222 (= lt!15753 e!6184)))

(assert (=> d!3222 (= c!686 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!15759 () Unit!845)

(declare-fun lt!15756 () Unit!845)

(assert (=> d!3222 (= lt!15759 lt!15756)))

(assert (=> d!3222 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!478) Unit!845)

(assert (=> d!3222 (= lt!15756 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3222 (= lt!15728 (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)))))

(assert (=> d!3222 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3222 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!15753)))

(declare-fun b!10126 () Bool)

(declare-fun res!10187 () Bool)

(assert (=> b!10126 (=> (not res!10187) (not e!6182))))

(assert (=> b!10126 (= res!10187 (isPrefixOf!0 thiss!1486 (_2!651 lt!15753)))))

(assert (= (and d!3222 c!686) b!10122))

(assert (= (and d!3222 (not c!686)) b!10119))

(assert (= (or b!10122 b!10119) bm!182))

(assert (= (and d!3222 res!10182) b!10125))

(assert (= (and b!10125 res!10185) b!10120))

(assert (= (and b!10120 res!10183) b!10126))

(assert (= (and b!10126 res!10187) b!10121))

(assert (= (and b!10121 res!10186) b!10123))

(assert (= (and b!10123 res!10184) b!10124))

(declare-fun m!14709 () Bool)

(assert (=> d!3222 m!14709))

(assert (=> d!3222 m!14407))

(declare-fun m!14711 () Bool)

(assert (=> d!3222 m!14711))

(declare-fun m!14713 () Bool)

(assert (=> d!3222 m!14713))

(declare-fun m!14715 () Bool)

(assert (=> b!10126 m!14715))

(declare-fun m!14717 () Bool)

(assert (=> b!10125 m!14717))

(declare-fun m!14719 () Bool)

(assert (=> b!10122 m!14719))

(declare-fun m!14721 () Bool)

(assert (=> b!10122 m!14721))

(declare-fun m!14723 () Bool)

(assert (=> b!10122 m!14723))

(declare-fun m!14725 () Bool)

(assert (=> b!10122 m!14725))

(declare-fun m!14727 () Bool)

(assert (=> b!10122 m!14727))

(declare-fun m!14729 () Bool)

(assert (=> b!10122 m!14729))

(assert (=> b!10122 m!14513))

(declare-fun m!14731 () Bool)

(assert (=> b!10122 m!14731))

(declare-fun m!14733 () Bool)

(assert (=> b!10122 m!14733))

(declare-fun m!14735 () Bool)

(assert (=> b!10122 m!14735))

(declare-fun m!14737 () Bool)

(assert (=> b!10122 m!14737))

(declare-fun m!14739 () Bool)

(assert (=> b!10122 m!14739))

(declare-fun m!14741 () Bool)

(assert (=> b!10122 m!14741))

(declare-fun m!14743 () Bool)

(assert (=> b!10122 m!14743))

(declare-fun m!14745 () Bool)

(assert (=> b!10122 m!14745))

(declare-fun m!14747 () Bool)

(assert (=> b!10122 m!14747))

(declare-fun m!14749 () Bool)

(assert (=> b!10122 m!14749))

(declare-fun m!14751 () Bool)

(assert (=> b!10122 m!14751))

(assert (=> b!10122 m!14741))

(declare-fun m!14753 () Bool)

(assert (=> b!10122 m!14753))

(declare-fun m!14755 () Bool)

(assert (=> b!10122 m!14755))

(declare-fun m!14757 () Bool)

(assert (=> b!10122 m!14757))

(declare-fun m!14759 () Bool)

(assert (=> b!10122 m!14759))

(declare-fun m!14761 () Bool)

(assert (=> b!10122 m!14761))

(declare-fun m!14763 () Bool)

(assert (=> b!10122 m!14763))

(assert (=> b!10122 m!14759))

(declare-fun m!14765 () Bool)

(assert (=> b!10122 m!14765))

(declare-fun m!14767 () Bool)

(assert (=> b!10122 m!14767))

(declare-fun m!14769 () Bool)

(assert (=> b!10122 m!14769))

(declare-fun m!14771 () Bool)

(assert (=> b!10122 m!14771))

(assert (=> b!10122 m!14771))

(declare-fun m!14773 () Bool)

(assert (=> b!10122 m!14773))

(declare-fun m!14775 () Bool)

(assert (=> b!10122 m!14775))

(declare-fun m!14777 () Bool)

(assert (=> b!10122 m!14777))

(assert (=> b!10122 m!14513))

(assert (=> b!10122 m!14407))

(declare-fun m!14779 () Bool)

(assert (=> b!10119 m!14779))

(declare-fun m!14781 () Bool)

(assert (=> b!10119 m!14781))

(declare-fun m!14783 () Bool)

(assert (=> bm!182 m!14783))

(declare-fun m!14785 () Bool)

(assert (=> b!10124 m!14785))

(declare-fun m!14787 () Bool)

(assert (=> b!10123 m!14787))

(declare-fun m!14789 () Bool)

(assert (=> b!10123 m!14789))

(declare-fun m!14791 () Bool)

(assert (=> b!10123 m!14791))

(declare-fun m!14793 () Bool)

(assert (=> b!10123 m!14793))

(declare-fun m!14795 () Bool)

(assert (=> b!10123 m!14795))

(assert (=> b!9917 d!3222))

(declare-fun b!10179 () Bool)

(declare-fun res!10228 () Bool)

(declare-fun e!6206 () Bool)

(assert (=> b!10179 (=> (not res!10228) (not e!6206))))

(declare-fun lt!15935 () tuple2!1224)

(assert (=> b!10179 (= res!10228 (bvsle (currentByte!1646 (_1!653 lt!15307)) (currentByte!1646 (_2!652 lt!15935))))))

(declare-fun b!10180 () Bool)

(declare-fun res!10230 () Bool)

(assert (=> b!10180 (=> (not res!10230) (not e!6206))))

(declare-fun lt!15929 () (_ BitVec 64))

(assert (=> b!10180 (= res!10230 (= (bvadd lt!15929 nBits!460) (bitIndex!0 (size!253 (buf!595 (_2!652 lt!15935))) (currentByte!1646 (_2!652 lt!15935)) (currentBit!1641 (_2!652 lt!15935)))))))

(assert (=> b!10180 (or (not (= (bvand lt!15929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15929 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10180 (= lt!15929 (bitIndex!0 (size!253 (buf!595 (_1!653 lt!15307))) (currentByte!1646 (_1!653 lt!15307)) (currentBit!1641 (_1!653 lt!15307))))))

(declare-fun b!10181 () Bool)

(assert (=> b!10181 (= e!6206 (= (byteArrayBitContentToList!0 (_2!652 lt!15935) (_1!652 lt!15935) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!652 lt!15935) (_1!653 lt!15307) nBits!460)))))

(declare-fun d!3248 () Bool)

(assert (=> d!3248 e!6206))

(declare-fun res!10229 () Bool)

(assert (=> d!3248 (=> (not res!10229) (not e!6206))))

(assert (=> d!3248 (= res!10229 (= (buf!595 (_2!652 lt!15935)) (buf!595 (_1!653 lt!15307))))))

(declare-datatypes ((tuple3!76 0))(
  ( (tuple3!77 (_1!663 Unit!845) (_2!663 BitStream!478) (_3!41 array!588)) )
))
(declare-fun lt!15934 () tuple3!76)

(assert (=> d!3248 (= lt!15935 (tuple2!1225 (_3!41 lt!15934) (_2!663 lt!15934)))))

(declare-fun readBitsLoop!0 (BitStream!478 (_ BitVec 64) array!588 (_ BitVec 64) (_ BitVec 64)) tuple3!76)

(assert (=> d!3248 (= lt!15934 (readBitsLoop!0 (_1!653 lt!15307) nBits!460 (array!589 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3248 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3248 (= (readBits!0 (_1!653 lt!15307) nBits!460) lt!15935)))

(declare-fun b!10182 () Bool)

(declare-fun res!10231 () Bool)

(assert (=> b!10182 (=> (not res!10231) (not e!6206))))

(declare-fun lt!15931 () (_ BitVec 64))

(assert (=> b!10182 (= res!10231 (= (size!253 (_1!652 lt!15935)) ((_ extract 31 0) lt!15931)))))

(assert (=> b!10182 (and (bvslt lt!15931 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!15931 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!15928 () (_ BitVec 64))

(declare-fun lt!15933 () (_ BitVec 64))

(assert (=> b!10182 (= lt!15931 (bvsdiv lt!15928 lt!15933))))

(assert (=> b!10182 (and (not (= lt!15933 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!15928 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!15933 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10182 (= lt!15933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!15930 () (_ BitVec 64))

(declare-fun lt!15932 () (_ BitVec 64))

(assert (=> b!10182 (= lt!15928 (bvsub lt!15930 lt!15932))))

(assert (=> b!10182 (or (= (bvand lt!15930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15930 lt!15932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10182 (= lt!15932 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15936 () (_ BitVec 64))

(assert (=> b!10182 (= lt!15930 (bvadd nBits!460 lt!15936))))

(assert (=> b!10182 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15936 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!15936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10182 (= lt!15936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!10183 () Bool)

(declare-fun res!10232 () Bool)

(assert (=> b!10183 (=> (not res!10232) (not e!6206))))

(assert (=> b!10183 (= res!10232 (invariant!0 (currentBit!1641 (_2!652 lt!15935)) (currentByte!1646 (_2!652 lt!15935)) (size!253 (buf!595 (_2!652 lt!15935)))))))

(assert (= (and d!3248 res!10229) b!10180))

(assert (= (and b!10180 res!10230) b!10183))

(assert (= (and b!10183 res!10232) b!10182))

(assert (= (and b!10182 res!10231) b!10179))

(assert (= (and b!10179 res!10228) b!10181))

(declare-fun m!14825 () Bool)

(assert (=> b!10180 m!14825))

(declare-fun m!14827 () Bool)

(assert (=> b!10180 m!14827))

(declare-fun m!14829 () Bool)

(assert (=> b!10181 m!14829))

(declare-fun m!14831 () Bool)

(assert (=> b!10181 m!14831))

(declare-fun m!14833 () Bool)

(assert (=> d!3248 m!14833))

(declare-fun m!14835 () Bool)

(assert (=> b!10183 m!14835))

(assert (=> b!9912 d!3248))

(declare-fun d!3254 () Bool)

(assert (=> d!3254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486))) nBits!460))))

(declare-fun bs!956 () Bool)

(assert (= bs!956 d!3254))

(declare-fun m!14837 () Bool)

(assert (=> bs!956 m!14837))

(assert (=> b!9912 d!3254))

(declare-fun d!3256 () Bool)

(declare-fun c!694 () Bool)

(assert (=> d!3256 (= c!694 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6210 () List!147)

(assert (=> d!3256 (= (byteArrayBitContentToList!0 (_2!651 lt!15306) (_1!652 lt!15308) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6210)))

(declare-fun b!10192 () Bool)

(assert (=> b!10192 (= e!6210 Nil!144)))

(declare-fun b!10193 () Bool)

(assert (=> b!10193 (= e!6210 (Cons!143 (not (= (bvand ((_ sign_extend 24) (select (arr!667 (_1!652 lt!15308)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!651 lt!15306) (_1!652 lt!15308) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3256 c!694) b!10192))

(assert (= (and d!3256 (not c!694)) b!10193))

(assert (=> b!10193 m!14531))

(assert (=> b!10193 m!14533))

(declare-fun m!14839 () Bool)

(assert (=> b!10193 m!14839))

(assert (=> b!9912 d!3256))

(declare-fun d!3258 () Bool)

(assert (=> d!3258 (validate_offset_bits!1 ((_ sign_extend 32) (size!253 (buf!595 (_2!651 lt!15306)))) ((_ sign_extend 32) (currentByte!1646 thiss!1486)) ((_ sign_extend 32) (currentBit!1641 thiss!1486)) nBits!460)))

(declare-fun lt!15983 () Unit!845)

(declare-fun choose!9 (BitStream!478 array!588 (_ BitVec 64) BitStream!478) Unit!845)

(assert (=> d!3258 (= lt!15983 (choose!9 thiss!1486 (buf!595 (_2!651 lt!15306)) nBits!460 (BitStream!479 (buf!595 (_2!651 lt!15306)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486))))))

(assert (=> d!3258 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!595 (_2!651 lt!15306)) nBits!460) lt!15983)))

(declare-fun bs!957 () Bool)

(assert (= bs!957 d!3258))

(assert (=> bs!957 m!14427))

(declare-fun m!14879 () Bool)

(assert (=> bs!957 m!14879))

(assert (=> b!9912 d!3258))

(declare-fun b!10235 () Bool)

(declare-fun e!6229 () Unit!845)

(declare-fun lt!16081 () Unit!845)

(assert (=> b!10235 (= e!6229 lt!16081)))

(declare-fun lt!16096 () (_ BitVec 64))

(assert (=> b!10235 (= lt!16096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!16087 () (_ BitVec 64))

(assert (=> b!10235 (= lt!16087 (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!588 array!588 (_ BitVec 64) (_ BitVec 64)) Unit!845)

(assert (=> b!10235 (= lt!16081 (arrayBitRangesEqSymmetric!0 (buf!595 thiss!1486) (buf!595 (_2!651 lt!15306)) lt!16096 lt!16087))))

(assert (=> b!10235 (arrayBitRangesEq!0 (buf!595 (_2!651 lt!15306)) (buf!595 thiss!1486) lt!16096 lt!16087)))

(declare-fun d!3260 () Bool)

(declare-fun e!6230 () Bool)

(assert (=> d!3260 e!6230))

(declare-fun res!10274 () Bool)

(assert (=> d!3260 (=> (not res!10274) (not e!6230))))

(declare-fun lt!16097 () tuple2!1226)

(assert (=> d!3260 (= res!10274 (isPrefixOf!0 (_1!653 lt!16097) (_2!653 lt!16097)))))

(declare-fun lt!16084 () BitStream!478)

(assert (=> d!3260 (= lt!16097 (tuple2!1227 lt!16084 (_2!651 lt!15306)))))

(declare-fun lt!16080 () Unit!845)

(declare-fun lt!16095 () Unit!845)

(assert (=> d!3260 (= lt!16080 lt!16095)))

(assert (=> d!3260 (isPrefixOf!0 lt!16084 (_2!651 lt!15306))))

(assert (=> d!3260 (= lt!16095 (lemmaIsPrefixTransitive!0 lt!16084 (_2!651 lt!15306) (_2!651 lt!15306)))))

(declare-fun lt!16093 () Unit!845)

(declare-fun lt!16078 () Unit!845)

(assert (=> d!3260 (= lt!16093 lt!16078)))

(assert (=> d!3260 (isPrefixOf!0 lt!16084 (_2!651 lt!15306))))

(assert (=> d!3260 (= lt!16078 (lemmaIsPrefixTransitive!0 lt!16084 thiss!1486 (_2!651 lt!15306)))))

(declare-fun lt!16088 () Unit!845)

(assert (=> d!3260 (= lt!16088 e!6229)))

(declare-fun c!698 () Bool)

(assert (=> d!3260 (= c!698 (not (= (size!253 (buf!595 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!16089 () Unit!845)

(declare-fun lt!16091 () Unit!845)

(assert (=> d!3260 (= lt!16089 lt!16091)))

(assert (=> d!3260 (isPrefixOf!0 (_2!651 lt!15306) (_2!651 lt!15306))))

(assert (=> d!3260 (= lt!16091 (lemmaIsPrefixRefl!0 (_2!651 lt!15306)))))

(declare-fun lt!16094 () Unit!845)

(declare-fun lt!16090 () Unit!845)

(assert (=> d!3260 (= lt!16094 lt!16090)))

(assert (=> d!3260 (= lt!16090 (lemmaIsPrefixRefl!0 (_2!651 lt!15306)))))

(declare-fun lt!16082 () Unit!845)

(declare-fun lt!16085 () Unit!845)

(assert (=> d!3260 (= lt!16082 lt!16085)))

(assert (=> d!3260 (isPrefixOf!0 lt!16084 lt!16084)))

(assert (=> d!3260 (= lt!16085 (lemmaIsPrefixRefl!0 lt!16084))))

(declare-fun lt!16079 () Unit!845)

(declare-fun lt!16086 () Unit!845)

(assert (=> d!3260 (= lt!16079 lt!16086)))

(assert (=> d!3260 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3260 (= lt!16086 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3260 (= lt!16084 (BitStream!479 (buf!595 (_2!651 lt!15306)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)))))

(assert (=> d!3260 (isPrefixOf!0 thiss!1486 (_2!651 lt!15306))))

(assert (=> d!3260 (= (reader!0 thiss!1486 (_2!651 lt!15306)) lt!16097)))

(declare-fun b!10236 () Bool)

(declare-fun res!10276 () Bool)

(assert (=> b!10236 (=> (not res!10276) (not e!6230))))

(assert (=> b!10236 (= res!10276 (isPrefixOf!0 (_2!653 lt!16097) (_2!651 lt!15306)))))

(declare-fun b!10237 () Bool)

(declare-fun Unit!873 () Unit!845)

(assert (=> b!10237 (= e!6229 Unit!873)))

(declare-fun b!10238 () Bool)

(declare-fun lt!16092 () (_ BitVec 64))

(declare-fun lt!16083 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!478 (_ BitVec 64)) BitStream!478)

(assert (=> b!10238 (= e!6230 (= (_1!653 lt!16097) (withMovedBitIndex!0 (_2!653 lt!16097) (bvsub lt!16083 lt!16092))))))

(assert (=> b!10238 (or (= (bvand lt!16083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16083 lt!16092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10238 (= lt!16092 (bitIndex!0 (size!253 (buf!595 (_2!651 lt!15306))) (currentByte!1646 (_2!651 lt!15306)) (currentBit!1641 (_2!651 lt!15306))))))

(assert (=> b!10238 (= lt!16083 (bitIndex!0 (size!253 (buf!595 thiss!1486)) (currentByte!1646 thiss!1486) (currentBit!1641 thiss!1486)))))

(declare-fun b!10239 () Bool)

(declare-fun res!10275 () Bool)

(assert (=> b!10239 (=> (not res!10275) (not e!6230))))

(assert (=> b!10239 (= res!10275 (isPrefixOf!0 (_1!653 lt!16097) thiss!1486))))

(assert (= (and d!3260 c!698) b!10235))

(assert (= (and d!3260 (not c!698)) b!10237))

(assert (= (and d!3260 res!10274) b!10239))

(assert (= (and b!10239 res!10275) b!10236))

(assert (= (and b!10236 res!10276) b!10238))

(declare-fun m!14955 () Bool)

(assert (=> b!10236 m!14955))

(declare-fun m!14957 () Bool)

(assert (=> d!3260 m!14957))

(declare-fun m!14959 () Bool)

(assert (=> d!3260 m!14959))

(declare-fun m!14961 () Bool)

(assert (=> d!3260 m!14961))

(declare-fun m!14963 () Bool)

(assert (=> d!3260 m!14963))

(declare-fun m!14965 () Bool)

(assert (=> d!3260 m!14965))

(declare-fun m!14967 () Bool)

(assert (=> d!3260 m!14967))

(declare-fun m!14969 () Bool)

(assert (=> d!3260 m!14969))

(assert (=> d!3260 m!14713))

(declare-fun m!14971 () Bool)

(assert (=> d!3260 m!14971))

(assert (=> d!3260 m!14435))

(assert (=> d!3260 m!14711))

(declare-fun m!14973 () Bool)

(assert (=> b!10239 m!14973))

(declare-fun m!14975 () Bool)

(assert (=> b!10238 m!14975))

(assert (=> b!10238 m!14405))

(assert (=> b!10238 m!14407))

(assert (=> b!10235 m!14407))

(declare-fun m!14977 () Bool)

(assert (=> b!10235 m!14977))

(declare-fun m!14979 () Bool)

(assert (=> b!10235 m!14979))

(assert (=> b!9912 d!3260))

(declare-fun b!10263 () Bool)

(declare-fun e!6241 () Bool)

(declare-fun lt!16113 () List!147)

(declare-fun length!27 (List!147) Int)

(assert (=> b!10263 (= e!6241 (> (length!27 lt!16113) 0))))

(declare-fun d!3280 () Bool)

(assert (=> d!3280 e!6241))

(declare-fun c!710 () Bool)

(assert (=> d!3280 (= c!710 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!1244 0))(
  ( (tuple2!1245 (_1!664 List!147) (_2!664 BitStream!478)) )
))
(declare-fun e!6242 () tuple2!1244)

(assert (=> d!3280 (= lt!16113 (_1!664 e!6242))))

(declare-fun c!709 () Bool)

(assert (=> d!3280 (= c!709 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3280 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3280 (= (bitStreamReadBitsIntoList!0 (_2!651 lt!15306) (_1!653 lt!15307) nBits!460) lt!16113)))

(declare-fun lt!16115 () (_ BitVec 64))

(declare-fun b!10261 () Bool)

(declare-datatypes ((tuple2!1246 0))(
  ( (tuple2!1247 (_1!665 Bool) (_2!665 BitStream!478)) )
))
(declare-fun lt!16114 () tuple2!1246)

(assert (=> b!10261 (= e!6242 (tuple2!1245 (Cons!143 (_1!665 lt!16114) (bitStreamReadBitsIntoList!0 (_2!651 lt!15306) (_2!665 lt!16114) (bvsub nBits!460 lt!16115))) (_2!665 lt!16114)))))

(declare-fun readBit!0 (BitStream!478) tuple2!1246)

(assert (=> b!10261 (= lt!16114 (readBit!0 (_1!653 lt!15307)))))

(assert (=> b!10261 (= lt!16115 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10262 () Bool)

(declare-fun isEmpty!32 (List!147) Bool)

(assert (=> b!10262 (= e!6241 (isEmpty!32 lt!16113))))

(declare-fun b!10260 () Bool)

(assert (=> b!10260 (= e!6242 (tuple2!1245 Nil!144 (_1!653 lt!15307)))))

(assert (= (and d!3280 c!709) b!10260))

(assert (= (and d!3280 (not c!709)) b!10261))

(assert (= (and d!3280 c!710) b!10262))

(assert (= (and d!3280 (not c!710)) b!10263))

(declare-fun m!14989 () Bool)

(assert (=> b!10263 m!14989))

(declare-fun m!14991 () Bool)

(assert (=> b!10261 m!14991))

(declare-fun m!14993 () Bool)

(assert (=> b!10261 m!14993))

(declare-fun m!14995 () Bool)

(assert (=> b!10262 m!14995))

(assert (=> b!9912 d!3280))

(push 1)

(assert (not b!10124))

(assert (not d!3216))

(assert (not b!10181))

(assert (not b!10122))

(assert (not b!10119))

(assert (not d!3254))

(assert (not b!10193))

(assert (not d!3198))

(assert (not b!9987))

(assert (not d!3258))

(assert (not b!10123))

(assert (not b!10183))

(assert (not b!10126))

(assert (not b!10261))

(assert (not b!10262))

(assert (not b!10239))

(assert (not d!3248))

(assert (not b!10236))

(assert (not b!10010))

(assert (not d!3210))

(assert (not d!3222))

(assert (not d!3212))

(assert (not d!3200))

(assert (not b!10238))

(assert (not b!10235))

(assert (not b!10263))

(assert (not d!3260))

(assert (not b!9978))

(assert (not b!10180))

(assert (not bm!182))

(assert (not b!10125))

(assert (not b!9985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

