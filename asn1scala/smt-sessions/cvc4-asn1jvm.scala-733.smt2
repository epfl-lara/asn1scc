; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20474 () Bool)

(assert start!20474)

(declare-datatypes ((array!4825 0))(
  ( (array!4826 (arr!2795 (Array (_ BitVec 32) (_ BitVec 8))) (size!2202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3878 0))(
  ( (BitStream!3879 (buf!2565 array!4825) (currentByte!5044 (_ BitVec 32)) (currentBit!5039 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8450 0))(
  ( (tuple2!8451 (_1!4480 BitStream!3878) (_2!4480 Bool)) )
))
(declare-fun lt!150438 () tuple2!8450)

(declare-fun b!103123 () Bool)

(declare-fun lt!150443 () (_ BitVec 32))

(declare-fun lt!150447 () (_ BitVec 64))

(declare-fun e!67484 () Bool)

(declare-fun lt!150445 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103123 (= e!67484 (= (bvand (bvor lt!150445 (ite (_2!4480 lt!150438) lt!150447 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!150443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!103124 () Bool)

(declare-fun e!67487 () Bool)

(declare-fun e!67492 () Bool)

(assert (=> b!103124 (= e!67487 e!67492)))

(declare-fun res!84839 () Bool)

(assert (=> b!103124 (=> (not res!84839) (not e!67492))))

(declare-fun thiss!1305 () BitStream!3878)

(declare-fun lt!150440 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103124 (= res!84839 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)) lt!150440))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!103124 (= lt!150440 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103125 () Bool)

(declare-fun res!84834 () Bool)

(declare-fun e!67488 () Bool)

(assert (=> b!103125 (=> (not res!84834) (not e!67488))))

(declare-datatypes ((Unit!6324 0))(
  ( (Unit!6325) )
))
(declare-datatypes ((tuple2!8452 0))(
  ( (tuple2!8453 (_1!4481 Unit!6324) (_2!4481 BitStream!3878)) )
))
(declare-fun lt!150439 () tuple2!8452)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103125 (= res!84834 (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(declare-fun b!103126 () Bool)

(declare-fun e!67494 () Bool)

(assert (=> b!103126 (= e!67492 (not e!67494))))

(declare-fun res!84831 () Bool)

(assert (=> b!103126 (=> res!84831 e!67494)))

(assert (=> b!103126 (= res!84831 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!150453 () tuple2!8452)

(declare-fun lt!150455 () (_ BitVec 64))

(assert (=> b!103126 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!150455)))

(declare-fun lt!150449 () Unit!6324)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3878 array!4825 (_ BitVec 64)) Unit!6324)

(assert (=> b!103126 (= lt!150449 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4481 lt!150439) (buf!2565 (_2!4481 lt!150453)) lt!150455))))

(assert (=> b!103126 (= lt!150455 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8454 0))(
  ( (tuple2!8455 (_1!4482 BitStream!3878) (_2!4482 (_ BitVec 64))) )
))
(declare-fun lt!150451 () tuple2!8454)

(declare-datatypes ((tuple2!8456 0))(
  ( (tuple2!8457 (_1!4483 BitStream!3878) (_2!4483 BitStream!3878)) )
))
(declare-fun lt!150442 () tuple2!8456)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8454)

(assert (=> b!103126 (= lt!150451 (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!150442) nBits!396 i!615 lt!150445))))

(assert (=> b!103126 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)) lt!150440)))

(declare-fun lt!150441 () Unit!6324)

(assert (=> b!103126 (= lt!150441 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2565 (_2!4481 lt!150453)) lt!150440))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103126 (= lt!150445 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!150454 () Bool)

(assert (=> b!103126 (= (_2!4480 lt!150438) lt!150454)))

(declare-fun readBitPure!0 (BitStream!3878) tuple2!8450)

(assert (=> b!103126 (= lt!150438 (readBitPure!0 (_1!4483 lt!150442)))))

(declare-fun lt!150452 () tuple2!8456)

(declare-fun reader!0 (BitStream!3878 BitStream!3878) tuple2!8456)

(assert (=> b!103126 (= lt!150452 (reader!0 (_2!4481 lt!150439) (_2!4481 lt!150453)))))

(assert (=> b!103126 (= lt!150442 (reader!0 thiss!1305 (_2!4481 lt!150453)))))

(declare-fun e!67486 () Bool)

(assert (=> b!103126 e!67486))

(declare-fun res!84827 () Bool)

(assert (=> b!103126 (=> (not res!84827) (not e!67486))))

(declare-fun lt!150448 () tuple2!8450)

(declare-fun lt!150456 () tuple2!8450)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103126 (= res!84827 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150448))) (currentByte!5044 (_1!4480 lt!150448)) (currentBit!5039 (_1!4480 lt!150448))) (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150456))) (currentByte!5044 (_1!4480 lt!150456)) (currentBit!5039 (_1!4480 lt!150456)))))))

(declare-fun lt!150450 () Unit!6324)

(declare-fun lt!150446 () BitStream!3878)

(declare-fun readBitPrefixLemma!0 (BitStream!3878 BitStream!3878) Unit!6324)

(assert (=> b!103126 (= lt!150450 (readBitPrefixLemma!0 lt!150446 (_2!4481 lt!150453)))))

(assert (=> b!103126 (= lt!150456 (readBitPure!0 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))))))

(assert (=> b!103126 (= lt!150448 (readBitPure!0 lt!150446))))

(assert (=> b!103126 (= lt!150446 (BitStream!3879 (buf!2565 (_2!4481 lt!150439)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(assert (=> b!103126 e!67488))

(declare-fun res!84830 () Bool)

(assert (=> b!103126 (=> (not res!84830) (not e!67488))))

(declare-fun isPrefixOf!0 (BitStream!3878 BitStream!3878) Bool)

(assert (=> b!103126 (= res!84830 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150453)))))

(declare-fun lt!150444 () Unit!6324)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3878 BitStream!3878 BitStream!3878) Unit!6324)

(assert (=> b!103126 (= lt!150444 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4481 lt!150439) (_2!4481 lt!150453)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8452)

(assert (=> b!103126 (= lt!150453 (appendNLeastSignificantBitsLoop!0 (_2!4481 lt!150439) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67485 () Bool)

(assert (=> b!103126 e!67485))

(declare-fun res!84832 () Bool)

(assert (=> b!103126 (=> (not res!84832) (not e!67485))))

(assert (=> b!103126 (= res!84832 (= (size!2202 (buf!2565 thiss!1305)) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(declare-fun appendBit!0 (BitStream!3878 Bool) tuple2!8452)

(assert (=> b!103126 (= lt!150439 (appendBit!0 thiss!1305 lt!150454))))

(assert (=> b!103126 (= lt!150454 (not (= (bvand v!199 lt!150447) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103126 (= lt!150447 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103127 () Bool)

(declare-fun e!67490 () Bool)

(declare-fun lt!150436 () tuple2!8450)

(declare-fun lt!150437 () (_ BitVec 64))

(assert (=> b!103127 (= e!67490 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150436))) (currentByte!5044 (_1!4480 lt!150436)) (currentBit!5039 (_1!4480 lt!150436))) lt!150437))))

(declare-fun res!84835 () Bool)

(assert (=> start!20474 (=> (not res!84835) (not e!67487))))

(assert (=> start!20474 (= res!84835 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20474 e!67487))

(assert (=> start!20474 true))

(declare-fun e!67491 () Bool)

(declare-fun inv!12 (BitStream!3878) Bool)

(assert (=> start!20474 (and (inv!12 thiss!1305) e!67491)))

(declare-fun b!103128 () Bool)

(assert (=> b!103128 (= e!67486 (= (_2!4480 lt!150448) (_2!4480 lt!150456)))))

(declare-fun b!103129 () Bool)

(assert (=> b!103129 (= e!67488 (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150453)))))))

(declare-fun b!103130 () Bool)

(declare-fun res!84837 () Bool)

(assert (=> b!103130 (=> (not res!84837) (not e!67492))))

(assert (=> b!103130 (= res!84837 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!103131 () Bool)

(declare-fun e!67489 () Bool)

(assert (=> b!103131 (= e!67489 e!67490)))

(declare-fun res!84828 () Bool)

(assert (=> b!103131 (=> (not res!84828) (not e!67490))))

(assert (=> b!103131 (= res!84828 (and (= (_2!4480 lt!150436) lt!150454) (= (_1!4480 lt!150436) (_2!4481 lt!150439))))))

(declare-fun readerFrom!0 (BitStream!3878 (_ BitVec 32) (_ BitVec 32)) BitStream!3878)

(assert (=> b!103131 (= lt!150436 (readBitPure!0 (readerFrom!0 (_2!4481 lt!150439) (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305))))))

(declare-fun b!103132 () Bool)

(assert (=> b!103132 (= e!67485 e!67489)))

(declare-fun res!84838 () Bool)

(assert (=> b!103132 (=> (not res!84838) (not e!67489))))

(declare-fun lt!150457 () (_ BitVec 64))

(assert (=> b!103132 (= res!84838 (= lt!150437 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!150457)))))

(assert (=> b!103132 (= lt!150437 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(assert (=> b!103132 (= lt!150457 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(declare-fun b!103133 () Bool)

(declare-fun array_inv!2004 (array!4825) Bool)

(assert (=> b!103133 (= e!67491 (array_inv!2004 (buf!2565 thiss!1305)))))

(declare-fun b!103134 () Bool)

(declare-fun res!84836 () Bool)

(assert (=> b!103134 (=> (not res!84836) (not e!67492))))

(assert (=> b!103134 (= res!84836 (bvslt i!615 nBits!396))))

(declare-fun b!103135 () Bool)

(assert (=> b!103135 (= e!67494 e!67484)))

(declare-fun res!84833 () Bool)

(assert (=> b!103135 (=> res!84833 e!67484)))

(assert (=> b!103135 (= res!84833 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4483 lt!150452)))) ((_ sign_extend 32) (currentByte!5044 (_1!4483 lt!150452))) ((_ sign_extend 32) (currentBit!5039 (_1!4483 lt!150452))) ((_ sign_extend 32) lt!150443))))))

(assert (=> b!103135 (= lt!150443 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun b!103136 () Bool)

(declare-fun res!84829 () Bool)

(assert (=> b!103136 (=> (not res!84829) (not e!67489))))

(assert (=> b!103136 (= res!84829 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150439)))))

(assert (= (and start!20474 res!84835) b!103124))

(assert (= (and b!103124 res!84839) b!103130))

(assert (= (and b!103130 res!84837) b!103134))

(assert (= (and b!103134 res!84836) b!103126))

(assert (= (and b!103126 res!84832) b!103132))

(assert (= (and b!103132 res!84838) b!103136))

(assert (= (and b!103136 res!84829) b!103131))

(assert (= (and b!103131 res!84828) b!103127))

(assert (= (and b!103126 res!84830) b!103125))

(assert (= (and b!103125 res!84834) b!103129))

(assert (= (and b!103126 res!84827) b!103128))

(assert (= (and b!103126 (not res!84831)) b!103135))

(assert (= (and b!103135 (not res!84833)) b!103123))

(assert (= start!20474 b!103133))

(declare-fun m!150405 () Bool)

(assert (=> b!103135 m!150405))

(declare-fun m!150407 () Bool)

(assert (=> b!103133 m!150407))

(declare-fun m!150409 () Bool)

(assert (=> b!103130 m!150409))

(declare-fun m!150411 () Bool)

(assert (=> b!103127 m!150411))

(declare-fun m!150413 () Bool)

(assert (=> b!103131 m!150413))

(assert (=> b!103131 m!150413))

(declare-fun m!150415 () Bool)

(assert (=> b!103131 m!150415))

(declare-fun m!150417 () Bool)

(assert (=> b!103132 m!150417))

(declare-fun m!150419 () Bool)

(assert (=> b!103132 m!150419))

(declare-fun m!150421 () Bool)

(assert (=> b!103129 m!150421))

(declare-fun m!150423 () Bool)

(assert (=> b!103125 m!150423))

(declare-fun m!150425 () Bool)

(assert (=> start!20474 m!150425))

(declare-fun m!150427 () Bool)

(assert (=> b!103123 m!150427))

(declare-fun m!150429 () Bool)

(assert (=> b!103136 m!150429))

(declare-fun m!150431 () Bool)

(assert (=> b!103124 m!150431))

(declare-fun m!150433 () Bool)

(assert (=> b!103126 m!150433))

(declare-fun m!150435 () Bool)

(assert (=> b!103126 m!150435))

(declare-fun m!150437 () Bool)

(assert (=> b!103126 m!150437))

(declare-fun m!150439 () Bool)

(assert (=> b!103126 m!150439))

(declare-fun m!150441 () Bool)

(assert (=> b!103126 m!150441))

(declare-fun m!150443 () Bool)

(assert (=> b!103126 m!150443))

(declare-fun m!150445 () Bool)

(assert (=> b!103126 m!150445))

(declare-fun m!150447 () Bool)

(assert (=> b!103126 m!150447))

(declare-fun m!150449 () Bool)

(assert (=> b!103126 m!150449))

(declare-fun m!150451 () Bool)

(assert (=> b!103126 m!150451))

(declare-fun m!150453 () Bool)

(assert (=> b!103126 m!150453))

(declare-fun m!150455 () Bool)

(assert (=> b!103126 m!150455))

(declare-fun m!150457 () Bool)

(assert (=> b!103126 m!150457))

(declare-fun m!150459 () Bool)

(assert (=> b!103126 m!150459))

(declare-fun m!150461 () Bool)

(assert (=> b!103126 m!150461))

(declare-fun m!150463 () Bool)

(assert (=> b!103126 m!150463))

(declare-fun m!150465 () Bool)

(assert (=> b!103126 m!150465))

(declare-fun m!150467 () Bool)

(assert (=> b!103126 m!150467))

(push 1)

(assert (not b!103126))

(assert (not b!103132))

(assert (not b!103129))

(assert (not b!103123))

(assert (not b!103130))

(assert (not b!103133))

(assert (not start!20474))

(assert (not b!103136))

(assert (not b!103125))

(assert (not b!103127))

(assert (not b!103135))

(assert (not b!103131))

(assert (not b!103124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32116 () Bool)

(assert (=> d!32116 (= (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150453)))) (and (bvsge (currentBit!5039 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5039 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5044 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150453)))) (and (= (currentBit!5039 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150453))))))))))

(assert (=> b!103129 d!32116))

(declare-fun d!32118 () Bool)

(declare-fun e!67542 () Bool)

(assert (=> d!32118 e!67542))

(declare-fun res!84916 () Bool)

(assert (=> d!32118 (=> (not res!84916) (not e!67542))))

(declare-fun lt!150641 () (_ BitVec 64))

(declare-fun lt!150643 () (_ BitVec 64))

(declare-fun lt!150639 () (_ BitVec 64))

(assert (=> d!32118 (= res!84916 (= lt!150643 (bvsub lt!150639 lt!150641)))))

(assert (=> d!32118 (or (= (bvand lt!150639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150641 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150639 lt!150641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32118 (= lt!150641 (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150439)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439)))))))

