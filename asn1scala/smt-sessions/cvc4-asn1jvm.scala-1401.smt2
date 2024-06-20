; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38524 () Bool)

(assert start!38524)

(declare-fun b!173318 () Bool)

(declare-fun res!143564 () Bool)

(declare-fun e!121006 () Bool)

(assert (=> b!173318 (=> (not res!143564) (not e!121006))))

(declare-datatypes ((array!9330 0))(
  ( (array!9331 (arr!5049 (Array (_ BitVec 32) (_ BitVec 8))) (size!4119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7346 0))(
  ( (BitStream!7347 (buf!4547 array!9330) (currentByte!8634 (_ BitVec 32)) (currentBit!8629 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7346)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((Unit!12407 0))(
  ( (Unit!12408) )
))
(declare-datatypes ((tuple2!14928 0))(
  ( (tuple2!14929 (_1!8106 Unit!12407) (_2!8106 BitStream!7346)) )
))
(declare-fun lt!266703 () tuple2!14928)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173318 (= res!143564 (= (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!266703))) (currentByte!8634 (_2!8106 lt!266703)) (currentBit!8629 (_2!8106 lt!266703))) (bvadd (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173320 () Bool)

(declare-fun e!121008 () Bool)

(assert (=> b!173320 (= e!121008 e!121006)))

(declare-fun res!143562 () Bool)

(assert (=> b!173320 (=> (not res!143562) (not e!121006))))

(assert (=> b!173320 (= res!143562 (= (size!4119 (buf!4547 (_2!8106 lt!266703))) (size!4119 (buf!4547 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14928)

(assert (=> b!173320 (= lt!266703 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173321 () Bool)

(declare-datatypes ((tuple2!14930 0))(
  ( (tuple2!14931 (_1!8107 BitStream!7346) (_2!8107 BitStream!7346)) )
))
(declare-fun lt!266704 () tuple2!14930)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173321 (= e!121006 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_1!8107 lt!266704)))) ((_ sign_extend 32) (currentByte!8634 (_1!8107 lt!266704))) ((_ sign_extend 32) (currentBit!8629 (_1!8107 lt!266704))) ((_ sign_extend 32) nBits!340))))))

(assert (=> b!173321 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266705 () Unit!12407)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7346 array!9330 (_ BitVec 64)) Unit!12407)

(assert (=> b!173321 (= lt!266705 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4547 (_2!8106 lt!266703)) ((_ sign_extend 32) nBits!340)))))

(declare-fun reader!0 (BitStream!7346 BitStream!7346) tuple2!14930)

(assert (=> b!173321 (= lt!266704 (reader!0 thiss!1187 (_2!8106 lt!266703)))))

(declare-fun b!173322 () Bool)

(declare-fun res!143560 () Bool)

(assert (=> b!173322 (=> (not res!143560) (not e!121008))))

(assert (=> b!173322 (= res!143560 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173323 () Bool)

(declare-fun res!143565 () Bool)

(assert (=> b!173323 (=> (not res!143565) (not e!121006))))

(declare-fun isPrefixOf!0 (BitStream!7346 BitStream!7346) Bool)

(assert (=> b!173323 (= res!143565 (isPrefixOf!0 thiss!1187 (_2!8106 lt!266703)))))

(declare-fun res!143561 () Bool)

(assert (=> start!38524 (=> (not res!143561) (not e!121008))))

(assert (=> start!38524 (= res!143561 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38524 e!121008))

(assert (=> start!38524 true))

(declare-fun e!121007 () Bool)

(declare-fun inv!12 (BitStream!7346) Bool)

(assert (=> start!38524 (and (inv!12 thiss!1187) e!121007)))

(declare-fun b!173319 () Bool)

(declare-fun array_inv!3860 (array!9330) Bool)

(assert (=> b!173319 (= e!121007 (array_inv!3860 (buf!4547 thiss!1187)))))

(declare-fun b!173324 () Bool)

(declare-fun res!143559 () Bool)

(assert (=> b!173324 (=> (not res!143559) (not e!121008))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173324 (= res!143559 (invariant!0 (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187))))))

(declare-fun b!173325 () Bool)

(declare-fun res!143563 () Bool)

(assert (=> b!173325 (=> (not res!143563) (not e!121006))))

(assert (=> b!173325 (= res!143563 (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!266703)))))))

(assert (= (and start!38524 res!143561) b!173322))

(assert (= (and b!173322 res!143560) b!173324))

(assert (= (and b!173324 res!143559) b!173320))

(assert (= (and b!173320 res!143562) b!173318))

(assert (= (and b!173318 res!143564) b!173325))

(assert (= (and b!173325 res!143563) b!173323))

(assert (= (and b!173323 res!143565) b!173321))

(assert (= start!38524 b!173319))

(declare-fun m!272409 () Bool)

(assert (=> b!173324 m!272409))

(declare-fun m!272411 () Bool)

(assert (=> b!173319 m!272411))

(declare-fun m!272413 () Bool)

(assert (=> b!173320 m!272413))

(declare-fun m!272415 () Bool)

(assert (=> b!173323 m!272415))

(declare-fun m!272417 () Bool)

(assert (=> b!173322 m!272417))

(declare-fun m!272419 () Bool)

(assert (=> start!38524 m!272419))

(declare-fun m!272421 () Bool)

(assert (=> b!173321 m!272421))

(declare-fun m!272423 () Bool)

(assert (=> b!173321 m!272423))

(declare-fun m!272425 () Bool)

(assert (=> b!173321 m!272425))

(declare-fun m!272427 () Bool)

(assert (=> b!173321 m!272427))

(declare-fun m!272429 () Bool)

(assert (=> b!173318 m!272429))

(declare-fun m!272431 () Bool)

(assert (=> b!173318 m!272431))

(push 1)

(assert (not b!173319))

(assert (not b!173320))

(assert (not b!173323))

(assert (not b!173324))

(assert (not b!173318))

(assert (not start!38524))

(assert (not b!173322))

