; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5734 () Bool)

(assert start!5734)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!25050 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!35538 () (_ BitVec 64))

(declare-fun e!17143 () Bool)

(declare-datatypes ((array!1657 0))(
  ( (array!1658 (arr!1170 (Array (_ BitVec 32) (_ BitVec 8))) (size!714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1260 0))(
  ( (BitStream!1261 (buf!1035 array!1657) (currentByte!2348 (_ BitVec 32)) (currentBit!2343 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2071 0))(
  ( (Unit!2072) )
))
(declare-datatypes ((tuple2!2838 0))(
  ( (tuple2!2839 (_1!1506 Unit!2071) (_2!1506 BitStream!1260)) )
))
(declare-fun lt!35533 () tuple2!2838)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25050 (= e!17143 (= lt!35538 (bvsub (bvsub (bvadd (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25051 () Bool)

(declare-fun e!17140 () Bool)

(declare-fun e!17141 () Bool)

(assert (=> b!25051 (= e!17140 (not e!17141))))

(declare-fun res!21663 () Bool)

(assert (=> b!25051 (=> res!21663 e!17141)))

(assert (=> b!25051 (= res!21663 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1260)

(declare-fun isPrefixOf!0 (BitStream!1260 BitStream!1260) Bool)

(assert (=> b!25051 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35527 () Unit!2071)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1260) Unit!2071)

(assert (=> b!25051 (= lt!35527 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!35535 () (_ BitVec 64))

(assert (=> b!25051 (= lt!35535 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(declare-fun b!25052 () Bool)

(declare-fun res!21657 () Bool)

(declare-fun e!17137 () Bool)

(assert (=> b!25052 (=> res!21657 e!17137)))

(declare-fun lt!35537 () tuple2!2838)

(assert (=> b!25052 (= res!21657 (not (= (size!714 (buf!1035 thiss!1379)) (size!714 (buf!1035 (_2!1506 lt!35537))))))))

(declare-fun b!25053 () Bool)

(declare-fun e!17136 () Bool)

(declare-datatypes ((tuple2!2840 0))(
  ( (tuple2!2841 (_1!1507 BitStream!1260) (_2!1507 BitStream!1260)) )
))
(declare-fun lt!35531 () tuple2!2840)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25053 (= e!17136 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_1!1507 lt!35531)))) ((_ sign_extend 32) (currentByte!2348 (_1!1507 lt!35531))) ((_ sign_extend 32) (currentBit!2343 (_1!1507 lt!35531))) (bvsub to!314 i!635)))))

(declare-fun lt!35530 () (_ BitVec 64))

(assert (=> b!25053 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!35530)))

(declare-fun lt!35536 () Unit!2071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1260 array!1657 (_ BitVec 64)) Unit!2071)

(assert (=> b!25053 (= lt!35536 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!35537)) lt!35530))))

(declare-fun lt!35529 () tuple2!2840)

(declare-fun reader!0 (BitStream!1260 BitStream!1260) tuple2!2840)

(assert (=> b!25053 (= lt!35529 (reader!0 (_2!1506 lt!35533) (_2!1506 lt!35537)))))

(assert (=> b!25053 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35534 () Unit!2071)

(assert (=> b!25053 (= lt!35534 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1035 (_2!1506 lt!35537)) (bvsub to!314 i!635)))))

(assert (=> b!25053 (= lt!35531 (reader!0 thiss!1379 (_2!1506 lt!35537)))))

(declare-fun b!25054 () Bool)

(assert (=> b!25054 (= e!17137 e!17136)))

(declare-fun res!21668 () Bool)

(assert (=> b!25054 (=> res!21668 e!17136)))

(assert (=> b!25054 (= res!21668 (not (= (size!714 (buf!1035 (_2!1506 lt!35533))) (size!714 (buf!1035 (_2!1506 lt!35537))))))))

(assert (=> b!25054 e!17143))

(declare-fun res!21660 () Bool)

(assert (=> b!25054 (=> (not res!21660) (not e!17143))))

(assert (=> b!25054 (= res!21660 (= (size!714 (buf!1035 (_2!1506 lt!35537))) (size!714 (buf!1035 thiss!1379))))))

(declare-fun b!25055 () Bool)

(declare-fun e!17135 () Bool)

(assert (=> b!25055 (= e!17141 e!17135)))

(declare-fun res!21658 () Bool)

(assert (=> b!25055 (=> res!21658 e!17135)))

(assert (=> b!25055 (= res!21658 (not (isPrefixOf!0 thiss!1379 (_2!1506 lt!35533))))))

(assert (=> b!25055 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!35530)))

(assert (=> b!25055 (= lt!35530 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35532 () Unit!2071)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1260 BitStream!1260 (_ BitVec 64) (_ BitVec 64)) Unit!2071)

(assert (=> b!25055 (= lt!35532 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1506 lt!35533) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1657)

(declare-fun appendBitFromByte!0 (BitStream!1260 (_ BitVec 8) (_ BitVec 32)) tuple2!2838)

(assert (=> b!25055 (= lt!35533 (appendBitFromByte!0 thiss!1379 (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25056 () Bool)

(declare-fun e!17134 () Bool)

(assert (=> b!25056 (= e!17134 e!17137)))

(declare-fun res!21659 () Bool)

(assert (=> b!25056 (=> res!21659 e!17137)))

(assert (=> b!25056 (= res!21659 (not (= lt!35538 (bvsub (bvadd lt!35535 to!314) i!635))))))

(assert (=> b!25056 (= lt!35538 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537))))))

(declare-fun res!21665 () Bool)

(assert (=> start!5734 (=> (not res!21665) (not e!17140))))

(assert (=> start!5734 (= res!21665 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!714 srcBuffer!2))))))))

(assert (=> start!5734 e!17140))

(assert (=> start!5734 true))

(declare-fun array_inv!683 (array!1657) Bool)

(assert (=> start!5734 (array_inv!683 srcBuffer!2)))

(declare-fun e!17138 () Bool)

(declare-fun inv!12 (BitStream!1260) Bool)

(assert (=> start!5734 (and (inv!12 thiss!1379) e!17138)))

(declare-fun b!25057 () Bool)

(declare-fun res!21661 () Bool)

(assert (=> b!25057 (=> res!21661 e!17136)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25057 (= res!21661 (not (invariant!0 (currentBit!2343 (_2!1506 lt!35533)) (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35533))))))))

(declare-fun b!25058 () Bool)

(assert (=> b!25058 (= e!17138 (array_inv!683 (buf!1035 thiss!1379)))))

(declare-fun b!25059 () Bool)

(declare-fun res!21669 () Bool)

(assert (=> b!25059 (=> (not res!21669) (not e!17140))))

(assert (=> b!25059 (= res!21669 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!17142 () Bool)

(declare-fun b!25060 () Bool)

(declare-fun lt!35539 () tuple2!2840)

(declare-datatypes ((List!331 0))(
  ( (Nil!328) (Cons!327 (h!446 Bool) (t!1081 List!331)) )
))
(declare-fun head!168 (List!331) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1260 array!1657 (_ BitVec 64) (_ BitVec 64)) List!331)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1260 BitStream!1260 (_ BitVec 64)) List!331)

(assert (=> b!25060 (= e!17142 (= (head!168 (byteArrayBitContentToList!0 (_2!1506 lt!35533) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!168 (bitStreamReadBitsIntoList!0 (_2!1506 lt!35533) (_1!1507 lt!35539) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25061 () Bool)

(declare-fun res!21664 () Bool)

(assert (=> b!25061 (=> res!21664 e!17136)))

(assert (=> b!25061 (= res!21664 (not (invariant!0 (currentBit!2343 (_2!1506 lt!35533)) (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35537))))))))

(declare-fun b!25062 () Bool)

(assert (=> b!25062 (= e!17135 e!17134)))

(declare-fun res!21662 () Bool)

(assert (=> b!25062 (=> res!21662 e!17134)))

(assert (=> b!25062 (= res!21662 (not (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35537))))))

(assert (=> b!25062 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35537))))

(declare-fun lt!35526 () Unit!2071)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1260 BitStream!1260 BitStream!1260) Unit!2071)

(assert (=> b!25062 (= lt!35526 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1506 lt!35533) (_2!1506 lt!35537)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1260 array!1657 (_ BitVec 64) (_ BitVec 64)) tuple2!2838)

