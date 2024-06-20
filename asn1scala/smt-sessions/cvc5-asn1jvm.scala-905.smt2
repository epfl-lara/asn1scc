; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25504 () Bool)

(assert start!25504)

(declare-fun b!129281 () Bool)

(declare-fun e!85692 () Bool)

(declare-datatypes ((array!5989 0))(
  ( (array!5990 (arr!3327 (Array (_ BitVec 32) (_ BitVec 8))) (size!2710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4684 0))(
  ( (BitStream!4685 (buf!3068 array!5989) (currentByte!5829 (_ BitVec 32)) (currentBit!5824 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4684)

(declare-datatypes ((Unit!8025 0))(
  ( (Unit!8026) )
))
(declare-datatypes ((tuple2!11038 0))(
  ( (tuple2!11039 (_1!5816 Unit!8025) (_2!5816 BitStream!4684)) )
))
(declare-fun lt!199928 () tuple2!11038)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129281 (= e!85692 (invariant!0 (currentBit!5824 thiss!1634) (currentByte!5829 thiss!1634) (size!2710 (buf!3068 (_2!5816 lt!199928)))))))

(declare-fun res!107060 () Bool)

(declare-fun e!85697 () Bool)

(assert (=> start!25504 (=> (not res!107060) (not e!85697))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5989)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25504 (= res!107060 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2710 arr!237))))))

(assert (=> start!25504 e!85697))

(assert (=> start!25504 true))

(declare-fun array_inv!2499 (array!5989) Bool)

(assert (=> start!25504 (array_inv!2499 arr!237)))

(declare-fun e!85699 () Bool)

(declare-fun inv!12 (BitStream!4684) Bool)

(assert (=> start!25504 (and (inv!12 thiss!1634) e!85699)))

(declare-fun b!129282 () Bool)

(assert (=> b!129282 (= e!85699 (array_inv!2499 (buf!3068 thiss!1634)))))

(declare-fun b!129283 () Bool)

(declare-fun res!107054 () Bool)

(declare-fun e!85698 () Bool)

(assert (=> b!129283 (=> res!107054 e!85698)))

(declare-fun lt!199930 () tuple2!11038)

(declare-fun lt!199927 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5989 array!5989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129283 (= res!107054 (not (arrayBitRangesEq!0 (buf!3068 (_2!5816 lt!199928)) (buf!3068 (_2!5816 lt!199930)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!199927)))))

(declare-fun b!129284 () Bool)

(declare-fun res!107056 () Bool)

(declare-fun e!85696 () Bool)

(assert (=> b!129284 (=> (not res!107056) (not e!85696))))

(declare-fun isPrefixOf!0 (BitStream!4684 BitStream!4684) Bool)

(assert (=> b!129284 (= res!107056 (isPrefixOf!0 (_2!5816 lt!199928) (_2!5816 lt!199930)))))

(declare-fun b!129285 () Bool)

(declare-fun e!85695 () Bool)

(assert (=> b!129285 (= e!85695 e!85696)))

(declare-fun res!107052 () Bool)

(assert (=> b!129285 (=> (not res!107052) (not e!85696))))

(declare-fun lt!199933 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129285 (= res!107052 (= (bitIndex!0 (size!2710 (buf!3068 (_2!5816 lt!199930))) (currentByte!5829 (_2!5816 lt!199930)) (currentBit!5824 (_2!5816 lt!199930))) (bvadd (bitIndex!0 (size!2710 (buf!3068 (_2!5816 lt!199928))) (currentByte!5829 (_2!5816 lt!199928)) (currentBit!5824 (_2!5816 lt!199928))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199933))))))