(assert (not b!173321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61215 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61215 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_1!8107 lt!266704)))) ((_ sign_extend 32) (currentByte!8634 (_1!8107 lt!266704))) ((_ sign_extend 32) (currentBit!8629 (_1!8107 lt!266704))) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4119 (buf!4547 (_1!8107 lt!266704)))) ((_ sign_extend 32) (currentByte!8634 (_1!8107 lt!266704))) ((_ sign_extend 32) (currentBit!8629 (_1!8107 lt!266704)))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15247 () Bool)

(assert (= bs!15247 d!61215))

(declare-fun m!272433 () Bool)

(assert (=> bs!15247 m!272433))

(assert (=> b!173321 d!61215))

(declare-fun d!61217 () Bool)

(assert (=> d!61217 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15248 () Bool)

(assert (= bs!15248 d!61217))

(declare-fun m!272435 () Bool)

(assert (=> bs!15248 m!272435))

(assert (=> b!173321 d!61217))

(declare-fun d!61219 () Bool)

(assert (=> d!61219 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340))))

(declare-fun lt!266708 () Unit!12407)

(declare-fun choose!9 (BitStream!7346 array!9330 (_ BitVec 64) BitStream!7346) Unit!12407)

(assert (=> d!61219 (= lt!266708 (choose!9 thiss!1187 (buf!4547 (_2!8106 lt!266703)) ((_ sign_extend 32) nBits!340) (BitStream!7347 (buf!4547 (_2!8106 lt!266703)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187))))))

(assert (=> d!61219 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4547 (_2!8106 lt!266703)) ((_ sign_extend 32) nBits!340)) lt!266708)))

(declare-fun bs!15249 () Bool)

(assert (= bs!15249 d!61219))

(assert (=> bs!15249 m!272423))

(declare-fun m!272437 () Bool)

(assert (=> bs!15249 m!272437))

(assert (=> b!173321 d!61219))

(declare-fun b!173370 () Bool)

(declare-fun res!143607 () Bool)

(declare-fun e!121035 () Bool)

(assert (=> b!173370 (=> (not res!143607) (not e!121035))))

(declare-fun lt!266806 () tuple2!14930)

(assert (=> b!173370 (= res!143607 (isPrefixOf!0 (_1!8107 lt!266806) thiss!1187))))

(declare-fun d!61221 () Bool)

(assert (=> d!61221 e!121035))

(declare-fun res!143608 () Bool)

(assert (=> d!61221 (=> (not res!143608) (not e!121035))))

(assert (=> d!61221 (= res!143608 (isPrefixOf!0 (_1!8107 lt!266806) (_2!8107 lt!266806)))))

(declare-fun lt!266816 () BitStream!7346)

(assert (=> d!61221 (= lt!266806 (tuple2!14931 lt!266816 (_2!8106 lt!266703)))))

(declare-fun lt!266812 () Unit!12407)

(declare-fun lt!266801 () Unit!12407)

(assert (=> d!61221 (= lt!266812 lt!266801)))

(assert (=> d!61221 (isPrefixOf!0 lt!266816 (_2!8106 lt!266703))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7346 BitStream!7346 BitStream!7346) Unit!12407)

(assert (=> d!61221 (= lt!266801 (lemmaIsPrefixTransitive!0 lt!266816 (_2!8106 lt!266703) (_2!8106 lt!266703)))))

(declare-fun lt!266805 () Unit!12407)

(declare-fun lt!266803 () Unit!12407)

(assert (=> d!61221 (= lt!266805 lt!266803)))

(assert (=> d!61221 (isPrefixOf!0 lt!266816 (_2!8106 lt!266703))))

(assert (=> d!61221 (= lt!266803 (lemmaIsPrefixTransitive!0 lt!266816 thiss!1187 (_2!8106 lt!266703)))))

(declare-fun lt!266815 () Unit!12407)

(declare-fun e!121034 () Unit!12407)

(assert (=> d!61221 (= lt!266815 e!121034)))

(declare-fun c!9108 () Bool)

