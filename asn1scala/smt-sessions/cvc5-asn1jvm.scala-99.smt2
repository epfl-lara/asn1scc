; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2354 () Bool)

(assert start!2354)

(declare-fun res!10857 () Bool)

(declare-fun e!6725 () Bool)

(assert (=> start!2354 (=> (not res!10857) (not e!6725))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!645 0))(
  ( (array!646 (arr!697 (Array (_ BitVec 32) (_ BitVec 8))) (size!277 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!645)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2354 (= res!10857 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!277 srcBuffer!6))))))))

(assert (=> start!2354 e!6725))

(assert (=> start!2354 true))

(declare-fun array_inv!269 (array!645) Bool)

(assert (=> start!2354 (array_inv!269 srcBuffer!6)))

(declare-datatypes ((BitStream!520 0))(
  ( (BitStream!521 (buf!622 array!645) (currentByte!1694 (_ BitVec 32)) (currentBit!1689 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!520)

(declare-fun e!6720 () Bool)

(declare-fun inv!12 (BitStream!520) Bool)

(assert (=> start!2354 (and (inv!12 thiss!1486) e!6720)))

(declare-fun b!11014 () Bool)

(declare-fun res!10862 () Bool)

(declare-fun e!6721 () Bool)

(assert (=> b!11014 (=> (not res!10862) (not e!6721))))

(declare-datatypes ((Unit!950 0))(
  ( (Unit!951) )
))
(declare-datatypes ((tuple2!1336 0))(
  ( (tuple2!1337 (_1!714 Unit!950) (_2!714 BitStream!520)) )
))
(declare-fun lt!17520 () tuple2!1336)

(declare-fun isPrefixOf!0 (BitStream!520 BitStream!520) Bool)

(assert (=> b!11014 (= res!10862 (isPrefixOf!0 thiss!1486 (_2!714 lt!17520)))))

(declare-fun b!11015 () Bool)

(declare-fun res!10864 () Bool)

(assert (=> b!11015 (=> (not res!10864) (not e!6721))))

(assert (=> b!11015 (= res!10864 (= (size!277 (buf!622 thiss!1486)) (size!277 (buf!622 (_2!714 lt!17520)))))))

(declare-fun b!11016 () Bool)

(assert (=> b!11016 (= e!6725 e!6721)))

(declare-fun res!10861 () Bool)

(assert (=> b!11016 (=> (not res!10861) (not e!6721))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11016 (= res!10861 (invariant!0 (currentBit!1689 (_2!714 lt!17520)) (currentByte!1694 (_2!714 lt!17520)) (size!277 (buf!622 (_2!714 lt!17520)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!520 array!645 (_ BitVec 64) (_ BitVec 64)) tuple2!1336)

(assert (=> b!11016 (= lt!17520 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11017 () Bool)

(declare-fun e!6724 () Bool)

(assert (=> b!11017 (= e!6721 (not e!6724))))

(declare-fun res!10860 () Bool)

(assert (=> b!11017 (=> res!10860 e!6724)))

(declare-datatypes ((List!156 0))(
  ( (Nil!153) (Cons!152 (h!271 Bool) (t!906 List!156)) )
))
(declare-fun lt!17521 () List!156)

(declare-datatypes ((tuple2!1338 0))(
  ( (tuple2!1339 (_1!715 array!645) (_2!715 BitStream!520)) )
))
(declare-fun lt!17517 () tuple2!1338)

(declare-fun byteArrayBitContentToList!0 (BitStream!520 array!645 (_ BitVec 64) (_ BitVec 64)) List!156)

(assert (=> b!11017 (= res!10860 (not (= (byteArrayBitContentToList!0 (_2!714 lt!17520) (_1!715 lt!17517) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17521)))))

(declare-datatypes ((tuple2!1340 0))(
  ( (tuple2!1341 (_1!716 BitStream!520) (_2!716 BitStream!520)) )
))
(declare-fun lt!17519 () tuple2!1340)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!520 BitStream!520 (_ BitVec 64)) List!156)

(assert (=> b!11017 (= lt!17521 (bitStreamReadBitsIntoList!0 (_2!714 lt!17520) (_1!716 lt!17519) nBits!460))))

(declare-fun readBits!0 (BitStream!520 (_ BitVec 64)) tuple2!1338)

(assert (=> b!11017 (= lt!17517 (readBits!0 (_1!716 lt!17519) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11017 (validate_offset_bits!1 ((_ sign_extend 32) (size!277 (buf!622 (_2!714 lt!17520)))) ((_ sign_extend 32) (currentByte!1694 thiss!1486)) ((_ sign_extend 32) (currentBit!1689 thiss!1486)) nBits!460)))

(declare-fun lt!17518 () Unit!950)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!520 array!645 (_ BitVec 64)) Unit!950)

(assert (=> b!11017 (= lt!17518 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!622 (_2!714 lt!17520)) nBits!460))))

(declare-fun reader!0 (BitStream!520 BitStream!520) tuple2!1340)

(assert (=> b!11017 (= lt!17519 (reader!0 thiss!1486 (_2!714 lt!17520)))))

(declare-fun b!11018 () Bool)

(declare-fun res!10859 () Bool)

(assert (=> b!11018 (=> (not res!10859) (not e!6725))))

(assert (=> b!11018 (= res!10859 (validate_offset_bits!1 ((_ sign_extend 32) (size!277 (buf!622 thiss!1486))) ((_ sign_extend 32) (currentByte!1694 thiss!1486)) ((_ sign_extend 32) (currentBit!1689 thiss!1486)) nBits!460))))

(declare-fun b!11019 () Bool)

(assert (=> b!11019 (= e!6720 (array_inv!269 (buf!622 thiss!1486)))))

(declare-fun b!11020 () Bool)

(declare-fun res!10863 () Bool)

(assert (=> b!11020 (=> (not res!10863) (not e!6721))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11020 (= res!10863 (= (bitIndex!0 (size!277 (buf!622 (_2!714 lt!17520))) (currentByte!1694 (_2!714 lt!17520)) (currentBit!1689 (_2!714 lt!17520))) (bvadd (bitIndex!0 (size!277 (buf!622 thiss!1486)) (currentByte!1694 thiss!1486) (currentBit!1689 thiss!1486)) nBits!460)))))

(declare-fun b!11021 () Bool)

(declare-fun res!10858 () Bool)

(assert (=> b!11021 (=> res!10858 e!6724)))

(assert (=> b!11021 (= res!10858 (not (= lt!17521 (byteArrayBitContentToList!0 (_2!714 lt!17520) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11022 () Bool)

(assert (=> b!11022 (= e!6724 true)))

(declare-fun lt!17522 () Unit!950)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!520 array!645 array!645 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!950)

(assert (=> b!11022 (= lt!17522 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!714 lt!17520) srcBuffer!6 (_1!715 lt!17517) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2354 res!10857) b!11018))

(assert (= (and b!11018 res!10859) b!11016))

(assert (= (and b!11016 res!10861) b!11015))

(assert (= (and b!11015 res!10864) b!11020))

(assert (= (and b!11020 res!10863) b!11014))

(assert (= (and b!11014 res!10862) b!11017))

(assert (= (and b!11017 (not res!10860)) b!11021))

(assert (= (and b!11021 (not res!10858)) b!11022))

(assert (= start!2354 b!11019))

(declare-fun m!16127 () Bool)

(assert (=> start!2354 m!16127))

(declare-fun m!16129 () Bool)

(assert (=> start!2354 m!16129))

(declare-fun m!16131 () Bool)

(assert (=> b!11014 m!16131))

(declare-fun m!16133 () Bool)

(assert (=> b!11016 m!16133))

(declare-fun m!16135 () Bool)

(assert (=> b!11016 m!16135))

(declare-fun m!16137 () Bool)

(assert (=> b!11020 m!16137))

(declare-fun m!16139 () Bool)

(assert (=> b!11020 m!16139))

(declare-fun m!16141 () Bool)

(assert (=> b!11018 m!16141))

(declare-fun m!16143 () Bool)

(assert (=> b!11017 m!16143))

(declare-fun m!16145 () Bool)

(assert (=> b!11017 m!16145))

(declare-fun m!16147 () Bool)

(assert (=> b!11017 m!16147))

(declare-fun m!16149 () Bool)

(assert (=> b!11017 m!16149))

(declare-fun m!16151 () Bool)

(assert (=> b!11017 m!16151))

(declare-fun m!16153 () Bool)

(assert (=> b!11017 m!16153))

(declare-fun m!16155 () Bool)

(assert (=> b!11019 m!16155))

(declare-fun m!16157 () Bool)

(assert (=> b!11022 m!16157))

(declare-fun m!16159 () Bool)

(assert (=> b!11021 m!16159))

(push 1)

(assert (not b!11014))

(assert (not b!11017))

(assert (not start!2354))

(assert (not b!11018))

(assert (not b!11016))

(assert (not b!11020))

(assert (not b!11022))

(assert (not b!11019))

(assert (not b!11021))

(check-sat)