(declare-fun lt!150640 () (_ BitVec 64))

(declare-fun lt!150638 () (_ BitVec 64))

(assert (=> d!32118 (= lt!150639 (bvmul lt!150640 lt!150638))))

(assert (=> d!32118 (or (= lt!150640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150638 (bvsdiv (bvmul lt!150640 lt!150638) lt!150640)))))

(assert (=> d!32118 (= lt!150638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32118 (= lt!150640 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(assert (=> d!32118 (= lt!150643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439)))))))

(assert (=> d!32118 (invariant!0 (currentBit!5039 (_2!4481 lt!150439)) (currentByte!5044 (_2!4481 lt!150439)) (size!2202 (buf!2565 (_2!4481 lt!150439))))))

(assert (=> d!32118 (= (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))) lt!150643)))

(declare-fun b!103220 () Bool)

(declare-fun res!84917 () Bool)

(assert (=> b!103220 (=> (not res!84917) (not e!67542))))

(assert (=> b!103220 (= res!84917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150643))))

(declare-fun b!103221 () Bool)

(declare-fun lt!150642 () (_ BitVec 64))

(assert (=> b!103221 (= e!67542 (bvsle lt!150643 (bvmul lt!150642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103221 (or (= lt!150642 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150642 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150642)))))

(assert (=> b!103221 (= lt!150642 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(assert (= (and d!32118 res!84916) b!103220))

(assert (= (and b!103220 res!84917) b!103221))

(declare-fun m!150609 () Bool)

(assert (=> d!32118 m!150609))

(declare-fun m!150611 () Bool)

(assert (=> d!32118 m!150611))

(assert (=> b!103132 d!32118))

(declare-fun d!32120 () Bool)

(declare-fun e!67543 () Bool)

(assert (=> d!32120 e!67543))

(declare-fun res!84918 () Bool)

(assert (=> d!32120 (=> (not res!84918) (not e!67543))))

(declare-fun lt!150645 () (_ BitVec 64))

(declare-fun lt!150647 () (_ BitVec 64))

(declare-fun lt!150649 () (_ BitVec 64))

(assert (=> d!32120 (= res!84918 (= lt!150649 (bvsub lt!150645 lt!150647)))))

(assert (=> d!32120 (or (= (bvand lt!150645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150645 lt!150647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32120 (= lt!150647 (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305))))))

(declare-fun lt!150646 () (_ BitVec 64))

(declare-fun lt!150644 () (_ BitVec 64))

(assert (=> d!32120 (= lt!150645 (bvmul lt!150646 lt!150644))))

(assert (=> d!32120 (or (= lt!150646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150644 (bvsdiv (bvmul lt!150646 lt!150644) lt!150646)))))

(assert (=> d!32120 (= lt!150644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32120 (= lt!150646 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))))))

(assert (=> d!32120 (= lt!150649 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5044 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5039 thiss!1305))))))

(assert (=> d!32120 (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 thiss!1305)))))

(assert (=> d!32120 (= (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)) lt!150649)))

(declare-fun b!103222 () Bool)

(declare-fun res!84919 () Bool)

(assert (=> b!103222 (=> (not res!84919) (not e!67543))))

(assert (=> b!103222 (= res!84919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150649))))

(declare-fun b!103223 () Bool)

(declare-fun lt!150648 () (_ BitVec 64))

(assert (=> b!103223 (= e!67543 (bvsle lt!150649 (bvmul lt!150648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103223 (or (= lt!150648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150648)))))

(assert (=> b!103223 (= lt!150648 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))))))

(assert (= (and d!32120 res!84918) b!103222))

(assert (= (and b!103222 res!84919) b!103223))

(declare-fun m!150613 () Bool)

(assert (=> d!32120 m!150613))

(declare-fun m!150615 () Bool)

(assert (=> d!32120 m!150615))

(assert (=> b!103132 d!32120))

(declare-fun d!32122 () Bool)

(declare-datatypes ((tuple2!8466 0))(
  ( (tuple2!8467 (_1!4488 Bool) (_2!4488 BitStream!3878)) )
))
(declare-fun lt!150652 () tuple2!8466)

(declare-fun readBit!0 (BitStream!3878) tuple2!8466)

(assert (=> d!32122 (= lt!150652 (readBit!0 (readerFrom!0 (_2!4481 lt!150439) (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305))))))

(assert (=> d!32122 (= (readBitPure!0 (readerFrom!0 (_2!4481 lt!150439) (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305))) (tuple2!8451 (_2!4488 lt!150652) (_1!4488 lt!150652)))))

(declare-fun bs!7872 () Bool)

(assert (= bs!7872 d!32122))

(assert (=> bs!7872 m!150413))

(declare-fun m!150617 () Bool)

(assert (=> bs!7872 m!150617))

(assert (=> b!103131 d!32122))

(declare-fun d!32124 () Bool)

(declare-fun e!67546 () Bool)

(assert (=> d!32124 e!67546))

(declare-fun res!84923 () Bool)

(assert (=> d!32124 (=> (not res!84923) (not e!67546))))