(assert (=> d!61221 (= c!9108 (not (= (size!4119 (buf!4547 thiss!1187)) #b00000000000000000000000000000000)))))

(declare-fun lt!266802 () Unit!12407)

(declare-fun lt!266807 () Unit!12407)

(assert (=> d!61221 (= lt!266802 lt!266807)))

(assert (=> d!61221 (isPrefixOf!0 (_2!8106 lt!266703) (_2!8106 lt!266703))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7346) Unit!12407)

(assert (=> d!61221 (= lt!266807 (lemmaIsPrefixRefl!0 (_2!8106 lt!266703)))))

(declare-fun lt!266800 () Unit!12407)

(declare-fun lt!266810 () Unit!12407)

(assert (=> d!61221 (= lt!266800 lt!266810)))

(assert (=> d!61221 (= lt!266810 (lemmaIsPrefixRefl!0 (_2!8106 lt!266703)))))

(declare-fun lt!266814 () Unit!12407)

(declare-fun lt!266804 () Unit!12407)

(assert (=> d!61221 (= lt!266814 lt!266804)))

(assert (=> d!61221 (isPrefixOf!0 lt!266816 lt!266816)))

(assert (=> d!61221 (= lt!266804 (lemmaIsPrefixRefl!0 lt!266816))))

(declare-fun lt!266809 () Unit!12407)

(declare-fun lt!266808 () Unit!12407)

(assert (=> d!61221 (= lt!266809 lt!266808)))

(assert (=> d!61221 (isPrefixOf!0 thiss!1187 thiss!1187)))

(assert (=> d!61221 (= lt!266808 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> d!61221 (= lt!266816 (BitStream!7347 (buf!4547 (_2!8106 lt!266703)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)))))

(assert (=> d!61221 (isPrefixOf!0 thiss!1187 (_2!8106 lt!266703))))

(assert (=> d!61221 (= (reader!0 thiss!1187 (_2!8106 lt!266703)) lt!266806)))

(declare-fun b!173371 () Bool)

(declare-fun lt!266811 () Unit!12407)

(assert (=> b!173371 (= e!121034 lt!266811)))

(declare-fun lt!266798 () (_ BitVec 64))

(assert (=> b!173371 (= lt!266798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!266813 () (_ BitVec 64))

(assert (=> b!173371 (= lt!266813 (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9330 array!9330 (_ BitVec 64) (_ BitVec 64)) Unit!12407)

(assert (=> b!173371 (= lt!266811 (arrayBitRangesEqSymmetric!0 (buf!4547 thiss!1187) (buf!4547 (_2!8106 lt!266703)) lt!266798 lt!266813))))

(declare-fun arrayBitRangesEq!0 (array!9330 array!9330 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173371 (arrayBitRangesEq!0 (buf!4547 (_2!8106 lt!266703)) (buf!4547 thiss!1187) lt!266798 lt!266813)))

(declare-fun lt!266799 () (_ BitVec 64))

(declare-fun lt!266797 () (_ BitVec 64))

(declare-fun b!173372 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7346 (_ BitVec 64)) BitStream!7346)

(assert (=> b!173372 (= e!121035 (= (_1!8107 lt!266806) (withMovedBitIndex!0 (_2!8107 lt!266806) (bvsub lt!266799 lt!266797))))))

(assert (=> b!173372 (or (= (bvand lt!266799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266799 lt!266797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173372 (= lt!266797 (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!266703))) (currentByte!8634 (_2!8106 lt!266703)) (currentBit!8629 (_2!8106 lt!266703))))))

(assert (=> b!173372 (= lt!266799 (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)))))

(declare-fun b!173373 () Bool)

(declare-fun Unit!12409 () Unit!12407)

(assert (=> b!173373 (= e!121034 Unit!12409)))

(declare-fun b!173374 () Bool)

(declare-fun res!143606 () Bool)

(assert (=> b!173374 (=> (not res!143606) (not e!121035))))

(assert (=> b!173374 (= res!143606 (isPrefixOf!0 (_2!8107 lt!266806) (_2!8106 lt!266703)))))

(assert (= (and d!61221 c!9108) b!173371))

(assert (= (and d!61221 (not c!9108)) b!173373))

(assert (= (and d!61221 res!143608) b!173370))

(assert (= (and b!173370 res!143607) b!173374))

(assert (= (and b!173374 res!143606) b!173372))

(assert (=> b!173371 m!272431))

(declare-fun m!272455 () Bool)

(assert (=> b!173371 m!272455))

(declare-fun m!272457 () Bool)

(assert (=> b!173371 m!272457))

(declare-fun m!272459 () Bool)

(assert (=> d!61221 m!272459))

(assert (=> d!61221 m!272415))

(declare-fun m!272461 () Bool)

(assert (=> d!61221 m!272461))

(declare-fun m!272463 () Bool)

(assert (=> d!61221 m!272463))

(declare-fun m!272465 () Bool)

(assert (=> d!61221 m!272465))

(declare-fun m!272467 () Bool)

(assert (=> d!61221 m!272467))

(declare-fun m!272469 () Bool)

(assert (=> d!61221 m!272469))

(declare-fun m!272471 () Bool)

(assert (=> d!61221 m!272471))

(declare-fun m!272473 () Bool)

(assert (=> d!61221 m!272473))

(declare-fun m!272475 () Bool)

(assert (=> d!61221 m!272475))

(declare-fun m!272477 () Bool)

(assert (=> d!61221 m!272477))

(declare-fun m!272479 () Bool)

(assert (=> b!173374 m!272479))

(declare-fun m!272481 () Bool)

(assert (=> b!173372 m!272481))

(assert (=> b!173372 m!272429))

(assert (=> b!173372 m!272431))

(declare-fun m!272483 () Bool)

(assert (=> b!173370 m!272483))

(assert (=> b!173321 d!61221))

(declare-fun d!61249 () Bool)

(assert (=> d!61249 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15254 () Bool)

(assert (= bs!15254 d!61249))

(declare-fun m!272485 () Bool)

(assert (=> bs!15254 m!272485))

(assert (=> b!173322 d!61249))

(declare-fun d!61251 () Bool)

(assert (=> d!61251 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187))))))

(declare-fun bs!15255 () Bool)

(assert (= bs!15255 d!61251))

(assert (=> bs!15255 m!272409))

(assert (=> start!38524 d!61251))

(declare-fun d!61253 () Bool)

(declare-fun res!143616 () Bool)

(declare-fun e!121040 () Bool)

(assert (=> d!61253 (=> (not res!143616) (not e!121040))))

(assert (=> d!61253 (= res!143616 (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!266703)))))))

(assert (=> d!61253 (= (isPrefixOf!0 thiss!1187 (_2!8106 lt!266703)) e!121040)))

(declare-fun b!173381 () Bool)

(declare-fun res!143615 () Bool)

(assert (=> b!173381 (=> (not res!143615) (not e!121040))))

(assert (=> b!173381 (= res!143615 (bvsle (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!266703))) (currentByte!8634 (_2!8106 lt!266703)) (currentBit!8629 (_2!8106 lt!266703)))))))

(declare-fun b!173382 () Bool)

(declare-fun e!121041 () Bool)

(assert (=> b!173382 (= e!121040 e!121041)))

(declare-fun res!143617 () Bool)

(assert (=> b!173382 (=> res!143617 e!121041)))