(assert (=> b!25062 (= lt!35537 (appendBitsMSBFirstLoop!0 (_2!1506 lt!35533) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25062 e!17142))

(declare-fun res!21667 () Bool)

(assert (=> b!25062 (=> (not res!21667) (not e!17142))))

(assert (=> b!25062 (= res!21667 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35528 () Unit!2071)

(assert (=> b!25062 (= lt!35528 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1035 (_2!1506 lt!35533)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!25062 (= lt!35539 (reader!0 thiss!1379 (_2!1506 lt!35533)))))

(declare-fun b!25063 () Bool)

(declare-fun res!21666 () Bool)

(assert (=> b!25063 (=> res!21666 e!17137)))

(assert (=> b!25063 (= res!21666 (not (invariant!0 (currentBit!2343 (_2!1506 lt!35537)) (currentByte!2348 (_2!1506 lt!35537)) (size!714 (buf!1035 (_2!1506 lt!35537))))))))

(assert (= (and start!5734 res!21665) b!25059))

(assert (= (and b!25059 res!21669) b!25051))

(assert (= (and b!25051 (not res!21663)) b!25055))

(assert (= (and b!25055 (not res!21658)) b!25062))

(assert (= (and b!25062 res!21667) b!25060))

(assert (= (and b!25062 (not res!21662)) b!25056))

(assert (= (and b!25056 (not res!21659)) b!25063))

(assert (= (and b!25063 (not res!21666)) b!25052))

(assert (= (and b!25052 (not res!21657)) b!25054))

(assert (= (and b!25054 res!21660) b!25050))

(assert (= (and b!25054 (not res!21668)) b!25057))

(assert (= (and b!25057 (not res!21661)) b!25061))

(assert (= (and b!25061 (not res!21664)) b!25053))

(assert (= start!5734 b!25058))

(declare-fun m!35503 () Bool)

(assert (=> b!25055 m!35503))

(declare-fun m!35505 () Bool)

(assert (=> b!25055 m!35505))

(declare-fun m!35507 () Bool)

(assert (=> b!25055 m!35507))

(declare-fun m!35509 () Bool)

(assert (=> b!25055 m!35509))

(assert (=> b!25055 m!35503))

(declare-fun m!35511 () Bool)

(assert (=> b!25055 m!35511))

(declare-fun m!35513 () Bool)

(assert (=> b!25051 m!35513))

(declare-fun m!35515 () Bool)

(assert (=> b!25051 m!35515))

(declare-fun m!35517 () Bool)

(assert (=> b!25051 m!35517))

(declare-fun m!35519 () Bool)

(assert (=> b!25063 m!35519))

(declare-fun m!35521 () Bool)

(assert (=> b!25059 m!35521))

(declare-fun m!35523 () Bool)

(assert (=> b!25053 m!35523))

(declare-fun m!35525 () Bool)

(assert (=> b!25053 m!35525))

(declare-fun m!35527 () Bool)

(assert (=> b!25053 m!35527))

(declare-fun m!35529 () Bool)

(assert (=> b!25053 m!35529))

(declare-fun m!35531 () Bool)

(assert (=> b!25053 m!35531))

(declare-fun m!35533 () Bool)

(assert (=> b!25053 m!35533))

(declare-fun m!35535 () Bool)

(assert (=> b!25053 m!35535))

(declare-fun m!35537 () Bool)

(assert (=> b!25057 m!35537))

(declare-fun m!35539 () Bool)

(assert (=> b!25062 m!35539))

(declare-fun m!35541 () Bool)

(assert (=> b!25062 m!35541))

(declare-fun m!35543 () Bool)

(assert (=> b!25062 m!35543))

(declare-fun m!35545 () Bool)

(assert (=> b!25062 m!35545))

(declare-fun m!35547 () Bool)

(assert (=> b!25062 m!35547))

(declare-fun m!35549 () Bool)

(assert (=> b!25062 m!35549))

(declare-fun m!35551 () Bool)

(assert (=> b!25062 m!35551))

(declare-fun m!35553 () Bool)

(assert (=> start!5734 m!35553))

(declare-fun m!35555 () Bool)

(assert (=> start!5734 m!35555))

(declare-fun m!35557 () Bool)

(assert (=> b!25061 m!35557))

(declare-fun m!35559 () Bool)

(assert (=> b!25050 m!35559))

(declare-fun m!35561 () Bool)

(assert (=> b!25056 m!35561))

(declare-fun m!35563 () Bool)

(assert (=> b!25060 m!35563))

(assert (=> b!25060 m!35563))

(declare-fun m!35565 () Bool)

(assert (=> b!25060 m!35565))

(declare-fun m!35567 () Bool)

(assert (=> b!25060 m!35567))

(assert (=> b!25060 m!35567))

(declare-fun m!35569 () Bool)

(assert (=> b!25060 m!35569))

(declare-fun m!35571 () Bool)

(assert (=> b!25058 m!35571))

(check-sat (not b!25059) (not b!25058) (not b!25053) (not b!25060) (not b!25061) (not b!25050) (not b!25062) (not b!25057) (not b!25063) (not b!25056) (not b!25055) (not start!5734) (not b!25051))
(check-sat)
(get-model)

(declare-fun d!7436 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7436 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2165 () Bool)

(assert (= bs!2165 d!7436))

(declare-fun m!35643 () Bool)

(assert (=> bs!2165 m!35643))

(assert (=> b!25059 d!7436))

(declare-fun d!7438 () Bool)

(assert (=> d!7438 (= (head!168 (byteArrayBitContentToList!0 (_2!1506 lt!35533) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!446 (byteArrayBitContentToList!0 (_2!1506 lt!35533) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25060 d!7438))

(declare-fun d!7440 () Bool)

(declare-fun c!1671 () Bool)

(assert (=> d!7440 (= c!1671 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17179 () List!331)

(assert (=> d!7440 (= (byteArrayBitContentToList!0 (_2!1506 lt!35533) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17179)))

(declare-fun b!25110 () Bool)

(assert (=> b!25110 (= e!17179 Nil!328)))

(declare-fun b!25111 () Bool)

(assert (=> b!25111 (= e!17179 (Cons!327 (not (= (bvand ((_ sign_extend 24) (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1506 lt!35533) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7440 c!1671) b!25110))

(assert (= (and d!7440 (not c!1671)) b!25111))

(assert (=> b!25111 m!35503))

(declare-fun m!35645 () Bool)

(assert (=> b!25111 m!35645))

(declare-fun m!35647 () Bool)

(assert (=> b!25111 m!35647))

(assert (=> b!25060 d!7440))

(declare-fun d!7442 () Bool)

(assert (=> d!7442 (= (head!168 (bitStreamReadBitsIntoList!0 (_2!1506 lt!35533) (_1!1507 lt!35539) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!446 (bitStreamReadBitsIntoList!0 (_2!1506 lt!35533) (_1!1507 lt!35539) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25060 d!7442))

(declare-fun b!25123 () Bool)

(declare-fun e!17185 () Bool)

(declare-fun lt!35588 () List!331)

(declare-fun length!59 (List!331) Int)

(assert (=> b!25123 (= e!17185 (> (length!59 lt!35588) 0))))

(declare-fun b!25120 () Bool)

(declare-datatypes ((tuple2!2846 0))(
  ( (tuple2!2847 (_1!1510 List!331) (_2!1510 BitStream!1260)) )
))
(declare-fun e!17184 () tuple2!2846)

(assert (=> b!25120 (= e!17184 (tuple2!2847 Nil!328 (_1!1507 lt!35539)))))

(declare-datatypes ((tuple2!2848 0))(
  ( (tuple2!2849 (_1!1511 Bool) (_2!1511 BitStream!1260)) )
))
(declare-fun lt!35589 () tuple2!2848)

(declare-fun lt!35590 () (_ BitVec 64))

(declare-fun b!25121 () Bool)

(assert (=> b!25121 (= e!17184 (tuple2!2847 (Cons!327 (_1!1511 lt!35589) (bitStreamReadBitsIntoList!0 (_2!1506 lt!35533) (_2!1511 lt!35589) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!35590))) (_2!1511 lt!35589)))))

(declare-fun readBit!0 (BitStream!1260) tuple2!2848)

(assert (=> b!25121 (= lt!35589 (readBit!0 (_1!1507 lt!35539)))))

(assert (=> b!25121 (= lt!35590 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7444 () Bool)

(assert (=> d!7444 e!17185))

(declare-fun c!1676 () Bool)

(assert (=> d!7444 (= c!1676 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7444 (= lt!35588 (_1!1510 e!17184))))

(declare-fun c!1677 () Bool)

(assert (=> d!7444 (= c!1677 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7444 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7444 (= (bitStreamReadBitsIntoList!0 (_2!1506 lt!35533) (_1!1507 lt!35539) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35588)))

(declare-fun b!25122 () Bool)

(declare-fun isEmpty!64 (List!331) Bool)

(assert (=> b!25122 (= e!17185 (isEmpty!64 lt!35588))))

(assert (= (and d!7444 c!1677) b!25120))

(assert (= (and d!7444 (not c!1677)) b!25121))

(assert (= (and d!7444 c!1676) b!25122))

(assert (= (and d!7444 (not c!1676)) b!25123))

(declare-fun m!35649 () Bool)

(assert (=> b!25123 m!35649))

(declare-fun m!35651 () Bool)

(assert (=> b!25121 m!35651))

(declare-fun m!35653 () Bool)

(assert (=> b!25121 m!35653))

(declare-fun m!35655 () Bool)

(assert (=> b!25122 m!35655))

(assert (=> b!25060 d!7444))

(declare-fun d!7446 () Bool)

(declare-fun e!17188 () Bool)

(assert (=> d!7446 e!17188))

(declare-fun res!21714 () Bool)

(assert (=> d!7446 (=> (not res!21714) (not e!17188))))

(declare-fun lt!35606 () (_ BitVec 64))

(declare-fun lt!35605 () (_ BitVec 64))

(declare-fun lt!35608 () (_ BitVec 64))

(assert (=> d!7446 (= res!21714 (= lt!35605 (bvsub lt!35608 lt!35606)))))

(assert (=> d!7446 (or (= (bvand lt!35608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35606 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35608 lt!35606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7446 (= lt!35606 (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533)))))))

(declare-fun lt!35604 () (_ BitVec 64))

(declare-fun lt!35607 () (_ BitVec 64))

(assert (=> d!7446 (= lt!35608 (bvmul lt!35604 lt!35607))))

(assert (=> d!7446 (or (= lt!35604 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35607 (bvsdiv (bvmul lt!35604 lt!35607) lt!35604)))))

(assert (=> d!7446 (= lt!35607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7446 (= lt!35604 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))))))

(assert (=> d!7446 (= lt!35605 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533)))))))

(assert (=> d!7446 (invariant!0 (currentBit!2343 (_2!1506 lt!35533)) (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35533))))))

(assert (=> d!7446 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))) lt!35605)))

(declare-fun b!25128 () Bool)

(declare-fun res!21713 () Bool)

(assert (=> b!25128 (=> (not res!21713) (not e!17188))))

(assert (=> b!25128 (= res!21713 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35605))))

(declare-fun b!25129 () Bool)

(declare-fun lt!35603 () (_ BitVec 64))

(assert (=> b!25129 (= e!17188 (bvsle lt!35605 (bvmul lt!35603 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25129 (or (= lt!35603 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35603 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35603)))))

(assert (=> b!25129 (= lt!35603 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))))))

(assert (= (and d!7446 res!21714) b!25128))

(assert (= (and b!25128 res!21713) b!25129))

(declare-fun m!35657 () Bool)

(assert (=> d!7446 m!35657))

(assert (=> d!7446 m!35537))

(assert (=> b!25050 d!7446))

(declare-fun d!7448 () Bool)

(assert (=> d!7448 (= (invariant!0 (currentBit!2343 (_2!1506 lt!35533)) (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35537)))) (and (bvsge (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (bvslt (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000001000) (bvsge (currentByte!2348 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35537)))) (and (= (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (= (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35537))))))))))

(assert (=> b!25061 d!7448))

(declare-fun d!7450 () Bool)

(declare-fun e!17189 () Bool)

(assert (=> d!7450 e!17189))

(declare-fun res!21716 () Bool)

(assert (=> d!7450 (=> (not res!21716) (not e!17189))))

(declare-fun lt!35614 () (_ BitVec 64))

(declare-fun lt!35612 () (_ BitVec 64))

(declare-fun lt!35611 () (_ BitVec 64))

(assert (=> d!7450 (= res!21716 (= lt!35611 (bvsub lt!35614 lt!35612)))))

(assert (=> d!7450 (or (= (bvand lt!35614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35612 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35614 lt!35612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7450 (= lt!35612 (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35537))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35537)))))))

(declare-fun lt!35610 () (_ BitVec 64))

(declare-fun lt!35613 () (_ BitVec 64))

(assert (=> d!7450 (= lt!35614 (bvmul lt!35610 lt!35613))))

(assert (=> d!7450 (or (= lt!35610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35613 (bvsdiv (bvmul lt!35610 lt!35613) lt!35610)))))

(assert (=> d!7450 (= lt!35613 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7450 (= lt!35610 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))))))

(assert (=> d!7450 (= lt!35611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35537)))))))

(assert (=> d!7450 (invariant!0 (currentBit!2343 (_2!1506 lt!35537)) (currentByte!2348 (_2!1506 lt!35537)) (size!714 (buf!1035 (_2!1506 lt!35537))))))

(assert (=> d!7450 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537))) lt!35611)))

(declare-fun b!25130 () Bool)

(declare-fun res!21715 () Bool)

(assert (=> b!25130 (=> (not res!21715) (not e!17189))))

(assert (=> b!25130 (= res!21715 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35611))))

(declare-fun b!25131 () Bool)

(declare-fun lt!35609 () (_ BitVec 64))