(assert (=> d!32124 (= res!84923 (invariant!0 (currentBit!5039 (_2!4481 lt!150439)) (currentByte!5044 (_2!4481 lt!150439)) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(assert (=> d!32124 (= (readerFrom!0 (_2!4481 lt!150439) (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305)) (BitStream!3879 (buf!2565 (_2!4481 lt!150439)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(declare-fun b!103226 () Bool)

(assert (=> b!103226 (= e!67546 (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(assert (= (and d!32124 res!84923) b!103226))

(assert (=> d!32124 m!150611))

(assert (=> b!103226 m!150423))

(assert (=> b!103131 d!32124))

(declare-fun d!32126 () Bool)

(assert (=> d!32126 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!103130 d!32126))

(declare-fun d!32128 () Bool)

(assert (=> d!32128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4483 lt!150452)))) ((_ sign_extend 32) (currentByte!5044 (_1!4483 lt!150452))) ((_ sign_extend 32) (currentBit!5039 (_1!4483 lt!150452))) ((_ sign_extend 32) lt!150443)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4483 lt!150452)))) ((_ sign_extend 32) (currentByte!5044 (_1!4483 lt!150452))) ((_ sign_extend 32) (currentBit!5039 (_1!4483 lt!150452)))) ((_ sign_extend 32) lt!150443)))))

(declare-fun bs!7873 () Bool)

(assert (= bs!7873 d!32128))

(declare-fun m!150619 () Bool)

(assert (=> bs!7873 m!150619))

(assert (=> b!103135 d!32128))

(declare-fun d!32130 () Bool)

(assert (=> d!32130 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)) lt!150440) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305))) lt!150440))))

(declare-fun bs!7874 () Bool)

(assert (= bs!7874 d!32130))

(assert (=> bs!7874 m!150613))

(assert (=> b!103124 d!32130))

(declare-fun d!32132 () Bool)

(assert (=> d!32132 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 thiss!1305))))))

(declare-fun bs!7875 () Bool)

(assert (= bs!7875 d!32132))

(assert (=> bs!7875 m!150615))

(assert (=> start!20474 d!32132))

(declare-fun d!32134 () Bool)

(assert (=> d!32134 (= (onesLSBLong!0 lt!150443) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!150443))))))

(assert (=> b!103123 d!32134))

(declare-fun d!32136 () Bool)

(assert (=> d!32136 (= (array_inv!2004 (buf!2565 thiss!1305)) (bvsge (size!2202 (buf!2565 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!103133 d!32136))

(declare-fun d!32138 () Bool)

(declare-fun e!67547 () Bool)

(assert (=> d!32138 e!67547))

(declare-fun res!84924 () Bool)

(assert (=> d!32138 (=> (not res!84924) (not e!67547))))

(declare-fun lt!150658 () (_ BitVec 64))

(declare-fun lt!150656 () (_ BitVec 64))

(declare-fun lt!150654 () (_ BitVec 64))

(assert (=> d!32138 (= res!84924 (= lt!150658 (bvsub lt!150654 lt!150656)))))

(assert (=> d!32138 (or (= (bvand lt!150654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150654 lt!150656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32138 (= lt!150656 (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150436)))) ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150436))) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150436)))))))

(declare-fun lt!150655 () (_ BitVec 64))

(declare-fun lt!150653 () (_ BitVec 64))

(assert (=> d!32138 (= lt!150654 (bvmul lt!150655 lt!150653))))

(assert (=> d!32138 (or (= lt!150655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150653 (bvsdiv (bvmul lt!150655 lt!150653) lt!150655)))))

(assert (=> d!32138 (= lt!150653 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32138 (= lt!150655 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150436)))))))

(assert (=> d!32138 (= lt!150658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150436))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150436)))))))

(assert (=> d!32138 (invariant!0 (currentBit!5039 (_1!4480 lt!150436)) (currentByte!5044 (_1!4480 lt!150436)) (size!2202 (buf!2565 (_1!4480 lt!150436))))))

(assert (=> d!32138 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150436))) (currentByte!5044 (_1!4480 lt!150436)) (currentBit!5039 (_1!4480 lt!150436))) lt!150658)))

(declare-fun b!103227 () Bool)

(declare-fun res!84925 () Bool)

(assert (=> b!103227 (=> (not res!84925) (not e!67547))))

(assert (=> b!103227 (= res!84925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150658))))

(declare-fun b!103228 () Bool)

(declare-fun lt!150657 () (_ BitVec 64))

(assert (=> b!103228 (= e!67547 (bvsle lt!150658 (bvmul lt!150657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103228 (or (= lt!150657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150657)))))

(assert (=> b!103228 (= lt!150657 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150436)))))))

(assert (= (and d!32138 res!84924) b!103227))

(assert (= (and b!103227 res!84925) b!103228))

(declare-fun m!150621 () Bool)

(assert (=> d!32138 m!150621))

(declare-fun m!150623 () Bool)

(assert (=> d!32138 m!150623))

(assert (=> b!103127 d!32138))

(declare-fun b!103239 () Bool)

(declare-fun res!84932 () Bool)

(declare-fun e!67553 () Bool)

(assert (=> b!103239 (=> (not res!84932) (not e!67553))))

(declare-fun lt!150703 () tuple2!8456)

(assert (=> b!103239 (= res!84932 (isPrefixOf!0 (_2!4483 lt!150703) (_2!4481 lt!150453)))))

(declare-fun lt!150716 () (_ BitVec 64))

(declare-fun lt!150701 () (_ BitVec 64))

(declare-fun b!103240 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!3878 (_ BitVec 64)) BitStream!3878)

(assert (=> b!103240 (= e!67553 (= (_1!4483 lt!150703) (withMovedBitIndex!0 (_2!4483 lt!150703) (bvsub lt!150701 lt!150716))))))

(assert (=> b!103240 (or (= (bvand lt!150701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150701 lt!150716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103240 (= lt!150716 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150453))) (currentByte!5044 (_2!4481 lt!150453)) (currentBit!5039 (_2!4481 lt!150453))))))

(assert (=> b!103240 (= lt!150701 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(declare-fun b!103241 () Bool)

(declare-fun e!67552 () Unit!6324)

(declare-fun Unit!6342 () Unit!6324)

(assert (=> b!103241 (= e!67552 Unit!6342)))

(declare-fun d!32140 () Bool)

(assert (=> d!32140 e!67553))

(declare-fun res!84933 () Bool)

(assert (=> d!32140 (=> (not res!84933) (not e!67553))))

(assert (=> d!32140 (= res!84933 (isPrefixOf!0 (_1!4483 lt!150703) (_2!4483 lt!150703)))))

(declare-fun lt!150713 () BitStream!3878)

(assert (=> d!32140 (= lt!150703 (tuple2!8457 lt!150713 (_2!4481 lt!150453)))))

(declare-fun lt!150709 () Unit!6324)

(declare-fun lt!150700 () Unit!6324)

(assert (=> d!32140 (= lt!150709 lt!150700)))

(assert (=> d!32140 (isPrefixOf!0 lt!150713 (_2!4481 lt!150453))))

(assert (=> d!32140 (= lt!150700 (lemmaIsPrefixTransitive!0 lt!150713 (_2!4481 lt!150453) (_2!4481 lt!150453)))))

(declare-fun lt!150710 () Unit!6324)

(declare-fun lt!150711 () Unit!6324)

(assert (=> d!32140 (= lt!150710 lt!150711)))

(assert (=> d!32140 (isPrefixOf!0 lt!150713 (_2!4481 lt!150453))))

(assert (=> d!32140 (= lt!150711 (lemmaIsPrefixTransitive!0 lt!150713 thiss!1305 (_2!4481 lt!150453)))))

(declare-fun lt!150714 () Unit!6324)

(assert (=> d!32140 (= lt!150714 e!67552)))

(declare-fun c!6393 () Bool)

(assert (=> d!32140 (= c!6393 (not (= (size!2202 (buf!2565 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!150718 () Unit!6324)

(declare-fun lt!150708 () Unit!6324)

(assert (=> d!32140 (= lt!150718 lt!150708)))

(assert (=> d!32140 (isPrefixOf!0 (_2!4481 lt!150453) (_2!4481 lt!150453))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3878) Unit!6324)

(assert (=> d!32140 (= lt!150708 (lemmaIsPrefixRefl!0 (_2!4481 lt!150453)))))

(declare-fun lt!150712 () Unit!6324)

(declare-fun lt!150717 () Unit!6324)

(assert (=> d!32140 (= lt!150712 lt!150717)))

(assert (=> d!32140 (= lt!150717 (lemmaIsPrefixRefl!0 (_2!4481 lt!150453)))))

(declare-fun lt!150715 () Unit!6324)

(declare-fun lt!150704 () Unit!6324)

(assert (=> d!32140 (= lt!150715 lt!150704)))

(assert (=> d!32140 (isPrefixOf!0 lt!150713 lt!150713)))

(assert (=> d!32140 (= lt!150704 (lemmaIsPrefixRefl!0 lt!150713))))

(declare-fun lt!150706 () Unit!6324)

(declare-fun lt!150702 () Unit!6324)

(assert (=> d!32140 (= lt!150706 lt!150702)))

(assert (=> d!32140 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32140 (= lt!150702 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32140 (= lt!150713 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(assert (=> d!32140 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150453))))

(assert (=> d!32140 (= (reader!0 thiss!1305 (_2!4481 lt!150453)) lt!150703)))

(declare-fun b!103242 () Bool)

(declare-fun res!84934 () Bool)

(assert (=> b!103242 (=> (not res!84934) (not e!67553))))

(assert (=> b!103242 (= res!84934 (isPrefixOf!0 (_1!4483 lt!150703) thiss!1305))))

(declare-fun b!103243 () Bool)

(declare-fun lt!150699 () Unit!6324)

(assert (=> b!103243 (= e!67552 lt!150699)))

(declare-fun lt!150705 () (_ BitVec 64))

(assert (=> b!103243 (= lt!150705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150707 () (_ BitVec 64))

(assert (=> b!103243 (= lt!150707 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4825 array!4825 (_ BitVec 64) (_ BitVec 64)) Unit!6324)

(assert (=> b!103243 (= lt!150699 (arrayBitRangesEqSymmetric!0 (buf!2565 thiss!1305) (buf!2565 (_2!4481 lt!150453)) lt!150705 lt!150707))))

(declare-fun arrayBitRangesEq!0 (array!4825 array!4825 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103243 (arrayBitRangesEq!0 (buf!2565 (_2!4481 lt!150453)) (buf!2565 thiss!1305) lt!150705 lt!150707)))

(assert (= (and d!32140 c!6393) b!103243))

(assert (= (and d!32140 (not c!6393)) b!103241))

(assert (= (and d!32140 res!84933) b!103242))

(assert (= (and b!103242 res!84934) b!103239))

(assert (= (and b!103239 res!84932) b!103240))

(assert (=> b!103243 m!150419))

(declare-fun m!150625 () Bool)

(assert (=> b!103243 m!150625))

(declare-fun m!150627 () Bool)

(assert (=> b!103243 m!150627))

(declare-fun m!150629 () Bool)

(assert (=> b!103239 m!150629))

(assert (=> d!32140 m!150441))

(declare-fun m!150631 () Bool)

(assert (=> d!32140 m!150631))

(declare-fun m!150633 () Bool)

(assert (=> d!32140 m!150633))

(declare-fun m!150635 () Bool)

(assert (=> d!32140 m!150635))

(declare-fun m!150637 () Bool)

(assert (=> d!32140 m!150637))

(declare-fun m!150639 () Bool)

(assert (=> d!32140 m!150639))

(declare-fun m!150641 () Bool)

(assert (=> d!32140 m!150641))

(declare-fun m!150643 () Bool)

(assert (=> d!32140 m!150643))

(declare-fun m!150645 () Bool)

(assert (=> d!32140 m!150645))

(declare-fun m!150647 () Bool)

(assert (=> d!32140 m!150647))

(declare-fun m!150649 () Bool)

(assert (=> d!32140 m!150649))

(declare-fun m!150651 () Bool)

(assert (=> b!103242 m!150651))

(declare-fun m!150653 () Bool)

(assert (=> b!103240 m!150653))

(declare-fun m!150655 () Bool)

(assert (=> b!103240 m!150655))

(assert (=> b!103240 m!150419))

(assert (=> b!103126 d!32140))

(declare-fun d!32142 () Bool)

(declare-fun e!67554 () Bool)

(assert (=> d!32142 e!67554))

(declare-fun res!84935 () Bool)

(assert (=> d!32142 (=> (not res!84935) (not e!67554))))

(declare-fun lt!150720 () (_ BitVec 64))

(declare-fun lt!150724 () (_ BitVec 64))

(declare-fun lt!150722 () (_ BitVec 64))

(assert (=> d!32142 (= res!84935 (= lt!150724 (bvsub lt!150720 lt!150722)))))

(assert (=> d!32142 (or (= (bvand lt!150720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150720 lt!150722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32142 (= lt!150722 (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150456)))) ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150456))) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150456)))))))

(declare-fun lt!150721 () (_ BitVec 64))

(declare-fun lt!150719 () (_ BitVec 64))

(assert (=> d!32142 (= lt!150720 (bvmul lt!150721 lt!150719))))

(assert (=> d!32142 (or (= lt!150721 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150719 (bvsdiv (bvmul lt!150721 lt!150719) lt!150721)))))

(assert (=> d!32142 (= lt!150719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32142 (= lt!150721 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150456)))))))

(assert (=> d!32142 (= lt!150724 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150456))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150456)))))))