(assert (=> b!173382 (= res!143617 (= (size!4119 (buf!4547 thiss!1187)) #b00000000000000000000000000000000))))

(declare-fun b!173383 () Bool)

(assert (=> b!173383 (= e!121041 (arrayBitRangesEq!0 (buf!4547 thiss!1187) (buf!4547 (_2!8106 lt!266703)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187))))))

(assert (= (and d!61253 res!143616) b!173381))

(assert (= (and b!173381 res!143615) b!173382))

(assert (= (and b!173382 (not res!143617)) b!173383))

(assert (=> b!173381 m!272431))

(assert (=> b!173381 m!272429))

(assert (=> b!173383 m!272431))

(assert (=> b!173383 m!272431))

(declare-fun m!272487 () Bool)

(assert (=> b!173383 m!272487))

(assert (=> b!173323 d!61253))

(declare-fun d!61255 () Bool)

(declare-fun e!121044 () Bool)

(assert (=> d!61255 e!121044))

(declare-fun res!143623 () Bool)

(assert (=> d!61255 (=> (not res!143623) (not e!121044))))

(declare-fun lt!266831 () (_ BitVec 64))

(declare-fun lt!266829 () (_ BitVec 64))

(declare-fun lt!266834 () (_ BitVec 64))

(assert (=> d!61255 (= res!143623 (= lt!266831 (bvsub lt!266829 lt!266834)))))

(assert (=> d!61255 (or (= (bvand lt!266829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266829 lt!266834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61255 (= lt!266834 (remainingBits!0 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))) ((_ sign_extend 32) (currentByte!8634 (_2!8106 lt!266703))) ((_ sign_extend 32) (currentBit!8629 (_2!8106 lt!266703)))))))

(declare-fun lt!266832 () (_ BitVec 64))

(declare-fun lt!266833 () (_ BitVec 64))

(assert (=> d!61255 (= lt!266829 (bvmul lt!266832 lt!266833))))

(assert (=> d!61255 (or (= lt!266832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266833 (bvsdiv (bvmul lt!266832 lt!266833) lt!266832)))))

(assert (=> d!61255 (= lt!266833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61255 (= lt!266832 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))))))

(assert (=> d!61255 (= lt!266831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8634 (_2!8106 lt!266703))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8629 (_2!8106 lt!266703)))))))

(assert (=> d!61255 (invariant!0 (currentBit!8629 (_2!8106 lt!266703)) (currentByte!8634 (_2!8106 lt!266703)) (size!4119 (buf!4547 (_2!8106 lt!266703))))))

(assert (=> d!61255 (= (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!266703))) (currentByte!8634 (_2!8106 lt!266703)) (currentBit!8629 (_2!8106 lt!266703))) lt!266831)))

(declare-fun b!173388 () Bool)

(declare-fun res!143622 () Bool)

(assert (=> b!173388 (=> (not res!143622) (not e!121044))))

(assert (=> b!173388 (= res!143622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266831))))

(declare-fun b!173389 () Bool)

(declare-fun lt!266830 () (_ BitVec 64))

(assert (=> b!173389 (= e!121044 (bvsle lt!266831 (bvmul lt!266830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173389 (or (= lt!266830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266830)))))

(assert (=> b!173389 (= lt!266830 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!266703)))))))

(assert (= (and d!61255 res!143623) b!173388))

(assert (= (and b!173388 res!143622) b!173389))

(declare-fun m!272489 () Bool)

(assert (=> d!61255 m!272489))

(declare-fun m!272491 () Bool)

(assert (=> d!61255 m!272491))

(assert (=> b!173318 d!61255))

(declare-fun d!61257 () Bool)

(declare-fun e!121045 () Bool)

(assert (=> d!61257 e!121045))

(declare-fun res!143625 () Bool)

(assert (=> d!61257 (=> (not res!143625) (not e!121045))))

(declare-fun lt!266837 () (_ BitVec 64))

(declare-fun lt!266840 () (_ BitVec 64))

(declare-fun lt!266835 () (_ BitVec 64))

(assert (=> d!61257 (= res!143625 (= lt!266837 (bvsub lt!266835 lt!266840)))))

(assert (=> d!61257 (or (= (bvand lt!266835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266835 lt!266840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61257 (= lt!266840 (remainingBits!0 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187))))))

(declare-fun lt!266838 () (_ BitVec 64))

(declare-fun lt!266839 () (_ BitVec 64))

(assert (=> d!61257 (= lt!266835 (bvmul lt!266838 lt!266839))))

(assert (=> d!61257 (or (= lt!266838 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266839 (bvsdiv (bvmul lt!266838 lt!266839) lt!266838)))))

(assert (=> d!61257 (= lt!266839 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61257 (= lt!266838 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))))))

(assert (=> d!61257 (= lt!266837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8634 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8629 thiss!1187))))))

(assert (=> d!61257 (invariant!0 (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187)))))

(assert (=> d!61257 (= (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) lt!266837)))

(declare-fun b!173390 () Bool)

(declare-fun res!143624 () Bool)

(assert (=> b!173390 (=> (not res!143624) (not e!121045))))

(assert (=> b!173390 (= res!143624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266837))))

(declare-fun b!173391 () Bool)

(declare-fun lt!266836 () (_ BitVec 64))

(assert (=> b!173391 (= e!121045 (bvsle lt!266837 (bvmul lt!266836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!173391 (or (= lt!266836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266836)))))

(assert (=> b!173391 (= lt!266836 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))))))

(assert (= (and d!61257 res!143625) b!173390))

(assert (= (and b!173390 res!143624) b!173391))

(assert (=> d!61257 m!272485))

(assert (=> d!61257 m!272409))

(assert (=> b!173318 d!61257))

(declare-fun d!61259 () Bool)

(assert (=> d!61259 (= (invariant!0 (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187))) (and (bvsge (currentBit!8629 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8629 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8634 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187))) (and (= (currentBit!8629 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8634 thiss!1187) (size!4119 (buf!4547 thiss!1187)))))))))

(assert (=> b!173324 d!61259))

(declare-fun d!61261 () Bool)

