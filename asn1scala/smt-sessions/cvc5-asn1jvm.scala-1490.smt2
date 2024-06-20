; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41270 () Bool)

(assert start!41270)

(declare-fun b!192062 () Bool)

(declare-fun res!160372 () Bool)

(declare-fun e!132369 () Bool)

(assert (=> b!192062 (=> res!160372 e!132369)))

(declare-datatypes ((array!9944 0))(
  ( (array!9945 (arr!5314 (Array (_ BitVec 32) (_ BitVec 8))) (size!4384 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7876 0))(
  ( (BitStream!7877 (buf!4864 array!9944) (currentByte!9148 (_ BitVec 32)) (currentBit!9143 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13645 0))(
  ( (Unit!13646) )
))
(declare-datatypes ((tuple2!16604 0))(
  ( (tuple2!16605 (_1!8947 Unit!13645) (_2!8947 BitStream!7876)) )
))
(declare-fun lt!298717 () tuple2!16604)

(declare-fun lt!298710 () tuple2!16604)

(declare-fun isPrefixOf!0 (BitStream!7876 BitStream!7876) Bool)

(assert (=> b!192062 (= res!160372 (not (isPrefixOf!0 (_2!8947 lt!298717) (_2!8947 lt!298710))))))

(declare-fun lt!298718 () (_ BitVec 64))

(declare-datatypes ((tuple2!16606 0))(
  ( (tuple2!16607 (_1!8948 BitStream!7876) (_2!8948 BitStream!7876)) )
))
(declare-fun lt!298732 () tuple2!16606)

(declare-datatypes ((tuple2!16608 0))(
  ( (tuple2!16609 (_1!8949 BitStream!7876) (_2!8949 (_ BitVec 64))) )
))
(declare-fun lt!298712 () tuple2!16608)

(declare-fun e!132371 () Bool)

(declare-fun lt!298726 () BitStream!7876)

(declare-fun b!192063 () Bool)

(declare-fun lt!298737 () tuple2!16608)

(declare-fun lt!298734 () (_ BitVec 64))

(assert (=> b!192063 (= e!132371 (and (= lt!298718 (bvsub lt!298734 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8948 lt!298732) lt!298726)) (= (_2!8949 lt!298712) (_2!8949 lt!298737)))))))

(declare-fun b!192064 () Bool)

(declare-fun res!160356 () Bool)

(assert (=> b!192064 (=> (not res!160356) (not e!132371))))

(declare-fun lt!298729 () (_ BitVec 64))

(declare-fun lt!298723 () tuple2!16606)

(declare-fun withMovedBitIndex!0 (BitStream!7876 (_ BitVec 64)) BitStream!7876)

(assert (=> b!192064 (= res!160356 (= (_1!8948 lt!298723) (withMovedBitIndex!0 (_2!8948 lt!298723) (bvsub lt!298718 lt!298729))))))

(declare-fun b!192065 () Bool)

(declare-fun e!132359 () Bool)

(declare-datatypes ((tuple2!16610 0))(
  ( (tuple2!16611 (_1!8950 BitStream!7876) (_2!8950 Bool)) )
))
(declare-fun lt!298715 () tuple2!16610)

(declare-fun lt!298725 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192065 (= e!132359 (= (bitIndex!0 (size!4384 (buf!4864 (_1!8950 lt!298715))) (currentByte!9148 (_1!8950 lt!298715)) (currentBit!9143 (_1!8950 lt!298715))) lt!298725))))

(declare-fun b!192066 () Bool)

(declare-fun res!160367 () Bool)

(declare-fun e!132365 () Bool)

(assert (=> b!192066 (=> (not res!160367) (not e!132365))))

(declare-fun thiss!1204 () BitStream!7876)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192066 (= res!160367 (invariant!0 (currentBit!9143 thiss!1204) (currentByte!9148 thiss!1204) (size!4384 (buf!4864 thiss!1204))))))

(declare-fun b!192067 () Bool)

(declare-fun e!132370 () Bool)

(assert (=> b!192067 (= e!132370 e!132359)))

(declare-fun res!160364 () Bool)

(assert (=> b!192067 (=> (not res!160364) (not e!132359))))

(declare-fun lt!298738 () Bool)