(assert (=> d!32142 (invariant!0 (currentBit!5039 (_1!4480 lt!150456)) (currentByte!5044 (_1!4480 lt!150456)) (size!2202 (buf!2565 (_1!4480 lt!150456))))))

(assert (=> d!32142 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150456))) (currentByte!5044 (_1!4480 lt!150456)) (currentBit!5039 (_1!4480 lt!150456))) lt!150724)))

(declare-fun b!103244 () Bool)

(declare-fun res!84936 () Bool)

(assert (=> b!103244 (=> (not res!84936) (not e!67554))))

(assert (=> b!103244 (= res!84936 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150724))))

(declare-fun b!103245 () Bool)

(declare-fun lt!150723 () (_ BitVec 64))

(assert (=> b!103245 (= e!67554 (bvsle lt!150724 (bvmul lt!150723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103245 (or (= lt!150723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150723)))))

(assert (=> b!103245 (= lt!150723 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150456)))))))

(assert (= (and d!32142 res!84935) b!103244))

(assert (= (and b!103244 res!84936) b!103245))

(declare-fun m!150657 () Bool)

(assert (=> d!32142 m!150657))

(declare-fun m!150659 () Bool)

(assert (=> d!32142 m!150659))

(assert (=> b!103126 d!32142))

(declare-fun b!103255 () Bool)

(declare-fun res!84946 () Bool)

(declare-fun e!67559 () Bool)

(assert (=> b!103255 (=> (not res!84946) (not e!67559))))

(declare-fun lt!150736 () (_ BitVec 64))

(declare-fun lt!150735 () (_ BitVec 64))

(declare-fun lt!150734 () tuple2!8452)

(assert (=> b!103255 (= res!84946 (= (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150734))) (currentByte!5044 (_2!4481 lt!150734)) (currentBit!5039 (_2!4481 lt!150734))) (bvadd lt!150736 lt!150735)))))

(assert (=> b!103255 (or (not (= (bvand lt!150736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150735 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150736 lt!150735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103255 (= lt!150735 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!103255 (= lt!150736 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)))))

(declare-fun b!103256 () Bool)

(declare-fun res!84948 () Bool)

(assert (=> b!103256 (=> (not res!84948) (not e!67559))))

(assert (=> b!103256 (= res!84948 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150734)))))

(declare-fun b!103258 () Bool)

(declare-fun e!67560 () Bool)

(declare-fun lt!150733 () tuple2!8450)

(assert (=> b!103258 (= e!67560 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150733))) (currentByte!5044 (_1!4480 lt!150733)) (currentBit!5039 (_1!4480 lt!150733))) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150734))) (currentByte!5044 (_2!4481 lt!150734)) (currentBit!5039 (_2!4481 lt!150734)))))))

(declare-fun b!103257 () Bool)

(assert (=> b!103257 (= e!67559 e!67560)))

(declare-fun res!84947 () Bool)

(assert (=> b!103257 (=> (not res!84947) (not e!67560))))

(assert (=> b!103257 (= res!84947 (and (= (_2!4480 lt!150733) lt!150454) (= (_1!4480 lt!150733) (_2!4481 lt!150734))))))

(assert (=> b!103257 (= lt!150733 (readBitPure!0 (readerFrom!0 (_2!4481 lt!150734) (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305))))))

(declare-fun d!32144 () Bool)

(assert (=> d!32144 e!67559))

(declare-fun res!84945 () Bool)

(assert (=> d!32144 (=> (not res!84945) (not e!67559))))

(assert (=> d!32144 (= res!84945 (= (size!2202 (buf!2565 thiss!1305)) (size!2202 (buf!2565 (_2!4481 lt!150734)))))))

(declare-fun choose!16 (BitStream!3878 Bool) tuple2!8452)

(assert (=> d!32144 (= lt!150734 (choose!16 thiss!1305 lt!150454))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32144 (validate_offset_bit!0 ((_ sign_extend 32) (size!2202 (buf!2565 thiss!1305))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)))))

(assert (=> d!32144 (= (appendBit!0 thiss!1305 lt!150454) lt!150734)))

(assert (= (and d!32144 res!84945) b!103255))

(assert (= (and b!103255 res!84946) b!103256))

(assert (= (and b!103256 res!84948) b!103257))

(assert (= (and b!103257 res!84947) b!103258))

(declare-fun m!150661 () Bool)

(assert (=> b!103256 m!150661))

(declare-fun m!150663 () Bool)

(assert (=> b!103255 m!150663))

(assert (=> b!103255 m!150419))

(declare-fun m!150665 () Bool)

(assert (=> b!103257 m!150665))

(assert (=> b!103257 m!150665))

(declare-fun m!150667 () Bool)

(assert (=> b!103257 m!150667))

(declare-fun m!150669 () Bool)

(assert (=> d!32144 m!150669))

(declare-fun m!150671 () Bool)

(assert (=> d!32144 m!150671))

(declare-fun m!150673 () Bool)

(assert (=> b!103258 m!150673))

(assert (=> b!103258 m!150663))

(assert (=> b!103126 d!32144))

(declare-fun b!103259 () Bool)

(declare-fun res!84949 () Bool)

(declare-fun e!67562 () Bool)

(assert (=> b!103259 (=> (not res!84949) (not e!67562))))

(declare-fun lt!150741 () tuple2!8456)

(assert (=> b!103259 (= res!84949 (isPrefixOf!0 (_2!4483 lt!150741) (_2!4481 lt!150453)))))

(declare-fun lt!150754 () (_ BitVec 64))

(declare-fun b!103260 () Bool)

(declare-fun lt!150739 () (_ BitVec 64))

(assert (=> b!103260 (= e!67562 (= (_1!4483 lt!150741) (withMovedBitIndex!0 (_2!4483 lt!150741) (bvsub lt!150739 lt!150754))))))

(assert (=> b!103260 (or (= (bvand lt!150739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150739 lt!150754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103260 (= lt!150754 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150453))) (currentByte!5044 (_2!4481 lt!150453)) (currentBit!5039 (_2!4481 lt!150453))))))