(assert (=> d!61261 (= (array_inv!3860 (buf!4547 thiss!1187)) (bvsge (size!4119 (buf!4547 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173319 d!61261))

(declare-fun b!173483 () Bool)

(declare-fun e!121095 () tuple2!14928)

(declare-fun lt!267181 () tuple2!14928)

(assert (=> b!173483 (= e!121095 (tuple2!14929 (_1!8106 lt!267181) (_2!8106 lt!267181)))))

(declare-fun lt!267218 () Bool)

(assert (=> b!173483 (= lt!267218 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!267197 () tuple2!14928)

(declare-fun appendBit!0 (BitStream!7346 Bool) tuple2!14928)

(assert (=> b!173483 (= lt!267197 (appendBit!0 thiss!1187 lt!267218))))

(declare-fun res!143703 () Bool)

(assert (=> b!173483 (= res!143703 (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!267197)))))))

(declare-fun e!121096 () Bool)

(assert (=> b!173483 (=> (not res!143703) (not e!121096))))

(assert (=> b!173483 e!121096))

(declare-fun lt!267217 () tuple2!14928)

(assert (=> b!173483 (= lt!267217 lt!267197)))

(assert (=> b!173483 (= lt!267181 (appendBitsLSBFirstLoopTR!0 (_2!8106 lt!267217) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!267178 () Unit!12407)

(assert (=> b!173483 (= lt!267178 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8106 lt!267217) (_2!8106 lt!267181)))))

(declare-fun call!2864 () Bool)

(assert (=> b!173483 call!2864))

(declare-fun lt!267175 () Unit!12407)

(assert (=> b!173483 (= lt!267175 lt!267178)))

(assert (=> b!173483 (invariant!0 (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187) (size!4119 (buf!4547 (_2!8106 lt!267217))))))

(declare-fun lt!267216 () BitStream!7346)

(assert (=> b!173483 (= lt!267216 (BitStream!7347 (buf!4547 (_2!8106 lt!267217)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)))))

(assert (=> b!173483 (invariant!0 (currentBit!8629 lt!267216) (currentByte!8634 lt!267216) (size!4119 (buf!4547 (_2!8106 lt!267181))))))

(declare-fun lt!267169 () BitStream!7346)

(assert (=> b!173483 (= lt!267169 (BitStream!7347 (buf!4547 (_2!8106 lt!267181)) (currentByte!8634 lt!267216) (currentBit!8629 lt!267216)))))

(declare-datatypes ((tuple2!14936 0))(
  ( (tuple2!14937 (_1!8110 BitStream!7346) (_2!8110 Bool)) )
))
(declare-fun lt!267184 () tuple2!14936)

(declare-fun readBitPure!0 (BitStream!7346) tuple2!14936)

(assert (=> b!173483 (= lt!267184 (readBitPure!0 lt!267216))))

(declare-fun lt!267164 () tuple2!14936)

(assert (=> b!173483 (= lt!267164 (readBitPure!0 lt!267169))))

(declare-fun lt!267182 () Unit!12407)

(declare-fun readBitPrefixLemma!0 (BitStream!7346 BitStream!7346) Unit!12407)

(assert (=> b!173483 (= lt!267182 (readBitPrefixLemma!0 lt!267216 (_2!8106 lt!267181)))))

(declare-fun res!143694 () Bool)

(assert (=> b!173483 (= res!143694 (= (bitIndex!0 (size!4119 (buf!4547 (_1!8110 lt!267184))) (currentByte!8634 (_1!8110 lt!267184)) (currentBit!8629 (_1!8110 lt!267184))) (bitIndex!0 (size!4119 (buf!4547 (_1!8110 lt!267164))) (currentByte!8634 (_1!8110 lt!267164)) (currentBit!8629 (_1!8110 lt!267164)))))))

(declare-fun e!121097 () Bool)

(assert (=> b!173483 (=> (not res!143694) (not e!121097))))

(assert (=> b!173483 e!121097))

(declare-fun lt!267207 () Unit!12407)

(assert (=> b!173483 (= lt!267207 lt!267182)))

(declare-fun lt!267192 () tuple2!14930)

(assert (=> b!173483 (= lt!267192 (reader!0 thiss!1187 (_2!8106 lt!267181)))))

(declare-fun lt!267177 () tuple2!14930)

(assert (=> b!173483 (= lt!267177 (reader!0 (_2!8106 lt!267217) (_2!8106 lt!267181)))))

(declare-fun lt!267171 () tuple2!14936)

(assert (=> b!173483 (= lt!267171 (readBitPure!0 (_1!8107 lt!267192)))))

(assert (=> b!173483 (= (_2!8110 lt!267171) lt!267218)))

(declare-fun lt!267210 () Unit!12407)

(declare-fun Unit!12421 () Unit!12407)

(assert (=> b!173483 (= lt!267210 Unit!12421)))

(declare-fun lt!267176 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173483 (= lt!267176 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!267165 () (_ BitVec 64))

(assert (=> b!173483 (= lt!267165 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267194 () Unit!12407)

(assert (=> b!173483 (= lt!267194 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4547 (_2!8106 lt!267181)) lt!267165))))

(assert (=> b!173483 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!267181)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) lt!267165)))

(declare-fun lt!267190 () Unit!12407)

(assert (=> b!173483 (= lt!267190 lt!267194)))

(declare-datatypes ((tuple2!14938 0))(
  ( (tuple2!14939 (_1!8111 BitStream!7346) (_2!8111 (_ BitVec 64))) )
))
(declare-fun lt!267167 () tuple2!14938)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14938)

(assert (=> b!173483 (= lt!267167 (readNBitsLSBFirstsLoopPure!0 (_1!8107 lt!267192) nBits!340 #b00000000000000000000000000000000 lt!267176))))

(declare-fun lt!267174 () (_ BitVec 64))

(assert (=> b!173483 (= lt!267174 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!267195 () Unit!12407)

(assert (=> b!173483 (= lt!267195 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8106 lt!267217) (buf!4547 (_2!8106 lt!267181)) lt!267174))))

(assert (=> b!173483 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!267181)))) ((_ sign_extend 32) (currentByte!8634 (_2!8106 lt!267217))) ((_ sign_extend 32) (currentBit!8629 (_2!8106 lt!267217))) lt!267174)))

(declare-fun lt!267183 () Unit!12407)

(assert (=> b!173483 (= lt!267183 lt!267195)))

(declare-fun lt!267203 () tuple2!14938)

