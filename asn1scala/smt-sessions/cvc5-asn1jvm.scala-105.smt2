; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2672 () Bool)

(assert start!2672)

(declare-fun b!12724 () Bool)

(declare-fun res!12121 () Bool)

(declare-fun e!7703 () Bool)

(assert (=> b!12724 (=> (not res!12121) (not e!7703))))

(declare-datatypes ((array!687 0))(
  ( (array!688 (arr!727 (Array (_ BitVec 32) (_ BitVec 8))) (size!298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!556 0))(
  ( (BitStream!557 (buf!649 array!687) (currentByte!1733 (_ BitVec 32)) (currentBit!1728 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1079 0))(
  ( (Unit!1080) )
))
(declare-datatypes ((tuple2!1474 0))(
  ( (tuple2!1475 (_1!792 Unit!1079) (_2!792 BitStream!556)) )
))
(declare-fun lt!20582 () tuple2!1474)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!556)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12724 (= res!12121 (= (bitIndex!0 (size!298 (buf!649 (_2!792 lt!20582))) (currentByte!1733 (_2!792 lt!20582)) (currentBit!1728 (_2!792 lt!20582))) (bvadd (bitIndex!0 (size!298 (buf!649 thiss!1486)) (currentByte!1733 thiss!1486) (currentBit!1728 thiss!1486)) nBits!460)))))

(declare-fun b!12725 () Bool)

(declare-fun res!12126 () Bool)

(assert (=> b!12725 (=> (not res!12126) (not e!7703))))

(declare-fun isPrefixOf!0 (BitStream!556 BitStream!556) Bool)

(assert (=> b!12725 (= res!12126 (isPrefixOf!0 thiss!1486 (_2!792 lt!20582)))))

(declare-fun b!12726 () Bool)

(declare-fun res!12123 () Bool)

(declare-fun e!7698 () Bool)

(assert (=> b!12726 (=> (not res!12123) (not e!7698))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12726 (= res!12123 (validate_offset_bits!1 ((_ sign_extend 32) (size!298 (buf!649 thiss!1486))) ((_ sign_extend 32) (currentByte!1733 thiss!1486)) ((_ sign_extend 32) (currentBit!1728 thiss!1486)) nBits!460))))

(declare-fun b!12727 () Bool)

(declare-fun e!7701 () Bool)

(assert (=> b!12727 (= e!7701 true)))

(declare-fun srcBuffer!6 () array!687)

(declare-datatypes ((tuple2!1476 0))(
  ( (tuple2!1477 (_1!793 array!687) (_2!793 BitStream!556)) )
))
(declare-fun lt!20577 () tuple2!1476)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!20581 () Unit!1079)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!556 array!687 array!687 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1079)

(assert (=> b!12727 (= lt!20581 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!792 lt!20582) srcBuffer!6 (_1!793 lt!20577) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12728 () Bool)

(assert (=> b!12728 (= e!7703 (not e!7701))))

(declare-fun res!12127 () Bool)

(assert (=> b!12728 (=> res!12127 e!7701)))

(declare-datatypes ((List!174 0))(
  ( (Nil!171) (Cons!170 (h!289 Bool) (t!924 List!174)) )
))
(declare-fun lt!20580 () List!174)

(declare-fun byteArrayBitContentToList!0 (BitStream!556 array!687 (_ BitVec 64) (_ BitVec 64)) List!174)

(assert (=> b!12728 (= res!12127 (not (= (byteArrayBitContentToList!0 (_2!792 lt!20582) (_1!793 lt!20577) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20580)))))

(declare-datatypes ((tuple2!1478 0))(
  ( (tuple2!1479 (_1!794 BitStream!556) (_2!794 BitStream!556)) )
))
(declare-fun lt!20579 () tuple2!1478)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!556 BitStream!556 (_ BitVec 64)) List!174)

(assert (=> b!12728 (= lt!20580 (bitStreamReadBitsIntoList!0 (_2!792 lt!20582) (_1!794 lt!20579) nBits!460))))

(declare-fun readBits!0 (BitStream!556 (_ BitVec 64)) tuple2!1476)

(assert (=> b!12728 (= lt!20577 (readBits!0 (_1!794 lt!20579) nBits!460))))

(assert (=> b!12728 (validate_offset_bits!1 ((_ sign_extend 32) (size!298 (buf!649 (_2!792 lt!20582)))) ((_ sign_extend 32) (currentByte!1733 thiss!1486)) ((_ sign_extend 32) (currentBit!1728 thiss!1486)) nBits!460)))

