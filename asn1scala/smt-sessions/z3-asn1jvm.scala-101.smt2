; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2368 () Bool)

(assert start!2368)

(declare-fun res!11025 () Bool)

(declare-fun e!6851 () Bool)

(assert (=> start!2368 (=> (not res!11025) (not e!6851))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!659 0))(
  ( (array!660 (arr!704 (Array (_ BitVec 32) (_ BitVec 8))) (size!284 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!659)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2368 (= res!11025 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!284 srcBuffer!6))))))))

(assert (=> start!2368 e!6851))

(assert (=> start!2368 true))

(declare-fun array_inv!276 (array!659) Bool)

(assert (=> start!2368 (array_inv!276 srcBuffer!6)))

(declare-datatypes ((BitStream!534 0))(
  ( (BitStream!535 (buf!629 array!659) (currentByte!1701 (_ BitVec 32)) (currentBit!1696 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!534)

(declare-fun e!6846 () Bool)

(declare-fun inv!12 (BitStream!534) Bool)

(assert (=> start!2368 (and (inv!12 thiss!1486) e!6846)))

(declare-fun b!11203 () Bool)

(declare-fun res!11031 () Bool)

(declare-fun e!6850 () Bool)

(assert (=> b!11203 (=> res!11031 e!6850)))

(declare-datatypes ((Unit!964 0))(
  ( (Unit!965) )
))
(declare-datatypes ((tuple2!1378 0))(
  ( (tuple2!1379 (_1!735 Unit!964) (_2!735 BitStream!534)) )
))
(declare-fun lt!17648 () tuple2!1378)

(declare-datatypes ((List!163 0))(
  ( (Nil!160) (Cons!159 (h!278 Bool) (t!913 List!163)) )
))
(declare-fun lt!17644 () List!163)

(declare-fun byteArrayBitContentToList!0 (BitStream!534 array!659 (_ BitVec 64) (_ BitVec 64)) List!163)

(assert (=> b!11203 (= res!11031 (not (= lt!17644 (byteArrayBitContentToList!0 (_2!735 lt!17648) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11204 () Bool)

(declare-fun res!11028 () Bool)

(assert (=> b!11204 (=> (not res!11028) (not e!6851))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11204 (= res!11028 (validate_offset_bits!1 ((_ sign_extend 32) (size!284 (buf!629 thiss!1486))) ((_ sign_extend 32) (currentByte!1701 thiss!1486)) ((_ sign_extend 32) (currentBit!1696 thiss!1486)) nBits!460))))

(declare-fun b!11205 () Bool)

(declare-fun e!6847 () Bool)

(assert (=> b!11205 (= e!6847 (not e!6850))))

(declare-fun res!11029 () Bool)

(assert (=> b!11205 (=> res!11029 e!6850)))

(declare-datatypes ((tuple2!1380 0))(
  ( (tuple2!1381 (_1!736 array!659) (_2!736 BitStream!534)) )
))
(declare-fun lt!17646 () tuple2!1380)

(assert (=> b!11205 (= res!11029 (not (= (byteArrayBitContentToList!0 (_2!735 lt!17648) (_1!736 lt!17646) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17644)))))

(declare-datatypes ((tuple2!1382 0))(
  ( (tuple2!1383 (_1!737 BitStream!534) (_2!737 BitStream!534)) )
))
(declare-fun lt!17643 () tuple2!1382)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!534 BitStream!534 (_ BitVec 64)) List!163)

(assert (=> b!11205 (= lt!17644 (bitStreamReadBitsIntoList!0 (_2!735 lt!17648) (_1!737 lt!17643) nBits!460))))

(declare-fun readBits!0 (BitStream!534 (_ BitVec 64)) tuple2!1380)

(assert (=> b!11205 (= lt!17646 (readBits!0 (_1!737 lt!17643) nBits!460))))

(assert (=> b!11205 (validate_offset_bits!1 ((_ sign_extend 32) (size!284 (buf!629 (_2!735 lt!17648)))) ((_ sign_extend 32) (currentByte!1701 thiss!1486)) ((_ sign_extend 32) (currentBit!1696 thiss!1486)) nBits!460)))

(declare-fun lt!17647 () Unit!964)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!534 array!659 (_ BitVec 64)) Unit!964)

(assert (=> b!11205 (= lt!17647 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!629 (_2!735 lt!17648)) nBits!460))))

(declare-fun reader!0 (BitStream!534 BitStream!534) tuple2!1382)

(assert (=> b!11205 (= lt!17643 (reader!0 thiss!1486 (_2!735 lt!17648)))))

(declare-fun b!11206 () Bool)

(declare-fun res!11030 () Bool)

(assert (=> b!11206 (=> (not res!11030) (not e!6847))))

(declare-fun isPrefixOf!0 (BitStream!534 BitStream!534) Bool)

(assert (=> b!11206 (= res!11030 (isPrefixOf!0 thiss!1486 (_2!735 lt!17648)))))

(declare-fun b!11207 () Bool)

(assert (=> b!11207 (= e!6851 e!6847)))

(declare-fun res!11032 () Bool)

(assert (=> b!11207 (=> (not res!11032) (not e!6847))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11207 (= res!11032 (invariant!0 (currentBit!1696 (_2!735 lt!17648)) (currentByte!1701 (_2!735 lt!17648)) (size!284 (buf!629 (_2!735 lt!17648)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!534 array!659 (_ BitVec 64) (_ BitVec 64)) tuple2!1378)

(assert (=> b!11207 (= lt!17648 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11208 () Bool)

(declare-fun res!11027 () Bool)

(assert (=> b!11208 (=> (not res!11027) (not e!6847))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11208 (= res!11027 (= (bitIndex!0 (size!284 (buf!629 (_2!735 lt!17648))) (currentByte!1701 (_2!735 lt!17648)) (currentBit!1696 (_2!735 lt!17648))) (bvadd (bitIndex!0 (size!284 (buf!629 thiss!1486)) (currentByte!1701 thiss!1486) (currentBit!1696 thiss!1486)) nBits!460)))))

(declare-fun b!11209 () Bool)

(assert (=> b!11209 (= e!6846 (array_inv!276 (buf!629 thiss!1486)))))

(declare-fun b!11210 () Bool)

(declare-fun res!11026 () Bool)

(assert (=> b!11210 (=> (not res!11026) (not e!6847))))

(assert (=> b!11210 (= res!11026 (= (size!284 (buf!629 thiss!1486)) (size!284 (buf!629 (_2!735 lt!17648)))))))

(declare-fun b!11211 () Bool)

(assert (=> b!11211 (= e!6850 true)))

(declare-fun lt!17645 () Unit!964)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!534 array!659 array!659 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!964)

(assert (=> b!11211 (= lt!17645 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!735 lt!17648) srcBuffer!6 (_1!736 lt!17646) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2368 res!11025) b!11204))

(assert (= (and b!11204 res!11028) b!11207))

(assert (= (and b!11207 res!11032) b!11210))

(assert (= (and b!11210 res!11026) b!11208))

(assert (= (and b!11208 res!11027) b!11206))

(assert (= (and b!11206 res!11030) b!11205))

(assert (= (and b!11205 (not res!11029)) b!11203))

(assert (= (and b!11203 (not res!11031)) b!11211))

(assert (= start!2368 b!11209))

(declare-fun m!16365 () Bool)

(assert (=> b!11205 m!16365))

(declare-fun m!16367 () Bool)

(assert (=> b!11205 m!16367))

(declare-fun m!16369 () Bool)

(assert (=> b!11205 m!16369))

(declare-fun m!16371 () Bool)

(assert (=> b!11205 m!16371))

(declare-fun m!16373 () Bool)

(assert (=> b!11205 m!16373))

(declare-fun m!16375 () Bool)

(assert (=> b!11205 m!16375))

(declare-fun m!16377 () Bool)

(assert (=> b!11207 m!16377))

(declare-fun m!16379 () Bool)

(assert (=> b!11207 m!16379))

(declare-fun m!16381 () Bool)

(assert (=> b!11203 m!16381))

(declare-fun m!16383 () Bool)

(assert (=> b!11206 m!16383))

(declare-fun m!16385 () Bool)

(assert (=> b!11204 m!16385))

(declare-fun m!16387 () Bool)

(assert (=> b!11209 m!16387))

(declare-fun m!16389 () Bool)

(assert (=> b!11208 m!16389))

(declare-fun m!16391 () Bool)

(assert (=> b!11208 m!16391))

(declare-fun m!16393 () Bool)

(assert (=> b!11211 m!16393))

(declare-fun m!16395 () Bool)

(assert (=> start!2368 m!16395))

(declare-fun m!16397 () Bool)

(assert (=> start!2368 m!16397))

(check-sat (not b!11206) (not b!11211) (not b!11209) (not b!11205) (not b!11208) (not start!2368) (not b!11207) (not b!11204) (not b!11203))