(assert (=> b!173483 (= lt!267203 (readNBitsLSBFirstsLoopPure!0 (_1!8107 lt!267177) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267176 (ite (_2!8110 lt!267171) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!267211 () tuple2!14938)

(assert (=> b!173483 (= lt!267211 (readNBitsLSBFirstsLoopPure!0 (_1!8107 lt!267192) nBits!340 #b00000000000000000000000000000000 lt!267176))))

(declare-fun c!9122 () Bool)

(assert (=> b!173483 (= c!9122 (_2!8110 (readBitPure!0 (_1!8107 lt!267192))))))

(declare-fun e!121100 () (_ BitVec 64))

(declare-fun lt!267180 () tuple2!14938)

(assert (=> b!173483 (= lt!267180 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8107 lt!267192) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!267176 e!121100)))))

(declare-fun lt!267187 () Unit!12407)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12407)

(assert (=> b!173483 (= lt!267187 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8107 lt!267192) nBits!340 #b00000000000000000000000000000000 lt!267176))))

(assert (=> b!173483 (and (= (_2!8111 lt!267211) (_2!8111 lt!267180)) (= (_1!8111 lt!267211) (_1!8111 lt!267180)))))

(declare-fun lt!267198 () Unit!12407)

(assert (=> b!173483 (= lt!267198 lt!267187)))

(assert (=> b!173483 (= (_1!8107 lt!267192) (withMovedBitIndex!0 (_2!8107 lt!267192) (bvsub (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267181))) (currentByte!8634 (_2!8106 lt!267181)) (currentBit!8629 (_2!8106 lt!267181))))))))

(declare-fun lt!267191 () Unit!12407)

(declare-fun Unit!12423 () Unit!12407)

(assert (=> b!173483 (= lt!267191 Unit!12423)))

(assert (=> b!173483 (= (_1!8107 lt!267177) (withMovedBitIndex!0 (_2!8107 lt!267177) (bvsub (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267217))) (currentByte!8634 (_2!8106 lt!267217)) (currentBit!8629 (_2!8106 lt!267217))) (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267181))) (currentByte!8634 (_2!8106 lt!267181)) (currentBit!8629 (_2!8106 lt!267181))))))))

(declare-fun lt!267173 () Unit!12407)

(declare-fun Unit!12424 () Unit!12407)

(assert (=> b!173483 (= lt!267173 Unit!12424)))

(assert (=> b!173483 (= (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) (bvsub (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267217))) (currentByte!8634 (_2!8106 lt!267217)) (currentBit!8629 (_2!8106 lt!267217))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!267189 () Unit!12407)

(declare-fun Unit!12425 () Unit!12407)

(assert (=> b!173483 (= lt!267189 Unit!12425)))

(assert (=> b!173483 (= (_2!8111 lt!267167) (_2!8111 lt!267203))))

(declare-fun lt!267179 () Unit!12407)

(declare-fun Unit!12426 () Unit!12407)

(assert (=> b!173483 (= lt!267179 Unit!12426)))

(assert (=> b!173483 (invariant!0 (currentBit!8629 (_2!8106 lt!267181)) (currentByte!8634 (_2!8106 lt!267181)) (size!4119 (buf!4547 (_2!8106 lt!267181))))))

(declare-fun lt!267168 () Unit!12407)

(declare-fun Unit!12427 () Unit!12407)

(assert (=> b!173483 (= lt!267168 Unit!12427)))

(assert (=> b!173483 (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!267181))))))

(declare-fun lt!267201 () Unit!12407)

(declare-fun Unit!12428 () Unit!12407)

(assert (=> b!173483 (= lt!267201 Unit!12428)))

(assert (=> b!173483 (= (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267181))) (currentByte!8634 (_2!8106 lt!267181)) (currentBit!8629 (_2!8106 lt!267181))) (bvsub (bvadd (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!267185 () Unit!12407)

(declare-fun Unit!12429 () Unit!12407)

(assert (=> b!173483 (= lt!267185 Unit!12429)))

(declare-fun lt!267219 () Unit!12407)

(declare-fun Unit!12430 () Unit!12407)

(assert (=> b!173483 (= lt!267219 Unit!12430)))

(declare-fun lt!267193 () tuple2!14930)

(assert (=> b!173483 (= lt!267193 (reader!0 thiss!1187 (_2!8106 lt!267181)))))

(declare-fun lt!267205 () (_ BitVec 64))

(assert (=> b!173483 (= lt!267205 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!267166 () Unit!12407)

(assert (=> b!173483 (= lt!267166 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4547 (_2!8106 lt!267181)) lt!267205))))

(assert (=> b!173483 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!267181)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) lt!267205)))

(declare-fun lt!267209 () Unit!12407)

(assert (=> b!173483 (= lt!267209 lt!267166)))

(declare-fun lt!267202 () tuple2!14938)