(assert (=> b!103260 (= lt!150739 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(declare-fun b!103261 () Bool)

(declare-fun e!67561 () Unit!6324)

(declare-fun Unit!6343 () Unit!6324)

(assert (=> b!103261 (= e!67561 Unit!6343)))

(declare-fun d!32146 () Bool)

(assert (=> d!32146 e!67562))

(declare-fun res!84950 () Bool)

(assert (=> d!32146 (=> (not res!84950) (not e!67562))))

(assert (=> d!32146 (= res!84950 (isPrefixOf!0 (_1!4483 lt!150741) (_2!4483 lt!150741)))))

(declare-fun lt!150751 () BitStream!3878)

(assert (=> d!32146 (= lt!150741 (tuple2!8457 lt!150751 (_2!4481 lt!150453)))))

(declare-fun lt!150747 () Unit!6324)

(declare-fun lt!150738 () Unit!6324)

(assert (=> d!32146 (= lt!150747 lt!150738)))

(assert (=> d!32146 (isPrefixOf!0 lt!150751 (_2!4481 lt!150453))))

(assert (=> d!32146 (= lt!150738 (lemmaIsPrefixTransitive!0 lt!150751 (_2!4481 lt!150453) (_2!4481 lt!150453)))))

(declare-fun lt!150748 () Unit!6324)

(declare-fun lt!150749 () Unit!6324)

(assert (=> d!32146 (= lt!150748 lt!150749)))

(assert (=> d!32146 (isPrefixOf!0 lt!150751 (_2!4481 lt!150453))))

(assert (=> d!32146 (= lt!150749 (lemmaIsPrefixTransitive!0 lt!150751 (_2!4481 lt!150439) (_2!4481 lt!150453)))))

(declare-fun lt!150752 () Unit!6324)

(assert (=> d!32146 (= lt!150752 e!67561)))

(declare-fun c!6394 () Bool)

(assert (=> d!32146 (= c!6394 (not (= (size!2202 (buf!2565 (_2!4481 lt!150439))) #b00000000000000000000000000000000)))))

(declare-fun lt!150756 () Unit!6324)

(declare-fun lt!150746 () Unit!6324)

(assert (=> d!32146 (= lt!150756 lt!150746)))

(assert (=> d!32146 (isPrefixOf!0 (_2!4481 lt!150453) (_2!4481 lt!150453))))

(assert (=> d!32146 (= lt!150746 (lemmaIsPrefixRefl!0 (_2!4481 lt!150453)))))

(declare-fun lt!150750 () Unit!6324)

(declare-fun lt!150755 () Unit!6324)

(assert (=> d!32146 (= lt!150750 lt!150755)))

(assert (=> d!32146 (= lt!150755 (lemmaIsPrefixRefl!0 (_2!4481 lt!150453)))))

(declare-fun lt!150753 () Unit!6324)

(declare-fun lt!150742 () Unit!6324)

(assert (=> d!32146 (= lt!150753 lt!150742)))

(assert (=> d!32146 (isPrefixOf!0 lt!150751 lt!150751)))

(assert (=> d!32146 (= lt!150742 (lemmaIsPrefixRefl!0 lt!150751))))

(declare-fun lt!150744 () Unit!6324)

(declare-fun lt!150740 () Unit!6324)

(assert (=> d!32146 (= lt!150744 lt!150740)))

(assert (=> d!32146 (isPrefixOf!0 (_2!4481 lt!150439) (_2!4481 lt!150439))))

(assert (=> d!32146 (= lt!150740 (lemmaIsPrefixRefl!0 (_2!4481 lt!150439)))))

(assert (=> d!32146 (= lt!150751 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(assert (=> d!32146 (isPrefixOf!0 (_2!4481 lt!150439) (_2!4481 lt!150453))))

(assert (=> d!32146 (= (reader!0 (_2!4481 lt!150439) (_2!4481 lt!150453)) lt!150741)))

(declare-fun b!103262 () Bool)

(declare-fun res!84951 () Bool)

(assert (=> b!103262 (=> (not res!84951) (not e!67562))))

(assert (=> b!103262 (= res!84951 (isPrefixOf!0 (_1!4483 lt!150741) (_2!4481 lt!150439)))))

(declare-fun b!103263 () Bool)

(declare-fun lt!150737 () Unit!6324)

(assert (=> b!103263 (= e!67561 lt!150737)))

(declare-fun lt!150743 () (_ BitVec 64))

(assert (=> b!103263 (= lt!150743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150745 () (_ BitVec 64))

(assert (=> b!103263 (= lt!150745 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(assert (=> b!103263 (= lt!150737 (arrayBitRangesEqSymmetric!0 (buf!2565 (_2!4481 lt!150439)) (buf!2565 (_2!4481 lt!150453)) lt!150743 lt!150745))))

(assert (=> b!103263 (arrayBitRangesEq!0 (buf!2565 (_2!4481 lt!150453)) (buf!2565 (_2!4481 lt!150439)) lt!150743 lt!150745)))

(assert (= (and d!32146 c!6394) b!103263))

(assert (= (and d!32146 (not c!6394)) b!103261))

(assert (= (and d!32146 res!84950) b!103262))

(assert (= (and b!103262 res!84951) b!103259))

(assert (= (and b!103259 res!84949) b!103260))

(assert (=> b!103263 m!150417))

(declare-fun m!150675 () Bool)

(assert (=> b!103263 m!150675))

(declare-fun m!150677 () Bool)

(assert (=> b!103263 m!150677))

(declare-fun m!150679 () Bool)

(assert (=> b!103259 m!150679))

(declare-fun m!150681 () Bool)

(assert (=> d!32146 m!150681))

(assert (=> d!32146 m!150631))

(declare-fun m!150683 () Bool)

(assert (=> d!32146 m!150683))

(assert (=> d!32146 m!150635))

(declare-fun m!150685 () Bool)

(assert (=> d!32146 m!150685))

(declare-fun m!150687 () Bool)

(assert (=> d!32146 m!150687))

(declare-fun m!150689 () Bool)

(assert (=> d!32146 m!150689))

(declare-fun m!150691 () Bool)

(assert (=> d!32146 m!150691))

(declare-fun m!150693 () Bool)

(assert (=> d!32146 m!150693))

(declare-fun m!150695 () Bool)

(assert (=> d!32146 m!150695))

(declare-fun m!150697 () Bool)

(assert (=> d!32146 m!150697))

(declare-fun m!150699 () Bool)

(assert (=> b!103262 m!150699))

(declare-fun m!150701 () Bool)

(assert (=> b!103260 m!150701))

(assert (=> b!103260 m!150655))

(assert (=> b!103260 m!150417))

(assert (=> b!103126 d!32146))

(declare-fun d!32148 () Bool)

(declare-fun lt!150757 () tuple2!8466)

(assert (=> d!32148 (= lt!150757 (readBit!0 lt!150446))))

(assert (=> d!32148 (= (readBitPure!0 lt!150446) (tuple2!8451 (_2!4488 lt!150757) (_1!4488 lt!150757)))))

(declare-fun bs!7876 () Bool)

(assert (= bs!7876 d!32148))

(declare-fun m!150703 () Bool)

(assert (=> bs!7876 m!150703))

(assert (=> b!103126 d!32148))

(declare-fun d!32150 () Bool)

(declare-fun lt!150758 () tuple2!8466)

(assert (=> d!32150 (= lt!150758 (readBit!0 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))))))

(assert (=> d!32150 (= (readBitPure!0 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))) (tuple2!8451 (_2!4488 lt!150758) (_1!4488 lt!150758)))))

(declare-fun bs!7877 () Bool)

(assert (= bs!7877 d!32150))

(declare-fun m!150705 () Bool)

(assert (=> bs!7877 m!150705))

(assert (=> b!103126 d!32150))

(declare-fun d!32152 () Bool)

(assert (=> d!32152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!150455) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439)))) lt!150455))))

(declare-fun bs!7878 () Bool)

(assert (= bs!7878 d!32152))

(declare-fun m!150707 () Bool)

(assert (=> bs!7878 m!150707))

(assert (=> b!103126 d!32152))

(declare-fun d!32154 () Bool)

(assert (=> d!32154 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!103126 d!32154))

(declare-fun d!32156 () Bool)

(assert (=> d!32156 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)) lt!150440)))

(declare-fun lt!150761 () Unit!6324)

(declare-fun choose!9 (BitStream!3878 array!4825 (_ BitVec 64) BitStream!3878) Unit!6324)

(assert (=> d!32156 (= lt!150761 (choose!9 thiss!1305 (buf!2565 (_2!4481 lt!150453)) lt!150440 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))))))

(assert (=> d!32156 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2565 (_2!4481 lt!150453)) lt!150440) lt!150761)))

(declare-fun bs!7879 () Bool)

(assert (= bs!7879 d!32156))

(assert (=> bs!7879 m!150463))

(declare-fun m!150709 () Bool)

(assert (=> bs!7879 m!150709))

(assert (=> b!103126 d!32156))

(declare-fun d!32158 () Bool)

(declare-fun lt!150762 () tuple2!8466)

(assert (=> d!32158 (= lt!150762 (readBit!0 (_1!4483 lt!150442)))))

(assert (=> d!32158 (= (readBitPure!0 (_1!4483 lt!150442)) (tuple2!8451 (_2!4488 lt!150762) (_1!4488 lt!150762)))))

(declare-fun bs!7880 () Bool)

(assert (= bs!7880 d!32158))

(declare-fun m!150711 () Bool)

(assert (=> bs!7880 m!150711))

(assert (=> b!103126 d!32158))

(declare-fun b!103419 () Bool)

(declare-fun e!67650 () (_ BitVec 64))

(assert (=> b!103419 (= e!67650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!103420 () Bool)

(declare-fun e!67647 () Bool)

(declare-fun lt!151323 () (_ BitVec 64))

(assert (=> b!103420 (= e!67647 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150439)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!151323))))

(declare-fun b!103422 () Bool)