(assert (=> b!129285 (= lt!199933 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129286 () Bool)

(declare-fun res!107057 () Bool)

(assert (=> b!129286 (=> res!107057 e!85698)))

(assert (=> b!129286 (= res!107057 (bvsgt lt!199927 (bitIndex!0 (size!2710 (buf!3068 (_2!5816 lt!199930))) (currentByte!5829 (_2!5816 lt!199930)) (currentBit!5824 (_2!5816 lt!199930)))))))

(declare-fun b!129287 () Bool)

(declare-fun res!107055 () Bool)

(declare-fun e!85694 () Bool)

(assert (=> b!129287 (=> (not res!107055) (not e!85694))))

(assert (=> b!129287 (= res!107055 (= (bitIndex!0 (size!2710 (buf!3068 (_2!5816 lt!199928))) (currentByte!5829 (_2!5816 lt!199928)) (currentBit!5824 (_2!5816 lt!199928))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2710 (buf!3068 thiss!1634)) (currentByte!5829 thiss!1634) (currentBit!5824 thiss!1634)))))))

(declare-fun b!129288 () Bool)

(declare-fun res!107049 () Bool)

(assert (=> b!129288 (=> (not res!107049) (not e!85697))))

(assert (=> b!129288 (= res!107049 (invariant!0 (currentBit!5824 thiss!1634) (currentByte!5829 thiss!1634) (size!2710 (buf!3068 thiss!1634))))))

(declare-fun b!129289 () Bool)

(declare-fun res!107059 () Bool)

(assert (=> b!129289 (=> (not res!107059) (not e!85694))))

(assert (=> b!129289 (= res!107059 (isPrefixOf!0 thiss!1634 (_2!5816 lt!199928)))))

(declare-datatypes ((tuple2!11040 0))(
  ( (tuple2!11041 (_1!5817 BitStream!4684) (_2!5817 BitStream!4684)) )
))
(declare-fun lt!199934 () tuple2!11040)

(declare-datatypes ((tuple2!11042 0))(
  ( (tuple2!11043 (_1!5818 BitStream!4684) (_2!5818 (_ BitVec 8))) )
))
(declare-fun lt!199937 () tuple2!11042)

(declare-fun b!129290 () Bool)

(assert (=> b!129290 (= e!85694 (and (= (_2!5818 lt!199937) (select (arr!3327 arr!237) from!447)) (= (_1!5818 lt!199937) (_2!5817 lt!199934))))))

(declare-fun readBytePure!0 (BitStream!4684) tuple2!11042)

(assert (=> b!129290 (= lt!199937 (readBytePure!0 (_1!5817 lt!199934)))))

(declare-fun reader!0 (BitStream!4684 BitStream!4684) tuple2!11040)

(assert (=> b!129290 (= lt!199934 (reader!0 thiss!1634 (_2!5816 lt!199928)))))

(declare-fun b!129291 () Bool)

(declare-fun res!107058 () Bool)

(assert (=> b!129291 (=> (not res!107058) (not e!85697))))

(assert (=> b!129291 (= res!107058 (bvslt from!447 to!404))))

(declare-fun b!129292 () Bool)

(declare-fun res!107062 () Bool)

