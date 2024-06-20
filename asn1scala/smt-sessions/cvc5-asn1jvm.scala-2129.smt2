; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54054 () Bool)

(assert start!54054)

(declare-fun b!251410 () Bool)

(declare-fun e!174196 () Bool)

(declare-fun e!174194 () Bool)

(assert (=> b!251410 (= e!174196 e!174194)))

(declare-fun res!210538 () Bool)

(assert (=> b!251410 (=> (not res!210538) (not e!174194))))

(declare-datatypes ((array!13678 0))(
  ( (array!13679 (arr!6985 (Array (_ BitVec 32) (_ BitVec 8))) (size!5998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10918 0))(
  ( (BitStream!10919 (buf!6500 array!13678) (currentByte!11955 (_ BitVec 32)) (currentBit!11950 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21558 0))(
  ( (tuple2!21559 (_1!11707 BitStream!10918) (_2!11707 Bool)) )
))
(declare-fun lt!390738 () tuple2!21558)

(declare-datatypes ((Unit!18144 0))(
  ( (Unit!18145) )
))
(declare-datatypes ((tuple2!21560 0))(
  ( (tuple2!21561 (_1!11708 Unit!18144) (_2!11708 BitStream!10918)) )
))
(declare-fun lt!390731 () tuple2!21560)

(declare-fun bit!26 () Bool)

(assert (=> b!251410 (= res!210538 (and (= (_2!11707 lt!390738) bit!26) (= (_1!11707 lt!390738) (_2!11708 lt!390731))))))

(declare-fun thiss!1005 () BitStream!10918)

(declare-fun readBitPure!0 (BitStream!10918) tuple2!21558)

(declare-fun readerFrom!0 (BitStream!10918 (_ BitVec 32) (_ BitVec 32)) BitStream!10918)

(assert (=> b!251410 (= lt!390738 (readBitPure!0 (readerFrom!0 (_2!11708 lt!390731) (currentBit!11950 thiss!1005) (currentByte!11955 thiss!1005))))))

(declare-fun b!251411 () Bool)

(declare-fun e!174198 () Bool)

(declare-fun lt!390747 () tuple2!21560)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251411 (= e!174198 (invariant!0 (currentBit!11950 thiss!1005) (currentByte!11955 thiss!1005) (size!5998 (buf!6500 (_2!11708 lt!390747)))))))

(declare-fun b!251412 () Bool)

(declare-fun res!210539 () Bool)

(assert (=> b!251412 (=> (not res!210539) (not e!174198))))

(assert (=> b!251412 (= res!210539 (invariant!0 (currentBit!11950 thiss!1005) (currentByte!11955 thiss!1005) (size!5998 (buf!6500 (_2!11708 lt!390731)))))))

(declare-fun b!251413 () Bool)

(declare-fun res!210542 () Bool)

(declare-fun e!174197 () Bool)

(assert (=> b!251413 (=> (not res!210542) (not e!174197))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!251413 (= res!210542 (bvslt from!289 nBits!297))))

(declare-fun b!251414 () Bool)

(declare-fun res!210547 () Bool)

(assert (=> b!251414 (=> (not res!210547) (not e!174197))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251414 (= res!210547 (validate_offset_bits!1 ((_ sign_extend 32) (size!5998 (buf!6500 thiss!1005))) ((_ sign_extend 32) (currentByte!11955 thiss!1005)) ((_ sign_extend 32) (currentBit!11950 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!210537 () Bool)

(assert (=> start!54054 (=> (not res!210537) (not e!174197))))

(assert (=> start!54054 (= res!210537 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54054 e!174197))

(assert (=> start!54054 true))

(declare-fun e!174193 () Bool)

(declare-fun inv!12 (BitStream!10918) Bool)

(assert (=> start!54054 (and (inv!12 thiss!1005) e!174193)))

(declare-fun b!251415 () Bool)

(declare-fun e!174195 () Bool)

(declare-fun e!174199 () Bool)

(assert (=> b!251415 (= e!174195 e!174199)))

(declare-fun res!210548 () Bool)

(assert (=> b!251415 (=> (not res!210548) (not e!174199))))

(declare-fun lt!390736 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251415 (= res!210548 (= (bitIndex!0 (size!5998 (buf!6500 (_2!11708 lt!390747))) (currentByte!11955 (_2!11708 lt!390747)) (currentBit!11950 (_2!11708 lt!390747))) (bvadd (bitIndex!0 (size!5998 (buf!6500 (_2!11708 lt!390731))) (currentByte!11955 (_2!11708 lt!390731)) (currentBit!11950 (_2!11708 lt!390731))) lt!390736)))))

(assert (=> b!251415 (= lt!390736 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251416 () Bool)

(declare-fun lt!390746 () (_ BitVec 64))

(assert (=> b!251416 (= e!174194 (= (bitIndex!0 (size!5998 (buf!6500 (_1!11707 lt!390738))) (currentByte!11955 (_1!11707 lt!390738)) (currentBit!11950 (_1!11707 lt!390738))) lt!390746))))

(declare-fun b!251417 () Bool)

(assert (=> b!251417 (= e!174197 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!21562 0))(
  ( (tuple2!21563 (_1!11709 BitStream!10918) (_2!11709 BitStream!10918)) )
))
(declare-fun lt!390739 () tuple2!21562)

(assert (=> b!251417 (= (_2!11707 (readBitPure!0 (_1!11709 lt!390739))) bit!26)))

(declare-fun lt!390744 () tuple2!21562)

(declare-fun reader!0 (BitStream!10918 BitStream!10918) tuple2!21562)

(assert (=> b!251417 (= lt!390744 (reader!0 (_2!11708 lt!390731) (_2!11708 lt!390747)))))

(assert (=> b!251417 (= lt!390739 (reader!0 thiss!1005 (_2!11708 lt!390747)))))

(declare-fun e!174191 () Bool)

(assert (=> b!251417 e!174191))

(declare-fun res!210549 () Bool)

(assert (=> b!251417 (=> (not res!210549) (not e!174191))))

(declare-fun lt!390741 () tuple2!21558)

(declare-fun lt!390732 () tuple2!21558)

(assert (=> b!251417 (= res!210549 (= (bitIndex!0 (size!5998 (buf!6500 (_1!11707 lt!390741))) (currentByte!11955 (_1!11707 lt!390741)) (currentBit!11950 (_1!11707 lt!390741))) (bitIndex!0 (size!5998 (buf!6500 (_1!11707 lt!390732))) (currentByte!11955 (_1!11707 lt!390732)) (currentBit!11950 (_1!11707 lt!390732)))))))

(declare-fun lt!390740 () Unit!18144)

(declare-fun lt!390735 () BitStream!10918)

(declare-fun readBitPrefixLemma!0 (BitStream!10918 BitStream!10918) Unit!18144)

(assert (=> b!251417 (= lt!390740 (readBitPrefixLemma!0 lt!390735 (_2!11708 lt!390747)))))

(assert (=> b!251417 (= lt!390732 (readBitPure!0 (BitStream!10919 (buf!6500 (_2!11708 lt!390747)) (currentByte!11955 thiss!1005) (currentBit!11950 thiss!1005))))))

(assert (=> b!251417 (= lt!390741 (readBitPure!0 lt!390735))))

(assert (=> b!251417 (= lt!390735 (BitStream!10919 (buf!6500 (_2!11708 lt!390731)) (currentByte!11955 thiss!1005) (currentBit!11950 thiss!1005)))))

(assert (=> b!251417 e!174198))

(declare-fun res!210546 () Bool)

(assert (=> b!251417 (=> (not res!210546) (not e!174198))))

(declare-fun isPrefixOf!0 (BitStream!10918 BitStream!10918) Bool)

(assert (=> b!251417 (= res!210546 (isPrefixOf!0 thiss!1005 (_2!11708 lt!390747)))))

(declare-fun lt!390737 () Unit!18144)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10918 BitStream!10918 BitStream!10918) Unit!18144)

(assert (=> b!251417 (= lt!390737 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11708 lt!390731) (_2!11708 lt!390747)))))

(assert (=> b!251417 e!174195))

(declare-fun res!210541 () Bool)

(assert (=> b!251417 (=> (not res!210541) (not e!174195))))

(assert (=> b!251417 (= res!210541 (= (size!5998 (buf!6500 (_2!11708 lt!390731))) (size!5998 (buf!6500 (_2!11708 lt!390747)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10918 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21560)

(assert (=> b!251417 (= lt!390747 (appendNBitsLoop!0 (_2!11708 lt!390731) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251417 (validate_offset_bits!1 ((_ sign_extend 32) (size!5998 (buf!6500 (_2!11708 lt!390731)))) ((_ sign_extend 32) (currentByte!11955 (_2!11708 lt!390731))) ((_ sign_extend 32) (currentBit!11950 (_2!11708 lt!390731))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390745 () Unit!18144)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10918 BitStream!10918 (_ BitVec 64) (_ BitVec 64)) Unit!18144)

(assert (=> b!251417 (= lt!390745 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11708 lt!390731) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174192 () Bool)

(assert (=> b!251417 e!174192))

(declare-fun res!210543 () Bool)

(assert (=> b!251417 (=> (not res!210543) (not e!174192))))

(assert (=> b!251417 (= res!210543 (= (size!5998 (buf!6500 thiss!1005)) (size!5998 (buf!6500 (_2!11708 lt!390731)))))))

(declare-fun appendBit!0 (BitStream!10918 Bool) tuple2!21560)

(assert (=> b!251417 (= lt!390731 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251418 () Bool)

(declare-fun res!210544 () Bool)

(assert (=> b!251418 (=> (not res!210544) (not e!174196))))

(assert (=> b!251418 (= res!210544 (isPrefixOf!0 thiss!1005 (_2!11708 lt!390731)))))

(declare-fun b!251419 () Bool)

(assert (=> b!251419 (= e!174192 e!174196)))

(declare-fun res!210545 () Bool)

(assert (=> b!251419 (=> (not res!210545) (not e!174196))))

(declare-fun lt!390742 () (_ BitVec 64))

(assert (=> b!251419 (= res!210545 (= lt!390746 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390742)))))

(assert (=> b!251419 (= lt!390746 (bitIndex!0 (size!5998 (buf!6500 (_2!11708 lt!390731))) (currentByte!11955 (_2!11708 lt!390731)) (currentBit!11950 (_2!11708 lt!390731))))))

(assert (=> b!251419 (= lt!390742 (bitIndex!0 (size!5998 (buf!6500 thiss!1005)) (currentByte!11955 thiss!1005) (currentBit!11950 thiss!1005)))))

(declare-fun b!251420 () Bool)

(declare-fun lt!390734 () tuple2!21558)

(declare-fun lt!390743 () tuple2!21562)

(assert (=> b!251420 (= e!174199 (not (or (not (_2!11707 lt!390734)) (not (= (_1!11707 lt!390734) (_2!11709 lt!390743))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10918 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21558)

(assert (=> b!251420 (= lt!390734 (checkBitsLoopPure!0 (_1!11709 lt!390743) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251420 (validate_offset_bits!1 ((_ sign_extend 32) (size!5998 (buf!6500 (_2!11708 lt!390747)))) ((_ sign_extend 32) (currentByte!11955 (_2!11708 lt!390731))) ((_ sign_extend 32) (currentBit!11950 (_2!11708 lt!390731))) lt!390736)))

(declare-fun lt!390733 () Unit!18144)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10918 array!13678 (_ BitVec 64)) Unit!18144)

(assert (=> b!251420 (= lt!390733 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11708 lt!390731) (buf!6500 (_2!11708 lt!390747)) lt!390736))))

(assert (=> b!251420 (= lt!390743 (reader!0 (_2!11708 lt!390731) (_2!11708 lt!390747)))))

(declare-fun b!251421 () Bool)

(declare-fun array_inv!5739 (array!13678) Bool)

(assert (=> b!251421 (= e!174193 (array_inv!5739 (buf!6500 thiss!1005)))))

(declare-fun b!251422 () Bool)

(assert (=> b!251422 (= e!174191 (= (_2!11707 lt!390741) (_2!11707 lt!390732)))))

(declare-fun b!251423 () Bool)

(declare-fun res!210540 () Bool)

(assert (=> b!251423 (=> (not res!210540) (not e!174199))))

(assert (=> b!251423 (= res!210540 (isPrefixOf!0 (_2!11708 lt!390731) (_2!11708 lt!390747)))))

(assert (= (and start!54054 res!210537) b!251414))

(assert (= (and b!251414 res!210547) b!251413))

(assert (= (and b!251413 res!210542) b!251417))

(assert (= (and b!251417 res!210543) b!251419))

(assert (= (and b!251419 res!210545) b!251418))

(assert (= (and b!251418 res!210544) b!251410))

(assert (= (and b!251410 res!210538) b!251416))

(assert (= (and b!251417 res!210541) b!251415))

(assert (= (and b!251415 res!210548) b!251423))

(assert (= (and b!251423 res!210540) b!251420))

(assert (= (and b!251417 res!210546) b!251412))

(assert (= (and b!251412 res!210539) b!251411))

(assert (= (and b!251417 res!210549) b!251422))

(assert (= start!54054 b!251421))

(declare-fun m!378267 () Bool)

(assert (=> b!251423 m!378267))

(declare-fun m!378269 () Bool)

(assert (=> b!251410 m!378269))

(assert (=> b!251410 m!378269))

(declare-fun m!378271 () Bool)

(assert (=> b!251410 m!378271))

(declare-fun m!378273 () Bool)

(assert (=> b!251411 m!378273))

(declare-fun m!378275 () Bool)

(assert (=> b!251414 m!378275))

(declare-fun m!378277 () Bool)

(assert (=> b!251420 m!378277))

(declare-fun m!378279 () Bool)

(assert (=> b!251420 m!378279))

(declare-fun m!378281 () Bool)

(assert (=> b!251420 m!378281))

(declare-fun m!378283 () Bool)

(assert (=> b!251420 m!378283))

(declare-fun m!378285 () Bool)

(assert (=> b!251412 m!378285))

(declare-fun m!378287 () Bool)

(assert (=> b!251415 m!378287))

(declare-fun m!378289 () Bool)

(assert (=> b!251415 m!378289))

(assert (=> b!251419 m!378289))

(declare-fun m!378291 () Bool)

(assert (=> b!251419 m!378291))

(declare-fun m!378293 () Bool)

(assert (=> start!54054 m!378293))

(declare-fun m!378295 () Bool)

(assert (=> b!251417 m!378295))

(declare-fun m!378297 () Bool)

(assert (=> b!251417 m!378297))

(declare-fun m!378299 () Bool)

(assert (=> b!251417 m!378299))

(declare-fun m!378301 () Bool)

(assert (=> b!251417 m!378301))

(declare-fun m!378303 () Bool)

(assert (=> b!251417 m!378303))

(declare-fun m!378305 () Bool)

(assert (=> b!251417 m!378305))

(assert (=> b!251417 m!378283))

(declare-fun m!378307 () Bool)

(assert (=> b!251417 m!378307))

(declare-fun m!378309 () Bool)

(assert (=> b!251417 m!378309))

(declare-fun m!378311 () Bool)

(assert (=> b!251417 m!378311))

(declare-fun m!378313 () Bool)

(assert (=> b!251417 m!378313))

(declare-fun m!378315 () Bool)

(assert (=> b!251417 m!378315))

(declare-fun m!378317 () Bool)

(assert (=> b!251417 m!378317))

(declare-fun m!378319 () Bool)

(assert (=> b!251417 m!378319))

(declare-fun m!378321 () Bool)

(assert (=> b!251418 m!378321))

(declare-fun m!378323 () Bool)

(assert (=> b!251421 m!378323))

(declare-fun m!378325 () Bool)

(assert (=> b!251416 m!378325))

(push 1)

(assert (not b!251414))

(assert (not b!251421))

(assert (not b!251418))

(assert (not b!251420))

(assert (not b!251423))

(assert (not b!251411))

(assert (not b!251417))

(assert (not b!251419))

(assert (not b!251415))

(assert (not b!251412))

(assert (not b!251410))

(assert (not b!251416))

(assert (not start!54054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

