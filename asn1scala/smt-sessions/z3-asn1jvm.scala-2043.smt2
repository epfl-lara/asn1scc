; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52128 () Bool)

(assert start!52128)

(declare-fun b!240049 () Bool)

(declare-fun e!166417 () Bool)

(declare-datatypes ((array!13116 0))(
  ( (array!13117 (arr!6731 (Array (_ BitVec 32) (_ BitVec 8))) (size!5744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10410 0))(
  ( (BitStream!10411 (buf!6201 array!13116) (currentByte!11549 (_ BitVec 32)) (currentBit!11544 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10410)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240049 (= e!166417 (not (invariant!0 (currentBit!11544 thiss!982) (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982)))))))

(declare-fun e!166415 () Bool)

(assert (=> b!240049 e!166415))

(declare-fun res!200391 () Bool)

(assert (=> b!240049 (=> (not res!200391) (not e!166415))))

(declare-datatypes ((Unit!17586 0))(
  ( (Unit!17587) )
))
(declare-datatypes ((tuple2!20310 0))(
  ( (tuple2!20311 (_1!11077 Unit!17586) (_2!11077 BitStream!10410)) )
))
(declare-fun lt!374859 () tuple2!20310)

(assert (=> b!240049 (= res!200391 (= (size!5744 (buf!6201 thiss!982)) (size!5744 (buf!6201 (_2!11077 lt!374859)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10410 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20310)

(assert (=> b!240049 (= lt!374859 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240050 () Bool)

(declare-fun res!200390 () Bool)

(assert (=> b!240050 (=> (not res!200390) (not e!166415))))

(declare-fun isPrefixOf!0 (BitStream!10410 BitStream!10410) Bool)

(assert (=> b!240050 (= res!200390 (isPrefixOf!0 thiss!982 (_2!11077 lt!374859)))))

(declare-fun b!240051 () Bool)

(declare-datatypes ((tuple2!20312 0))(
  ( (tuple2!20313 (_1!11078 BitStream!10410) (_2!11078 Bool)) )
))
(declare-fun lt!374860 () tuple2!20312)

(declare-datatypes ((tuple2!20314 0))(
  ( (tuple2!20315 (_1!11079 BitStream!10410) (_2!11079 BitStream!10410)) )
))
(declare-fun lt!374861 () tuple2!20314)

(assert (=> b!240051 (= e!166415 (not (or (not (_2!11078 lt!374860)) (not (= (_1!11078 lt!374860) (_2!11079 lt!374861))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10410 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20312)

(assert (=> b!240051 (= lt!374860 (checkBitsLoopPure!0 (_1!11079 lt!374861) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240051 (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) nBits!288)))

(declare-fun lt!374862 () Unit!17586)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10410 array!13116 (_ BitVec 64)) Unit!17586)

(assert (=> b!240051 (= lt!374862 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6201 (_2!11077 lt!374859)) nBits!288))))

(declare-fun reader!0 (BitStream!10410 BitStream!10410) tuple2!20314)

(assert (=> b!240051 (= lt!374861 (reader!0 thiss!982 (_2!11077 lt!374859)))))

(declare-fun res!200393 () Bool)

(assert (=> start!52128 (=> (not res!200393) (not e!166417))))

(assert (=> start!52128 (= res!200393 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52128 e!166417))

(assert (=> start!52128 true))

(declare-fun e!166416 () Bool)

(declare-fun inv!12 (BitStream!10410) Bool)

(assert (=> start!52128 (and (inv!12 thiss!982) e!166416)))

(declare-fun b!240048 () Bool)

(declare-fun res!200392 () Bool)

(assert (=> b!240048 (=> (not res!200392) (not e!166415))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240048 (= res!200392 (= (bitIndex!0 (size!5744 (buf!6201 (_2!11077 lt!374859))) (currentByte!11549 (_2!11077 lt!374859)) (currentBit!11544 (_2!11077 lt!374859))) (bvadd (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)) nBits!288)))))

(declare-fun b!240052 () Bool)

(declare-fun res!200394 () Bool)

(assert (=> b!240052 (=> (not res!200394) (not e!166417))))

(assert (=> b!240052 (= res!200394 (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) nBits!288))))

(declare-fun b!240053 () Bool)

(declare-fun array_inv!5485 (array!13116) Bool)

(assert (=> b!240053 (= e!166416 (array_inv!5485 (buf!6201 thiss!982)))))

(assert (= (and start!52128 res!200393) b!240052))

(assert (= (and b!240052 res!200394) b!240049))

(assert (= (and b!240049 res!200391) b!240048))

(assert (= (and b!240048 res!200392) b!240050))

(assert (= (and b!240050 res!200390) b!240051))

(assert (= start!52128 b!240053))

(declare-fun m!362433 () Bool)

(assert (=> b!240051 m!362433))

(declare-fun m!362435 () Bool)

(assert (=> b!240051 m!362435))

(declare-fun m!362437 () Bool)

(assert (=> b!240051 m!362437))

(declare-fun m!362439 () Bool)

(assert (=> b!240051 m!362439))

(declare-fun m!362441 () Bool)

(assert (=> start!52128 m!362441))

(declare-fun m!362443 () Bool)

(assert (=> b!240053 m!362443))

(declare-fun m!362445 () Bool)

(assert (=> b!240052 m!362445))

(declare-fun m!362447 () Bool)

(assert (=> b!240048 m!362447))

(declare-fun m!362449 () Bool)

(assert (=> b!240048 m!362449))

(declare-fun m!362451 () Bool)

(assert (=> b!240049 m!362451))

(declare-fun m!362453 () Bool)

(assert (=> b!240049 m!362453))

(declare-fun m!362455 () Bool)

(assert (=> b!240050 m!362455))

(check-sat (not b!240049) (not b!240053) (not start!52128) (not b!240052) (not b!240048) (not b!240051) (not b!240050))
(check-sat)
(get-model)

(declare-fun d!81228 () Bool)

(declare-datatypes ((tuple2!20322 0))(
  ( (tuple2!20323 (_1!11083 Bool) (_2!11083 BitStream!10410)) )
))
(declare-fun lt!374877 () tuple2!20322)

(declare-fun checkBitsLoop!0 (BitStream!10410 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20322)

(assert (=> d!81228 (= lt!374877 (checkBitsLoop!0 (_1!11079 lt!374861) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81228 (= (checkBitsLoopPure!0 (_1!11079 lt!374861) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20313 (_2!11083 lt!374877) (_1!11083 lt!374877)))))

(declare-fun bs!20477 () Bool)

(assert (= bs!20477 d!81228))

(declare-fun m!362481 () Bool)

(assert (=> bs!20477 m!362481))

(assert (=> b!240051 d!81228))

(declare-fun d!81230 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81230 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982))) nBits!288))))

(declare-fun bs!20478 () Bool)

(assert (= bs!20478 d!81230))

(declare-fun m!362483 () Bool)

(assert (=> bs!20478 m!362483))

(assert (=> b!240051 d!81230))

(declare-fun d!81232 () Bool)

(assert (=> d!81232 (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) nBits!288)))

(declare-fun lt!374880 () Unit!17586)

(declare-fun choose!9 (BitStream!10410 array!13116 (_ BitVec 64) BitStream!10410) Unit!17586)

(assert (=> d!81232 (= lt!374880 (choose!9 thiss!982 (buf!6201 (_2!11077 lt!374859)) nBits!288 (BitStream!10411 (buf!6201 (_2!11077 lt!374859)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982))))))

(assert (=> d!81232 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6201 (_2!11077 lt!374859)) nBits!288) lt!374880)))

(declare-fun bs!20479 () Bool)

(assert (= bs!20479 d!81232))

(assert (=> bs!20479 m!362435))

(declare-fun m!362485 () Bool)

(assert (=> bs!20479 m!362485))

(assert (=> b!240051 d!81232))

(declare-fun b!240099 () Bool)

(declare-fun res!200434 () Bool)

(declare-fun e!166446 () Bool)

(assert (=> b!240099 (=> (not res!200434) (not e!166446))))

(declare-fun lt!374958 () tuple2!20314)

(assert (=> b!240099 (= res!200434 (isPrefixOf!0 (_1!11079 lt!374958) thiss!982))))

(declare-fun lt!374969 () (_ BitVec 64))

(declare-fun lt!374970 () (_ BitVec 64))

(declare-fun b!240100 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10410 (_ BitVec 64)) BitStream!10410)

(assert (=> b!240100 (= e!166446 (= (_1!11079 lt!374958) (withMovedBitIndex!0 (_2!11079 lt!374958) (bvsub lt!374970 lt!374969))))))

(assert (=> b!240100 (or (= (bvand lt!374970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374970 lt!374969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240100 (= lt!374969 (bitIndex!0 (size!5744 (buf!6201 (_2!11077 lt!374859))) (currentByte!11549 (_2!11077 lt!374859)) (currentBit!11544 (_2!11077 lt!374859))))))

(assert (=> b!240100 (= lt!374970 (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)))))

(declare-fun b!240101 () Bool)

(declare-fun e!166445 () Unit!17586)

(declare-fun lt!374965 () Unit!17586)

(assert (=> b!240101 (= e!166445 lt!374965)))

(declare-fun lt!374966 () (_ BitVec 64))

(assert (=> b!240101 (= lt!374966 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374964 () (_ BitVec 64))

(assert (=> b!240101 (= lt!374964 (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13116 array!13116 (_ BitVec 64) (_ BitVec 64)) Unit!17586)

(assert (=> b!240101 (= lt!374965 (arrayBitRangesEqSymmetric!0 (buf!6201 thiss!982) (buf!6201 (_2!11077 lt!374859)) lt!374966 lt!374964))))

(declare-fun arrayBitRangesEq!0 (array!13116 array!13116 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240101 (arrayBitRangesEq!0 (buf!6201 (_2!11077 lt!374859)) (buf!6201 thiss!982) lt!374966 lt!374964)))

(declare-fun b!240102 () Bool)

(declare-fun res!200433 () Bool)

(assert (=> b!240102 (=> (not res!200433) (not e!166446))))

(assert (=> b!240102 (= res!200433 (isPrefixOf!0 (_2!11079 lt!374958) (_2!11077 lt!374859)))))

(declare-fun d!81234 () Bool)

(assert (=> d!81234 e!166446))

(declare-fun res!200435 () Bool)

(assert (=> d!81234 (=> (not res!200435) (not e!166446))))

(assert (=> d!81234 (= res!200435 (isPrefixOf!0 (_1!11079 lt!374958) (_2!11079 lt!374958)))))

(declare-fun lt!374976 () BitStream!10410)

(assert (=> d!81234 (= lt!374958 (tuple2!20315 lt!374976 (_2!11077 lt!374859)))))

(declare-fun lt!374960 () Unit!17586)

(declare-fun lt!374971 () Unit!17586)

(assert (=> d!81234 (= lt!374960 lt!374971)))

(assert (=> d!81234 (isPrefixOf!0 lt!374976 (_2!11077 lt!374859))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10410 BitStream!10410 BitStream!10410) Unit!17586)

(assert (=> d!81234 (= lt!374971 (lemmaIsPrefixTransitive!0 lt!374976 (_2!11077 lt!374859) (_2!11077 lt!374859)))))

(declare-fun lt!374973 () Unit!17586)

(declare-fun lt!374967 () Unit!17586)

(assert (=> d!81234 (= lt!374973 lt!374967)))

(assert (=> d!81234 (isPrefixOf!0 lt!374976 (_2!11077 lt!374859))))

(assert (=> d!81234 (= lt!374967 (lemmaIsPrefixTransitive!0 lt!374976 thiss!982 (_2!11077 lt!374859)))))

(declare-fun lt!374963 () Unit!17586)

(assert (=> d!81234 (= lt!374963 e!166445)))

(declare-fun c!11416 () Bool)

(assert (=> d!81234 (= c!11416 (not (= (size!5744 (buf!6201 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!374957 () Unit!17586)

(declare-fun lt!374962 () Unit!17586)

(assert (=> d!81234 (= lt!374957 lt!374962)))

(assert (=> d!81234 (isPrefixOf!0 (_2!11077 lt!374859) (_2!11077 lt!374859))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10410) Unit!17586)

(assert (=> d!81234 (= lt!374962 (lemmaIsPrefixRefl!0 (_2!11077 lt!374859)))))

(declare-fun lt!374972 () Unit!17586)

(declare-fun lt!374959 () Unit!17586)

(assert (=> d!81234 (= lt!374972 lt!374959)))

(assert (=> d!81234 (= lt!374959 (lemmaIsPrefixRefl!0 (_2!11077 lt!374859)))))

(declare-fun lt!374961 () Unit!17586)

(declare-fun lt!374968 () Unit!17586)

(assert (=> d!81234 (= lt!374961 lt!374968)))

(assert (=> d!81234 (isPrefixOf!0 lt!374976 lt!374976)))

(assert (=> d!81234 (= lt!374968 (lemmaIsPrefixRefl!0 lt!374976))))

(declare-fun lt!374975 () Unit!17586)

(declare-fun lt!374974 () Unit!17586)

(assert (=> d!81234 (= lt!374975 lt!374974)))

(assert (=> d!81234 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81234 (= lt!374974 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81234 (= lt!374976 (BitStream!10411 (buf!6201 (_2!11077 lt!374859)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)))))

(assert (=> d!81234 (isPrefixOf!0 thiss!982 (_2!11077 lt!374859))))

(assert (=> d!81234 (= (reader!0 thiss!982 (_2!11077 lt!374859)) lt!374958)))

(declare-fun b!240103 () Bool)

(declare-fun Unit!17590 () Unit!17586)

(assert (=> b!240103 (= e!166445 Unit!17590)))

(assert (= (and d!81234 c!11416) b!240101))

(assert (= (and d!81234 (not c!11416)) b!240103))

(assert (= (and d!81234 res!200435) b!240099))

(assert (= (and b!240099 res!200434) b!240102))

(assert (= (and b!240102 res!200433) b!240100))

(declare-fun m!362509 () Bool)

(assert (=> b!240099 m!362509))

(declare-fun m!362511 () Bool)

(assert (=> b!240100 m!362511))

(assert (=> b!240100 m!362447))

(assert (=> b!240100 m!362449))

(declare-fun m!362513 () Bool)

(assert (=> d!81234 m!362513))

(assert (=> d!81234 m!362455))

(declare-fun m!362515 () Bool)

(assert (=> d!81234 m!362515))

(declare-fun m!362517 () Bool)

(assert (=> d!81234 m!362517))

(declare-fun m!362519 () Bool)

(assert (=> d!81234 m!362519))

(declare-fun m!362521 () Bool)

(assert (=> d!81234 m!362521))

(declare-fun m!362523 () Bool)

(assert (=> d!81234 m!362523))

(declare-fun m!362525 () Bool)

(assert (=> d!81234 m!362525))

(declare-fun m!362527 () Bool)

(assert (=> d!81234 m!362527))

(declare-fun m!362529 () Bool)

(assert (=> d!81234 m!362529))

(declare-fun m!362531 () Bool)

(assert (=> d!81234 m!362531))

(assert (=> b!240101 m!362449))

(declare-fun m!362533 () Bool)

(assert (=> b!240101 m!362533))

(declare-fun m!362535 () Bool)

(assert (=> b!240101 m!362535))

(declare-fun m!362537 () Bool)

(assert (=> b!240102 m!362537))

(assert (=> b!240051 d!81234))

(declare-fun d!81262 () Bool)

(assert (=> d!81262 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982))) nBits!288))))

(declare-fun bs!20487 () Bool)

(assert (= bs!20487 d!81262))

(declare-fun m!362539 () Bool)

(assert (=> bs!20487 m!362539))

(assert (=> b!240052 d!81262))

(declare-fun d!81264 () Bool)

(declare-fun e!166449 () Bool)

(assert (=> d!81264 e!166449))

(declare-fun res!200440 () Bool)

(assert (=> d!81264 (=> (not res!200440) (not e!166449))))

(declare-fun lt!374989 () (_ BitVec 64))

(declare-fun lt!374994 () (_ BitVec 64))

(declare-fun lt!374992 () (_ BitVec 64))

(assert (=> d!81264 (= res!200440 (= lt!374992 (bvsub lt!374989 lt!374994)))))

(assert (=> d!81264 (or (= (bvand lt!374989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374994 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374989 lt!374994) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81264 (= lt!374994 (remainingBits!0 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))) ((_ sign_extend 32) (currentByte!11549 (_2!11077 lt!374859))) ((_ sign_extend 32) (currentBit!11544 (_2!11077 lt!374859)))))))

(declare-fun lt!374990 () (_ BitVec 64))

(declare-fun lt!374991 () (_ BitVec 64))

(assert (=> d!81264 (= lt!374989 (bvmul lt!374990 lt!374991))))

(assert (=> d!81264 (or (= lt!374990 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374991 (bvsdiv (bvmul lt!374990 lt!374991) lt!374990)))))

(assert (=> d!81264 (= lt!374991 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81264 (= lt!374990 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))))))

(assert (=> d!81264 (= lt!374992 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11549 (_2!11077 lt!374859))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11544 (_2!11077 lt!374859)))))))

(assert (=> d!81264 (invariant!0 (currentBit!11544 (_2!11077 lt!374859)) (currentByte!11549 (_2!11077 lt!374859)) (size!5744 (buf!6201 (_2!11077 lt!374859))))))

(assert (=> d!81264 (= (bitIndex!0 (size!5744 (buf!6201 (_2!11077 lt!374859))) (currentByte!11549 (_2!11077 lt!374859)) (currentBit!11544 (_2!11077 lt!374859))) lt!374992)))

(declare-fun b!240108 () Bool)

(declare-fun res!200441 () Bool)

(assert (=> b!240108 (=> (not res!200441) (not e!166449))))

(assert (=> b!240108 (= res!200441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374992))))

(declare-fun b!240109 () Bool)

(declare-fun lt!374993 () (_ BitVec 64))

(assert (=> b!240109 (= e!166449 (bvsle lt!374992 (bvmul lt!374993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240109 (or (= lt!374993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374993)))))

(assert (=> b!240109 (= lt!374993 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!374859)))))))

(assert (= (and d!81264 res!200440) b!240108))

(assert (= (and b!240108 res!200441) b!240109))

(declare-fun m!362541 () Bool)

(assert (=> d!81264 m!362541))

(declare-fun m!362543 () Bool)

(assert (=> d!81264 m!362543))

(assert (=> b!240048 d!81264))

(declare-fun d!81266 () Bool)

(declare-fun e!166450 () Bool)

(assert (=> d!81266 e!166450))

(declare-fun res!200442 () Bool)

(assert (=> d!81266 (=> (not res!200442) (not e!166450))))

(declare-fun lt!374998 () (_ BitVec 64))

(declare-fun lt!375000 () (_ BitVec 64))

(declare-fun lt!374995 () (_ BitVec 64))

(assert (=> d!81266 (= res!200442 (= lt!374998 (bvsub lt!374995 lt!375000)))))

(assert (=> d!81266 (or (= (bvand lt!374995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374995 lt!375000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81266 (= lt!375000 (remainingBits!0 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982))))))

(declare-fun lt!374996 () (_ BitVec 64))

(declare-fun lt!374997 () (_ BitVec 64))

(assert (=> d!81266 (= lt!374995 (bvmul lt!374996 lt!374997))))

(assert (=> d!81266 (or (= lt!374996 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374997 (bvsdiv (bvmul lt!374996 lt!374997) lt!374996)))))

(assert (=> d!81266 (= lt!374997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81266 (= lt!374996 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))))))

