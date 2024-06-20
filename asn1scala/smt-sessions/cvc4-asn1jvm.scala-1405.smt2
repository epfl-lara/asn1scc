; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38654 () Bool)

(assert start!38654)

(declare-fun b!173914 () Bool)

(declare-fun res!144029 () Bool)

(declare-fun e!121360 () Bool)

(assert (=> b!173914 (=> (not res!144029) (not e!121360))))

(declare-datatypes ((array!9362 0))(
  ( (array!9363 (arr!5061 (Array (_ BitVec 32) (_ BitVec 8))) (size!4131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7370 0))(
  ( (BitStream!7371 (buf!4562 array!9362) (currentByte!8667 (_ BitVec 32)) (currentBit!8662 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7370)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173914 (= res!144029 (invariant!0 (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun e!121358 () Bool)

(declare-fun lt!268090 () (_ BitVec 64))

(declare-datatypes ((Unit!12483 0))(
  ( (Unit!12484) )
))
(declare-datatypes ((tuple2!14984 0))(
  ( (tuple2!14985 (_1!8134 Unit!12483) (_2!8134 BitStream!7370)) )
))
(declare-fun lt!268089 () tuple2!14984)

(declare-fun b!173915 () Bool)

(declare-fun lt!268091 () (_ BitVec 64))

(assert (=> b!173915 (= e!121358 (and (= (size!4131 (buf!4562 thiss!1187)) (size!4131 (buf!4562 (_2!8134 lt!268089)))) (let ((bdg!10253 (bvand lt!268091 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!10253 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!10253 (bvand lt!268090 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun res!144032 () Bool)

(assert (=> start!38654 (=> (not res!144032) (not e!121360))))

(assert (=> start!38654 (= res!144032 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38654 e!121360))

(assert (=> start!38654 true))

(declare-fun e!121356 () Bool)

(declare-fun inv!12 (BitStream!7370) Bool)

(assert (=> start!38654 (and (inv!12 thiss!1187) e!121356)))

(declare-fun b!173916 () Bool)

(declare-fun array_inv!3872 (array!9362) Bool)

(assert (=> b!173916 (= e!121356 (array_inv!3872 (buf!4562 thiss!1187)))))

(declare-fun b!173917 () Bool)

(declare-fun res!144031 () Bool)

(assert (=> b!173917 (=> (not res!144031) (not e!121360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173917 (= res!144031 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173918 () Bool)

(declare-fun e!121357 () Bool)

(assert (=> b!173918 (= e!121357 e!121358)))

(declare-fun res!144030 () Bool)

(assert (=> b!173918 (=> (not res!144030) (not e!121358))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173918 (= res!144030 (= (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268089))) (currentByte!8667 (_2!8134 lt!268089)) (currentBit!8662 (_2!8134 lt!268089))) lt!268090))))

(assert (=> b!173918 (= lt!268090 (bvadd lt!268091 ((_ sign_extend 32) nBits!340)))))

(assert (=> b!173918 (= lt!268091 (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)))))

(declare-fun b!173919 () Bool)

(assert (=> b!173919 (= e!121360 e!121357)))

(declare-fun res!144033 () Bool)

(assert (=> b!173919 (=> (not res!144033) (not e!121357))))

(assert (=> b!173919 (= res!144033 (= (size!4131 (buf!4562 (_2!8134 lt!268089))) (size!4131 (buf!4562 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14984)

(assert (=> b!173919 (= lt!268089 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(assert (= (and start!38654 res!144032) b!173917))

(assert (= (and b!173917 res!144031) b!173914))

(assert (= (and b!173914 res!144029) b!173919))

(assert (= (and b!173919 res!144033) b!173918))

(assert (= (and b!173918 res!144030) b!173915))

(assert (= start!38654 b!173916))

(declare-fun m!273199 () Bool)

(assert (=> b!173917 m!273199))

(declare-fun m!273201 () Bool)

(assert (=> b!173918 m!273201))

(declare-fun m!273203 () Bool)

(assert (=> b!173918 m!273203))

(declare-fun m!273205 () Bool)

(assert (=> b!173919 m!273205))

(declare-fun m!273207 () Bool)

(assert (=> start!38654 m!273207))

(declare-fun m!273209 () Bool)

(assert (=> b!173916 m!273209))

(declare-fun m!273211 () Bool)

(assert (=> b!173914 m!273211))

(push 1)

(assert (not b!173917))

(assert (not b!173916))

(assert (not start!38654))

(assert (not b!173919))

(assert (not b!173914))

(assert (not b!173918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61357 () Bool)

(assert (=> d!61357 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187))))))

(declare-fun bs!15288 () Bool)

(assert (= bs!15288 d!61357))

(assert (=> bs!15288 m!273211))

(assert (=> start!38654 d!61357))

(declare-fun b!174000 () Bool)

(declare-fun res!144095 () Bool)

(declare-fun e!121409 () Bool)

(assert (=> b!174000 (=> (not res!144095) (not e!121409))))

(declare-fun lt!268422 () tuple2!14984)

(declare-fun isPrefixOf!0 (BitStream!7370 BitStream!7370) Bool)

(assert (=> b!174000 (= res!144095 (isPrefixOf!0 thiss!1187 (_2!8134 lt!268422)))))

(declare-fun b!174001 () Bool)

(declare-fun e!121410 () (_ BitVec 64))

(assert (=> b!174001 (= e!121410 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!174002 () Bool)

(declare-fun e!121411 () tuple2!14984)

(declare-fun lt!268410 () tuple2!14984)

(assert (=> b!174002 (= e!121411 (tuple2!14985 (_1!8134 lt!268410) (_2!8134 lt!268410)))))

(declare-fun lt!268385 () Bool)

(assert (=> b!174002 (= lt!268385 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!268409 () tuple2!14984)

(declare-fun appendBit!0 (BitStream!7370 Bool) tuple2!14984)

(assert (=> b!174002 (= lt!268409 (appendBit!0 thiss!1187 lt!268385))))

(declare-fun res!144099 () Bool)

(assert (=> b!174002 (= res!144099 (= (size!4131 (buf!4562 thiss!1187)) (size!4131 (buf!4562 (_2!8134 lt!268409)))))))

(declare-fun e!121413 () Bool)

(assert (=> b!174002 (=> (not res!144099) (not e!121413))))

(assert (=> b!174002 e!121413))

(declare-fun lt!268378 () tuple2!14984)

(assert (=> b!174002 (= lt!268378 lt!268409)))

(assert (=> b!174002 (= lt!268410 (appendBitsLSBFirstLoopTR!0 (_2!8134 lt!268378) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!268404 () Unit!12483)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7370 BitStream!7370 BitStream!7370) Unit!12483)

(assert (=> b!174002 (= lt!268404 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8134 lt!268378) (_2!8134 lt!268410)))))

(declare-fun call!2882 () Bool)

(assert (=> b!174002 call!2882))

(declare-fun lt!268407 () Unit!12483)

(assert (=> b!174002 (= lt!268407 lt!268404)))

(assert (=> b!174002 (invariant!0 (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187) (size!4131 (buf!4562 (_2!8134 lt!268378))))))

(declare-fun lt!268383 () BitStream!7370)

(assert (=> b!174002 (= lt!268383 (BitStream!7371 (buf!4562 (_2!8134 lt!268378)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)))))

(assert (=> b!174002 (invariant!0 (currentBit!8662 lt!268383) (currentByte!8667 lt!268383) (size!4131 (buf!4562 (_2!8134 lt!268410))))))

(declare-fun lt!268417 () BitStream!7370)

(assert (=> b!174002 (= lt!268417 (BitStream!7371 (buf!4562 (_2!8134 lt!268410)) (currentByte!8667 lt!268383) (currentBit!8662 lt!268383)))))

(declare-datatypes ((tuple2!14992 0))(
  ( (tuple2!14993 (_1!8138 BitStream!7370) (_2!8138 Bool)) )
))
(declare-fun lt!268427 () tuple2!14992)

(declare-fun readBitPure!0 (BitStream!7370) tuple2!14992)

(assert (=> b!174002 (= lt!268427 (readBitPure!0 lt!268383))))

(declare-fun lt!268421 () tuple2!14992)

(assert (=> b!174002 (= lt!268421 (readBitPure!0 lt!268417))))

(declare-fun lt!268395 () Unit!12483)

(declare-fun readBitPrefixLemma!0 (BitStream!7370 BitStream!7370) Unit!12483)

(assert (=> b!174002 (= lt!268395 (readBitPrefixLemma!0 lt!268383 (_2!8134 lt!268410)))))

(declare-fun res!144096 () Bool)

(assert (=> b!174002 (= res!144096 (= (bitIndex!0 (size!4131 (buf!4562 (_1!8138 lt!268427))) (currentByte!8667 (_1!8138 lt!268427)) (currentBit!8662 (_1!8138 lt!268427))) (bitIndex!0 (size!4131 (buf!4562 (_1!8138 lt!268421))) (currentByte!8667 (_1!8138 lt!268421)) (currentBit!8662 (_1!8138 lt!268421)))))))

(declare-fun e!121414 () Bool)

(assert (=> b!174002 (=> (not res!144096) (not e!121414))))

(assert (=> b!174002 e!121414))

(declare-fun lt!268412 () Unit!12483)

(assert (=> b!174002 (= lt!268412 lt!268395)))

(declare-datatypes ((tuple2!14994 0))(
  ( (tuple2!14995 (_1!8139 BitStream!7370) (_2!8139 BitStream!7370)) )
))
(declare-fun lt!268391 () tuple2!14994)

(declare-fun reader!0 (BitStream!7370 BitStream!7370) tuple2!14994)

(assert (=> b!174002 (= lt!268391 (reader!0 thiss!1187 (_2!8134 lt!268410)))))

(declare-fun lt!268415 () tuple2!14994)

(assert (=> b!174002 (= lt!268415 (reader!0 (_2!8134 lt!268378) (_2!8134 lt!268410)))))

(declare-fun lt!268392 () tuple2!14992)

(assert (=> b!174002 (= lt!268392 (readBitPure!0 (_1!8139 lt!268391)))))

(assert (=> b!174002 (= (_2!8138 lt!268392) lt!268385)))

(declare-fun lt!268416 () Unit!12483)

(declare-fun Unit!12495 () Unit!12483)

(assert (=> b!174002 (= lt!268416 Unit!12495)))

(declare-fun lt!268418 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174002 (= lt!268418 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!268386 () (_ BitVec 64))

(assert (=> b!174002 (= lt!268386 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268373 () Unit!12483)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7370 array!9362 (_ BitVec 64)) Unit!12483)

(assert (=> b!174002 (= lt!268373 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4562 (_2!8134 lt!268410)) lt!268386))))

(assert (=> b!174002 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268410)))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) lt!268386)))

(declare-fun lt!268398 () Unit!12483)

(assert (=> b!174002 (= lt!268398 lt!268373)))

(declare-datatypes ((tuple2!14996 0))(
  ( (tuple2!14997 (_1!8140 BitStream!7370) (_2!8140 (_ BitVec 64))) )
))
(declare-fun lt!268380 () tuple2!14996)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14996)

(assert (=> b!174002 (= lt!268380 (readNBitsLSBFirstsLoopPure!0 (_1!8139 lt!268391) nBits!340 #b00000000000000000000000000000000 lt!268418))))

(declare-fun lt!268399 () (_ BitVec 64))

(assert (=> b!174002 (= lt!268399 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!268424 () Unit!12483)

(assert (=> b!174002 (= lt!268424 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8134 lt!268378) (buf!4562 (_2!8134 lt!268410)) lt!268399))))

(assert (=> b!174002 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268410)))) ((_ sign_extend 32) (currentByte!8667 (_2!8134 lt!268378))) ((_ sign_extend 32) (currentBit!8662 (_2!8134 lt!268378))) lt!268399)))

(declare-fun lt!268375 () Unit!12483)

(assert (=> b!174002 (= lt!268375 lt!268424)))

(declare-fun lt!268389 () tuple2!14996)

(assert (=> b!174002 (= lt!268389 (readNBitsLSBFirstsLoopPure!0 (_1!8139 lt!268415) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268418 (ite (_2!8138 lt!268392) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!268423 () tuple2!14996)

(assert (=> b!174002 (= lt!268423 (readNBitsLSBFirstsLoopPure!0 (_1!8139 lt!268391) nBits!340 #b00000000000000000000000000000000 lt!268418))))

(declare-fun c!9161 () Bool)

(assert (=> b!174002 (= c!9161 (_2!8138 (readBitPure!0 (_1!8139 lt!268391))))))

(declare-fun lt!268393 () tuple2!14996)

(declare-fun withMovedBitIndex!0 (BitStream!7370 (_ BitVec 64)) BitStream!7370)

(assert (=> b!174002 (= lt!268393 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8139 lt!268391) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268418 e!121410)))))

(declare-fun lt!268384 () Unit!12483)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12483)

(assert (=> b!174002 (= lt!268384 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8139 lt!268391) nBits!340 #b00000000000000000000000000000000 lt!268418))))

(assert (=> b!174002 (and (= (_2!8140 lt!268423) (_2!8140 lt!268393)) (= (_1!8140 lt!268423) (_1!8140 lt!268393)))))

(declare-fun lt!268406 () Unit!12483)

(assert (=> b!174002 (= lt!268406 lt!268384)))

(assert (=> b!174002 (= (_1!8139 lt!268391) (withMovedBitIndex!0 (_2!8139 lt!268391) (bvsub (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)) (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268410))) (currentByte!8667 (_2!8134 lt!268410)) (currentBit!8662 (_2!8134 lt!268410))))))))

(declare-fun lt!268426 () Unit!12483)

(declare-fun Unit!12496 () Unit!12483)

(assert (=> b!174002 (= lt!268426 Unit!12496)))

(assert (=> b!174002 (= (_1!8139 lt!268415) (withMovedBitIndex!0 (_2!8139 lt!268415) (bvsub (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268378))) (currentByte!8667 (_2!8134 lt!268378)) (currentBit!8662 (_2!8134 lt!268378))) (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268410))) (currentByte!8667 (_2!8134 lt!268410)) (currentBit!8662 (_2!8134 lt!268410))))))))

(declare-fun lt!268374 () Unit!12483)

(declare-fun Unit!12498 () Unit!12483)

(assert (=> b!174002 (= lt!268374 Unit!12498)))

(assert (=> b!174002 (= (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)) (bvsub (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268378))) (currentByte!8667 (_2!8134 lt!268378)) (currentBit!8662 (_2!8134 lt!268378))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!268402 () Unit!12483)

(declare-fun Unit!12499 () Unit!12483)

(assert (=> b!174002 (= lt!268402 Unit!12499)))

(assert (=> b!174002 (= (_2!8140 lt!268380) (_2!8140 lt!268389))))

(declare-fun lt!268387 () Unit!12483)

(declare-fun Unit!12500 () Unit!12483)

(assert (=> b!174002 (= lt!268387 Unit!12500)))

(assert (=> b!174002 (invariant!0 (currentBit!8662 (_2!8134 lt!268410)) (currentByte!8667 (_2!8134 lt!268410)) (size!4131 (buf!4562 (_2!8134 lt!268410))))))

(declare-fun lt!268420 () Unit!12483)

(declare-fun Unit!12501 () Unit!12483)

(assert (=> b!174002 (= lt!268420 Unit!12501)))

(assert (=> b!174002 (= (size!4131 (buf!4562 thiss!1187)) (size!4131 (buf!4562 (_2!8134 lt!268410))))))

(declare-fun lt!268408 () Unit!12483)

(declare-fun Unit!12502 () Unit!12483)

(assert (=> b!174002 (= lt!268408 Unit!12502)))

(assert (=> b!174002 (= (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268410))) (currentByte!8667 (_2!8134 lt!268410)) (currentBit!8662 (_2!8134 lt!268410))) (bvsub (bvadd (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!268403 () Unit!12483)

(declare-fun Unit!12503 () Unit!12483)

(assert (=> b!174002 (= lt!268403 Unit!12503)))

(declare-fun lt!268425 () Unit!12483)

(declare-fun Unit!12504 () Unit!12483)

(assert (=> b!174002 (= lt!268425 Unit!12504)))

(declare-fun lt!268396 () tuple2!14994)

(assert (=> b!174002 (= lt!268396 (reader!0 thiss!1187 (_2!8134 lt!268410)))))

(declare-fun lt!268372 () (_ BitVec 64))

(assert (=> b!174002 (= lt!268372 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268394 () Unit!12483)

(assert (=> b!174002 (= lt!268394 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4562 (_2!8134 lt!268410)) lt!268372))))

(assert (=> b!174002 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268410)))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) lt!268372)))

(declare-fun lt!268376 () Unit!12483)

(assert (=> b!174002 (= lt!268376 lt!268394)))

(declare-fun lt!268411 () tuple2!14996)

(assert (=> b!174002 (= lt!268411 (readNBitsLSBFirstsLoopPure!0 (_1!8139 lt!268396) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144103 () Bool)

(assert (=> b!174002 (= res!144103 (= (_2!8140 lt!268411) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121408 () Bool)

(assert (=> b!174002 (=> (not res!144103) (not e!121408))))

(assert (=> b!174002 e!121408))

(declare-fun lt!268397 () Unit!12483)

(declare-fun Unit!12505 () Unit!12483)

(assert (=> b!174002 (= lt!268397 Unit!12505)))

(declare-fun b!174003 () Bool)

(declare-fun res!144105 () Bool)

(assert (=> b!174003 (= res!144105 (= (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268409))) (currentByte!8667 (_2!8134 lt!268409)) (currentBit!8662 (_2!8134 lt!268409))) (bvadd (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174003 (=> (not res!144105) (not e!121413))))

(declare-fun b!174004 () Bool)

(assert (=> b!174004 (= e!121408 (= (_1!8140 lt!268411) (_2!8139 lt!268396)))))

(declare-fun b!174005 () Bool)

(declare-fun res!144101 () Bool)

(assert (=> b!174005 (=> (not res!144101) (not e!121409))))

(assert (=> b!174005 (= res!144101 (= (size!4131 (buf!4562 thiss!1187)) (size!4131 (buf!4562 (_2!8134 lt!268422)))))))

(declare-fun b!174006 () Bool)

(declare-fun res!144100 () Bool)

(assert (=> b!174006 (=> (not res!144100) (not e!121409))))

(declare-fun lt!268401 () (_ BitVec 64))

(declare-fun lt!268390 () (_ BitVec 64))

(assert (=> b!174006 (= res!144100 (= (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268422))) (currentByte!8667 (_2!8134 lt!268422)) (currentBit!8662 (_2!8134 lt!268422))) (bvsub lt!268390 lt!268401)))))

(assert (=> b!174006 (or (= (bvand lt!268390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268390 lt!268401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174006 (= lt!268401 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!268377 () (_ BitVec 64))

(declare-fun lt!268381 () (_ BitVec 64))

(assert (=> b!174006 (= lt!268390 (bvadd lt!268377 lt!268381))))

(assert (=> b!174006 (or (not (= (bvand lt!268377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268381 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!268377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!268377 lt!268381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174006 (= lt!268381 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174006 (= lt!268377 (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)))))

(declare-fun b!174007 () Bool)

(assert (=> b!174007 (= e!121410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!174008 () Bool)

(declare-fun Unit!12506 () Unit!12483)

(assert (=> b!174008 (= e!121411 (tuple2!14985 Unit!12506 thiss!1187))))

(declare-fun lt!268400 () Unit!12483)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7370) Unit!12483)

(assert (=> b!174008 (= lt!268400 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!174008 call!2882))

(declare-fun lt!268379 () Unit!12483)

(assert (=> b!174008 (= lt!268379 lt!268400)))

(declare-fun c!9162 () Bool)

(declare-fun bm!2879 () Bool)

(assert (=> bm!2879 (= call!2882 (isPrefixOf!0 thiss!1187 (ite c!9162 thiss!1187 (_2!8134 lt!268410))))))

(declare-fun b!174009 () Bool)

(declare-fun lt!268419 () tuple2!14992)

(declare-fun readerFrom!0 (BitStream!7370 (_ BitVec 32) (_ BitVec 32)) BitStream!7370)

(assert (=> b!174009 (= lt!268419 (readBitPure!0 (readerFrom!0 (_2!8134 lt!268409) (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187))))))

(declare-fun res!144097 () Bool)

(assert (=> b!174009 (= res!144097 (and (= (_2!8138 lt!268419) lt!268385) (= (_1!8138 lt!268419) (_2!8134 lt!268409))))))

(declare-fun e!121406 () Bool)

(assert (=> b!174009 (=> (not res!144097) (not e!121406))))

(assert (=> b!174009 (= e!121413 e!121406)))

(declare-fun d!61359 () Bool)

(assert (=> d!61359 e!121409))

(declare-fun res!144098 () Bool)

(assert (=> d!61359 (=> (not res!144098) (not e!121409))))

(assert (=> d!61359 (= res!144098 (invariant!0 (currentBit!8662 (_2!8134 lt!268422)) (currentByte!8667 (_2!8134 lt!268422)) (size!4131 (buf!4562 (_2!8134 lt!268422)))))))

(assert (=> d!61359 (= lt!268422 e!121411)))

(assert (=> d!61359 (= c!9162 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61359 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61359 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!268422)))

(declare-fun b!174010 () Bool)

(declare-fun e!121407 () Bool)

(declare-fun lt!268413 () tuple2!14996)

(declare-fun lt!268405 () tuple2!14994)

(assert (=> b!174010 (= e!121407 (= (_1!8140 lt!268413) (_2!8139 lt!268405)))))

(declare-fun b!174011 () Bool)

(declare-fun e!121412 () Bool)

(declare-fun lt!268388 () (_ BitVec 64))

(assert (=> b!174011 (= e!121412 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) lt!268388))))

(declare-fun b!174012 () Bool)

(assert (=> b!174012 (= e!121409 e!121407)))

(declare-fun res!144102 () Bool)

(assert (=> b!174012 (=> (not res!144102) (not e!121407))))

(assert (=> b!174012 (= res!144102 (= (_2!8140 lt!268413) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174012 (= lt!268413 (readNBitsLSBFirstsLoopPure!0 (_1!8139 lt!268405) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!268414 () Unit!12483)

(declare-fun lt!268382 () Unit!12483)

(assert (=> b!174012 (= lt!268414 lt!268382)))

(assert (=> b!174012 (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268422)))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) lt!268388)))

(assert (=> b!174012 (= lt!268382 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4562 (_2!8134 lt!268422)) lt!268388))))

(assert (=> b!174012 e!121412))

(declare-fun res!144094 () Bool)

(assert (=> b!174012 (=> (not res!144094) (not e!121412))))

(assert (=> b!174012 (= res!144094 (and (= (size!4131 (buf!4562 thiss!1187)) (size!4131 (buf!4562 (_2!8134 lt!268422)))) (bvsge lt!268388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174012 (= lt!268388 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!174012 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!174012 (= lt!268405 (reader!0 thiss!1187 (_2!8134 lt!268422)))))

(declare-fun b!174013 () Bool)

(declare-fun res!144104 () Bool)

(assert (=> b!174013 (= res!144104 (isPrefixOf!0 thiss!1187 (_2!8134 lt!268409)))))

(assert (=> b!174013 (=> (not res!144104) (not e!121413))))

(declare-fun b!174014 () Bool)

(assert (=> b!174014 (= e!121406 (= (bitIndex!0 (size!4131 (buf!4562 (_1!8138 lt!268419))) (currentByte!8667 (_1!8138 lt!268419)) (currentBit!8662 (_1!8138 lt!268419))) (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268409))) (currentByte!8667 (_2!8134 lt!268409)) (currentBit!8662 (_2!8134 lt!268409)))))))

(declare-fun b!174015 () Bool)

(assert (=> b!174015 (= e!121414 (= (_2!8138 lt!268427) (_2!8138 lt!268421)))))

(assert (= (and d!61359 c!9162) b!174008))

(assert (= (and d!61359 (not c!9162)) b!174002))

(assert (= (and b!174002 res!144099) b!174003))

(assert (= (and b!174003 res!144105) b!174013))

(assert (= (and b!174013 res!144104) b!174009))

(assert (= (and b!174009 res!144097) b!174014))

(assert (= (and b!174002 res!144096) b!174015))

(assert (= (and b!174002 c!9161) b!174001))

(assert (= (and b!174002 (not c!9161)) b!174007))

(assert (= (and b!174002 res!144103) b!174004))

(assert (= (or b!174008 b!174002) bm!2879))

(assert (= (and d!61359 res!144098) b!174005))

(assert (= (and b!174005 res!144101) b!174006))

(assert (= (and b!174006 res!144100) b!174000))

(assert (= (and b!174000 res!144095) b!174012))

(assert (= (and b!174012 res!144094) b!174011))

(assert (= (and b!174012 res!144102) b!174010))

(declare-fun m!273311 () Bool)

(assert (=> d!61359 m!273311))

(declare-fun m!273313 () Bool)

(assert (=> b!174008 m!273313))

(declare-fun m!273315 () Bool)

(assert (=> b!174013 m!273315))

(declare-fun m!273317 () Bool)

(assert (=> b!174002 m!273317))

(assert (=> b!174002 m!273203))

(declare-fun m!273319 () Bool)

(assert (=> b!174002 m!273319))

(declare-fun m!273321 () Bool)

(assert (=> b!174002 m!273321))

(declare-fun m!273323 () Bool)

(assert (=> b!174002 m!273323))

(declare-fun m!273325 () Bool)

(assert (=> b!174002 m!273325))

(declare-fun m!273327 () Bool)

(assert (=> b!174002 m!273327))

(declare-fun m!273329 () Bool)

(assert (=> b!174002 m!273329))

(declare-fun m!273331 () Bool)

(assert (=> b!174002 m!273331))

(declare-fun m!273333 () Bool)

(assert (=> b!174002 m!273333))

(declare-fun m!273335 () Bool)

(assert (=> b!174002 m!273335))

(declare-fun m!273337 () Bool)

(assert (=> b!174002 m!273337))

(declare-fun m!273339 () Bool)

(assert (=> b!174002 m!273339))

(declare-fun m!273341 () Bool)

(assert (=> b!174002 m!273341))

(declare-fun m!273343 () Bool)

(assert (=> b!174002 m!273343))

(declare-fun m!273345 () Bool)

(assert (=> b!174002 m!273345))

(declare-fun m!273347 () Bool)

(assert (=> b!174002 m!273347))

(declare-fun m!273349 () Bool)

(assert (=> b!174002 m!273349))

(declare-fun m!273351 () Bool)

(assert (=> b!174002 m!273351))

(declare-fun m!273353 () Bool)

(assert (=> b!174002 m!273353))

(declare-fun m!273355 () Bool)

(assert (=> b!174002 m!273355))

(declare-fun m!273357 () Bool)

(assert (=> b!174002 m!273357))

(declare-fun m!273359 () Bool)

(assert (=> b!174002 m!273359))

(declare-fun m!273361 () Bool)

(assert (=> b!174002 m!273361))

(declare-fun m!273363 () Bool)

(assert (=> b!174002 m!273363))

(declare-fun m!273365 () Bool)

(assert (=> b!174002 m!273365))

(declare-fun m!273367 () Bool)

(assert (=> b!174002 m!273367))

(declare-fun m!273369 () Bool)

(assert (=> b!174002 m!273369))

(assert (=> b!174002 m!273341))

(declare-fun m!273371 () Bool)

(assert (=> b!174002 m!273371))

(declare-fun m!273373 () Bool)

(assert (=> b!174002 m!273373))

(declare-fun m!273375 () Bool)

(assert (=> b!174002 m!273375))

(declare-fun m!273377 () Bool)

(assert (=> b!174002 m!273377))

(declare-fun m!273379 () Bool)

(assert (=> b!174002 m!273379))

(declare-fun m!273381 () Bool)

(assert (=> b!174011 m!273381))

(declare-fun m!273383 () Bool)

(assert (=> b!174003 m!273383))

(assert (=> b!174003 m!273203))

(assert (=> b!174012 m!273325))

(declare-fun m!273385 () Bool)

(assert (=> b!174012 m!273385))

(declare-fun m!273387 () Bool)

(assert (=> b!174012 m!273387))

(assert (=> b!174012 m!273367))

(declare-fun m!273389 () Bool)

(assert (=> b!174012 m!273389))

(declare-fun m!273391 () Bool)

(assert (=> b!174012 m!273391))

(declare-fun m!273393 () Bool)

(assert (=> bm!2879 m!273393))

(declare-fun m!273395 () Bool)

(assert (=> b!174009 m!273395))

(assert (=> b!174009 m!273395))

(declare-fun m!273397 () Bool)

(assert (=> b!174009 m!273397))

(declare-fun m!273399 () Bool)

(assert (=> b!174006 m!273399))

(assert (=> b!174006 m!273203))

(declare-fun m!273401 () Bool)

(assert (=> b!174014 m!273401))

(assert (=> b!174014 m!273383))

(declare-fun m!273403 () Bool)

(assert (=> b!174000 m!273403))

(assert (=> b!173919 d!61359))

(declare-fun d!61367 () Bool)

(assert (=> d!61367 (= (invariant!0 (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187))) (and (bvsge (currentBit!8662 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8662 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8667 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187))) (and (= (currentBit!8662 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187)))))))))

(assert (=> b!173914 d!61367))

(declare-fun d!61369 () Bool)

(declare-fun e!121427 () Bool)

(assert (=> d!61369 e!121427))

(declare-fun res!144126 () Bool)

(assert (=> d!61369 (=> (not res!144126) (not e!121427))))

(declare-fun lt!268483 () (_ BitVec 64))

(declare-fun lt!268481 () (_ BitVec 64))

(declare-fun lt!268482 () (_ BitVec 64))

(assert (=> d!61369 (= res!144126 (= lt!268481 (bvsub lt!268482 lt!268483)))))

(assert (=> d!61369 (or (= (bvand lt!268482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268482 lt!268483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61369 (= lt!268483 (remainingBits!0 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268089)))) ((_ sign_extend 32) (currentByte!8667 (_2!8134 lt!268089))) ((_ sign_extend 32) (currentBit!8662 (_2!8134 lt!268089)))))))

(declare-fun lt!268480 () (_ BitVec 64))

(declare-fun lt!268484 () (_ BitVec 64))

(assert (=> d!61369 (= lt!268482 (bvmul lt!268480 lt!268484))))

(assert (=> d!61369 (or (= lt!268480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268484 (bvsdiv (bvmul lt!268480 lt!268484) lt!268480)))))

(assert (=> d!61369 (= lt!268484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61369 (= lt!268480 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268089)))))))

(assert (=> d!61369 (= lt!268481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8667 (_2!8134 lt!268089))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8662 (_2!8134 lt!268089)))))))

(assert (=> d!61369 (invariant!0 (currentBit!8662 (_2!8134 lt!268089)) (currentByte!8667 (_2!8134 lt!268089)) (size!4131 (buf!4562 (_2!8134 lt!268089))))))

(assert (=> d!61369 (= (bitIndex!0 (size!4131 (buf!4562 (_2!8134 lt!268089))) (currentByte!8667 (_2!8134 lt!268089)) (currentBit!8662 (_2!8134 lt!268089))) lt!268481)))

(declare-fun b!174040 () Bool)

(declare-fun res!144127 () Bool)

(assert (=> b!174040 (=> (not res!144127) (not e!121427))))

(assert (=> b!174040 (= res!144127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268481))))

(declare-fun b!174041 () Bool)

(declare-fun lt!268485 () (_ BitVec 64))

(assert (=> b!174041 (= e!121427 (bvsle lt!268481 (bvmul lt!268485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174041 (or (= lt!268485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268485)))))

(assert (=> b!174041 (= lt!268485 ((_ sign_extend 32) (size!4131 (buf!4562 (_2!8134 lt!268089)))))))

(assert (= (and d!61369 res!144126) b!174040))

(assert (= (and b!174040 res!144127) b!174041))

(declare-fun m!273409 () Bool)

(assert (=> d!61369 m!273409))

(declare-fun m!273411 () Bool)

(assert (=> d!61369 m!273411))

(assert (=> b!173918 d!61369))

(declare-fun d!61373 () Bool)

(declare-fun e!121428 () Bool)

(assert (=> d!61373 e!121428))

(declare-fun res!144128 () Bool)

(assert (=> d!61373 (=> (not res!144128) (not e!121428))))

(declare-fun lt!268493 () (_ BitVec 64))

(declare-fun lt!268492 () (_ BitVec 64))

(declare-fun lt!268491 () (_ BitVec 64))

(assert (=> d!61373 (= res!144128 (= lt!268491 (bvsub lt!268492 lt!268493)))))

(assert (=> d!61373 (or (= (bvand lt!268492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268492 lt!268493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61373 (= lt!268493 (remainingBits!0 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187))))))

(declare-fun lt!268490 () (_ BitVec 64))

(declare-fun lt!268494 () (_ BitVec 64))

(assert (=> d!61373 (= lt!268492 (bvmul lt!268490 lt!268494))))

(assert (=> d!61373 (or (= lt!268490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268494 (bvsdiv (bvmul lt!268490 lt!268494) lt!268490)))))

(assert (=> d!61373 (= lt!268494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61373 (= lt!268490 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))))))

(assert (=> d!61373 (= lt!268491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8667 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8662 thiss!1187))))))

(assert (=> d!61373 (invariant!0 (currentBit!8662 thiss!1187) (currentByte!8667 thiss!1187) (size!4131 (buf!4562 thiss!1187)))))

(assert (=> d!61373 (= (bitIndex!0 (size!4131 (buf!4562 thiss!1187)) (currentByte!8667 thiss!1187) (currentBit!8662 thiss!1187)) lt!268491)))

(declare-fun b!174042 () Bool)

(declare-fun res!144129 () Bool)

(assert (=> b!174042 (=> (not res!144129) (not e!121428))))

(assert (=> b!174042 (= res!144129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268491))))

(declare-fun b!174043 () Bool)

(declare-fun lt!268495 () (_ BitVec 64))

(assert (=> b!174043 (= e!121428 (bvsle lt!268491 (bvmul lt!268495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174043 (or (= lt!268495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268495)))))

(assert (=> b!174043 (= lt!268495 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))))))

(assert (= (and d!61373 res!144128) b!174042))

(assert (= (and b!174042 res!144129) b!174043))

(declare-fun m!273413 () Bool)

(assert (=> d!61373 m!273413))

(assert (=> d!61373 m!273211))

(assert (=> b!173918 d!61373))

(declare-fun d!61375 () Bool)

(assert (=> d!61375 (= (array_inv!3872 (buf!4562 thiss!1187)) (bvsge (size!4131 (buf!4562 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173916 d!61375))

(declare-fun d!61377 () Bool)

(assert (=> d!61377 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4131 (buf!4562 thiss!1187))) ((_ sign_extend 32) (currentByte!8667 thiss!1187)) ((_ sign_extend 32) (currentBit!8662 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15289 () Bool)

(assert (= bs!15289 d!61377))

(assert (=> bs!15289 m!273413))

(assert (=> b!173917 d!61377))

(push 1)

(assert (not d!61373))

(assert (not b!174011))

(assert (not bm!2879))

(assert (not b!174012))

(assert (not b!174009))

(assert (not b!174013))

(assert (not b!174003))

(assert (not d!61359))

(assert (not b!174014))

(assert (not b!174006))

(assert (not d!61377))

(assert (not d!61369))

(assert (not b!174000))

(assert (not b!174002))

(assert (not b!174008))

(assert (not d!61357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