(assert (=> b!173483 (= lt!267202 (readNBitsLSBFirstsLoopPure!0 (_1!8107 lt!267193) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143699 () Bool)

(assert (=> b!173483 (= res!143699 (= (_2!8111 lt!267202) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121098 () Bool)

(assert (=> b!173483 (=> (not res!143699) (not e!121098))))

(assert (=> b!173483 e!121098))

(declare-fun lt!267214 () Unit!12407)

(declare-fun Unit!12431 () Unit!12407)

(assert (=> b!173483 (= lt!267214 Unit!12431)))

(declare-fun b!173484 () Bool)

(declare-fun res!143698 () Bool)

(declare-fun e!121103 () Bool)

(assert (=> b!173484 (=> (not res!143698) (not e!121103))))

(declare-fun lt!267213 () (_ BitVec 64))

(declare-fun lt!267200 () tuple2!14928)

(declare-fun lt!267186 () (_ BitVec 64))

(assert (=> b!173484 (= res!143698 (= (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267200))) (currentByte!8634 (_2!8106 lt!267200)) (currentBit!8629 (_2!8106 lt!267200))) (bvsub lt!267213 lt!267186)))))

(assert (=> b!173484 (or (= (bvand lt!267213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!267213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!267213 lt!267186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173484 (= lt!267186 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!267215 () (_ BitVec 64))

(declare-fun lt!267206 () (_ BitVec 64))

(assert (=> b!173484 (= lt!267213 (bvadd lt!267215 lt!267206))))

(assert (=> b!173484 (or (not (= (bvand lt!267215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!267206 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!267215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!267215 lt!267206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173484 (= lt!267206 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173484 (= lt!267215 (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)))))

(declare-fun b!173485 () Bool)

(declare-fun e!121102 () Bool)

(declare-fun lt!267170 () tuple2!14936)

(assert (=> b!173485 (= e!121102 (= (bitIndex!0 (size!4119 (buf!4547 (_1!8110 lt!267170))) (currentByte!8634 (_1!8110 lt!267170)) (currentBit!8629 (_1!8110 lt!267170))) (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267197))) (currentByte!8634 (_2!8106 lt!267197)) (currentBit!8629 (_2!8106 lt!267197)))))))

(declare-fun b!173486 () Bool)

(assert (=> b!173486 (= e!121100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!173487 () Bool)

(declare-fun readerFrom!0 (BitStream!7346 (_ BitVec 32) (_ BitVec 32)) BitStream!7346)

(assert (=> b!173487 (= lt!267170 (readBitPure!0 (readerFrom!0 (_2!8106 lt!267197) (currentBit!8629 thiss!1187) (currentByte!8634 thiss!1187))))))

(declare-fun res!143693 () Bool)

(assert (=> b!173487 (= res!143693 (and (= (_2!8110 lt!267170) lt!267218) (= (_1!8110 lt!267170) (_2!8106 lt!267197))))))

(assert (=> b!173487 (=> (not res!143693) (not e!121102))))

(assert (=> b!173487 (= e!121096 e!121102)))

(declare-fun b!173488 () Bool)

(declare-fun e!121101 () Bool)

(declare-fun lt!267208 () tuple2!14938)

(declare-fun lt!267196 () tuple2!14930)

(assert (=> b!173488 (= e!121101 (= (_1!8111 lt!267208) (_2!8107 lt!267196)))))

(declare-fun bm!2861 () Bool)

(declare-fun c!9121 () Bool)

(assert (=> bm!2861 (= call!2864 (isPrefixOf!0 thiss!1187 (ite c!9121 thiss!1187 (_2!8106 lt!267181))))))

(declare-fun b!173489 () Bool)

(declare-fun Unit!12432 () Unit!12407)

(assert (=> b!173489 (= e!121095 (tuple2!14929 Unit!12432 thiss!1187))))

(declare-fun lt!267188 () Unit!12407)

(assert (=> b!173489 (= lt!267188 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!173489 call!2864))

(declare-fun lt!267212 () Unit!12407)

(assert (=> b!173489 (= lt!267212 lt!267188)))

(declare-fun b!173490 () Bool)

(declare-fun res!143696 () Bool)

(assert (=> b!173490 (= res!143696 (isPrefixOf!0 thiss!1187 (_2!8106 lt!267197)))))

(assert (=> b!173490 (=> (not res!143696) (not e!121096))))

(declare-fun b!173482 () Bool)

(declare-fun e!121099 () Bool)

(declare-fun lt!267204 () (_ BitVec 64))

(assert (=> b!173482 (= e!121099 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 thiss!1187))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) lt!267204))))

(declare-fun d!61263 () Bool)

(assert (=> d!61263 e!121103))

(declare-fun res!143695 () Bool)

(assert (=> d!61263 (=> (not res!143695) (not e!121103))))

(assert (=> d!61263 (= res!143695 (invariant!0 (currentBit!8629 (_2!8106 lt!267200)) (currentByte!8634 (_2!8106 lt!267200)) (size!4119 (buf!4547 (_2!8106 lt!267200)))))))

(assert (=> d!61263 (= lt!267200 e!121095)))

(assert (=> d!61263 (= c!9121 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61263 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61263 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!267200)))

(declare-fun b!173491 () Bool)

(assert (=> b!173491 (= e!121103 e!121101)))

(declare-fun res!143702 () Bool)

(assert (=> b!173491 (=> (not res!143702) (not e!121101))))

(assert (=> b!173491 (= res!143702 (= (_2!8111 lt!267208) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173491 (= lt!267208 (readNBitsLSBFirstsLoopPure!0 (_1!8107 lt!267196) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!267199 () Unit!12407)

(declare-fun lt!267172 () Unit!12407)

(assert (=> b!173491 (= lt!267199 lt!267172)))

(assert (=> b!173491 (validate_offset_bits!1 ((_ sign_extend 32) (size!4119 (buf!4547 (_2!8106 lt!267200)))) ((_ sign_extend 32) (currentByte!8634 thiss!1187)) ((_ sign_extend 32) (currentBit!8629 thiss!1187)) lt!267204)))

(assert (=> b!173491 (= lt!267172 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4547 (_2!8106 lt!267200)) lt!267204))))

(assert (=> b!173491 e!121099))

(declare-fun res!143692 () Bool)

(assert (=> b!173491 (=> (not res!143692) (not e!121099))))

(assert (=> b!173491 (= res!143692 (and (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!267200)))) (bvsge lt!267204 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173491 (= lt!267204 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173491 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!173491 (= lt!267196 (reader!0 thiss!1187 (_2!8106 lt!267200)))))

(declare-fun b!173492 () Bool)

(declare-fun res!143701 () Bool)

(assert (=> b!173492 (=> (not res!143701) (not e!121103))))

(assert (=> b!173492 (= res!143701 (= (size!4119 (buf!4547 thiss!1187)) (size!4119 (buf!4547 (_2!8106 lt!267200)))))))

(declare-fun b!173493 () Bool)

(declare-fun res!143700 () Bool)

(assert (=> b!173493 (=> (not res!143700) (not e!121103))))

(assert (=> b!173493 (= res!143700 (isPrefixOf!0 thiss!1187 (_2!8106 lt!267200)))))

(declare-fun b!173494 () Bool)

(assert (=> b!173494 (= e!121100 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!173495 () Bool)

(assert (=> b!173495 (= e!121098 (= (_1!8111 lt!267202) (_2!8107 lt!267193)))))

(declare-fun b!173496 () Bool)

(declare-fun res!143697 () Bool)

(assert (=> b!173496 (= res!143697 (= (bitIndex!0 (size!4119 (buf!4547 (_2!8106 lt!267197))) (currentByte!8634 (_2!8106 lt!267197)) (currentBit!8629 (_2!8106 lt!267197))) (bvadd (bitIndex!0 (size!4119 (buf!4547 thiss!1187)) (currentByte!8634 thiss!1187) (currentBit!8629 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!173496 (=> (not res!143697) (not e!121096))))

(declare-fun b!173497 () Bool)

(assert (=> b!173497 (= e!121097 (= (_2!8110 lt!267184) (_2!8110 lt!267164)))))

(assert (= (and d!61263 c!9121) b!173489))

(assert (= (and d!61263 (not c!9121)) b!173483))

(assert (= (and b!173483 res!143703) b!173496))

(assert (= (and b!173496 res!143697) b!173490))

(assert (= (and b!173490 res!143696) b!173487))

(assert (= (and b!173487 res!143693) b!173485))

(assert (= (and b!173483 res!143694) b!173497))

(assert (= (and b!173483 c!9122) b!173494))

(assert (= (and b!173483 (not c!9122)) b!173486))

(assert (= (and b!173483 res!143699) b!173495))

(assert (= (or b!173489 b!173483) bm!2861))

(assert (= (and d!61263 res!143695) b!173492))

(assert (= (and b!173492 res!143701) b!173484))

(assert (= (and b!173484 res!143698) b!173493))

(assert (= (and b!173493 res!143700) b!173491))

(assert (= (and b!173491 res!143692) b!173482))

(assert (= (and b!173491 res!143702) b!173488))

(declare-fun m!272605 () Bool)

(assert (=> bm!2861 m!272605))

(declare-fun m!272611 () Bool)

(assert (=> b!173487 m!272611))

(assert (=> b!173487 m!272611))

(declare-fun m!272617 () Bool)

(assert (=> b!173487 m!272617))

(declare-fun m!272623 () Bool)

(assert (=> b!173482 m!272623))

(declare-fun m!272629 () Bool)

(assert (=> b!173496 m!272629))

(assert (=> b!173496 m!272431))

(declare-fun m!272631 () Bool)

(assert (=> b!173483 m!272631))

(declare-fun m!272633 () Bool)

(assert (=> b!173483 m!272633))

(declare-fun m!272635 () Bool)

(assert (=> b!173483 m!272635))

(declare-fun m!272637 () Bool)

(assert (=> b!173483 m!272637))

(declare-fun m!272639 () Bool)

(assert (=> b!173483 m!272639))

(declare-fun m!272641 () Bool)

(assert (=> b!173483 m!272641))

(declare-fun m!272643 () Bool)

(assert (=> b!173483 m!272643))

(declare-fun m!272645 () Bool)

(assert (=> b!173483 m!272645))

(declare-fun m!272647 () Bool)

(assert (=> b!173483 m!272647))

(declare-fun m!272649 () Bool)

(assert (=> b!173483 m!272649))

(declare-fun m!272651 () Bool)

(assert (=> b!173483 m!272651))

(declare-fun m!272653 () Bool)

(assert (=> b!173483 m!272653))

(declare-fun m!272655 () Bool)

(assert (=> b!173483 m!272655))

(declare-fun m!272657 () Bool)

(assert (=> b!173483 m!272657))

(declare-fun m!272659 () Bool)

(assert (=> b!173483 m!272659))

(declare-fun m!272661 () Bool)

(assert (=> b!173483 m!272661))

(declare-fun m!272663 () Bool)

(assert (=> b!173483 m!272663))

(declare-fun m!272665 () Bool)

(assert (=> b!173483 m!272665))

(declare-fun m!272667 () Bool)

(assert (=> b!173483 m!272667))

(declare-fun m!272669 () Bool)

(assert (=> b!173483 m!272669))

(declare-fun m!272671 () Bool)

(assert (=> b!173483 m!272671))

(assert (=> b!173483 m!272637))

(declare-fun m!272673 () Bool)

(assert (=> b!173483 m!272673))

(declare-fun m!272675 () Bool)

(assert (=> b!173483 m!272675))

(declare-fun m!272677 () Bool)

(assert (=> b!173483 m!272677))

(assert (=> b!173483 m!272431))

(declare-fun m!272679 () Bool)

(assert (=> b!173483 m!272679))

(declare-fun m!272681 () Bool)

(assert (=> b!173483 m!272681))

(declare-fun m!272683 () Bool)

(assert (=> b!173483 m!272683))

(declare-fun m!272685 () Bool)

(assert (=> b!173483 m!272685))

(declare-fun m!272687 () Bool)

(assert (=> b!173483 m!272687))

(declare-fun m!272689 () Bool)

(assert (=> b!173483 m!272689))

(declare-fun m!272691 () Bool)

(assert (=> b!173483 m!272691))

(declare-fun m!272693 () Bool)

(assert (=> b!173483 m!272693))

(declare-fun m!272695 () Bool)

(assert (=> b!173490 m!272695))

(declare-fun m!272697 () Bool)

(assert (=> b!173485 m!272697))

(assert (=> b!173485 m!272629))

(assert (=> b!173489 m!272477))

(assert (=> b!173491 m!272633))

(declare-fun m!272699 () Bool)

(assert (=> b!173491 m!272699))

(assert (=> b!173491 m!272675))

(declare-fun m!272701 () Bool)

(assert (=> b!173491 m!272701))

(declare-fun m!272703 () Bool)

(assert (=> b!173491 m!272703))

(declare-fun m!272705 () Bool)

(assert (=> b!173491 m!272705))

(declare-fun m!272707 () Bool)

(assert (=> b!173493 m!272707))

(declare-fun m!272709 () Bool)

(assert (=> d!61263 m!272709))

(declare-fun m!272711 () Bool)

(assert (=> b!173484 m!272711))

(assert (=> b!173484 m!272431))

(assert (=> b!173320 d!61263))

(push 1)

(assert (not d!61251))

(assert (not b!173490))

(assert (not b!173496))

(assert (not d!61255))

(assert (not b!173370))

(assert (not b!173371))

(assert (not d!61219))

(assert (not d!61257))

(assert (not b!173383))

(assert (not b!173374))

(assert (not b!173491))

(assert (not d!61221))

(assert (not b!173484))

(assert (not b!173482))

(assert (not bm!2861))

(assert (not d!61263))

(assert (not d!61217))

(assert (not b!173485))

(assert (not b!173381))

(assert (not b!173489))

(assert (not b!173372))

(assert (not d!61249))

(assert (not b!173483))

(assert (not d!61215))

(assert (not b!173493))

(assert (not b!173487))

(check-sat)

(pop 1)

(push 1)

(check-sat)