(assert (=> b!103422 (= e!67650 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun lt!151290 () BitStream!3878)

(declare-fun bm!1288 () Bool)

(declare-fun lt!151311 () tuple2!8452)

(declare-fun call!1291 () Bool)

(declare-fun c!6415 () Bool)

(assert (=> bm!1288 (= call!1291 (isPrefixOf!0 (ite c!6415 (_2!4481 lt!150439) lt!151290) (ite c!6415 (_2!4481 lt!151311) lt!151290)))))

(declare-fun b!103423 () Bool)

(declare-fun res!85069 () Bool)

(declare-fun lt!151320 () tuple2!8452)

(assert (=> b!103423 (= res!85069 (isPrefixOf!0 (_2!4481 lt!150439) (_2!4481 lt!151320)))))

(declare-fun e!67645 () Bool)

(assert (=> b!103423 (=> (not res!85069) (not e!67645))))

(declare-fun b!103424 () Bool)

(declare-fun e!67649 () tuple2!8452)

(declare-fun lt!151296 () Unit!6324)

(assert (=> b!103424 (= e!67649 (tuple2!8453 lt!151296 (_2!4481 lt!150439)))))

(assert (=> b!103424 (= lt!151290 (_2!4481 lt!150439))))

(assert (=> b!103424 (= lt!151296 (lemmaIsPrefixRefl!0 lt!151290))))

(assert (=> b!103424 call!1291))

(declare-fun b!103425 () Bool)

(declare-fun Unit!6344 () Unit!6324)

(assert (=> b!103425 (= e!67649 (tuple2!8453 Unit!6344 (_2!4481 lt!151311)))))

(declare-fun lt!151286 () Bool)

(assert (=> b!103425 (= lt!151286 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103425 (= lt!151320 (appendBit!0 (_2!4481 lt!150439) lt!151286))))

(declare-fun res!85068 () Bool)

(assert (=> b!103425 (= res!85068 (= (size!2202 (buf!2565 (_2!4481 lt!150439))) (size!2202 (buf!2565 (_2!4481 lt!151320)))))))

(assert (=> b!103425 (=> (not res!85068) (not e!67645))))

(assert (=> b!103425 e!67645))

(declare-fun lt!151319 () tuple2!8452)

(assert (=> b!103425 (= lt!151319 lt!151320)))

(assert (=> b!103425 (= lt!151311 (appendNLeastSignificantBitsLoop!0 (_2!4481 lt!151319) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!151279 () Unit!6324)

(assert (=> b!103425 (= lt!151279 (lemmaIsPrefixTransitive!0 (_2!4481 lt!150439) (_2!4481 lt!151319) (_2!4481 lt!151311)))))

(assert (=> b!103425 call!1291))

(declare-fun lt!151297 () Unit!6324)

(assert (=> b!103425 (= lt!151297 lt!151279)))

(assert (=> b!103425 (invariant!0 (currentBit!5039 (_2!4481 lt!150439)) (currentByte!5044 (_2!4481 lt!150439)) (size!2202 (buf!2565 (_2!4481 lt!151319))))))

(declare-fun lt!151291 () BitStream!3878)

(assert (=> b!103425 (= lt!151291 (BitStream!3879 (buf!2565 (_2!4481 lt!151319)) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(assert (=> b!103425 (invariant!0 (currentBit!5039 lt!151291) (currentByte!5044 lt!151291) (size!2202 (buf!2565 (_2!4481 lt!151311))))))

(declare-fun lt!151316 () BitStream!3878)

(assert (=> b!103425 (= lt!151316 (BitStream!3879 (buf!2565 (_2!4481 lt!151311)) (currentByte!5044 lt!151291) (currentBit!5039 lt!151291)))))

(declare-fun lt!151292 () tuple2!8450)

(assert (=> b!103425 (= lt!151292 (readBitPure!0 lt!151291))))

(declare-fun lt!151280 () tuple2!8450)

(assert (=> b!103425 (= lt!151280 (readBitPure!0 lt!151316))))

(declare-fun lt!151309 () Unit!6324)

(assert (=> b!103425 (= lt!151309 (readBitPrefixLemma!0 lt!151291 (_2!4481 lt!151311)))))

(declare-fun res!85067 () Bool)

(assert (=> b!103425 (= res!85067 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!151292))) (currentByte!5044 (_1!4480 lt!151292)) (currentBit!5039 (_1!4480 lt!151292))) (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!151280))) (currentByte!5044 (_1!4480 lt!151280)) (currentBit!5039 (_1!4480 lt!151280)))))))

(declare-fun e!67644 () Bool)

(assert (=> b!103425 (=> (not res!85067) (not e!67644))))

(assert (=> b!103425 e!67644))

(declare-fun lt!151308 () Unit!6324)

(assert (=> b!103425 (= lt!151308 lt!151309)))

(declare-fun lt!151284 () tuple2!8456)

(assert (=> b!103425 (= lt!151284 (reader!0 (_2!4481 lt!150439) (_2!4481 lt!151311)))))

(declare-fun lt!151310 () tuple2!8456)

(assert (=> b!103425 (= lt!151310 (reader!0 (_2!4481 lt!151319) (_2!4481 lt!151311)))))

(declare-fun lt!151307 () tuple2!8450)

(assert (=> b!103425 (= lt!151307 (readBitPure!0 (_1!4483 lt!151284)))))

(assert (=> b!103425 (= (_2!4480 lt!151307) lt!151286)))

(declare-fun lt!151295 () Unit!6324)

(declare-fun Unit!6345 () Unit!6324)

(assert (=> b!103425 (= lt!151295 Unit!6345)))

(declare-fun lt!151282 () (_ BitVec 64))

(assert (=> b!103425 (= lt!151282 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!151303 () (_ BitVec 64))

(assert (=> b!103425 (= lt!151303 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!151302 () Unit!6324)

(assert (=> b!103425 (= lt!151302 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4481 lt!150439) (buf!2565 (_2!4481 lt!151311)) lt!151303))))

(assert (=> b!103425 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!151311)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!151303)))

(declare-fun lt!151313 () Unit!6324)

(assert (=> b!103425 (= lt!151313 lt!151302)))

(declare-fun lt!151293 () tuple2!8454)

(assert (=> b!103425 (= lt!151293 (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!151284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151282))))

(declare-fun lt!151314 () (_ BitVec 64))

(assert (=> b!103425 (= lt!151314 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!151318 () Unit!6324)

(assert (=> b!103425 (= lt!151318 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4481 lt!151319) (buf!2565 (_2!4481 lt!151311)) lt!151314))))

(assert (=> b!103425 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!151311)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!151319))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!151319))) lt!151314)))

(declare-fun lt!151299 () Unit!6324)

(assert (=> b!103425 (= lt!151299 lt!151318)))

(declare-fun lt!151315 () tuple2!8454)

(assert (=> b!103425 (= lt!151315 (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!151310) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!151282 (ite (_2!4480 lt!151307) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!151285 () tuple2!8454)

(assert (=> b!103425 (= lt!151285 (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!151284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151282))))

(declare-fun c!6416 () Bool)

(assert (=> b!103425 (= c!6416 (_2!4480 (readBitPure!0 (_1!4483 lt!151284))))))

(declare-fun lt!151304 () tuple2!8454)

(assert (=> b!103425 (= lt!151304 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4483 lt!151284) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!151282 e!67650)))))

(declare-fun lt!151300 () Unit!6324)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6324)

(assert (=> b!103425 (= lt!151300 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4483 lt!151284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151282))))

(assert (=> b!103425 (and (= (_2!4482 lt!151285) (_2!4482 lt!151304)) (= (_1!4482 lt!151285) (_1!4482 lt!151304)))))

(declare-fun lt!151305 () Unit!6324)

(assert (=> b!103425 (= lt!151305 lt!151300)))

(assert (=> b!103425 (= (_1!4483 lt!151284) (withMovedBitIndex!0 (_2!4483 lt!151284) (bvsub (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151311))) (currentByte!5044 (_2!4481 lt!151311)) (currentBit!5039 (_2!4481 lt!151311))))))))

(declare-fun lt!151298 () Unit!6324)

(declare-fun Unit!6346 () Unit!6324)

(assert (=> b!103425 (= lt!151298 Unit!6346)))

(assert (=> b!103425 (= (_1!4483 lt!151310) (withMovedBitIndex!0 (_2!4483 lt!151310) (bvsub (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151319))) (currentByte!5044 (_2!4481 lt!151319)) (currentBit!5039 (_2!4481 lt!151319))) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151311))) (currentByte!5044 (_2!4481 lt!151311)) (currentBit!5039 (_2!4481 lt!151311))))))))

(declare-fun lt!151301 () Unit!6324)

(declare-fun Unit!6347 () Unit!6324)

(assert (=> b!103425 (= lt!151301 Unit!6347)))

(assert (=> b!103425 (= (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))) (bvsub (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151319))) (currentByte!5044 (_2!4481 lt!151319)) (currentBit!5039 (_2!4481 lt!151319))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!151306 () Unit!6324)

(declare-fun Unit!6348 () Unit!6324)

(assert (=> b!103425 (= lt!151306 Unit!6348)))

(assert (=> b!103425 (= (_2!4482 lt!151293) (_2!4482 lt!151315))))

(declare-fun lt!151289 () Unit!6324)

(declare-fun Unit!6349 () Unit!6324)

(assert (=> b!103425 (= lt!151289 Unit!6349)))

(assert (=> b!103425 (= (_1!4482 lt!151293) (_2!4483 lt!151284))))

(declare-fun b!103426 () Bool)

(declare-fun res!85072 () Bool)

(declare-fun e!67648 () Bool)

(assert (=> b!103426 (=> (not res!85072) (not e!67648))))

(declare-fun lt!151321 () tuple2!8452)

(assert (=> b!103426 (= res!85072 (isPrefixOf!0 (_2!4481 lt!150439) (_2!4481 lt!151321)))))

(declare-fun b!103427 () Bool)

(declare-fun e!67646 () Bool)

(declare-fun lt!151281 () tuple2!8450)

(assert (=> b!103427 (= e!67646 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!151281))) (currentByte!5044 (_1!4480 lt!151281)) (currentBit!5039 (_1!4480 lt!151281))) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151320))) (currentByte!5044 (_2!4481 lt!151320)) (currentBit!5039 (_2!4481 lt!151320)))))))

(declare-fun b!103428 () Bool)

(declare-fun res!85074 () Bool)

(assert (=> b!103428 (=> (not res!85074) (not e!67648))))

(declare-fun lt!151322 () (_ BitVec 64))

(declare-fun lt!151283 () (_ BitVec 64))

(assert (=> b!103428 (= res!85074 (= (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151321))) (currentByte!5044 (_2!4481 lt!151321)) (currentBit!5039 (_2!4481 lt!151321))) (bvadd lt!151322 lt!151283)))))

(assert (=> b!103428 (or (not (= (bvand lt!151322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!151322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!151322 lt!151283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103428 (= lt!151283 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103428 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103428 (= lt!151322 (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))))))

(declare-fun lt!151288 () tuple2!8454)

(declare-fun lt!151294 () tuple2!8456)

(declare-fun b!103429 () Bool)

(assert (=> b!103429 (= e!67648 (and (= (_2!4482 lt!151288) v!199) (= (_1!4482 lt!151288) (_2!4483 lt!151294))))))

(declare-fun lt!151287 () (_ BitVec 64))

(assert (=> b!103429 (= lt!151288 (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!151294) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151287))))

(declare-fun lt!151312 () Unit!6324)

(declare-fun lt!151317 () Unit!6324)

(assert (=> b!103429 (= lt!151312 lt!151317)))

(assert (=> b!103429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!151321)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!151323)))

(assert (=> b!103429 (= lt!151317 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4481 lt!150439) (buf!2565 (_2!4481 lt!151321)) lt!151323))))

(assert (=> b!103429 e!67647))

(declare-fun res!85070 () Bool)

(assert (=> b!103429 (=> (not res!85070) (not e!67647))))