(declare-fun lt!20578 () Unit!1079)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!556 array!687 (_ BitVec 64)) Unit!1079)

(assert (=> b!12728 (= lt!20578 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!649 (_2!792 lt!20582)) nBits!460))))

(declare-fun reader!0 (BitStream!556 BitStream!556) tuple2!1478)

(assert (=> b!12728 (= lt!20579 (reader!0 thiss!1486 (_2!792 lt!20582)))))

(declare-fun res!12120 () Bool)

(assert (=> start!2672 (=> (not res!12120) (not e!7698))))

(assert (=> start!2672 (= res!12120 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!298 srcBuffer!6))))))))

(assert (=> start!2672 e!7698))

(assert (=> start!2672 true))

(declare-fun array_inv!287 (array!687) Bool)

(assert (=> start!2672 (array_inv!287 srcBuffer!6)))

(declare-fun e!7699 () Bool)

(declare-fun inv!12 (BitStream!556) Bool)

(assert (=> start!2672 (and (inv!12 thiss!1486) e!7699)))

(declare-fun b!12729 () Bool)

(declare-fun res!12125 () Bool)

(assert (=> b!12729 (=> (not res!12125) (not e!7703))))

(assert (=> b!12729 (= res!12125 (= (size!298 (buf!649 thiss!1486)) (size!298 (buf!649 (_2!792 lt!20582)))))))

(declare-fun b!12730 () Bool)

(assert (=> b!12730 (= e!7699 (array_inv!287 (buf!649 thiss!1486)))))

(declare-fun b!12731 () Bool)

(assert (=> b!12731 (= e!7698 e!7703)))

(declare-fun res!12122 () Bool)

(assert (=> b!12731 (=> (not res!12122) (not e!7703))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12731 (= res!12122 (invariant!0 (currentBit!1728 (_2!792 lt!20582)) (currentByte!1733 (_2!792 lt!20582)) (size!298 (buf!649 (_2!792 lt!20582)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!556 array!687 (_ BitVec 64) (_ BitVec 64)) tuple2!1474)

(assert (=> b!12731 (= lt!20582 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12732 () Bool)

(declare-fun res!12124 () Bool)

(assert (=> b!12732 (=> res!12124 e!7701)))

(assert (=> b!12732 (= res!12124 (not (= lt!20580 (byteArrayBitContentToList!0 (_2!792 lt!20582) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!2672 res!12120) b!12726))

(assert (= (and b!12726 res!12123) b!12731))

(assert (= (and b!12731 res!12122) b!12729))

(assert (= (and b!12729 res!12125) b!12724))

(assert (= (and b!12724 res!12121) b!12725))

(assert (= (and b!12725 res!12126) b!12728))

(assert (= (and b!12728 (not res!12127)) b!12732))

(assert (= (and b!12732 (not res!12124)) b!12727))

(assert (= start!2672 b!12730))

(declare-fun m!19253 () Bool)

(assert (=> start!2672 m!19253))

(declare-fun m!19255 () Bool)

(assert (=> start!2672 m!19255))

(declare-fun m!19257 () Bool)

(assert (=> b!12726 m!19257))

(declare-fun m!19259 () Bool)

(assert (=> b!12728 m!19259))

(declare-fun m!19261 () Bool)

(assert (=> b!12728 m!19261))

(declare-fun m!19263 () Bool)

(assert (=> b!12728 m!19263))

(declare-fun m!19265 () Bool)

(assert (=> b!12728 m!19265))

(declare-fun m!19267 () Bool)

(assert (=> b!12728 m!19267))

(declare-fun m!19269 () Bool)

(assert (=> b!12728 m!19269))

(declare-fun m!19271 () Bool)

(assert (=> b!12727 m!19271))

(declare-fun m!19273 () Bool)

(assert (=> b!12725 m!19273))

(declare-fun m!19275 () Bool)

(assert (=> b!12732 m!19275))

(declare-fun m!19277 () Bool)

(assert (=> b!12730 m!19277))

(declare-fun m!19279 () Bool)

(assert (=> b!12724 m!19279))

(declare-fun m!19281 () Bool)

(assert (=> b!12724 m!19281))

(declare-fun m!19283 () Bool)

(assert (=> b!12731 m!19283))

(declare-fun m!19285 () Bool)

(assert (=> b!12731 m!19285))

(push 1)

(assert (not b!12731))

(assert (not b!12726))

(assert (not b!12732))

(assert (not b!12724))

(assert (not b!12727))

(assert (not b!12728))

(assert (not start!2672))

(assert (not b!12725))

(assert (not b!12730))

(check-sat)

(pop 1)