(assert (=> b!129292 (=> (not res!107062) (not e!85697))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129292 (= res!107062 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2710 (buf!3068 thiss!1634))) ((_ sign_extend 32) (currentByte!5829 thiss!1634)) ((_ sign_extend 32) (currentBit!5824 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129293 () Bool)

(assert (=> b!129293 (= e!85698 true)))

(declare-fun lt!199931 () tuple2!11042)

(assert (=> b!129293 (= lt!199931 (readBytePure!0 (BitStream!4685 (buf!3068 (_2!5816 lt!199930)) (currentByte!5829 thiss!1634) (currentBit!5824 thiss!1634))))))

(declare-fun lt!199936 () tuple2!11042)

(assert (=> b!129293 (= lt!199936 (readBytePure!0 (BitStream!4685 (buf!3068 (_2!5816 lt!199928)) (currentByte!5829 thiss!1634) (currentBit!5824 thiss!1634))))))

(declare-fun e!85691 () Bool)

(declare-datatypes ((tuple2!11044 0))(
  ( (tuple2!11045 (_1!5819 BitStream!4684) (_2!5819 array!5989)) )
))
(declare-fun lt!199929 () tuple2!11044)

(declare-fun b!129294 () Bool)

(declare-fun arrayRangesEq!113 (array!5989 array!5989 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129294 (= e!85691 (not (arrayRangesEq!113 arr!237 (_2!5819 lt!199929) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129295 () Bool)

(assert (=> b!129295 (= e!85696 (not e!85691))))

(declare-fun res!107048 () Bool)

(assert (=> b!129295 (=> res!107048 e!85691)))

(declare-fun lt!199926 () tuple2!11040)

(assert (=> b!129295 (= res!107048 (or (not (= (size!2710 (_2!5819 lt!199929)) (size!2710 arr!237))) (not (= (_1!5819 lt!199929) (_2!5817 lt!199926)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4684 array!5989 (_ BitVec 32) (_ BitVec 32)) tuple2!11044)

(assert (=> b!129295 (= lt!199929 (readByteArrayLoopPure!0 (_1!5817 lt!199926) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129295 (validate_offset_bits!1 ((_ sign_extend 32) (size!2710 (buf!3068 (_2!5816 lt!199930)))) ((_ sign_extend 32) (currentByte!5829 (_2!5816 lt!199928))) ((_ sign_extend 32) (currentBit!5824 (_2!5816 lt!199928))) lt!199933)))

(declare-fun lt!199932 () Unit!8025)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4684 array!5989 (_ BitVec 64)) Unit!8025)

(assert (=> b!129295 (= lt!199932 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5816 lt!199928) (buf!3068 (_2!5816 lt!199930)) lt!199933))))

(assert (=> b!129295 (= lt!199926 (reader!0 (_2!5816 lt!199928) (_2!5816 lt!199930)))))

(declare-fun b!129296 () Bool)

(assert (=> b!129296 (= e!85697 (not e!85698))))

(declare-fun res!107053 () Bool)

(assert (=> b!129296 (=> res!107053 e!85698)))

(assert (=> b!129296 (= res!107053 (bvsgt lt!199927 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2710 (buf!3068 (_2!5816 lt!199928)))))))))

(assert (=> b!129296 (= lt!199927 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2710 (buf!3068 (_2!5816 lt!199928))) (currentByte!5829 thiss!1634) (currentBit!5824 thiss!1634))))))

(assert (=> b!129296 e!85692))

(declare-fun res!107051 () Bool)

(assert (=> b!129296 (=> (not res!107051) (not e!85692))))

(assert (=> b!129296 (= res!107051 (isPrefixOf!0 thiss!1634 (_2!5816 lt!199930)))))

(declare-fun lt!199925 () Unit!8025)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4684 BitStream!4684 BitStream!4684) Unit!8025)

(assert (=> b!129296 (= lt!199925 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5816 lt!199928) (_2!5816 lt!199930)))))

(assert (=> b!129296 e!85695))

(declare-fun res!107061 () Bool)

(assert (=> b!129296 (=> (not res!107061) (not e!85695))))