(assert (=> b!103429 (= res!85070 (and (= (size!2202 (buf!2565 (_2!4481 lt!150439))) (size!2202 (buf!2565 (_2!4481 lt!151321)))) (bvsge lt!151323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103429 (= lt!151323 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103429 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103429 (= lt!151287 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!103429 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103429 (= lt!151294 (reader!0 (_2!4481 lt!150439) (_2!4481 lt!151321)))))

(declare-fun d!32160 () Bool)

(assert (=> d!32160 e!67648))

(declare-fun res!85066 () Bool)

(assert (=> d!32160 (=> (not res!85066) (not e!67648))))

(assert (=> d!32160 (= res!85066 (= (size!2202 (buf!2565 (_2!4481 lt!150439))) (size!2202 (buf!2565 (_2!4481 lt!151321)))))))

(assert (=> d!32160 (= lt!151321 e!67649)))

(assert (=> d!32160 (= c!6415 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32160 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32160 (= (appendNLeastSignificantBitsLoop!0 (_2!4481 lt!150439) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!151321)))

(declare-fun b!103421 () Bool)

(declare-fun res!85071 () Bool)

(assert (=> b!103421 (= res!85071 (= (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!151320))) (currentByte!5044 (_2!4481 lt!151320)) (currentBit!5039 (_2!4481 lt!151320))) (bvadd (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!103421 (=> (not res!85071) (not e!67645))))

(declare-fun b!103430 () Bool)

(assert (=> b!103430 (= lt!151281 (readBitPure!0 (readerFrom!0 (_2!4481 lt!151320) (currentBit!5039 (_2!4481 lt!150439)) (currentByte!5044 (_2!4481 lt!150439)))))))

(declare-fun res!85073 () Bool)

(assert (=> b!103430 (= res!85073 (and (= (_2!4480 lt!151281) lt!151286) (= (_1!4480 lt!151281) (_2!4481 lt!151320))))))

(assert (=> b!103430 (=> (not res!85073) (not e!67646))))

(assert (=> b!103430 (= e!67645 e!67646)))

(declare-fun b!103431 () Bool)

(assert (=> b!103431 (= e!67644 (= (_2!4480 lt!151292) (_2!4480 lt!151280)))))

(assert (= (and d!32160 c!6415) b!103425))

(assert (= (and d!32160 (not c!6415)) b!103424))

(assert (= (and b!103425 res!85068) b!103421))

(assert (= (and b!103421 res!85071) b!103423))

(assert (= (and b!103423 res!85069) b!103430))

(assert (= (and b!103430 res!85073) b!103427))

(assert (= (and b!103425 res!85067) b!103431))

(assert (= (and b!103425 c!6416) b!103422))

(assert (= (and b!103425 (not c!6416)) b!103419))

(assert (= (or b!103425 b!103424) bm!1288))

(assert (= (and d!32160 res!85066) b!103428))

(assert (= (and b!103428 res!85074) b!103426))

(assert (= (and b!103426 res!85072) b!103429))

(assert (= (and b!103429 res!85070) b!103420))

(declare-fun m!150997 () Bool)

(assert (=> b!103424 m!150997))

(declare-fun m!150999 () Bool)

(assert (=> b!103426 m!150999))

(declare-fun m!151001 () Bool)

(assert (=> bm!1288 m!151001))

(declare-fun m!151003 () Bool)

(assert (=> b!103421 m!151003))

(assert (=> b!103421 m!150417))

(declare-fun m!151005 () Bool)

(assert (=> b!103429 m!151005))

(declare-fun m!151007 () Bool)

(assert (=> b!103429 m!151007))

(declare-fun m!151009 () Bool)

(assert (=> b!103429 m!151009))

(declare-fun m!151011 () Bool)

(assert (=> b!103429 m!151011))

(declare-fun m!151013 () Bool)

(assert (=> b!103429 m!151013))

(declare-fun m!151015 () Bool)

(assert (=> b!103423 m!151015))

(declare-fun m!151017 () Bool)

(assert (=> b!103428 m!151017))

(assert (=> b!103428 m!150417))

(declare-fun m!151019 () Bool)

(assert (=> b!103427 m!151019))

(assert (=> b!103427 m!151003))

(declare-fun m!151021 () Bool)

(assert (=> b!103420 m!151021))

(assert (=> b!103425 m!150417))

(assert (=> b!103425 m!151005))

(declare-fun m!151023 () Bool)

(assert (=> b!103425 m!151023))

(declare-fun m!151025 () Bool)

(assert (=> b!103425 m!151025))

(declare-fun m!151027 () Bool)

(assert (=> b!103425 m!151027))

(declare-fun m!151029 () Bool)

(assert (=> b!103425 m!151029))

(declare-fun m!151031 () Bool)

(assert (=> b!103425 m!151031))

(declare-fun m!151033 () Bool)

(assert (=> b!103425 m!151033))

(declare-fun m!151035 () Bool)

(assert (=> b!103425 m!151035))

(declare-fun m!151037 () Bool)

(assert (=> b!103425 m!151037))

(declare-fun m!151039 () Bool)

(assert (=> b!103425 m!151039))

(declare-fun m!151041 () Bool)

(assert (=> b!103425 m!151041))

(declare-fun m!151043 () Bool)

(assert (=> b!103425 m!151043))

(declare-fun m!151045 () Bool)

(assert (=> b!103425 m!151045))

(declare-fun m!151047 () Bool)

(assert (=> b!103425 m!151047))

(declare-fun m!151049 () Bool)

(assert (=> b!103425 m!151049))

(declare-fun m!151051 () Bool)

(assert (=> b!103425 m!151051))

(declare-fun m!151053 () Bool)

(assert (=> b!103425 m!151053))

(assert (=> b!103425 m!151043))

(declare-fun m!151055 () Bool)

(assert (=> b!103425 m!151055))

(declare-fun m!151057 () Bool)

(assert (=> b!103425 m!151057))

(declare-fun m!151059 () Bool)

(assert (=> b!103425 m!151059))

(declare-fun m!151061 () Bool)

(assert (=> b!103425 m!151061))

(declare-fun m!151063 () Bool)

(assert (=> b!103425 m!151063))

(declare-fun m!151065 () Bool)

(assert (=> b!103425 m!151065))

(declare-fun m!151067 () Bool)

(assert (=> b!103425 m!151067))

(declare-fun m!151069 () Bool)

(assert (=> b!103425 m!151069))

(declare-fun m!151071 () Bool)

(assert (=> b!103425 m!151071))

(declare-fun m!151073 () Bool)

(assert (=> b!103425 m!151073))

(declare-fun m!151075 () Bool)

(assert (=> b!103430 m!151075))

(assert (=> b!103430 m!151075))

(declare-fun m!151077 () Bool)

(assert (=> b!103430 m!151077))

(assert (=> b!103126 d!32160))

(declare-fun d!32214 () Bool)

(assert (=> d!32214 (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 (_2!4481 lt!150439))) ((_ sign_extend 32) (currentBit!5039 (_2!4481 lt!150439))) lt!150455)))

(declare-fun lt!151324 () Unit!6324)

(assert (=> d!32214 (= lt!151324 (choose!9 (_2!4481 lt!150439) (buf!2565 (_2!4481 lt!150453)) lt!150455 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439)))))))

(assert (=> d!32214 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4481 lt!150439) (buf!2565 (_2!4481 lt!150453)) lt!150455) lt!151324)))

(declare-fun bs!7893 () Bool)

(assert (= bs!7893 d!32214))

(assert (=> bs!7893 m!150465))

(declare-fun m!151079 () Bool)

(assert (=> bs!7893 m!151079))

(assert (=> b!103126 d!32214))

(declare-fun d!32216 () Bool)

(declare-datatypes ((tuple2!8468 0))(
  ( (tuple2!8469 (_1!4489 (_ BitVec 64)) (_2!4489 BitStream!3878)) )
))
(declare-fun lt!151327 () tuple2!8468)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8468)

(assert (=> d!32216 (= lt!151327 (readNLeastSignificantBitsLoop!0 (_1!4483 lt!150442) nBits!396 i!615 lt!150445))))

(assert (=> d!32216 (= (readNLeastSignificantBitsLoopPure!0 (_1!4483 lt!150442) nBits!396 i!615 lt!150445) (tuple2!8455 (_2!4489 lt!151327) (_1!4489 lt!151327)))))

(declare-fun bs!7894 () Bool)

(assert (= bs!7894 d!32216))

(declare-fun m!151081 () Bool)

(assert (=> bs!7894 m!151081))

(assert (=> b!103126 d!32216))

(declare-fun d!32218 () Bool)

(assert (=> d!32218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305)) lt!150440) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_2!4481 lt!150453)))) ((_ sign_extend 32) (currentByte!5044 thiss!1305)) ((_ sign_extend 32) (currentBit!5039 thiss!1305))) lt!150440))))

(declare-fun bs!7895 () Bool)

(assert (= bs!7895 d!32218))

(declare-fun m!151083 () Bool)

(assert (=> bs!7895 m!151083))

(assert (=> b!103126 d!32218))

(declare-fun d!32220 () Bool)

(assert (=> d!32220 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150453))))

(declare-fun lt!151330 () Unit!6324)

(declare-fun choose!30 (BitStream!3878 BitStream!3878 BitStream!3878) Unit!6324)

(assert (=> d!32220 (= lt!151330 (choose!30 thiss!1305 (_2!4481 lt!150439) (_2!4481 lt!150453)))))

(assert (=> d!32220 (isPrefixOf!0 thiss!1305 (_2!4481 lt!150439))))

(assert (=> d!32220 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4481 lt!150439) (_2!4481 lt!150453)) lt!151330)))

(declare-fun bs!7896 () Bool)

(assert (= bs!7896 d!32220))

(assert (=> bs!7896 m!150441))

(declare-fun m!151085 () Bool)

(assert (=> bs!7896 m!151085))

(assert (=> bs!7896 m!150429))

(assert (=> b!103126 d!32220))

(declare-fun d!32222 () Bool)

(declare-fun e!67653 () Bool)

(assert (=> d!32222 e!67653))

(declare-fun res!85077 () Bool)

(assert (=> d!32222 (=> (not res!85077) (not e!67653))))

(declare-fun lt!151340 () tuple2!8450)

(declare-fun lt!151342 () tuple2!8450)

(assert (=> d!32222 (= res!85077 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!151340))) (currentByte!5044 (_1!4480 lt!151340)) (currentBit!5039 (_1!4480 lt!151340))) (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!151342))) (currentByte!5044 (_1!4480 lt!151342)) (currentBit!5039 (_1!4480 lt!151342)))))))

(declare-fun lt!151341 () Unit!6324)

(declare-fun lt!151339 () BitStream!3878)

(declare-fun choose!50 (BitStream!3878 BitStream!3878 BitStream!3878 tuple2!8450 tuple2!8450 BitStream!3878 Bool tuple2!8450 tuple2!8450 BitStream!3878 Bool) Unit!6324)

