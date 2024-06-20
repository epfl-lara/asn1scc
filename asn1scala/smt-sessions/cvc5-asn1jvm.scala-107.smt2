; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2684 () Bool)

(assert start!2684)

(declare-fun b!12886 () Bool)

(declare-fun res!12268 () Bool)

(declare-fun e!7810 () Bool)

(assert (=> b!12886 (=> res!12268 e!7810)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!699 0))(
  ( (array!700 (arr!733 (Array (_ BitVec 32) (_ BitVec 8))) (size!304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!568 0))(
  ( (BitStream!569 (buf!655 array!699) (currentByte!1739 (_ BitVec 32)) (currentBit!1734 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1091 0))(
  ( (Unit!1092) )
))
(declare-datatypes ((tuple2!1510 0))(
  ( (tuple2!1511 (_1!810 Unit!1091) (_2!810 BitStream!568)) )
))
(declare-fun lt!20690 () tuple2!1510)

(declare-fun srcBuffer!6 () array!699)

(declare-datatypes ((List!180 0))(
  ( (Nil!177) (Cons!176 (h!295 Bool) (t!930 List!180)) )
))
(declare-fun lt!20688 () List!180)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!568 array!699 (_ BitVec 64) (_ BitVec 64)) List!180)

(assert (=> b!12886 (= res!12268 (not (= lt!20688 (byteArrayBitContentToList!0 (_2!810 lt!20690) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!12267 () Bool)

(declare-fun e!7811 () Bool)

(assert (=> start!2684 (=> (not res!12267) (not e!7811))))

(assert (=> start!2684 (= res!12267 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!304 srcBuffer!6))))))))

(assert (=> start!2684 e!7811))

(assert (=> start!2684 true))

(declare-fun array_inv!293 (array!699) Bool)

(assert (=> start!2684 (array_inv!293 srcBuffer!6)))

(declare-fun thiss!1486 () BitStream!568)

(declare-fun e!7808 () Bool)

(declare-fun inv!12 (BitStream!568) Bool)

(assert (=> start!2684 (and (inv!12 thiss!1486) e!7808)))

(declare-fun b!12887 () Bool)

(assert (=> b!12887 (= e!7808 (array_inv!293 (buf!655 thiss!1486)))))

(declare-fun b!12888 () Bool)

(declare-fun res!12271 () Bool)

(declare-fun e!7809 () Bool)

(assert (=> b!12888 (=> (not res!12271) (not e!7809))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12888 (= res!12271 (= (bitIndex!0 (size!304 (buf!655 (_2!810 lt!20690))) (currentByte!1739 (_2!810 lt!20690)) (currentBit!1734 (_2!810 lt!20690))) (bvadd (bitIndex!0 (size!304 (buf!655 thiss!1486)) (currentByte!1739 thiss!1486) (currentBit!1734 thiss!1486)) nBits!460)))))

(declare-fun b!12889 () Bool)

(assert (=> b!12889 (= e!7811 e!7809)))

(declare-fun res!12265 () Bool)

(assert (=> b!12889 (=> (not res!12265) (not e!7809))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12889 (= res!12265 (invariant!0 (currentBit!1734 (_2!810 lt!20690)) (currentByte!1739 (_2!810 lt!20690)) (size!304 (buf!655 (_2!810 lt!20690)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!568 array!699 (_ BitVec 64) (_ BitVec 64)) tuple2!1510)

(assert (=> b!12889 (= lt!20690 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12890 () Bool)

(declare-fun res!12264 () Bool)

(assert (=> b!12890 (=> (not res!12264) (not e!7809))))

(assert (=> b!12890 (= res!12264 (= (size!304 (buf!655 thiss!1486)) (size!304 (buf!655 (_2!810 lt!20690)))))))

(declare-fun b!12891 () Bool)

(declare-fun res!12266 () Bool)

(assert (=> b!12891 (=> (not res!12266) (not e!7809))))

(declare-fun isPrefixOf!0 (BitStream!568 BitStream!568) Bool)

(assert (=> b!12891 (= res!12266 (isPrefixOf!0 thiss!1486 (_2!810 lt!20690)))))

(declare-fun b!12892 () Bool)

(assert (=> b!12892 (= e!7810 true)))

(declare-datatypes ((tuple2!1512 0))(
  ( (tuple2!1513 (_1!811 array!699) (_2!811 BitStream!568)) )
))
(declare-fun lt!20687 () tuple2!1512)

(declare-fun lt!20685 () Unit!1091)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!568 array!699 array!699 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1091)

(assert (=> b!12892 (= lt!20685 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!810 lt!20690) srcBuffer!6 (_1!811 lt!20687) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12893 () Bool)

(declare-fun res!12270 () Bool)

(assert (=> b!12893 (=> (not res!12270) (not e!7811))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12893 (= res!12270 (validate_offset_bits!1 ((_ sign_extend 32) (size!304 (buf!655 thiss!1486))) ((_ sign_extend 32) (currentByte!1739 thiss!1486)) ((_ sign_extend 32) (currentBit!1734 thiss!1486)) nBits!460))))

(declare-fun b!12894 () Bool)

(assert (=> b!12894 (= e!7809 (not e!7810))))

(declare-fun res!12269 () Bool)

(assert (=> b!12894 (=> res!12269 e!7810)))

(assert (=> b!12894 (= res!12269 (not (= (byteArrayBitContentToList!0 (_2!810 lt!20690) (_1!811 lt!20687) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20688)))))

(declare-datatypes ((tuple2!1514 0))(
  ( (tuple2!1515 (_1!812 BitStream!568) (_2!812 BitStream!568)) )
))
(declare-fun lt!20686 () tuple2!1514)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!568 BitStream!568 (_ BitVec 64)) List!180)

(assert (=> b!12894 (= lt!20688 (bitStreamReadBitsIntoList!0 (_2!810 lt!20690) (_1!812 lt!20686) nBits!460))))

(declare-fun readBits!0 (BitStream!568 (_ BitVec 64)) tuple2!1512)

(assert (=> b!12894 (= lt!20687 (readBits!0 (_1!812 lt!20686) nBits!460))))

(assert (=> b!12894 (validate_offset_bits!1 ((_ sign_extend 32) (size!304 (buf!655 (_2!810 lt!20690)))) ((_ sign_extend 32) (currentByte!1739 thiss!1486)) ((_ sign_extend 32) (currentBit!1734 thiss!1486)) nBits!460)))

(declare-fun lt!20689 () Unit!1091)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!568 array!699 (_ BitVec 64)) Unit!1091)

(assert (=> b!12894 (= lt!20689 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!655 (_2!810 lt!20690)) nBits!460))))

(declare-fun reader!0 (BitStream!568 BitStream!568) tuple2!1514)

(assert (=> b!12894 (= lt!20686 (reader!0 thiss!1486 (_2!810 lt!20690)))))

(assert (= (and start!2684 res!12267) b!12893))

(assert (= (and b!12893 res!12270) b!12889))

(assert (= (and b!12889 res!12265) b!12890))

(assert (= (and b!12890 res!12264) b!12888))

(assert (= (and b!12888 res!12271) b!12891))

(assert (= (and b!12891 res!12266) b!12894))

(assert (= (and b!12894 (not res!12269)) b!12886))

(assert (= (and b!12886 (not res!12268)) b!12892))

(assert (= start!2684 b!12887))

(declare-fun m!19457 () Bool)

(assert (=> b!12891 m!19457))

(declare-fun m!19459 () Bool)

(assert (=> b!12886 m!19459))

(declare-fun m!19461 () Bool)

(assert (=> b!12889 m!19461))

(declare-fun m!19463 () Bool)

(assert (=> b!12889 m!19463))

(declare-fun m!19465 () Bool)

(assert (=> b!12887 m!19465))

(declare-fun m!19467 () Bool)

(assert (=> b!12892 m!19467))

(declare-fun m!19469 () Bool)

(assert (=> b!12894 m!19469))

(declare-fun m!19471 () Bool)

(assert (=> b!12894 m!19471))

(declare-fun m!19473 () Bool)

(assert (=> b!12894 m!19473))

(declare-fun m!19475 () Bool)

(assert (=> b!12894 m!19475))

(declare-fun m!19477 () Bool)

(assert (=> b!12894 m!19477))

(declare-fun m!19479 () Bool)

(assert (=> b!12894 m!19479))

(declare-fun m!19481 () Bool)

(assert (=> b!12888 m!19481))

(declare-fun m!19483 () Bool)

(assert (=> b!12888 m!19483))

(declare-fun m!19485 () Bool)

(assert (=> start!2684 m!19485))

(declare-fun m!19487 () Bool)

(assert (=> start!2684 m!19487))

(declare-fun m!19489 () Bool)

(assert (=> b!12893 m!19489))

(push 1)

(assert (not b!12894))

(assert (not b!12892))

(assert (not b!12886))

(assert (not b!12893))

(assert (not start!2684))

(assert (not b!12891))

(assert (not b!12889))

(assert (not b!12888))

(assert (not b!12887))

(check-sat)

(pop 1)