(assert (=> b!129296 (= res!107061 (= (size!2710 (buf!3068 (_2!5816 lt!199928))) (size!2710 (buf!3068 (_2!5816 lt!199930)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4684 array!5989 (_ BitVec 32) (_ BitVec 32)) tuple2!11038)

(assert (=> b!129296 (= lt!199930 (appendByteArrayLoop!0 (_2!5816 lt!199928) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129296 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2710 (buf!3068 (_2!5816 lt!199928)))) ((_ sign_extend 32) (currentByte!5829 (_2!5816 lt!199928))) ((_ sign_extend 32) (currentBit!5824 (_2!5816 lt!199928))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199935 () Unit!8025)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4684 BitStream!4684 (_ BitVec 64) (_ BitVec 32)) Unit!8025)

(assert (=> b!129296 (= lt!199935 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5816 lt!199928) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129296 e!85694))

(declare-fun res!107050 () Bool)

(assert (=> b!129296 (=> (not res!107050) (not e!85694))))

(assert (=> b!129296 (= res!107050 (= (size!2710 (buf!3068 thiss!1634)) (size!2710 (buf!3068 (_2!5816 lt!199928)))))))

(declare-fun appendByte!0 (BitStream!4684 (_ BitVec 8)) tuple2!11038)

(assert (=> b!129296 (= lt!199928 (appendByte!0 thiss!1634 (select (arr!3327 arr!237) from!447)))))

(assert (= (and start!25504 res!107060) b!129292))

(assert (= (and b!129292 res!107062) b!129291))

(assert (= (and b!129291 res!107058) b!129288))

(assert (= (and b!129288 res!107049) b!129296))

(assert (= (and b!129296 res!107050) b!129287))

(assert (= (and b!129287 res!107055) b!129289))

(assert (= (and b!129289 res!107059) b!129290))

(assert (= (and b!129296 res!107061) b!129285))

(assert (= (and b!129285 res!107052) b!129284))

(assert (= (and b!129284 res!107056) b!129295))

(assert (= (and b!129295 (not res!107048)) b!129294))

(assert (= (and b!129296 res!107051) b!129281))

(assert (= (and b!129296 (not res!107053)) b!129286))

(assert (= (and b!129286 (not res!107057)) b!129283))

(assert (= (and b!129283 (not res!107054)) b!129293))

(assert (= start!25504 b!129282))

(declare-fun m!195085 () Bool)

(assert (=> b!129284 m!195085))

(declare-fun m!195087 () Bool)

(assert (=> start!25504 m!195087))

(declare-fun m!195089 () Bool)

(assert (=> start!25504 m!195089))

(declare-fun m!195091 () Bool)

(assert (=> b!129286 m!195091))

(assert (=> b!129285 m!195091))

(declare-fun m!195093 () Bool)

(assert (=> b!129285 m!195093))

(declare-fun m!195095 () Bool)

(assert (=> b!129281 m!195095))

(declare-fun m!195097 () Bool)

(assert (=> b!129293 m!195097))

(declare-fun m!195099 () Bool)

(assert (=> b!129293 m!195099))

(declare-fun m!195101 () Bool)

(assert (=> b!129290 m!195101))

(declare-fun m!195103 () Bool)

(assert (=> b!129290 m!195103))

(declare-fun m!195105 () Bool)

(assert (=> b!129290 m!195105))

(declare-fun m!195107 () Bool)

(assert (=> b!129283 m!195107))

(declare-fun m!195109 () Bool)

(assert (=> b!129288 m!195109))

(declare-fun m!195111 () Bool)

(assert (=> b!129292 m!195111))

(assert (=> b!129287 m!195093))

(declare-fun m!195113 () Bool)

(assert (=> b!129287 m!195113))

(declare-fun m!195115 () Bool)

(assert (=> b!129295 m!195115))

(declare-fun m!195117 () Bool)

(assert (=> b!129295 m!195117))

(declare-fun m!195119 () Bool)

(assert (=> b!129295 m!195119))

(declare-fun m!195121 () Bool)

(assert (=> b!129295 m!195121))

(declare-fun m!195123 () Bool)

(assert (=> b!129282 m!195123))

(declare-fun m!195125 () Bool)

(assert (=> b!129289 m!195125))

(declare-fun m!195127 () Bool)

(assert (=> b!129296 m!195127))

(declare-fun m!195129 () Bool)

(assert (=> b!129296 m!195129))

(declare-fun m!195131 () Bool)

(assert (=> b!129296 m!195131))

(declare-fun m!195133 () Bool)

(assert (=> b!129296 m!195133))

(declare-fun m!195135 () Bool)

(assert (=> b!129296 m!195135))

(declare-fun m!195137 () Bool)

(assert (=> b!129296 m!195137))

(assert (=> b!129296 m!195101))

(declare-fun m!195139 () Bool)

(assert (=> b!129296 m!195139))

(assert (=> b!129296 m!195101))

(declare-fun m!195141 () Bool)

(assert (=> b!129294 m!195141))

(push 1)

(assert (not b!129290))

(assert (not b!129296))

(assert (not b!129295))

(assert (not b!129288))

(assert (not b!129292))

(assert (not b!129289))

(assert (not b!129286))

(assert (not b!129283))

(assert (not b!129287))

(assert (not b!129284))

(assert (not start!25504))

(assert (not b!129282))

(assert (not b!129294))

(assert (not b!129293))

(assert (not b!129285))

(assert (not b!129281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