(assert (=> d!32222 (= lt!151341 (choose!50 lt!150446 (_2!4481 lt!150453) lt!151339 lt!151340 (tuple2!8451 (_1!4480 lt!151340) (_2!4480 lt!151340)) (_1!4480 lt!151340) (_2!4480 lt!151340) lt!151342 (tuple2!8451 (_1!4480 lt!151342) (_2!4480 lt!151342)) (_1!4480 lt!151342) (_2!4480 lt!151342)))))

(assert (=> d!32222 (= lt!151342 (readBitPure!0 lt!151339))))

(assert (=> d!32222 (= lt!151340 (readBitPure!0 lt!150446))))

(assert (=> d!32222 (= lt!151339 (BitStream!3879 (buf!2565 (_2!4481 lt!150453)) (currentByte!5044 lt!150446) (currentBit!5039 lt!150446)))))

(assert (=> d!32222 (invariant!0 (currentBit!5039 lt!150446) (currentByte!5044 lt!150446) (size!2202 (buf!2565 (_2!4481 lt!150453))))))

(assert (=> d!32222 (= (readBitPrefixLemma!0 lt!150446 (_2!4481 lt!150453)) lt!151341)))

(declare-fun b!103434 () Bool)

(assert (=> b!103434 (= e!67653 (= (_2!4480 lt!151340) (_2!4480 lt!151342)))))

(assert (= (and d!32222 res!85077) b!103434))

(declare-fun m!151087 () Bool)

(assert (=> d!32222 m!151087))

(declare-fun m!151089 () Bool)

(assert (=> d!32222 m!151089))

(assert (=> d!32222 m!150433))

(declare-fun m!151091 () Bool)

(assert (=> d!32222 m!151091))

(declare-fun m!151093 () Bool)

(assert (=> d!32222 m!151093))

(declare-fun m!151095 () Bool)

(assert (=> d!32222 m!151095))

(assert (=> b!103126 d!32222))

(declare-fun d!32224 () Bool)

(declare-fun e!67654 () Bool)

(assert (=> d!32224 e!67654))

(declare-fun res!85078 () Bool)

(assert (=> d!32224 (=> (not res!85078) (not e!67654))))

(declare-fun lt!151344 () (_ BitVec 64))

(declare-fun lt!151348 () (_ BitVec 64))

(declare-fun lt!151346 () (_ BitVec 64))

(assert (=> d!32224 (= res!85078 (= lt!151348 (bvsub lt!151344 lt!151346)))))

(assert (=> d!32224 (or (= (bvand lt!151344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151344 lt!151346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32224 (= lt!151346 (remainingBits!0 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150448)))) ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150448))) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150448)))))))

(declare-fun lt!151345 () (_ BitVec 64))

(declare-fun lt!151343 () (_ BitVec 64))

(assert (=> d!32224 (= lt!151344 (bvmul lt!151345 lt!151343))))

(assert (=> d!32224 (or (= lt!151345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!151343 (bvsdiv (bvmul lt!151345 lt!151343) lt!151345)))))

(assert (=> d!32224 (= lt!151343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32224 (= lt!151345 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150448)))))))

(assert (=> d!32224 (= lt!151348 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5044 (_1!4480 lt!150448))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5039 (_1!4480 lt!150448)))))))

(assert (=> d!32224 (invariant!0 (currentBit!5039 (_1!4480 lt!150448)) (currentByte!5044 (_1!4480 lt!150448)) (size!2202 (buf!2565 (_1!4480 lt!150448))))))

(assert (=> d!32224 (= (bitIndex!0 (size!2202 (buf!2565 (_1!4480 lt!150448))) (currentByte!5044 (_1!4480 lt!150448)) (currentBit!5039 (_1!4480 lt!150448))) lt!151348)))

(declare-fun b!103435 () Bool)

(declare-fun res!85079 () Bool)

(assert (=> b!103435 (=> (not res!85079) (not e!67654))))

(assert (=> b!103435 (= res!85079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!151348))))

(declare-fun b!103436 () Bool)

(declare-fun lt!151347 () (_ BitVec 64))

(assert (=> b!103436 (= e!67654 (bvsle lt!151348 (bvmul lt!151347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103436 (or (= lt!151347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!151347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!151347)))))

(assert (=> b!103436 (= lt!151347 ((_ sign_extend 32) (size!2202 (buf!2565 (_1!4480 lt!150448)))))))

(assert (= (and d!32224 res!85078) b!103435))

(assert (= (and b!103435 res!85079) b!103436))

(declare-fun m!151097 () Bool)

(assert (=> d!32224 m!151097))

(declare-fun m!151099 () Bool)

(assert (=> d!32224 m!151099))

(assert (=> b!103126 d!32224))

(declare-fun d!32226 () Bool)

(declare-fun res!85086 () Bool)

(declare-fun e!67659 () Bool)

(assert (=> d!32226 (=> (not res!85086) (not e!67659))))

(assert (=> d!32226 (= res!85086 (= (size!2202 (buf!2565 thiss!1305)) (size!2202 (buf!2565 (_2!4481 lt!150453)))))))

(assert (=> d!32226 (= (isPrefixOf!0 thiss!1305 (_2!4481 lt!150453)) e!67659)))

(declare-fun b!103443 () Bool)

(declare-fun res!85088 () Bool)

(assert (=> b!103443 (=> (not res!85088) (not e!67659))))

(assert (=> b!103443 (= res!85088 (bvsle (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150453))) (currentByte!5044 (_2!4481 lt!150453)) (currentBit!5039 (_2!4481 lt!150453)))))))

(declare-fun b!103444 () Bool)

(declare-fun e!67660 () Bool)

(assert (=> b!103444 (= e!67659 e!67660)))

(declare-fun res!85087 () Bool)

(assert (=> b!103444 (=> res!85087 e!67660)))

(assert (=> b!103444 (= res!85087 (= (size!2202 (buf!2565 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103445 () Bool)

(assert (=> b!103445 (= e!67660 (arrayBitRangesEq!0 (buf!2565 thiss!1305) (buf!2565 (_2!4481 lt!150453)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))))))

(assert (= (and d!32226 res!85086) b!103443))

(assert (= (and b!103443 res!85088) b!103444))

(assert (= (and b!103444 (not res!85087)) b!103445))

(assert (=> b!103443 m!150419))

(assert (=> b!103443 m!150655))

(assert (=> b!103445 m!150419))

(assert (=> b!103445 m!150419))

(declare-fun m!151101 () Bool)

(assert (=> b!103445 m!151101))

(assert (=> b!103126 d!32226))

(declare-fun d!32228 () Bool)

(declare-fun res!85089 () Bool)

(declare-fun e!67661 () Bool)

(assert (=> d!32228 (=> (not res!85089) (not e!67661))))

(assert (=> d!32228 (= res!85089 (= (size!2202 (buf!2565 thiss!1305)) (size!2202 (buf!2565 (_2!4481 lt!150439)))))))

(assert (=> d!32228 (= (isPrefixOf!0 thiss!1305 (_2!4481 lt!150439)) e!67661)))

(declare-fun b!103446 () Bool)

(declare-fun res!85091 () Bool)

(assert (=> b!103446 (=> (not res!85091) (not e!67661))))

(assert (=> b!103446 (= res!85091 (bvsle (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305)) (bitIndex!0 (size!2202 (buf!2565 (_2!4481 lt!150439))) (currentByte!5044 (_2!4481 lt!150439)) (currentBit!5039 (_2!4481 lt!150439)))))))

(declare-fun b!103447 () Bool)

(declare-fun e!67662 () Bool)

(assert (=> b!103447 (= e!67661 e!67662)))

(declare-fun res!85090 () Bool)

(assert (=> b!103447 (=> res!85090 e!67662)))

(assert (=> b!103447 (= res!85090 (= (size!2202 (buf!2565 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103448 () Bool)

(assert (=> b!103448 (= e!67662 (arrayBitRangesEq!0 (buf!2565 thiss!1305) (buf!2565 (_2!4481 lt!150439)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2202 (buf!2565 thiss!1305)) (currentByte!5044 thiss!1305) (currentBit!5039 thiss!1305))))))

(assert (= (and d!32228 res!85089) b!103446))

(assert (= (and b!103446 res!85091) b!103447))

(assert (= (and b!103447 (not res!85090)) b!103448))

(assert (=> b!103446 m!150419))

(assert (=> b!103446 m!150417))

(assert (=> b!103448 m!150419))

(assert (=> b!103448 m!150419))

(declare-fun m!151103 () Bool)

(assert (=> b!103448 m!151103))

(assert (=> b!103136 d!32228))

(declare-fun d!32230 () Bool)

(assert (=> d!32230 (= (invariant!0 (currentBit!5039 thiss!1305) (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150439)))) (and (bvsge (currentBit!5039 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5039 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5044 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150439)))) (and (= (currentBit!5039 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5044 thiss!1305) (size!2202 (buf!2565 (_2!4481 lt!150439))))))))))

(assert (=> b!103125 d!32230))

(push 1)

(assert (not b!103239))

(assert (not d!32138))

(assert (not d!32222))

(assert (not b!103426))

(assert (not d!32122))

(assert (not d!32224))

(assert (not b!103240))

(assert (not b!103428))

(assert (not b!103259))

(assert (not b!103255))

(assert (not b!103425))

(assert (not b!103443))

(assert (not b!103260))

(assert (not d!32218))

(assert (not d!32152))

(assert (not d!32146))

(assert (not b!103256))

(assert (not b!103258))

(assert (not d!32132))

(assert (not b!103429))

(assert (not b!103445))

(assert (not d!32144))

(assert (not d!32120))

(assert (not b!103423))

(assert (not b!103448))

(assert (not bm!1288))

(assert (not b!103424))

(assert (not d!32156))

(assert (not d!32130))

(assert (not d!32214))

(assert (not d!32128))

(assert (not d!32118))

(assert (not d!32148))

(assert (not d!32124))

(assert (not d!32142))

(assert (not b!103226))

(assert (not b!103421))

(assert (not b!103430))

(assert (not d!32150))

(assert (not b!103257))

(assert (not b!103446))

(assert (not b!103243))

(assert (not b!103262))

(assert (not d!32220))

(assert (not b!103427))

(assert (not d!32158))

(assert (not b!103242))

(assert (not b!103420))

(assert (not d!32140))

(assert (not d!32216))

(assert (not b!103263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