(assert (=> b!25131 (= e!17189 (bvsle lt!35611 (bvmul lt!35609 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25131 (or (= lt!35609 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35609 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35609)))))

(assert (=> b!25131 (= lt!35609 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))))))

(assert (= (and d!7450 res!21716) b!25130))

(assert (= (and b!25130 res!21715) b!25131))

(declare-fun m!35659 () Bool)

(assert (=> d!7450 m!35659))

(assert (=> d!7450 m!35519))

(assert (=> b!25056 d!7450))

(declare-fun d!7452 () Bool)

(assert (=> d!7452 (= (array_inv!683 srcBuffer!2) (bvsge (size!714 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5734 d!7452))

(declare-fun d!7454 () Bool)

(assert (=> d!7454 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2343 thiss!1379) (currentByte!2348 thiss!1379) (size!714 (buf!1035 thiss!1379))))))

(declare-fun bs!2166 () Bool)

(assert (= bs!2166 d!7454))

(declare-fun m!35661 () Bool)

(assert (=> bs!2166 m!35661))

(assert (=> start!5734 d!7454))

(declare-fun d!7456 () Bool)

(assert (=> d!7456 (= (invariant!0 (currentBit!2343 (_2!1506 lt!35533)) (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35533)))) (and (bvsge (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (bvslt (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000001000) (bvsge (currentByte!2348 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35533)))) (and (= (currentBit!2343 (_2!1506 lt!35533)) #b00000000000000000000000000000000) (= (currentByte!2348 (_2!1506 lt!35533)) (size!714 (buf!1035 (_2!1506 lt!35533))))))))))

(assert (=> b!25057 d!7456))

(declare-fun d!7458 () Bool)

(assert (=> d!7458 (= (array_inv!683 (buf!1035 thiss!1379)) (bvsge (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25058 d!7458))

(declare-fun d!7460 () Bool)

(declare-fun res!21723 () Bool)

(declare-fun e!17194 () Bool)

(assert (=> d!7460 (=> (not res!21723) (not e!17194))))

(assert (=> d!7460 (= res!21723 (= (size!714 (buf!1035 thiss!1379)) (size!714 (buf!1035 (_2!1506 lt!35533)))))))

(assert (=> d!7460 (= (isPrefixOf!0 thiss!1379 (_2!1506 lt!35533)) e!17194)))

(declare-fun b!25138 () Bool)

(declare-fun res!21724 () Bool)

(assert (=> b!25138 (=> (not res!21724) (not e!17194))))

(assert (=> b!25138 (= res!21724 (bvsle (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)) (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533)))))))

(declare-fun b!25139 () Bool)

(declare-fun e!17195 () Bool)

(assert (=> b!25139 (= e!17194 e!17195)))

(declare-fun res!21725 () Bool)

(assert (=> b!25139 (=> res!21725 e!17195)))

(assert (=> b!25139 (= res!21725 (= (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25140 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1657 array!1657 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25140 (= e!17195 (arrayBitRangesEq!0 (buf!1035 thiss!1379) (buf!1035 (_2!1506 lt!35533)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(assert (= (and d!7460 res!21723) b!25138))

(assert (= (and b!25138 res!21724) b!25139))

(assert (= (and b!25139 (not res!21725)) b!25140))

(assert (=> b!25138 m!35517))

(assert (=> b!25138 m!35559))

(assert (=> b!25140 m!35517))

(assert (=> b!25140 m!35517))

(declare-fun m!35663 () Bool)

(assert (=> b!25140 m!35663))

(assert (=> b!25055 d!7460))

(declare-fun d!7462 () Bool)

(assert (=> d!7462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!35530) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533)))) lt!35530))))

(declare-fun bs!2167 () Bool)

(assert (= bs!2167 d!7462))

(assert (=> bs!2167 m!35657))

(assert (=> b!25055 d!7462))

(declare-fun d!7464 () Bool)

(declare-fun e!17198 () Bool)

(assert (=> d!7464 e!17198))

(declare-fun res!21728 () Bool)

(assert (=> d!7464 (=> (not res!21728) (not e!17198))))

(assert (=> d!7464 (= res!21728 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35617 () Unit!2071)

(declare-fun choose!27 (BitStream!1260 BitStream!1260 (_ BitVec 64) (_ BitVec 64)) Unit!2071)

(assert (=> d!7464 (= lt!35617 (choose!27 thiss!1379 (_2!1506 lt!35533) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7464 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1506 lt!35533) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35617)))

(declare-fun b!25143 () Bool)

(assert (=> b!25143 (= e!17198 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7464 res!21728) b!25143))

(declare-fun m!35665 () Bool)

(assert (=> d!7464 m!35665))

(declare-fun m!35667 () Bool)

(assert (=> b!25143 m!35667))

(assert (=> b!25055 d!7464))

(declare-fun b!25161 () Bool)

(declare-fun e!17210 () Bool)

(declare-datatypes ((tuple2!2850 0))(
  ( (tuple2!2851 (_1!1512 BitStream!1260) (_2!1512 Bool)) )
))
(declare-fun lt!35642 () tuple2!2850)

(declare-fun lt!35652 () tuple2!2838)

(assert (=> b!25161 (= e!17210 (= (bitIndex!0 (size!714 (buf!1035 (_1!1512 lt!35642))) (currentByte!2348 (_1!1512 lt!35642)) (currentBit!2343 (_1!1512 lt!35642))) (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35652))) (currentByte!2348 (_2!1506 lt!35652)) (currentBit!2343 (_2!1506 lt!35652)))))))

(declare-fun b!25162 () Bool)

(declare-fun e!17207 () Bool)

(assert (=> b!25162 (= e!17207 e!17210)))

(declare-fun res!21747 () Bool)

(assert (=> b!25162 (=> (not res!21747) (not e!17210))))

(declare-fun lt!35643 () Bool)

(assert (=> b!25162 (= res!21747 (and (= (_2!1512 lt!35642) lt!35643) (= (_1!1512 lt!35642) (_2!1506 lt!35652))))))

(declare-fun readBitPure!0 (BitStream!1260) tuple2!2850)

(declare-fun readerFrom!0 (BitStream!1260 (_ BitVec 32) (_ BitVec 32)) BitStream!1260)

(assert (=> b!25162 (= lt!35642 (readBitPure!0 (readerFrom!0 (_2!1506 lt!35652) (currentBit!2343 thiss!1379) (currentByte!2348 thiss!1379))))))

(declare-fun b!25163 () Bool)

(declare-fun res!21746 () Bool)

(assert (=> b!25163 (=> (not res!21746) (not e!17207))))

(assert (=> b!25163 (= res!21746 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35652))) (currentByte!2348 (_2!1506 lt!35652)) (currentBit!2343 (_2!1506 lt!35652))) (bvadd (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7466 () Bool)

(declare-fun e!17209 () Bool)

(assert (=> d!7466 e!17209))

(declare-fun res!21750 () Bool)

(assert (=> d!7466 (=> (not res!21750) (not e!17209))))

(declare-fun lt!35647 () tuple2!2838)

(assert (=> d!7466 (= res!21750 (= (size!714 (buf!1035 (_2!1506 lt!35647))) (size!714 (buf!1035 thiss!1379))))))

(declare-fun lt!35644 () (_ BitVec 8))

(declare-fun lt!35649 () array!1657)

(assert (=> d!7466 (= lt!35644 (select (arr!1170 lt!35649) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7466 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!714 lt!35649)))))

(assert (=> d!7466 (= lt!35649 (array!1658 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!35653 () tuple2!2838)

(assert (=> d!7466 (= lt!35647 (tuple2!2839 (_1!1506 lt!35653) (_2!1506 lt!35653)))))

(assert (=> d!7466 (= lt!35653 lt!35652)))

(assert (=> d!7466 e!17207))

(declare-fun res!21749 () Bool)

(assert (=> d!7466 (=> (not res!21749) (not e!17207))))

(assert (=> d!7466 (= res!21749 (= (size!714 (buf!1035 thiss!1379)) (size!714 (buf!1035 (_2!1506 lt!35652)))))))

(declare-fun appendBit!0 (BitStream!1260 Bool) tuple2!2838)

(assert (=> d!7466 (= lt!35652 (appendBit!0 thiss!1379 lt!35643))))

(assert (=> d!7466 (= lt!35643 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7466 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7466 (= (appendBitFromByte!0 thiss!1379 (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!35647)))

(declare-fun b!25164 () Bool)

(declare-fun res!21752 () Bool)

(assert (=> b!25164 (=> (not res!21752) (not e!17207))))

(assert (=> b!25164 (= res!21752 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35652)))))

(declare-fun b!25165 () Bool)

(declare-fun e!17208 () Bool)

(assert (=> b!25165 (= e!17209 e!17208)))

(declare-fun res!21751 () Bool)

(assert (=> b!25165 (=> (not res!21751) (not e!17208))))

(declare-fun lt!35648 () tuple2!2850)

(assert (=> b!25165 (= res!21751 (and (= (_2!1512 lt!35648) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!35644)) #b00000000000000000000000000000000))) (= (_1!1512 lt!35648) (_2!1506 lt!35647))))))

(declare-datatypes ((tuple2!2852 0))(
  ( (tuple2!2853 (_1!1513 array!1657) (_2!1513 BitStream!1260)) )
))
(declare-fun lt!35651 () tuple2!2852)

(declare-fun lt!35650 () BitStream!1260)

(declare-fun readBits!0 (BitStream!1260 (_ BitVec 64)) tuple2!2852)

(assert (=> b!25165 (= lt!35651 (readBits!0 lt!35650 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!25165 (= lt!35648 (readBitPure!0 lt!35650))))

(assert (=> b!25165 (= lt!35650 (readerFrom!0 (_2!1506 lt!35647) (currentBit!2343 thiss!1379) (currentByte!2348 thiss!1379)))))

(declare-fun b!25166 () Bool)

(declare-fun res!21748 () Bool)

(assert (=> b!25166 (=> (not res!21748) (not e!17209))))

(assert (=> b!25166 (= res!21748 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35647)))))

(declare-fun b!25167 () Bool)

(declare-fun res!21745 () Bool)

(assert (=> b!25167 (=> (not res!21745) (not e!17209))))

(declare-fun lt!35645 () (_ BitVec 64))

(declare-fun lt!35646 () (_ BitVec 64))

(assert (=> b!25167 (= res!21745 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35647))) (currentByte!2348 (_2!1506 lt!35647)) (currentBit!2343 (_2!1506 lt!35647))) (bvadd lt!35646 lt!35645)))))

(assert (=> b!25167 (or (not (= (bvand lt!35646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35645 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!35646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!35646 lt!35645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25167 (= lt!35645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!25167 (= lt!35646 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(declare-fun b!25168 () Bool)

(assert (=> b!25168 (= e!17208 (= (bitIndex!0 (size!714 (buf!1035 (_1!1512 lt!35648))) (currentByte!2348 (_1!1512 lt!35648)) (currentBit!2343 (_1!1512 lt!35648))) (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35647))) (currentByte!2348 (_2!1506 lt!35647)) (currentBit!2343 (_2!1506 lt!35647)))))))

(assert (= (and d!7466 res!21749) b!25163))

(assert (= (and b!25163 res!21746) b!25164))

(assert (= (and b!25164 res!21752) b!25162))

(assert (= (and b!25162 res!21747) b!25161))

(assert (= (and d!7466 res!21750) b!25167))

(assert (= (and b!25167 res!21745) b!25166))

(assert (= (and b!25166 res!21748) b!25165))

(assert (= (and b!25165 res!21751) b!25168))

(declare-fun m!35669 () Bool)

(assert (=> b!25168 m!35669))

(declare-fun m!35671 () Bool)

(assert (=> b!25168 m!35671))

(declare-fun m!35673 () Bool)

(assert (=> b!25163 m!35673))

(assert (=> b!25163 m!35517))

(declare-fun m!35675 () Bool)

(assert (=> b!25164 m!35675))

(declare-fun m!35677 () Bool)

(assert (=> d!7466 m!35677))

(declare-fun m!35679 () Bool)

(assert (=> d!7466 m!35679))

(assert (=> d!7466 m!35645))

(assert (=> b!25167 m!35671))

(assert (=> b!25167 m!35517))

(declare-fun m!35681 () Bool)

(assert (=> b!25161 m!35681))

(assert (=> b!25161 m!35673))

(declare-fun m!35683 () Bool)

(assert (=> b!25165 m!35683))

(declare-fun m!35685 () Bool)

(assert (=> b!25165 m!35685))

(declare-fun m!35687 () Bool)

(assert (=> b!25165 m!35687))

(declare-fun m!35689 () Bool)

(assert (=> b!25162 m!35689))

(assert (=> b!25162 m!35689))

(declare-fun m!35691 () Bool)

(assert (=> b!25162 m!35691))

(declare-fun m!35693 () Bool)

(assert (=> b!25166 m!35693))

(assert (=> b!25055 d!7466))

(declare-fun d!7468 () Bool)

(declare-fun res!21753 () Bool)

(declare-fun e!17211 () Bool)

(assert (=> d!7468 (=> (not res!21753) (not e!17211))))

(assert (=> d!7468 (= res!21753 (= (size!714 (buf!1035 thiss!1379)) (size!714 (buf!1035 thiss!1379))))))

(assert (=> d!7468 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17211)))

(declare-fun b!25169 () Bool)

(declare-fun res!21754 () Bool)

(assert (=> b!25169 (=> (not res!21754) (not e!17211))))

(assert (=> b!25169 (= res!21754 (bvsle (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)) (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(declare-fun b!25170 () Bool)

(declare-fun e!17212 () Bool)

(assert (=> b!25170 (= e!17211 e!17212)))

(declare-fun res!21755 () Bool)

(assert (=> b!25170 (=> res!21755 e!17212)))

(assert (=> b!25170 (= res!21755 (= (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25171 () Bool)

(assert (=> b!25171 (= e!17212 (arrayBitRangesEq!0 (buf!1035 thiss!1379) (buf!1035 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(assert (= (and d!7468 res!21753) b!25169))

(assert (= (and b!25169 res!21754) b!25170))

(assert (= (and b!25170 (not res!21755)) b!25171))

(assert (=> b!25169 m!35517))

(assert (=> b!25169 m!35517))

(assert (=> b!25171 m!35517))

(assert (=> b!25171 m!35517))

(declare-fun m!35695 () Bool)

(assert (=> b!25171 m!35695))

(assert (=> b!25051 d!7468))

(declare-fun d!7470 () Bool)

(assert (=> d!7470 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35656 () Unit!2071)

(declare-fun choose!11 (BitStream!1260) Unit!2071)

(assert (=> d!7470 (= lt!35656 (choose!11 thiss!1379))))

(assert (=> d!7470 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!35656)))

(declare-fun bs!2169 () Bool)

(assert (= bs!2169 d!7470))

(assert (=> bs!2169 m!35513))

(declare-fun m!35697 () Bool)

(assert (=> bs!2169 m!35697))

(assert (=> b!25051 d!7470))

(declare-fun d!7472 () Bool)

(declare-fun e!17213 () Bool)

(assert (=> d!7472 e!17213))

(declare-fun res!21757 () Bool)

(assert (=> d!7472 (=> (not res!21757) (not e!17213))))

(declare-fun lt!35660 () (_ BitVec 64))

(declare-fun lt!35659 () (_ BitVec 64))

(declare-fun lt!35662 () (_ BitVec 64))

(assert (=> d!7472 (= res!21757 (= lt!35659 (bvsub lt!35662 lt!35660)))))

(assert (=> d!7472 (or (= (bvand lt!35662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35662 lt!35660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7472 (= lt!35660 (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379))))))

(declare-fun lt!35658 () (_ BitVec 64))

(declare-fun lt!35661 () (_ BitVec 64))

(assert (=> d!7472 (= lt!35662 (bvmul lt!35658 lt!35661))))

(assert (=> d!7472 (or (= lt!35658 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35661 (bvsdiv (bvmul lt!35658 lt!35661) lt!35658)))))

(assert (=> d!7472 (= lt!35661 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7472 (= lt!35658 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))))))

(assert (=> d!7472 (= lt!35659 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2348 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2343 thiss!1379))))))

(assert (=> d!7472 (invariant!0 (currentBit!2343 thiss!1379) (currentByte!2348 thiss!1379) (size!714 (buf!1035 thiss!1379)))))

(assert (=> d!7472 (= (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)) lt!35659)))

(declare-fun b!25172 () Bool)

(declare-fun res!21756 () Bool)

(assert (=> b!25172 (=> (not res!21756) (not e!17213))))

(assert (=> b!25172 (= res!21756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35659))))

(declare-fun b!25173 () Bool)

(declare-fun lt!35657 () (_ BitVec 64))

(assert (=> b!25173 (= e!17213 (bvsle lt!35659 (bvmul lt!35657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25173 (or (= lt!35657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35657)))))

(assert (=> b!25173 (= lt!35657 ((_ sign_extend 32) (size!714 (buf!1035 thiss!1379))))))

(assert (= (and d!7472 res!21757) b!25172))

(assert (= (and b!25172 res!21756) b!25173))

(assert (=> d!7472 m!35643))

(assert (=> d!7472 m!35661))

(assert (=> b!25051 d!7472))

(declare-fun d!7474 () Bool)

(assert (=> d!7474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2170 () Bool)

(assert (= bs!2170 d!7474))

(declare-fun m!35699 () Bool)

(assert (=> bs!2170 m!35699))

(assert (=> b!25062 d!7474))

(declare-fun b!25322 () Bool)

(declare-fun res!21868 () Bool)

(declare-fun e!17289 () Bool)

(assert (=> b!25322 (=> (not res!21868) (not e!17289))))

(declare-fun lt!36041 () tuple2!2838)

(assert (=> b!25322 (= res!21868 (= (size!714 (buf!1035 (_2!1506 lt!36041))) (size!714 (buf!1035 (_2!1506 lt!35533)))))))

(declare-fun b!25323 () Bool)

(declare-fun e!17290 () tuple2!2838)

(declare-fun lt!36043 () tuple2!2838)

(declare-fun Unit!2075 () Unit!2071)

(assert (=> b!25323 (= e!17290 (tuple2!2839 Unit!2075 (_2!1506 lt!36043)))))

(declare-fun lt!36055 () tuple2!2838)

(assert (=> b!25323 (= lt!36055 (appendBitFromByte!0 (_2!1506 lt!35533) (select (arr!1170 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!36030 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36030 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36037 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36037 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36025 () Unit!2071)

(assert (=> b!25323 (= lt!36025 (validateOffsetBitsIneqLemma!0 (_2!1506 lt!35533) (_2!1506 lt!36055) lt!36030 lt!36037))))

(assert (=> b!25323 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!36055)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!36055))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!36055))) (bvsub lt!36030 lt!36037))))

(declare-fun lt!36051 () Unit!2071)

(assert (=> b!25323 (= lt!36051 lt!36025)))

(declare-fun lt!36064 () tuple2!2840)

(assert (=> b!25323 (= lt!36064 (reader!0 (_2!1506 lt!35533) (_2!1506 lt!36055)))))

(declare-fun lt!36035 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36035 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36034 () Unit!2071)

(assert (=> b!25323 (= lt!36034 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!36055)) lt!36035))))

(assert (=> b!25323 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!36055)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!36035)))

(declare-fun lt!36028 () Unit!2071)

(assert (=> b!25323 (= lt!36028 lt!36034)))

(assert (=> b!25323 (= (head!168 (byteArrayBitContentToList!0 (_2!1506 lt!36055) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!168 (bitStreamReadBitsIntoList!0 (_2!1506 lt!36055) (_1!1507 lt!36064) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36062 () Unit!2071)

(declare-fun Unit!2076 () Unit!2071)

(assert (=> b!25323 (= lt!36062 Unit!2076)))

(assert (=> b!25323 (= lt!36043 (appendBitsMSBFirstLoop!0 (_2!1506 lt!36055) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!36026 () Unit!2071)

(assert (=> b!25323 (= lt!36026 (lemmaIsPrefixTransitive!0 (_2!1506 lt!35533) (_2!1506 lt!36055) (_2!1506 lt!36043)))))

(assert (=> b!25323 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!36043))))

(declare-fun lt!36065 () Unit!2071)

(assert (=> b!25323 (= lt!36065 lt!36026)))

(assert (=> b!25323 (= (size!714 (buf!1035 (_2!1506 lt!36043))) (size!714 (buf!1035 (_2!1506 lt!35533))))))

(declare-fun lt!36042 () Unit!2071)

(declare-fun Unit!2077 () Unit!2071)

(assert (=> b!25323 (= lt!36042 Unit!2077)))

(assert (=> b!25323 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!36043))) (currentByte!2348 (_2!1506 lt!36043)) (currentBit!2343 (_2!1506 lt!36043))) (bvsub (bvadd (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36048 () Unit!2071)

(declare-fun Unit!2078 () Unit!2071)

(assert (=> b!25323 (= lt!36048 Unit!2078)))

(assert (=> b!25323 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!36043))) (currentByte!2348 (_2!1506 lt!36043)) (currentBit!2343 (_2!1506 lt!36043))) (bvsub (bvsub (bvadd (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!36055))) (currentByte!2348 (_2!1506 lt!36055)) (currentBit!2343 (_2!1506 lt!36055))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36054 () Unit!2071)

(declare-fun Unit!2079 () Unit!2071)

(assert (=> b!25323 (= lt!36054 Unit!2079)))

(declare-fun lt!36027 () tuple2!2840)

(assert (=> b!25323 (= lt!36027 (reader!0 (_2!1506 lt!35533) (_2!1506 lt!36043)))))

(declare-fun lt!36049 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36049 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36031 () Unit!2071)

(assert (=> b!25323 (= lt!36031 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!36043)) lt!36049))))

(assert (=> b!25323 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!36043)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!36049)))

(declare-fun lt!36052 () Unit!2071)

(assert (=> b!25323 (= lt!36052 lt!36031)))

(declare-fun lt!36061 () tuple2!2840)

(declare-fun call!340 () tuple2!2840)

(assert (=> b!25323 (= lt!36061 call!340)))

(declare-fun lt!36057 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36057 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36067 () Unit!2071)

(assert (=> b!25323 (= lt!36067 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!36055) (buf!1035 (_2!1506 lt!36043)) lt!36057))))

(assert (=> b!25323 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!36043)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!36055))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!36055))) lt!36057)))

(declare-fun lt!36032 () Unit!2071)

(assert (=> b!25323 (= lt!36032 lt!36067)))

(declare-fun lt!36044 () List!331)

(assert (=> b!25323 (= lt!36044 (byteArrayBitContentToList!0 (_2!1506 lt!36043) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36038 () List!331)

(assert (=> b!25323 (= lt!36038 (byteArrayBitContentToList!0 (_2!1506 lt!36043) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36033 () List!331)

(assert (=> b!25323 (= lt!36033 (bitStreamReadBitsIntoList!0 (_2!1506 lt!36043) (_1!1507 lt!36027) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36053 () List!331)

(assert (=> b!25323 (= lt!36053 (bitStreamReadBitsIntoList!0 (_2!1506 lt!36043) (_1!1507 lt!36061) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36066 () (_ BitVec 64))

(assert (=> b!25323 (= lt!36066 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36060 () Unit!2071)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1260 BitStream!1260 BitStream!1260 BitStream!1260 (_ BitVec 64) List!331) Unit!2071)

(assert (=> b!25323 (= lt!36060 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1506 lt!36043) (_2!1506 lt!36043) (_1!1507 lt!36027) (_1!1507 lt!36061) lt!36066 lt!36033))))

(declare-fun tail!86 (List!331) List!331)

(assert (=> b!25323 (= (bitStreamReadBitsIntoList!0 (_2!1506 lt!36043) (_1!1507 lt!36061) (bvsub lt!36066 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!86 lt!36033))))

(declare-fun lt!36046 () Unit!2071)

(assert (=> b!25323 (= lt!36046 lt!36060)))

(declare-fun lt!36047 () Unit!2071)

(declare-fun lt!36059 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1657 array!1657 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2071)

(assert (=> b!25323 (= lt!36047 (arrayBitRangesEqImpliesEq!0 (buf!1035 (_2!1506 lt!36055)) (buf!1035 (_2!1506 lt!36043)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!36059 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!36055))) (currentByte!2348 (_2!1506 lt!36055)) (currentBit!2343 (_2!1506 lt!36055)))))))

(declare-fun bitAt!0 (array!1657 (_ BitVec 64)) Bool)

(assert (=> b!25323 (= (bitAt!0 (buf!1035 (_2!1506 lt!36055)) lt!36059) (bitAt!0 (buf!1035 (_2!1506 lt!36043)) lt!36059))))

(declare-fun lt!36029 () Unit!2071)

(assert (=> b!25323 (= lt!36029 lt!36047)))

(declare-fun b!25324 () Bool)

(declare-fun Unit!2080 () Unit!2071)

(assert (=> b!25324 (= e!17290 (tuple2!2839 Unit!2080 (_2!1506 lt!35533)))))

(assert (=> b!25324 (= (size!714 (buf!1035 (_2!1506 lt!35533))) (size!714 (buf!1035 (_2!1506 lt!35533))))))

(declare-fun lt!36063 () Unit!2071)

(declare-fun Unit!2081 () Unit!2071)

(assert (=> b!25324 (= lt!36063 Unit!2081)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1260 array!1657 array!1657 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25324 (checkByteArrayBitContent!0 (_2!1506 lt!35533) srcBuffer!2 (_1!1513 (readBits!0 (_1!1507 call!340) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun c!1697 () Bool)

(declare-fun bm!337 () Bool)

(assert (=> bm!337 (= call!340 (reader!0 (ite c!1697 (_2!1506 lt!36055) (_2!1506 lt!35533)) (ite c!1697 (_2!1506 lt!36043) (_2!1506 lt!35533))))))

(declare-fun b!25326 () Bool)

(declare-fun e!17288 () Bool)

(declare-fun lt!36056 () (_ BitVec 64))

(assert (=> b!25326 (= e!17288 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!36056))))

(declare-fun b!25327 () Bool)

(declare-fun res!21871 () Bool)

(assert (=> b!25327 (=> (not res!21871) (not e!17289))))

(assert (=> b!25327 (= res!21871 (invariant!0 (currentBit!2343 (_2!1506 lt!36041)) (currentByte!2348 (_2!1506 lt!36041)) (size!714 (buf!1035 (_2!1506 lt!36041)))))))

(declare-fun b!25325 () Bool)

(declare-fun res!21869 () Bool)

(assert (=> b!25325 (=> (not res!21869) (not e!17289))))

(assert (=> b!25325 (= res!21869 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!36041)))))

(declare-fun d!7476 () Bool)

(assert (=> d!7476 e!17289))

(declare-fun res!21870 () Bool)

(assert (=> d!7476 (=> (not res!21870) (not e!17289))))

(declare-fun lt!36024 () (_ BitVec 64))

(assert (=> d!7476 (= res!21870 (= (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!36041))) (currentByte!2348 (_2!1506 lt!36041)) (currentBit!2343 (_2!1506 lt!36041))) (bvsub lt!36024 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7476 (or (= (bvand lt!36024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36024 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36050 () (_ BitVec 64))

(assert (=> d!7476 (= lt!36024 (bvadd lt!36050 to!314))))

(assert (=> d!7476 (or (not (= (bvand lt!36050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!36050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!36050 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7476 (= lt!36050 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(assert (=> d!7476 (= lt!36041 e!17290)))

(assert (=> d!7476 (= c!1697 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!36045 () Unit!2071)

(declare-fun lt!36058 () Unit!2071)

(assert (=> d!7476 (= lt!36045 lt!36058)))

(assert (=> d!7476 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35533))))

(assert (=> d!7476 (= lt!36058 (lemmaIsPrefixRefl!0 (_2!1506 lt!35533)))))

(assert (=> d!7476 (= lt!36059 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(assert (=> d!7476 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7476 (= (appendBitsMSBFirstLoop!0 (_2!1506 lt!35533) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!36041)))

(declare-fun b!25328 () Bool)

(declare-fun res!21867 () Bool)

(assert (=> b!25328 (=> (not res!21867) (not e!17289))))

(assert (=> b!25328 (= res!21867 (= (size!714 (buf!1035 (_2!1506 lt!35533))) (size!714 (buf!1035 (_2!1506 lt!36041)))))))

(declare-fun b!25329 () Bool)

(declare-fun lt!36040 () tuple2!2840)

(assert (=> b!25329 (= e!17289 (= (bitStreamReadBitsIntoList!0 (_2!1506 lt!36041) (_1!1507 lt!36040) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1506 lt!36041) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!25329 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25329 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36039 () Unit!2071)

(declare-fun lt!36036 () Unit!2071)

(assert (=> b!25329 (= lt!36039 lt!36036)))

(assert (=> b!25329 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!36041)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!36056)))

(assert (=> b!25329 (= lt!36036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!36041)) lt!36056))))

(assert (=> b!25329 e!17288))

(declare-fun res!21872 () Bool)

(assert (=> b!25329 (=> (not res!21872) (not e!17288))))

(assert (=> b!25329 (= res!21872 (and (= (size!714 (buf!1035 (_2!1506 lt!35533))) (size!714 (buf!1035 (_2!1506 lt!36041)))) (bvsge lt!36056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25329 (= lt!36056 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!25329 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25329 (= lt!36040 (reader!0 (_2!1506 lt!35533) (_2!1506 lt!36041)))))

(assert (= (and d!7476 c!1697) b!25323))

(assert (= (and d!7476 (not c!1697)) b!25324))

(assert (= (or b!25323 b!25324) bm!337))

(assert (= (and d!7476 res!21870) b!25327))

(assert (= (and b!25327 res!21871) b!25328))

(assert (= (and b!25328 res!21867) b!25325))

(assert (= (and b!25325 res!21869) b!25322))

(assert (= (and b!25322 res!21868) b!25329))

(assert (= (and b!25329 res!21872) b!25326))

(declare-fun m!35889 () Bool)

(assert (=> b!25325 m!35889))

(declare-fun m!35891 () Bool)

(assert (=> b!25327 m!35891))

(declare-fun m!35893 () Bool)

(assert (=> b!25326 m!35893))

(assert (=> b!25323 m!35559))

(declare-fun m!35895 () Bool)

(assert (=> b!25323 m!35895))

(declare-fun m!35897 () Bool)

(assert (=> b!25323 m!35897))

(declare-fun m!35899 () Bool)

(assert (=> b!25323 m!35899))

(declare-fun m!35901 () Bool)

(assert (=> b!25323 m!35901))

(declare-fun m!35903 () Bool)

(assert (=> b!25323 m!35903))

(declare-fun m!35905 () Bool)

(assert (=> b!25323 m!35905))

(declare-fun m!35907 () Bool)

(assert (=> b!25323 m!35907))

(declare-fun m!35909 () Bool)

(assert (=> b!25323 m!35909))

(declare-fun m!35911 () Bool)

(assert (=> b!25323 m!35911))

(declare-fun m!35913 () Bool)

(assert (=> b!25323 m!35913))

(declare-fun m!35915 () Bool)

(assert (=> b!25323 m!35915))

(declare-fun m!35917 () Bool)

(assert (=> b!25323 m!35917))

(declare-fun m!35919 () Bool)

(assert (=> b!25323 m!35919))

(declare-fun m!35921 () Bool)

(assert (=> b!25323 m!35921))

(declare-fun m!35923 () Bool)

(assert (=> b!25323 m!35923))

(declare-fun m!35925 () Bool)

(assert (=> b!25323 m!35925))

(assert (=> b!25323 m!35901))

(declare-fun m!35927 () Bool)

(assert (=> b!25323 m!35927))

(declare-fun m!35929 () Bool)

(assert (=> b!25323 m!35929))

(declare-fun m!35931 () Bool)

(assert (=> b!25323 m!35931))

(declare-fun m!35933 () Bool)

(assert (=> b!25323 m!35933))

(declare-fun m!35935 () Bool)

(assert (=> b!25323 m!35935))

(declare-fun m!35937 () Bool)

(assert (=> b!25323 m!35937))

(declare-fun m!35939 () Bool)

(assert (=> b!25323 m!35939))

(declare-fun m!35941 () Bool)

(assert (=> b!25323 m!35941))

(declare-fun m!35943 () Bool)

(assert (=> b!25323 m!35943))

(declare-fun m!35945 () Bool)

(assert (=> b!25323 m!35945))

(declare-fun m!35947 () Bool)

(assert (=> b!25323 m!35947))

(assert (=> b!25323 m!35931))

(declare-fun m!35949 () Bool)

(assert (=> b!25323 m!35949))

(assert (=> b!25323 m!35919))

(declare-fun m!35951 () Bool)

(assert (=> b!25323 m!35951))

(declare-fun m!35953 () Bool)

(assert (=> b!25323 m!35953))

(declare-fun m!35955 () Bool)

(assert (=> b!25323 m!35955))

(assert (=> b!25323 m!35913))

(declare-fun m!35957 () Bool)

(assert (=> d!7476 m!35957))

(assert (=> d!7476 m!35559))

(declare-fun m!35959 () Bool)

(assert (=> d!7476 m!35959))

(declare-fun m!35961 () Bool)

(assert (=> d!7476 m!35961))

(declare-fun m!35963 () Bool)

(assert (=> b!25329 m!35963))

(declare-fun m!35965 () Bool)

(assert (=> b!25329 m!35965))

(declare-fun m!35967 () Bool)

(assert (=> b!25329 m!35967))

(declare-fun m!35969 () Bool)

(assert (=> b!25329 m!35969))

(declare-fun m!35971 () Bool)

(assert (=> b!25329 m!35971))

(declare-fun m!35973 () Bool)

(assert (=> bm!337 m!35973))

(declare-fun m!35975 () Bool)

(assert (=> b!25324 m!35975))

(declare-fun m!35977 () Bool)

(assert (=> b!25324 m!35977))

(assert (=> b!25062 d!7476))

(declare-fun d!7564 () Bool)

(assert (=> d!7564 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35537))))

(declare-fun lt!36070 () Unit!2071)

(declare-fun choose!30 (BitStream!1260 BitStream!1260 BitStream!1260) Unit!2071)

(assert (=> d!7564 (= lt!36070 (choose!30 thiss!1379 (_2!1506 lt!35533) (_2!1506 lt!35537)))))

(assert (=> d!7564 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35533))))

(assert (=> d!7564 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1506 lt!35533) (_2!1506 lt!35537)) lt!36070)))

(declare-fun bs!2186 () Bool)

(assert (= bs!2186 d!7564))

(assert (=> bs!2186 m!35543))

(declare-fun m!35979 () Bool)

(assert (=> bs!2186 m!35979))

(assert (=> bs!2186 m!35509))

(assert (=> b!25062 d!7564))

(declare-fun d!7566 () Bool)

(assert (=> d!7566 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35533)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36073 () Unit!2071)

(declare-fun choose!9 (BitStream!1260 array!1657 (_ BitVec 64) BitStream!1260) Unit!2071)

(assert (=> d!7566 (= lt!36073 (choose!9 thiss!1379 (buf!1035 (_2!1506 lt!35533)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1261 (buf!1035 (_2!1506 lt!35533)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(assert (=> d!7566 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1035 (_2!1506 lt!35533)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!36073)))

(declare-fun bs!2187 () Bool)

(assert (= bs!2187 d!7566))

(assert (=> bs!2187 m!35545))

(declare-fun m!35981 () Bool)

(assert (=> bs!2187 m!35981))

(assert (=> b!25062 d!7566))

(declare-fun b!25340 () Bool)

(declare-fun res!21881 () Bool)

(declare-fun e!17296 () Bool)

(assert (=> b!25340 (=> (not res!21881) (not e!17296))))

(declare-fun lt!36118 () tuple2!2840)

(assert (=> b!25340 (= res!21881 (isPrefixOf!0 (_1!1507 lt!36118) thiss!1379))))

(declare-fun b!25341 () Bool)

(declare-fun e!17295 () Unit!2071)

(declare-fun Unit!2082 () Unit!2071)

(assert (=> b!25341 (= e!17295 Unit!2082)))

(declare-fun b!25342 () Bool)

(declare-fun lt!36116 () Unit!2071)

(assert (=> b!25342 (= e!17295 lt!36116)))

(declare-fun lt!36129 () (_ BitVec 64))

(assert (=> b!25342 (= lt!36129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36133 () (_ BitVec 64))

(assert (=> b!25342 (= lt!36133 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1657 array!1657 (_ BitVec 64) (_ BitVec 64)) Unit!2071)

(assert (=> b!25342 (= lt!36116 (arrayBitRangesEqSymmetric!0 (buf!1035 thiss!1379) (buf!1035 (_2!1506 lt!35533)) lt!36129 lt!36133))))

(assert (=> b!25342 (arrayBitRangesEq!0 (buf!1035 (_2!1506 lt!35533)) (buf!1035 thiss!1379) lt!36129 lt!36133)))

(declare-fun b!25343 () Bool)

(declare-fun lt!36130 () (_ BitVec 64))

(declare-fun lt!36126 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1260 (_ BitVec 64)) BitStream!1260)

(assert (=> b!25343 (= e!17296 (= (_1!1507 lt!36118) (withMovedBitIndex!0 (_2!1507 lt!36118) (bvsub lt!36130 lt!36126))))))

(assert (=> b!25343 (or (= (bvand lt!36130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36130 lt!36126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25343 (= lt!36126 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(assert (=> b!25343 (= lt!36130 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(declare-fun b!25344 () Bool)

(declare-fun res!21879 () Bool)

(assert (=> b!25344 (=> (not res!21879) (not e!17296))))

(assert (=> b!25344 (= res!21879 (isPrefixOf!0 (_2!1507 lt!36118) (_2!1506 lt!35533)))))

(declare-fun d!7568 () Bool)

(assert (=> d!7568 e!17296))

(declare-fun res!21880 () Bool)

(assert (=> d!7568 (=> (not res!21880) (not e!17296))))

(assert (=> d!7568 (= res!21880 (isPrefixOf!0 (_1!1507 lt!36118) (_2!1507 lt!36118)))))

(declare-fun lt!36128 () BitStream!1260)

(assert (=> d!7568 (= lt!36118 (tuple2!2841 lt!36128 (_2!1506 lt!35533)))))

(declare-fun lt!36119 () Unit!2071)

(declare-fun lt!36117 () Unit!2071)

(assert (=> d!7568 (= lt!36119 lt!36117)))

(assert (=> d!7568 (isPrefixOf!0 lt!36128 (_2!1506 lt!35533))))

(assert (=> d!7568 (= lt!36117 (lemmaIsPrefixTransitive!0 lt!36128 (_2!1506 lt!35533) (_2!1506 lt!35533)))))

(declare-fun lt!36121 () Unit!2071)

(declare-fun lt!36114 () Unit!2071)

(assert (=> d!7568 (= lt!36121 lt!36114)))

(assert (=> d!7568 (isPrefixOf!0 lt!36128 (_2!1506 lt!35533))))

(assert (=> d!7568 (= lt!36114 (lemmaIsPrefixTransitive!0 lt!36128 thiss!1379 (_2!1506 lt!35533)))))

(declare-fun lt!36122 () Unit!2071)

(assert (=> d!7568 (= lt!36122 e!17295)))

(declare-fun c!1700 () Bool)

(assert (=> d!7568 (= c!1700 (not (= (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!36132 () Unit!2071)

(declare-fun lt!36131 () Unit!2071)

(assert (=> d!7568 (= lt!36132 lt!36131)))

(assert (=> d!7568 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35533))))

(assert (=> d!7568 (= lt!36131 (lemmaIsPrefixRefl!0 (_2!1506 lt!35533)))))

(declare-fun lt!36120 () Unit!2071)

(declare-fun lt!36123 () Unit!2071)

(assert (=> d!7568 (= lt!36120 lt!36123)))

(assert (=> d!7568 (= lt!36123 (lemmaIsPrefixRefl!0 (_2!1506 lt!35533)))))

(declare-fun lt!36124 () Unit!2071)

(declare-fun lt!36127 () Unit!2071)

(assert (=> d!7568 (= lt!36124 lt!36127)))

(assert (=> d!7568 (isPrefixOf!0 lt!36128 lt!36128)))

(assert (=> d!7568 (= lt!36127 (lemmaIsPrefixRefl!0 lt!36128))))

(declare-fun lt!36115 () Unit!2071)

(declare-fun lt!36125 () Unit!2071)

(assert (=> d!7568 (= lt!36115 lt!36125)))

(assert (=> d!7568 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7568 (= lt!36125 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7568 (= lt!36128 (BitStream!1261 (buf!1035 (_2!1506 lt!35533)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(assert (=> d!7568 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35533))))

(assert (=> d!7568 (= (reader!0 thiss!1379 (_2!1506 lt!35533)) lt!36118)))

(assert (= (and d!7568 c!1700) b!25342))

(assert (= (and d!7568 (not c!1700)) b!25341))

(assert (= (and d!7568 res!21880) b!25340))

(assert (= (and b!25340 res!21881) b!25344))

(assert (= (and b!25344 res!21879) b!25343))

(declare-fun m!35983 () Bool)

(assert (=> b!25343 m!35983))

(assert (=> b!25343 m!35559))

(assert (=> b!25343 m!35517))

(declare-fun m!35985 () Bool)

(assert (=> b!25340 m!35985))

(declare-fun m!35987 () Bool)

(assert (=> b!25344 m!35987))

(assert (=> d!7568 m!35961))

(declare-fun m!35989 () Bool)

(assert (=> d!7568 m!35989))

(declare-fun m!35991 () Bool)

(assert (=> d!7568 m!35991))

(declare-fun m!35993 () Bool)

(assert (=> d!7568 m!35993))

(assert (=> d!7568 m!35513))

(declare-fun m!35995 () Bool)

(assert (=> d!7568 m!35995))

(assert (=> d!7568 m!35515))

(declare-fun m!35997 () Bool)

(assert (=> d!7568 m!35997))

(declare-fun m!35999 () Bool)

(assert (=> d!7568 m!35999))

(assert (=> d!7568 m!35509))

(assert (=> d!7568 m!35959))

(assert (=> b!25342 m!35517))

(declare-fun m!36001 () Bool)

(assert (=> b!25342 m!36001))

(declare-fun m!36003 () Bool)

(assert (=> b!25342 m!36003))

(assert (=> b!25062 d!7568))

(declare-fun d!7570 () Bool)

(declare-fun res!21882 () Bool)

(declare-fun e!17297 () Bool)

(assert (=> d!7570 (=> (not res!21882) (not e!17297))))

(assert (=> d!7570 (= res!21882 (= (size!714 (buf!1035 (_2!1506 lt!35533))) (size!714 (buf!1035 (_2!1506 lt!35537)))))))

(assert (=> d!7570 (= (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35537)) e!17297)))

(declare-fun b!25345 () Bool)

(declare-fun res!21883 () Bool)

(assert (=> b!25345 (=> (not res!21883) (not e!17297))))

(assert (=> b!25345 (= res!21883 (bvsle (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))) (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537)))))))

(declare-fun b!25346 () Bool)

(declare-fun e!17298 () Bool)

(assert (=> b!25346 (= e!17297 e!17298)))

(declare-fun res!21884 () Bool)

(assert (=> b!25346 (=> res!21884 e!17298)))

(assert (=> b!25346 (= res!21884 (= (size!714 (buf!1035 (_2!1506 lt!35533))) #b00000000000000000000000000000000))))

(declare-fun b!25347 () Bool)

(assert (=> b!25347 (= e!17298 (arrayBitRangesEq!0 (buf!1035 (_2!1506 lt!35533)) (buf!1035 (_2!1506 lt!35537)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533)))))))

(assert (= (and d!7570 res!21882) b!25345))

(assert (= (and b!25345 res!21883) b!25346))

(assert (= (and b!25346 (not res!21884)) b!25347))

(assert (=> b!25345 m!35559))

(assert (=> b!25345 m!35561))

(assert (=> b!25347 m!35559))

(assert (=> b!25347 m!35559))

(declare-fun m!36005 () Bool)

(assert (=> b!25347 m!36005))

(assert (=> b!25062 d!7570))

(declare-fun d!7572 () Bool)

(declare-fun res!21885 () Bool)

(declare-fun e!17299 () Bool)

(assert (=> d!7572 (=> (not res!21885) (not e!17299))))

(assert (=> d!7572 (= res!21885 (= (size!714 (buf!1035 thiss!1379)) (size!714 (buf!1035 (_2!1506 lt!35537)))))))

(assert (=> d!7572 (= (isPrefixOf!0 thiss!1379 (_2!1506 lt!35537)) e!17299)))

(declare-fun b!25350 () Bool)

(declare-fun res!21886 () Bool)

(assert (=> b!25350 (=> (not res!21886) (not e!17299))))

(assert (=> b!25350 (= res!21886 (bvsle (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)) (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537)))))))

(declare-fun b!25351 () Bool)

(declare-fun e!17300 () Bool)

(assert (=> b!25351 (= e!17299 e!17300)))

(declare-fun res!21887 () Bool)

(assert (=> b!25351 (=> res!21887 e!17300)))

(assert (=> b!25351 (= res!21887 (= (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25352 () Bool)

(assert (=> b!25352 (= e!17300 (arrayBitRangesEq!0 (buf!1035 thiss!1379) (buf!1035 (_2!1506 lt!35537)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(assert (= (and d!7572 res!21885) b!25350))

(assert (= (and b!25350 res!21886) b!25351))

(assert (= (and b!25351 (not res!21887)) b!25352))

(assert (=> b!25350 m!35517))

(assert (=> b!25350 m!35561))

(assert (=> b!25352 m!35517))

(assert (=> b!25352 m!35517))

(declare-fun m!36007 () Bool)

(assert (=> b!25352 m!36007))

(assert (=> b!25062 d!7572))

(declare-fun d!7574 () Bool)

(assert (=> d!7574 (= (invariant!0 (currentBit!2343 (_2!1506 lt!35537)) (currentByte!2348 (_2!1506 lt!35537)) (size!714 (buf!1035 (_2!1506 lt!35537)))) (and (bvsge (currentBit!2343 (_2!1506 lt!35537)) #b00000000000000000000000000000000) (bvslt (currentBit!2343 (_2!1506 lt!35537)) #b00000000000000000000000000001000) (bvsge (currentByte!2348 (_2!1506 lt!35537)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2348 (_2!1506 lt!35537)) (size!714 (buf!1035 (_2!1506 lt!35537)))) (and (= (currentBit!2343 (_2!1506 lt!35537)) #b00000000000000000000000000000000) (= (currentByte!2348 (_2!1506 lt!35537)) (size!714 (buf!1035 (_2!1506 lt!35537))))))))))

(assert (=> b!25063 d!7574))

(declare-fun d!7576 () Bool)

(assert (=> d!7576 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_1!1507 lt!35531)))) ((_ sign_extend 32) (currentByte!2348 (_1!1507 lt!35531))) ((_ sign_extend 32) (currentBit!2343 (_1!1507 lt!35531))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_1!1507 lt!35531)))) ((_ sign_extend 32) (currentByte!2348 (_1!1507 lt!35531))) ((_ sign_extend 32) (currentBit!2343 (_1!1507 lt!35531)))) (bvsub to!314 i!635)))))

(declare-fun bs!2188 () Bool)

(assert (= bs!2188 d!7576))

(declare-fun m!36009 () Bool)

(assert (=> bs!2188 m!36009))

(assert (=> b!25053 d!7576))

(declare-fun d!7578 () Bool)

(assert (=> d!7578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2189 () Bool)

(assert (= bs!2189 d!7578))

(declare-fun m!36011 () Bool)

(assert (=> bs!2189 m!36011))

(assert (=> b!25053 d!7578))

(declare-fun d!7580 () Bool)

(assert (=> d!7580 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!35530) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533)))) lt!35530))))

(declare-fun bs!2190 () Bool)

(assert (= bs!2190 d!7580))

(declare-fun m!36013 () Bool)

(assert (=> bs!2190 m!36013))

(assert (=> b!25053 d!7580))

(declare-fun b!25355 () Bool)

(declare-fun res!21890 () Bool)

(declare-fun e!17304 () Bool)

(assert (=> b!25355 (=> (not res!21890) (not e!17304))))

(declare-fun lt!36164 () tuple2!2840)

(assert (=> b!25355 (= res!21890 (isPrefixOf!0 (_1!1507 lt!36164) thiss!1379))))

(declare-fun b!25356 () Bool)

(declare-fun e!17303 () Unit!2071)

(declare-fun Unit!2083 () Unit!2071)

(assert (=> b!25356 (= e!17303 Unit!2083)))

(declare-fun b!25357 () Bool)

(declare-fun lt!36162 () Unit!2071)

(assert (=> b!25357 (= e!17303 lt!36162)))

(declare-fun lt!36175 () (_ BitVec 64))

(assert (=> b!25357 (= lt!36175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36179 () (_ BitVec 64))

(assert (=> b!25357 (= lt!36179 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(assert (=> b!25357 (= lt!36162 (arrayBitRangesEqSymmetric!0 (buf!1035 thiss!1379) (buf!1035 (_2!1506 lt!35537)) lt!36175 lt!36179))))

(assert (=> b!25357 (arrayBitRangesEq!0 (buf!1035 (_2!1506 lt!35537)) (buf!1035 thiss!1379) lt!36175 lt!36179)))

(declare-fun lt!36176 () (_ BitVec 64))

(declare-fun b!25358 () Bool)

(declare-fun lt!36172 () (_ BitVec 64))

(assert (=> b!25358 (= e!17304 (= (_1!1507 lt!36164) (withMovedBitIndex!0 (_2!1507 lt!36164) (bvsub lt!36176 lt!36172))))))

(assert (=> b!25358 (or (= (bvand lt!36176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36172 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36176 lt!36172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25358 (= lt!36172 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537))))))

(assert (=> b!25358 (= lt!36176 (bitIndex!0 (size!714 (buf!1035 thiss!1379)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(declare-fun b!25359 () Bool)

(declare-fun res!21888 () Bool)

(assert (=> b!25359 (=> (not res!21888) (not e!17304))))

(assert (=> b!25359 (= res!21888 (isPrefixOf!0 (_2!1507 lt!36164) (_2!1506 lt!35537)))))

(declare-fun d!7582 () Bool)

(assert (=> d!7582 e!17304))

(declare-fun res!21889 () Bool)

(assert (=> d!7582 (=> (not res!21889) (not e!17304))))

(assert (=> d!7582 (= res!21889 (isPrefixOf!0 (_1!1507 lt!36164) (_2!1507 lt!36164)))))

(declare-fun lt!36174 () BitStream!1260)

(assert (=> d!7582 (= lt!36164 (tuple2!2841 lt!36174 (_2!1506 lt!35537)))))

(declare-fun lt!36165 () Unit!2071)

(declare-fun lt!36163 () Unit!2071)

(assert (=> d!7582 (= lt!36165 lt!36163)))

(assert (=> d!7582 (isPrefixOf!0 lt!36174 (_2!1506 lt!35537))))

(assert (=> d!7582 (= lt!36163 (lemmaIsPrefixTransitive!0 lt!36174 (_2!1506 lt!35537) (_2!1506 lt!35537)))))

(declare-fun lt!36167 () Unit!2071)

(declare-fun lt!36160 () Unit!2071)

(assert (=> d!7582 (= lt!36167 lt!36160)))

(assert (=> d!7582 (isPrefixOf!0 lt!36174 (_2!1506 lt!35537))))

(assert (=> d!7582 (= lt!36160 (lemmaIsPrefixTransitive!0 lt!36174 thiss!1379 (_2!1506 lt!35537)))))

(declare-fun lt!36168 () Unit!2071)

(assert (=> d!7582 (= lt!36168 e!17303)))

(declare-fun c!1703 () Bool)

(assert (=> d!7582 (= c!1703 (not (= (size!714 (buf!1035 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!36178 () Unit!2071)

(declare-fun lt!36177 () Unit!2071)

(assert (=> d!7582 (= lt!36178 lt!36177)))

(assert (=> d!7582 (isPrefixOf!0 (_2!1506 lt!35537) (_2!1506 lt!35537))))

(assert (=> d!7582 (= lt!36177 (lemmaIsPrefixRefl!0 (_2!1506 lt!35537)))))

(declare-fun lt!36166 () Unit!2071)

(declare-fun lt!36169 () Unit!2071)

(assert (=> d!7582 (= lt!36166 lt!36169)))

(assert (=> d!7582 (= lt!36169 (lemmaIsPrefixRefl!0 (_2!1506 lt!35537)))))

(declare-fun lt!36170 () Unit!2071)

(declare-fun lt!36173 () Unit!2071)

(assert (=> d!7582 (= lt!36170 lt!36173)))

(assert (=> d!7582 (isPrefixOf!0 lt!36174 lt!36174)))

(assert (=> d!7582 (= lt!36173 (lemmaIsPrefixRefl!0 lt!36174))))

(declare-fun lt!36161 () Unit!2071)

(declare-fun lt!36171 () Unit!2071)

(assert (=> d!7582 (= lt!36161 lt!36171)))

(assert (=> d!7582 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7582 (= lt!36171 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7582 (= lt!36174 (BitStream!1261 (buf!1035 (_2!1506 lt!35537)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379)))))

(assert (=> d!7582 (isPrefixOf!0 thiss!1379 (_2!1506 lt!35537))))

(assert (=> d!7582 (= (reader!0 thiss!1379 (_2!1506 lt!35537)) lt!36164)))

(assert (= (and d!7582 c!1703) b!25357))

(assert (= (and d!7582 (not c!1703)) b!25356))

(assert (= (and d!7582 res!21889) b!25355))

(assert (= (and b!25355 res!21890) b!25359))

(assert (= (and b!25359 res!21888) b!25358))

(declare-fun m!36015 () Bool)

(assert (=> b!25358 m!36015))

(assert (=> b!25358 m!35561))

(assert (=> b!25358 m!35517))

(declare-fun m!36017 () Bool)

(assert (=> b!25355 m!36017))

(declare-fun m!36019 () Bool)

(assert (=> b!25359 m!36019))

(declare-fun m!36021 () Bool)

(assert (=> d!7582 m!36021))

(declare-fun m!36023 () Bool)

(assert (=> d!7582 m!36023))

(declare-fun m!36025 () Bool)

(assert (=> d!7582 m!36025))

(declare-fun m!36027 () Bool)

(assert (=> d!7582 m!36027))

(assert (=> d!7582 m!35513))

(declare-fun m!36029 () Bool)

(assert (=> d!7582 m!36029))

(assert (=> d!7582 m!35515))

(declare-fun m!36031 () Bool)

(assert (=> d!7582 m!36031))

(declare-fun m!36033 () Bool)

(assert (=> d!7582 m!36033))

(assert (=> d!7582 m!35543))

(declare-fun m!36035 () Bool)

(assert (=> d!7582 m!36035))

(assert (=> b!25357 m!35517))

(declare-fun m!36037 () Bool)

(assert (=> b!25357 m!36037))

(declare-fun m!36039 () Bool)

(assert (=> b!25357 m!36039))

(assert (=> b!25053 d!7582))

(declare-fun d!7584 () Bool)

(assert (=> d!7584 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 (_2!1506 lt!35533))) ((_ sign_extend 32) (currentBit!2343 (_2!1506 lt!35533))) lt!35530)))

(declare-fun lt!36192 () Unit!2071)

(assert (=> d!7584 (= lt!36192 (choose!9 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!35537)) lt!35530 (BitStream!1261 (buf!1035 (_2!1506 lt!35537)) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533)))))))

(assert (=> d!7584 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1506 lt!35533) (buf!1035 (_2!1506 lt!35537)) lt!35530) lt!36192)))

(declare-fun bs!2191 () Bool)

(assert (= bs!2191 d!7584))

(assert (=> bs!2191 m!35531))

(declare-fun m!36041 () Bool)

(assert (=> bs!2191 m!36041))

(assert (=> b!25053 d!7584))

(declare-fun b!25360 () Bool)

(declare-fun res!21893 () Bool)

(declare-fun e!17306 () Bool)

(assert (=> b!25360 (=> (not res!21893) (not e!17306))))

(declare-fun lt!36205 () tuple2!2840)

(assert (=> b!25360 (= res!21893 (isPrefixOf!0 (_1!1507 lt!36205) (_2!1506 lt!35533)))))

(declare-fun b!25361 () Bool)

(declare-fun e!17305 () Unit!2071)

(declare-fun Unit!2085 () Unit!2071)

(assert (=> b!25361 (= e!17305 Unit!2085)))

(declare-fun b!25362 () Bool)

(declare-fun lt!36203 () Unit!2071)

(assert (=> b!25362 (= e!17305 lt!36203)))

(declare-fun lt!36216 () (_ BitVec 64))

(assert (=> b!25362 (= lt!36216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36220 () (_ BitVec 64))

(assert (=> b!25362 (= lt!36220 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(assert (=> b!25362 (= lt!36203 (arrayBitRangesEqSymmetric!0 (buf!1035 (_2!1506 lt!35533)) (buf!1035 (_2!1506 lt!35537)) lt!36216 lt!36220))))

(assert (=> b!25362 (arrayBitRangesEq!0 (buf!1035 (_2!1506 lt!35537)) (buf!1035 (_2!1506 lt!35533)) lt!36216 lt!36220)))

(declare-fun lt!36213 () (_ BitVec 64))

(declare-fun lt!36217 () (_ BitVec 64))

(declare-fun b!25363 () Bool)

(assert (=> b!25363 (= e!17306 (= (_1!1507 lt!36205) (withMovedBitIndex!0 (_2!1507 lt!36205) (bvsub lt!36217 lt!36213))))))

(assert (=> b!25363 (or (= (bvand lt!36217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36217 lt!36213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25363 (= lt!36213 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35537))) (currentByte!2348 (_2!1506 lt!35537)) (currentBit!2343 (_2!1506 lt!35537))))))

(assert (=> b!25363 (= lt!36217 (bitIndex!0 (size!714 (buf!1035 (_2!1506 lt!35533))) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(declare-fun b!25364 () Bool)

(declare-fun res!21891 () Bool)

(assert (=> b!25364 (=> (not res!21891) (not e!17306))))

(assert (=> b!25364 (= res!21891 (isPrefixOf!0 (_2!1507 lt!36205) (_2!1506 lt!35537)))))

(declare-fun d!7586 () Bool)

(assert (=> d!7586 e!17306))

(declare-fun res!21892 () Bool)

(assert (=> d!7586 (=> (not res!21892) (not e!17306))))

(assert (=> d!7586 (= res!21892 (isPrefixOf!0 (_1!1507 lt!36205) (_2!1507 lt!36205)))))

(declare-fun lt!36215 () BitStream!1260)

(assert (=> d!7586 (= lt!36205 (tuple2!2841 lt!36215 (_2!1506 lt!35537)))))

(declare-fun lt!36206 () Unit!2071)

(declare-fun lt!36204 () Unit!2071)

(assert (=> d!7586 (= lt!36206 lt!36204)))

(assert (=> d!7586 (isPrefixOf!0 lt!36215 (_2!1506 lt!35537))))

(assert (=> d!7586 (= lt!36204 (lemmaIsPrefixTransitive!0 lt!36215 (_2!1506 lt!35537) (_2!1506 lt!35537)))))

(declare-fun lt!36208 () Unit!2071)

(declare-fun lt!36199 () Unit!2071)

(assert (=> d!7586 (= lt!36208 lt!36199)))

(assert (=> d!7586 (isPrefixOf!0 lt!36215 (_2!1506 lt!35537))))

(assert (=> d!7586 (= lt!36199 (lemmaIsPrefixTransitive!0 lt!36215 (_2!1506 lt!35533) (_2!1506 lt!35537)))))

(declare-fun lt!36209 () Unit!2071)

(assert (=> d!7586 (= lt!36209 e!17305)))

(declare-fun c!1704 () Bool)

(assert (=> d!7586 (= c!1704 (not (= (size!714 (buf!1035 (_2!1506 lt!35533))) #b00000000000000000000000000000000)))))

(declare-fun lt!36219 () Unit!2071)

(declare-fun lt!36218 () Unit!2071)

(assert (=> d!7586 (= lt!36219 lt!36218)))

(assert (=> d!7586 (isPrefixOf!0 (_2!1506 lt!35537) (_2!1506 lt!35537))))

(assert (=> d!7586 (= lt!36218 (lemmaIsPrefixRefl!0 (_2!1506 lt!35537)))))

(declare-fun lt!36207 () Unit!2071)

(declare-fun lt!36210 () Unit!2071)

(assert (=> d!7586 (= lt!36207 lt!36210)))

(assert (=> d!7586 (= lt!36210 (lemmaIsPrefixRefl!0 (_2!1506 lt!35537)))))

(declare-fun lt!36211 () Unit!2071)

(declare-fun lt!36214 () Unit!2071)

(assert (=> d!7586 (= lt!36211 lt!36214)))

(assert (=> d!7586 (isPrefixOf!0 lt!36215 lt!36215)))

(assert (=> d!7586 (= lt!36214 (lemmaIsPrefixRefl!0 lt!36215))))

(declare-fun lt!36202 () Unit!2071)

(declare-fun lt!36212 () Unit!2071)

(assert (=> d!7586 (= lt!36202 lt!36212)))

(assert (=> d!7586 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35533))))

(assert (=> d!7586 (= lt!36212 (lemmaIsPrefixRefl!0 (_2!1506 lt!35533)))))

(assert (=> d!7586 (= lt!36215 (BitStream!1261 (buf!1035 (_2!1506 lt!35537)) (currentByte!2348 (_2!1506 lt!35533)) (currentBit!2343 (_2!1506 lt!35533))))))

(assert (=> d!7586 (isPrefixOf!0 (_2!1506 lt!35533) (_2!1506 lt!35537))))

(assert (=> d!7586 (= (reader!0 (_2!1506 lt!35533) (_2!1506 lt!35537)) lt!36205)))

(assert (= (and d!7586 c!1704) b!25362))

(assert (= (and d!7586 (not c!1704)) b!25361))

(assert (= (and d!7586 res!21892) b!25360))

(assert (= (and b!25360 res!21893) b!25364))

(assert (= (and b!25364 res!21891) b!25363))

(declare-fun m!36043 () Bool)

(assert (=> b!25363 m!36043))

(assert (=> b!25363 m!35561))

(assert (=> b!25363 m!35559))

(declare-fun m!36045 () Bool)

(assert (=> b!25360 m!36045))

(declare-fun m!36047 () Bool)

(assert (=> b!25364 m!36047))

(assert (=> d!7586 m!36021))

(declare-fun m!36049 () Bool)

(assert (=> d!7586 m!36049))

(declare-fun m!36051 () Bool)

(assert (=> d!7586 m!36051))

(declare-fun m!36053 () Bool)

(assert (=> d!7586 m!36053))

(assert (=> d!7586 m!35959))

(declare-fun m!36055 () Bool)

(assert (=> d!7586 m!36055))

(assert (=> d!7586 m!35961))

(declare-fun m!36057 () Bool)

(assert (=> d!7586 m!36057))

(declare-fun m!36059 () Bool)

(assert (=> d!7586 m!36059))

(assert (=> d!7586 m!35539))

(assert (=> d!7586 m!36035))

(assert (=> b!25362 m!35559))

(declare-fun m!36061 () Bool)

(assert (=> b!25362 m!36061))

(declare-fun m!36063 () Bool)

(assert (=> b!25362 m!36063))

(assert (=> b!25053 d!7586))

(declare-fun d!7588 () Bool)

(assert (=> d!7588 (validate_offset_bits!1 ((_ sign_extend 32) (size!714 (buf!1035 (_2!1506 lt!35537)))) ((_ sign_extend 32) (currentByte!2348 thiss!1379)) ((_ sign_extend 32) (currentBit!2343 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36251 () Unit!2071)

(assert (=> d!7588 (= lt!36251 (choose!9 thiss!1379 (buf!1035 (_2!1506 lt!35537)) (bvsub to!314 i!635) (BitStream!1261 (buf!1035 (_2!1506 lt!35537)) (currentByte!2348 thiss!1379) (currentBit!2343 thiss!1379))))))

(assert (=> d!7588 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1035 (_2!1506 lt!35537)) (bvsub to!314 i!635)) lt!36251)))

(declare-fun bs!2192 () Bool)

(assert (= bs!2192 d!7588))

(assert (=> bs!2192 m!35523))

(declare-fun m!36065 () Bool)

(assert (=> bs!2192 m!36065))

(assert (=> b!25053 d!7588))

(check-sat (not b!25344) (not d!7474) (not b!25167) (not b!25363) (not b!25121) (not b!25327) (not b!25352) (not b!25164) (not b!25329) (not b!25138) (not b!25343) (not b!25171) (not b!25122) (not d!7476) (not b!25163) (not b!25165) (not d!7462) (not bm!337) (not d!7580) (not d!7446) (not b!25342) (not b!25345) (not b!25324) (not b!25357) (not d!7464) (not b!25364) (not b!25123) (not d!7566) (not d!7588) (not d!7584) (not b!25111) (not b!25347) (not b!25362) (not d!7586) (not d!7436) (not d!7564) (not b!25350) (not b!25325) (not d!7568) (not d!7450) (not b!25360) (not d!7466) (not b!25359) (not b!25323) (not b!25168) (not b!25358) (not b!25340) (not b!25143) (not b!25169) (not d!7578) (not b!25140) (not b!25161) (not b!25355) (not b!25326) (not d!7454) (not b!25162) (not b!25166) (not d!7582) (not d!7576) (not d!7470) (not d!7472))
(check-sat)