(assert (=> d!81266 (= lt!374998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11549 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11544 thiss!982))))))

(assert (=> d!81266 (invariant!0 (currentBit!11544 thiss!982) (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982)))))

(assert (=> d!81266 (= (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)) lt!374998)))

(declare-fun b!240110 () Bool)

(declare-fun res!200443 () Bool)

(assert (=> b!240110 (=> (not res!200443) (not e!166450))))

(assert (=> b!240110 (= res!200443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374998))))

(declare-fun b!240111 () Bool)

(declare-fun lt!374999 () (_ BitVec 64))

(assert (=> b!240111 (= e!166450 (bvsle lt!374998 (bvmul lt!374999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240111 (or (= lt!374999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374999)))))

(assert (=> b!240111 (= lt!374999 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))))))

(assert (= (and d!81266 res!200442) b!240110))

(assert (= (and b!240110 res!200443) b!240111))

(assert (=> d!81266 m!362539))

(assert (=> d!81266 m!362451))

(assert (=> b!240048 d!81266))

(declare-fun d!81268 () Bool)

(assert (=> d!81268 (= (array_inv!5485 (buf!6201 thiss!982)) (bvsge (size!5744 (buf!6201 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240053 d!81268))

(declare-fun d!81270 () Bool)

(assert (=> d!81270 (= (inv!12 thiss!982) (invariant!0 (currentBit!11544 thiss!982) (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982))))))

(declare-fun bs!20488 () Bool)

(assert (= bs!20488 d!81270))

(assert (=> bs!20488 m!362451))

(assert (=> start!52128 d!81270))

(declare-fun d!81272 () Bool)

(assert (=> d!81272 (= (invariant!0 (currentBit!11544 thiss!982) (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982))) (and (bvsge (currentBit!11544 thiss!982) #b00000000000000000000000000000000) (bvslt (currentBit!11544 thiss!982) #b00000000000000000000000000001000) (bvsge (currentByte!11549 thiss!982) #b00000000000000000000000000000000) (or (bvslt (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982))) (and (= (currentBit!11544 thiss!982) #b00000000000000000000000000000000) (= (currentByte!11549 thiss!982) (size!5744 (buf!6201 thiss!982)))))))))

(assert (=> b!240049 d!81272))

(declare-fun b!240159 () Bool)

(declare-fun res!200480 () Bool)

(declare-fun e!166474 () Bool)

(assert (=> b!240159 (=> (not res!200480) (not e!166474))))

(declare-fun lt!375139 () tuple2!20310)

(declare-fun lt!375138 () (_ BitVec 64))

(declare-fun lt!375142 () (_ BitVec 64))

(assert (=> b!240159 (= res!200480 (= (bitIndex!0 (size!5744 (buf!6201 (_2!11077 lt!375139))) (currentByte!11549 (_2!11077 lt!375139)) (currentBit!11544 (_2!11077 lt!375139))) (bvadd lt!375138 lt!375142)))))

(assert (=> b!240159 (or (not (= (bvand lt!375138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375142 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!375138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!375138 lt!375142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240159 (= lt!375142 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240159 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240159 (= lt!375138 (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)))))

(declare-fun b!240162 () Bool)

(declare-fun e!166473 () Bool)

(declare-fun lt!375140 () (_ BitVec 64))

(assert (=> b!240162 (= e!166473 (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 thiss!982))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) lt!375140))))

(declare-fun d!81274 () Bool)

(assert (=> d!81274 e!166474))

(declare-fun res!200481 () Bool)

(assert (=> d!81274 (=> (not res!200481) (not e!166474))))

(assert (=> d!81274 (= res!200481 (= (size!5744 (buf!6201 thiss!982)) (size!5744 (buf!6201 (_2!11077 lt!375139)))))))

(declare-fun choose!51 (BitStream!10410 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20310)

(assert (=> d!81274 (= lt!375139 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81274 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81274 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!375139)))

(declare-fun b!240160 () Bool)

(declare-fun res!200479 () Bool)

(assert (=> b!240160 (=> (not res!200479) (not e!166474))))

(assert (=> b!240160 (= res!200479 (isPrefixOf!0 thiss!982 (_2!11077 lt!375139)))))

(declare-fun b!240161 () Bool)

(declare-fun lt!375137 () tuple2!20312)

(declare-fun lt!375144 () tuple2!20314)

(assert (=> b!240161 (= e!166474 (and (_2!11078 lt!375137) (= (_1!11078 lt!375137) (_2!11079 lt!375144))))))

(assert (=> b!240161 (= lt!375137 (checkBitsLoopPure!0 (_1!11079 lt!375144) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!375141 () Unit!17586)

(declare-fun lt!375143 () Unit!17586)

(assert (=> b!240161 (= lt!375141 lt!375143)))

(assert (=> b!240161 (validate_offset_bits!1 ((_ sign_extend 32) (size!5744 (buf!6201 (_2!11077 lt!375139)))) ((_ sign_extend 32) (currentByte!11549 thiss!982)) ((_ sign_extend 32) (currentBit!11544 thiss!982)) lt!375140)))

(assert (=> b!240161 (= lt!375143 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6201 (_2!11077 lt!375139)) lt!375140))))

(assert (=> b!240161 e!166473))

(declare-fun res!200482 () Bool)

(assert (=> b!240161 (=> (not res!200482) (not e!166473))))

(assert (=> b!240161 (= res!200482 (and (= (size!5744 (buf!6201 thiss!982)) (size!5744 (buf!6201 (_2!11077 lt!375139)))) (bvsge lt!375140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240161 (= lt!375140 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240161 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240161 (= lt!375144 (reader!0 thiss!982 (_2!11077 lt!375139)))))

(assert (= (and d!81274 res!200481) b!240159))

(assert (= (and b!240159 res!200480) b!240160))

(assert (= (and b!240160 res!200479) b!240161))

(assert (= (and b!240161 res!200482) b!240162))

(declare-fun m!362607 () Bool)

(assert (=> b!240162 m!362607))

(declare-fun m!362609 () Bool)

(assert (=> b!240159 m!362609))

(assert (=> b!240159 m!362449))

(declare-fun m!362611 () Bool)

(assert (=> d!81274 m!362611))

(declare-fun m!362613 () Bool)

(assert (=> b!240160 m!362613))

(declare-fun m!362615 () Bool)

(assert (=> b!240161 m!362615))

(declare-fun m!362617 () Bool)

(assert (=> b!240161 m!362617))

(declare-fun m!362619 () Bool)

(assert (=> b!240161 m!362619))

(declare-fun m!362621 () Bool)

(assert (=> b!240161 m!362621))

(assert (=> b!240049 d!81274))

(declare-fun d!81290 () Bool)

(declare-fun res!200491 () Bool)

(declare-fun e!166480 () Bool)

(assert (=> d!81290 (=> (not res!200491) (not e!166480))))

(assert (=> d!81290 (= res!200491 (= (size!5744 (buf!6201 thiss!982)) (size!5744 (buf!6201 (_2!11077 lt!374859)))))))

(assert (=> d!81290 (= (isPrefixOf!0 thiss!982 (_2!11077 lt!374859)) e!166480)))

(declare-fun b!240169 () Bool)

(declare-fun res!200489 () Bool)

(assert (=> b!240169 (=> (not res!200489) (not e!166480))))

(assert (=> b!240169 (= res!200489 (bvsle (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982)) (bitIndex!0 (size!5744 (buf!6201 (_2!11077 lt!374859))) (currentByte!11549 (_2!11077 lt!374859)) (currentBit!11544 (_2!11077 lt!374859)))))))

(declare-fun b!240170 () Bool)

(declare-fun e!166479 () Bool)

(assert (=> b!240170 (= e!166480 e!166479)))

(declare-fun res!200490 () Bool)

(assert (=> b!240170 (=> res!200490 e!166479)))

(assert (=> b!240170 (= res!200490 (= (size!5744 (buf!6201 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240171 () Bool)

(assert (=> b!240171 (= e!166479 (arrayBitRangesEq!0 (buf!6201 thiss!982) (buf!6201 (_2!11077 lt!374859)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5744 (buf!6201 thiss!982)) (currentByte!11549 thiss!982) (currentBit!11544 thiss!982))))))

(assert (= (and d!81290 res!200491) b!240169))

(assert (= (and b!240169 res!200489) b!240170))

(assert (= (and b!240170 (not res!200490)) b!240171))

(assert (=> b!240169 m!362449))

(assert (=> b!240169 m!362447))

(assert (=> b!240171 m!362449))

(assert (=> b!240171 m!362449))

(declare-fun m!362623 () Bool)

(assert (=> b!240171 m!362623))

(assert (=> b!240050 d!81290))

(check-sat (not d!81262) (not d!81274) (not b!240101) (not d!81230) (not b!240160) (not d!81264) (not b!240099) (not b!240161) (not d!81228) (not b!240162) (not d!81234) (not b!240159) (not b!240102) (not b!240169) (not d!81266) (not d!81232) (not b!240171) (not d!81270) (not b!240100))