(assert (=> b!192067 (= res!160364 (and (= (_2!8950 lt!298715) lt!298738) (= (_1!8950 lt!298715) (_2!8947 lt!298717))))))

(declare-fun readBitPure!0 (BitStream!7876) tuple2!16610)

(declare-fun readerFrom!0 (BitStream!7876 (_ BitVec 32) (_ BitVec 32)) BitStream!7876)

(assert (=> b!192067 (= lt!298715 (readBitPure!0 (readerFrom!0 (_2!8947 lt!298717) (currentBit!9143 thiss!1204) (currentByte!9148 thiss!1204))))))

(declare-fun b!192068 () Bool)

(declare-fun res!160352 () Bool)

(declare-fun e!132357 () Bool)

(assert (=> b!192068 (=> (not res!160352) (not e!132357))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192068 (= res!160352 (= (_2!8949 lt!298712) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!192069 () Bool)

(declare-fun res!160360 () Bool)

(assert (=> b!192069 (=> (not res!160360) (not e!132371))))

(assert (=> b!192069 (= res!160360 (= (_1!8948 lt!298732) (withMovedBitIndex!0 (_2!8948 lt!298732) (bvsub lt!298734 lt!298729))))))

(declare-fun b!192070 () Bool)

(declare-fun e!132364 () Bool)

(assert (=> b!192070 (= e!132364 e!132370)))

(declare-fun res!160370 () Bool)

(assert (=> b!192070 (=> (not res!160370) (not e!132370))))

(declare-fun lt!298735 () (_ BitVec 64))

(assert (=> b!192070 (= res!160370 (= lt!298725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298735)))))

(assert (=> b!192070 (= lt!298725 (bitIndex!0 (size!4384 (buf!4864 (_2!8947 lt!298717))) (currentByte!9148 (_2!8947 lt!298717)) (currentBit!9143 (_2!8947 lt!298717))))))

(assert (=> b!192070 (= lt!298735 (bitIndex!0 (size!4384 (buf!4864 thiss!1204)) (currentByte!9148 thiss!1204) (currentBit!9143 thiss!1204)))))

(declare-fun b!192071 () Bool)

(declare-fun res!160357 () Bool)

(assert (=> b!192071 (=> res!160357 e!132369)))

(assert (=> b!192071 (= res!160357 (not (invariant!0 (currentBit!9143 (_2!8947 lt!298710)) (currentByte!9148 (_2!8947 lt!298710)) (size!4384 (buf!4864 (_2!8947 lt!298710))))))))

(declare-fun b!192072 () Bool)

(declare-fun e!132362 () Bool)

(declare-fun array_inv!4125 (array!9944) Bool)

(assert (=> b!192072 (= e!132362 (array_inv!4125 (buf!4864 thiss!1204)))))

(declare-fun b!192073 () Bool)

(assert (=> b!192073 (= e!132357 (= (_1!8949 lt!298712) (_2!8948 lt!298723)))))

(declare-fun b!192074 () Bool)

(declare-fun res!160366 () Bool)

(assert (=> b!192074 (=> res!160366 e!132369)))

(assert (=> b!192074 (= res!160366 (not (isPrefixOf!0 thiss!1204 (_2!8947 lt!298717))))))

(declare-fun b!192075 () Bool)

(declare-fun e!132358 () Bool)

(assert (=> b!192075 (= e!132358 (invariant!0 (currentBit!9143 thiss!1204) (currentByte!9148 thiss!1204) (size!4384 (buf!4864 (_2!8947 lt!298710)))))))

(declare-fun b!192076 () Bool)

(declare-fun e!132363 () Bool)

(assert (=> b!192076 (= e!132363 e!132365)))

(declare-fun res!160358 () Bool)

(assert (=> b!192076 (=> (not res!160358) (not e!132365))))

(declare-fun lt!298727 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192076 (= res!160358 (validate_offset_bits!1 ((_ sign_extend 32) (size!4384 (buf!4864 thiss!1204))) ((_ sign_extend 32) (currentByte!9148 thiss!1204)) ((_ sign_extend 32) (currentBit!9143 thiss!1204)) lt!298727))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!192076 (= lt!298727 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192077 () Bool)

(declare-fun res!160362 () Bool)

(declare-fun e!132368 () Bool)

(assert (=> b!192077 (=> res!160362 e!132368)))

(assert (=> b!192077 (= res!160362 (not (= (bitIndex!0 (size!4384 (buf!4864 (_1!8949 lt!298712))) (currentByte!9148 (_1!8949 lt!298712)) (currentBit!9143 (_1!8949 lt!298712))) (bitIndex!0 (size!4384 (buf!4864 (_2!8948 lt!298723))) (currentByte!9148 (_2!8948 lt!298723)) (currentBit!9143 (_2!8948 lt!298723))))))))

(declare-fun b!192078 () Bool)

(declare-fun res!160359 () Bool)

(assert (=> b!192078 (=> (not res!160359) (not e!132370))))

(assert (=> b!192078 (= res!160359 (isPrefixOf!0 thiss!1204 (_2!8947 lt!298717)))))

(declare-fun res!160363 () Bool)

(assert (=> start!41270 (=> (not res!160363) (not e!132363))))

(assert (=> start!41270 (= res!160363 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41270 e!132363))

(assert (=> start!41270 true))

(declare-fun inv!12 (BitStream!7876) Bool)

(assert (=> start!41270 (and (inv!12 thiss!1204) e!132362)))

(declare-fun b!192079 () Bool)

(declare-fun e!132361 () Bool)

(assert (=> b!192079 (= e!132361 e!132369)))

(declare-fun res!160371 () Bool)

(assert (=> b!192079 (=> res!160371 e!132369)))

(assert (=> b!192079 (= res!160371 (not (= lt!298729 (bvsub (bvsub (bvadd lt!298734 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!192079 (= lt!298729 (bitIndex!0 (size!4384 (buf!4864 (_2!8947 lt!298710))) (currentByte!9148 (_2!8947 lt!298710)) (currentBit!9143 (_2!8947 lt!298710))))))

(assert (=> b!192079 (isPrefixOf!0 thiss!1204 (_2!8947 lt!298710))))

(declare-fun lt!298731 () Unit!13645)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7876 BitStream!7876 BitStream!7876) Unit!13645)

(assert (=> b!192079 (= lt!298731 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8947 lt!298717) (_2!8947 lt!298710)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7876 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16604)

(assert (=> b!192079 (= lt!298710 (appendBitsLSBFirstLoopTR!0 (_2!8947 lt!298717) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192080 () Bool)

(assert (=> b!192080 (= e!132365 (not e!132361))))

(declare-fun res!160368 () Bool)

(assert (=> b!192080 (=> res!160368 e!132361)))

(assert (=> b!192080 (= res!160368 (not (= lt!298734 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298718))))))

(assert (=> b!192080 (= lt!298734 (bitIndex!0 (size!4384 (buf!4864 (_2!8947 lt!298717))) (currentByte!9148 (_2!8947 lt!298717)) (currentBit!9143 (_2!8947 lt!298717))))))

(assert (=> b!192080 (= lt!298718 (bitIndex!0 (size!4384 (buf!4864 thiss!1204)) (currentByte!9148 thiss!1204) (currentBit!9143 thiss!1204)))))

(assert (=> b!192080 e!132364))

(declare-fun res!160365 () Bool)

(assert (=> b!192080 (=> (not res!160365) (not e!132364))))

(assert (=> b!192080 (= res!160365 (= (size!4384 (buf!4864 thiss!1204)) (size!4384 (buf!4864 (_2!8947 lt!298717)))))))

(declare-fun appendBit!0 (BitStream!7876 Bool) tuple2!16604)

(assert (=> b!192080 (= lt!298717 (appendBit!0 thiss!1204 lt!298738))))

(declare-fun lt!298730 () (_ BitVec 64))

(assert (=> b!192080 (= lt!298738 (not (= (bvand v!189 lt!298730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192080 (= lt!298730 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192081 () Bool)

(declare-fun e!132367 () Bool)

(assert (=> b!192081 (= e!132367 e!132368)))

(declare-fun res!160369 () Bool)

(assert (=> b!192081 (=> res!160369 e!132368)))

(assert (=> b!192081 (= res!160369 (not (= (_1!8948 lt!298732) lt!298726)))))

(assert (=> b!192081 e!132371))

(declare-fun res!160353 () Bool)

(assert (=> b!192081 (=> (not res!160353) (not e!132371))))

(declare-fun lt!298716 () tuple2!16608)

(assert (=> b!192081 (= res!160353 (and (= (_2!8949 lt!298712) (_2!8949 lt!298716)) (= (_1!8949 lt!298712) (_1!8949 lt!298716))))))

(declare-fun lt!298736 () (_ BitVec 64))

(declare-fun lt!298713 () Unit!13645)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13645)

(assert (=> b!192081 (= lt!298713 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8948 lt!298723) nBits!348 i!590 lt!298736))))

(declare-fun lt!298720 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16608)

(assert (=> b!192081 (= lt!298716 (readNBitsLSBFirstsLoopPure!0 lt!298726 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298720))))

(assert (=> b!192081 (= lt!298726 (withMovedBitIndex!0 (_1!8948 lt!298723) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192082 () Bool)

(declare-fun res!160373 () Bool)

(assert (=> b!192082 (=> (not res!160373) (not e!132365))))

(assert (=> b!192082 (= res!160373 (not (= i!590 nBits!348)))))

(declare-fun b!192083 () Bool)

(assert (=> b!192083 (= e!132368 true)))

(assert (=> b!192083 e!132357))

(declare-fun res!160355 () Bool)

(assert (=> b!192083 (=> (not res!160355) (not e!132357))))

(assert (=> b!192083 (= res!160355 (= (size!4384 (buf!4864 thiss!1204)) (size!4384 (buf!4864 (_2!8947 lt!298710)))))))

(declare-fun b!192084 () Bool)

(declare-fun res!160354 () Bool)

(assert (=> b!192084 (=> res!160354 e!132369)))

(assert (=> b!192084 (= res!160354 (or (not (= (size!4384 (buf!4864 (_2!8947 lt!298710))) (size!4384 (buf!4864 thiss!1204)))) (not (= lt!298729 (bvsub (bvadd lt!298718 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192085 () Bool)

(assert (=> b!192085 (= e!132369 e!132367)))

(declare-fun res!160351 () Bool)

(assert (=> b!192085 (=> res!160351 e!132367)))

(assert (=> b!192085 (= res!160351 (not (= (_1!8949 lt!298737) (_2!8948 lt!298732))))))

(assert (=> b!192085 (= lt!298737 (readNBitsLSBFirstsLoopPure!0 (_1!8948 lt!298732) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298720))))

(declare-fun lt!298711 () (_ BitVec 64))

(assert (=> b!192085 (validate_offset_bits!1 ((_ sign_extend 32) (size!4384 (buf!4864 (_2!8947 lt!298710)))) ((_ sign_extend 32) (currentByte!9148 (_2!8947 lt!298717))) ((_ sign_extend 32) (currentBit!9143 (_2!8947 lt!298717))) lt!298711)))

(declare-fun lt!298719 () Unit!13645)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7876 array!9944 (_ BitVec 64)) Unit!13645)

(assert (=> b!192085 (= lt!298719 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8947 lt!298717) (buf!4864 (_2!8947 lt!298710)) lt!298711))))

(assert (=> b!192085 (= lt!298711 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!298724 () tuple2!16610)

(assert (=> b!192085 (= lt!298720 (bvor lt!298736 (ite (_2!8950 lt!298724) lt!298730 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192085 (= lt!298712 (readNBitsLSBFirstsLoopPure!0 (_1!8948 lt!298723) nBits!348 i!590 lt!298736))))

(assert (=> b!192085 (validate_offset_bits!1 ((_ sign_extend 32) (size!4384 (buf!4864 (_2!8947 lt!298710)))) ((_ sign_extend 32) (currentByte!9148 thiss!1204)) ((_ sign_extend 32) (currentBit!9143 thiss!1204)) lt!298727)))

(declare-fun lt!298714 () Unit!13645)

(assert (=> b!192085 (= lt!298714 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4864 (_2!8947 lt!298710)) lt!298727))))

(assert (=> b!192085 (= lt!298736 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!192085 (= (_2!8950 lt!298724) lt!298738)))

(assert (=> b!192085 (= lt!298724 (readBitPure!0 (_1!8948 lt!298723)))))

(declare-fun reader!0 (BitStream!7876 BitStream!7876) tuple2!16606)

(assert (=> b!192085 (= lt!298732 (reader!0 (_2!8947 lt!298717) (_2!8947 lt!298710)))))

(assert (=> b!192085 (= lt!298723 (reader!0 thiss!1204 (_2!8947 lt!298710)))))

(declare-fun e!132366 () Bool)

(assert (=> b!192085 e!132366))

(declare-fun res!160361 () Bool)

(assert (=> b!192085 (=> (not res!160361) (not e!132366))))

(declare-fun lt!298721 () tuple2!16610)

(declare-fun lt!298728 () tuple2!16610)

(assert (=> b!192085 (= res!160361 (= (bitIndex!0 (size!4384 (buf!4864 (_1!8950 lt!298721))) (currentByte!9148 (_1!8950 lt!298721)) (currentBit!9143 (_1!8950 lt!298721))) (bitIndex!0 (size!4384 (buf!4864 (_1!8950 lt!298728))) (currentByte!9148 (_1!8950 lt!298728)) (currentBit!9143 (_1!8950 lt!298728)))))))

(declare-fun lt!298722 () Unit!13645)

(declare-fun lt!298733 () BitStream!7876)

(declare-fun readBitPrefixLemma!0 (BitStream!7876 BitStream!7876) Unit!13645)

(assert (=> b!192085 (= lt!298722 (readBitPrefixLemma!0 lt!298733 (_2!8947 lt!298710)))))

(assert (=> b!192085 (= lt!298728 (readBitPure!0 (BitStream!7877 (buf!4864 (_2!8947 lt!298710)) (currentByte!9148 thiss!1204) (currentBit!9143 thiss!1204))))))

(assert (=> b!192085 (= lt!298721 (readBitPure!0 lt!298733))))

(assert (=> b!192085 e!132358))

(declare-fun res!160374 () Bool)

(assert (=> b!192085 (=> (not res!160374) (not e!132358))))

(assert (=> b!192085 (= res!160374 (invariant!0 (currentBit!9143 thiss!1204) (currentByte!9148 thiss!1204) (size!4384 (buf!4864 (_2!8947 lt!298717)))))))

(assert (=> b!192085 (= lt!298733 (BitStream!7877 (buf!4864 (_2!8947 lt!298717)) (currentByte!9148 thiss!1204) (currentBit!9143 thiss!1204)))))

(declare-fun b!192086 () Bool)

(assert (=> b!192086 (= e!132366 (= (_2!8950 lt!298721) (_2!8950 lt!298728)))))

(assert (= (and start!41270 res!160363) b!192076))

(assert (= (and b!192076 res!160358) b!192066))

(assert (= (and b!192066 res!160367) b!192082))

(assert (= (and b!192082 res!160373) b!192080))

(assert (= (and b!192080 res!160365) b!192070))

(assert (= (and b!192070 res!160370) b!192078))

(assert (= (and b!192078 res!160359) b!192067))

(assert (= (and b!192067 res!160364) b!192065))

(assert (= (and b!192080 (not res!160368)) b!192079))

(assert (= (and b!192079 (not res!160371)) b!192071))

(assert (= (and b!192071 (not res!160357)) b!192084))

(assert (= (and b!192084 (not res!160354)) b!192062))

(assert (= (and b!192062 (not res!160372)) b!192074))

(assert (= (and b!192074 (not res!160366)) b!192085))

(assert (= (and b!192085 res!160374) b!192075))

(assert (= (and b!192085 res!160361) b!192086))

(assert (= (and b!192085 (not res!160351)) b!192081))

(assert (= (and b!192081 res!160353) b!192064))

(assert (= (and b!192064 res!160356) b!192069))

(assert (= (and b!192069 res!160360) b!192063))

(assert (= (and b!192081 (not res!160369)) b!192077))

(assert (= (and b!192077 (not res!160362)) b!192083))

(assert (= (and b!192083 res!160355) b!192068))

(assert (= (and b!192068 res!160352) b!192073))

(assert (= start!41270 b!192072))

(declare-fun m!298187 () Bool)

(assert (=> b!192085 m!298187))

(declare-fun m!298189 () Bool)

(assert (=> b!192085 m!298189))

(declare-fun m!298191 () Bool)

(assert (=> b!192085 m!298191))

(declare-fun m!298193 () Bool)

(assert (=> b!192085 m!298193))

(declare-fun m!298195 () Bool)

(assert (=> b!192085 m!298195))

(declare-fun m!298197 () Bool)

(assert (=> b!192085 m!298197))

(declare-fun m!298199 () Bool)

(assert (=> b!192085 m!298199))

(declare-fun m!298201 () Bool)

(assert (=> b!192085 m!298201))

(declare-fun m!298203 () Bool)

(assert (=> b!192085 m!298203))

(declare-fun m!298205 () Bool)

(assert (=> b!192085 m!298205))

(declare-fun m!298207 () Bool)

(assert (=> b!192085 m!298207))

(declare-fun m!298209 () Bool)

(assert (=> b!192085 m!298209))

(declare-fun m!298211 () Bool)

(assert (=> b!192085 m!298211))

(declare-fun m!298213 () Bool)

(assert (=> b!192085 m!298213))

(declare-fun m!298215 () Bool)

(assert (=> b!192085 m!298215))

(declare-fun m!298217 () Bool)

(assert (=> b!192085 m!298217))

(declare-fun m!298219 () Bool)

(assert (=> b!192066 m!298219))

(declare-fun m!298221 () Bool)

(assert (=> b!192065 m!298221))

(declare-fun m!298223 () Bool)

(assert (=> b!192075 m!298223))

(declare-fun m!298225 () Bool)

(assert (=> b!192071 m!298225))

(declare-fun m!298227 () Bool)

(assert (=> b!192076 m!298227))

(declare-fun m!298229 () Bool)

(assert (=> b!192062 m!298229))

(declare-fun m!298231 () Bool)

(assert (=> b!192080 m!298231))

(declare-fun m!298233 () Bool)

(assert (=> b!192080 m!298233))

(declare-fun m!298235 () Bool)

(assert (=> b!192080 m!298235))

(declare-fun m!298237 () Bool)

(assert (=> start!41270 m!298237))

(declare-fun m!298239 () Bool)

(assert (=> b!192069 m!298239))

(declare-fun m!298241 () Bool)

(assert (=> b!192077 m!298241))

(declare-fun m!298243 () Bool)

(assert (=> b!192077 m!298243))

(declare-fun m!298245 () Bool)

(assert (=> b!192079 m!298245))

(declare-fun m!298247 () Bool)

(assert (=> b!192079 m!298247))

(declare-fun m!298249 () Bool)

(assert (=> b!192079 m!298249))

(declare-fun m!298251 () Bool)

(assert (=> b!192079 m!298251))

(declare-fun m!298253 () Bool)

(assert (=> b!192078 m!298253))

(assert (=> b!192074 m!298253))

(declare-fun m!298255 () Bool)

(assert (=> b!192068 m!298255))

(assert (=> b!192070 m!298231))

(assert (=> b!192070 m!298233))

(declare-fun m!298257 () Bool)

(assert (=> b!192064 m!298257))

(declare-fun m!298259 () Bool)

(assert (=> b!192067 m!298259))

(assert (=> b!192067 m!298259))

(declare-fun m!298261 () Bool)

(assert (=> b!192067 m!298261))

(declare-fun m!298263 () Bool)

(assert (=> b!192081 m!298263))

(declare-fun m!298265 () Bool)

(assert (=> b!192081 m!298265))

(declare-fun m!298267 () Bool)

(assert (=> b!192081 m!298267))

(declare-fun m!298269 () Bool)

(assert (=> b!192072 m!298269))

(push 1)

(assert (not b!192064))

(assert (not b!192069))

(assert (not b!192066))

(assert (not b!192067))

(assert (not b!192062))

(assert (not b!192078))

(assert (not b!192079))

(assert (not b!192081))

(assert (not start!41270))

(assert (not b!192072))

(assert (not b!192076))

(assert (not b!192065))

(assert (not b!192070))

(assert (not b!192071))

(assert (not b!192085))

(assert (not b!192068))

(assert (not b!192074))

(assert (not b!192075))

(assert (not b!192077))

(assert (not b!192080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

