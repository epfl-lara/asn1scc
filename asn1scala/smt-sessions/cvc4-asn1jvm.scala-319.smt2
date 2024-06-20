; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6912 () Bool)

(assert start!6912)

(declare-fun b!33130 () Bool)

(declare-fun e!21952 () Bool)

(declare-fun e!21957 () Bool)

(assert (=> b!33130 (= e!21952 (not e!21957))))

(declare-fun res!28363 () Bool)

(assert (=> b!33130 (=> res!28363 e!21957)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!33130 (= res!28363 (bvsge i!635 to!314))))

(declare-datatypes ((array!1848 0))(
  ( (array!1849 (arr!1291 (Array (_ BitVec 32) (_ BitVec 8))) (size!816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1424 0))(
  ( (BitStream!1425 (buf!1144 array!1848) (currentByte!2511 (_ BitVec 32)) (currentBit!2506 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1424)

(declare-fun isPrefixOf!0 (BitStream!1424 BitStream!1424) Bool)

(assert (=> b!33130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2487 0))(
  ( (Unit!2488) )
))
(declare-fun lt!48834 () Unit!2487)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1424) Unit!2487)

(assert (=> b!33130 (= lt!48834 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48823 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33130 (= lt!48823 (bitIndex!0 (size!816 (buf!1144 thiss!1379)) (currentByte!2511 thiss!1379) (currentBit!2506 thiss!1379)))))

(declare-fun res!28360 () Bool)

(assert (=> start!6912 (=> (not res!28360) (not e!21952))))

(declare-fun srcBuffer!2 () array!1848)

(assert (=> start!6912 (= res!28360 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!816 srcBuffer!2))))))))

(assert (=> start!6912 e!21952))

(assert (=> start!6912 true))

(declare-fun array_inv!765 (array!1848) Bool)

(assert (=> start!6912 (array_inv!765 srcBuffer!2)))

(declare-fun e!21959 () Bool)

(declare-fun inv!12 (BitStream!1424) Bool)

(assert (=> start!6912 (and (inv!12 thiss!1379) e!21959)))

(declare-fun b!33131 () Bool)

(declare-fun e!21955 () Bool)

(declare-fun e!21951 () Bool)

(assert (=> b!33131 (= e!21955 e!21951)))

(declare-fun res!28361 () Bool)

(assert (=> b!33131 (=> res!28361 e!21951)))

(assert (=> b!33131 (= res!28361 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3378 0))(
  ( (tuple2!3379 (_1!1776 Unit!2487) (_2!1776 BitStream!1424)) )
))
(declare-fun lt!48830 () tuple2!3378)

(declare-datatypes ((tuple2!3380 0))(
  ( (tuple2!3381 (_1!1777 BitStream!1424) (_2!1777 BitStream!1424)) )
))
(declare-fun lt!48827 () tuple2!3380)

(declare-fun lt!48832 () (_ BitVec 64))

(declare-datatypes ((List!413 0))(
  ( (Nil!410) (Cons!409 (h!528 Bool) (t!1163 List!413)) )
))
(declare-fun lt!48833 () List!413)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1424 BitStream!1424 (_ BitVec 64)) List!413)

(assert (=> b!33131 (= lt!48833 (bitStreamReadBitsIntoList!0 (_2!1776 lt!48830) (_1!1777 lt!48827) lt!48832))))

(declare-fun lt!48831 () List!413)

(declare-fun lt!48835 () tuple2!3380)

(assert (=> b!33131 (= lt!48831 (bitStreamReadBitsIntoList!0 (_2!1776 lt!48830) (_1!1777 lt!48835) (bvsub to!314 i!635)))))

(declare-fun lt!48828 () tuple2!3378)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33131 (validate_offset_bits!1 ((_ sign_extend 32) (size!816 (buf!1144 (_2!1776 lt!48830)))) ((_ sign_extend 32) (currentByte!2511 (_2!1776 lt!48828))) ((_ sign_extend 32) (currentBit!2506 (_2!1776 lt!48828))) lt!48832)))

(declare-fun lt!48836 () Unit!2487)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1424 array!1848 (_ BitVec 64)) Unit!2487)

(assert (=> b!33131 (= lt!48836 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1776 lt!48828) (buf!1144 (_2!1776 lt!48830)) lt!48832))))

(declare-fun reader!0 (BitStream!1424 BitStream!1424) tuple2!3380)

(assert (=> b!33131 (= lt!48827 (reader!0 (_2!1776 lt!48828) (_2!1776 lt!48830)))))

(assert (=> b!33131 (validate_offset_bits!1 ((_ sign_extend 32) (size!816 (buf!1144 (_2!1776 lt!48830)))) ((_ sign_extend 32) (currentByte!2511 thiss!1379)) ((_ sign_extend 32) (currentBit!2506 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48837 () Unit!2487)

(assert (=> b!33131 (= lt!48837 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1144 (_2!1776 lt!48830)) (bvsub to!314 i!635)))))

(assert (=> b!33131 (= lt!48835 (reader!0 thiss!1379 (_2!1776 lt!48830)))))

(declare-fun b!33132 () Bool)

(declare-fun res!28355 () Bool)

(declare-fun e!21950 () Bool)

(assert (=> b!33132 (=> res!28355 e!21950)))

(assert (=> b!33132 (= res!28355 (not (= (size!816 (buf!1144 thiss!1379)) (size!816 (buf!1144 (_2!1776 lt!48830))))))))

(declare-fun b!33133 () Bool)

(declare-fun res!28365 () Bool)

(assert (=> b!33133 (=> res!28365 e!21955)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33133 (= res!28365 (not (invariant!0 (currentBit!2506 (_2!1776 lt!48828)) (currentByte!2511 (_2!1776 lt!48828)) (size!816 (buf!1144 (_2!1776 lt!48828))))))))

(declare-fun b!33134 () Bool)

(declare-fun e!21954 () Bool)

(declare-fun e!21958 () Bool)

(assert (=> b!33134 (= e!21954 e!21958)))

(declare-fun res!28362 () Bool)

(assert (=> b!33134 (=> res!28362 e!21958)))

(assert (=> b!33134 (= res!28362 (not (isPrefixOf!0 (_2!1776 lt!48828) (_2!1776 lt!48830))))))

(assert (=> b!33134 (isPrefixOf!0 thiss!1379 (_2!1776 lt!48830))))

(declare-fun lt!48825 () Unit!2487)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1424 BitStream!1424 BitStream!1424) Unit!2487)

(assert (=> b!33134 (= lt!48825 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1776 lt!48828) (_2!1776 lt!48830)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1424 array!1848 (_ BitVec 64) (_ BitVec 64)) tuple2!3378)

(assert (=> b!33134 (= lt!48830 (appendBitsMSBFirstLoop!0 (_2!1776 lt!48828) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21961 () Bool)

(assert (=> b!33134 e!21961))

(declare-fun res!28368 () Bool)

(assert (=> b!33134 (=> (not res!28368) (not e!21961))))

(assert (=> b!33134 (= res!28368 (validate_offset_bits!1 ((_ sign_extend 32) (size!816 (buf!1144 (_2!1776 lt!48828)))) ((_ sign_extend 32) (currentByte!2511 thiss!1379)) ((_ sign_extend 32) (currentBit!2506 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48826 () Unit!2487)

(assert (=> b!33134 (= lt!48826 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1144 (_2!1776 lt!48828)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48838 () tuple2!3380)

(assert (=> b!33134 (= lt!48838 (reader!0 thiss!1379 (_2!1776 lt!48828)))))

(declare-fun b!33135 () Bool)

(assert (=> b!33135 (= e!21951 true)))

(declare-fun tail!130 (List!413) List!413)

(assert (=> b!33135 (= lt!48833 (tail!130 lt!48831))))

(declare-fun lt!48829 () Unit!2487)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1424 BitStream!1424 BitStream!1424 BitStream!1424 (_ BitVec 64) List!413) Unit!2487)

(assert (=> b!33135 (= lt!48829 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1776 lt!48830) (_2!1776 lt!48830) (_1!1777 lt!48835) (_1!1777 lt!48827) (bvsub to!314 i!635) lt!48831))))

(declare-fun b!33136 () Bool)

(declare-fun res!28358 () Bool)

(assert (=> b!33136 (=> res!28358 e!21950)))

(assert (=> b!33136 (= res!28358 (not (invariant!0 (currentBit!2506 (_2!1776 lt!48830)) (currentByte!2511 (_2!1776 lt!48830)) (size!816 (buf!1144 (_2!1776 lt!48830))))))))

(declare-fun b!33137 () Bool)

(assert (=> b!33137 (= e!21958 e!21950)))

(declare-fun res!28366 () Bool)

(assert (=> b!33137 (=> res!28366 e!21950)))

(declare-fun lt!48822 () (_ BitVec 64))

(assert (=> b!33137 (= res!28366 (not (= lt!48822 (bvsub (bvadd lt!48823 to!314) i!635))))))

(assert (=> b!33137 (= lt!48822 (bitIndex!0 (size!816 (buf!1144 (_2!1776 lt!48830))) (currentByte!2511 (_2!1776 lt!48830)) (currentBit!2506 (_2!1776 lt!48830))))))

(declare-fun b!33138 () Bool)

(declare-fun res!28356 () Bool)

(assert (=> b!33138 (=> res!28356 e!21955)))

(assert (=> b!33138 (= res!28356 (not (invariant!0 (currentBit!2506 (_2!1776 lt!48828)) (currentByte!2511 (_2!1776 lt!48828)) (size!816 (buf!1144 (_2!1776 lt!48830))))))))

(declare-fun b!33139 () Bool)

(declare-fun res!28367 () Bool)

(assert (=> b!33139 (=> (not res!28367) (not e!21952))))

(assert (=> b!33139 (= res!28367 (validate_offset_bits!1 ((_ sign_extend 32) (size!816 (buf!1144 thiss!1379))) ((_ sign_extend 32) (currentByte!2511 thiss!1379)) ((_ sign_extend 32) (currentBit!2506 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33140 () Bool)

(assert (=> b!33140 (= e!21950 e!21955)))

(declare-fun res!28354 () Bool)

(assert (=> b!33140 (=> res!28354 e!21955)))

(assert (=> b!33140 (= res!28354 (not (= (size!816 (buf!1144 (_2!1776 lt!48828))) (size!816 (buf!1144 (_2!1776 lt!48830))))))))

(declare-fun e!21956 () Bool)

(assert (=> b!33140 e!21956))

(declare-fun res!28359 () Bool)

(assert (=> b!33140 (=> (not res!28359) (not e!21956))))

(assert (=> b!33140 (= res!28359 (= (size!816 (buf!1144 (_2!1776 lt!48830))) (size!816 (buf!1144 thiss!1379))))))

(declare-fun b!33141 () Bool)

(declare-fun res!28364 () Bool)

(assert (=> b!33141 (=> res!28364 e!21951)))

(declare-fun length!139 (List!413) Int)

(assert (=> b!33141 (= res!28364 (<= (length!139 lt!48831) 0))))

(declare-fun b!33142 () Bool)

(assert (=> b!33142 (= e!21956 (= lt!48822 (bvsub (bvsub (bvadd (bitIndex!0 (size!816 (buf!1144 (_2!1776 lt!48828))) (currentByte!2511 (_2!1776 lt!48828)) (currentBit!2506 (_2!1776 lt!48828))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33143 () Bool)

(assert (=> b!33143 (= e!21959 (array_inv!765 (buf!1144 thiss!1379)))))

(declare-fun b!33144 () Bool)

(assert (=> b!33144 (= e!21957 e!21954)))

(declare-fun res!28357 () Bool)

(assert (=> b!33144 (=> res!28357 e!21954)))

(assert (=> b!33144 (= res!28357 (not (isPrefixOf!0 thiss!1379 (_2!1776 lt!48828))))))

(assert (=> b!33144 (validate_offset_bits!1 ((_ sign_extend 32) (size!816 (buf!1144 (_2!1776 lt!48828)))) ((_ sign_extend 32) (currentByte!2511 (_2!1776 lt!48828))) ((_ sign_extend 32) (currentBit!2506 (_2!1776 lt!48828))) lt!48832)))

(assert (=> b!33144 (= lt!48832 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48824 () Unit!2487)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1424 BitStream!1424 (_ BitVec 64) (_ BitVec 64)) Unit!2487)

(assert (=> b!33144 (= lt!48824 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1776 lt!48828) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1424 (_ BitVec 8) (_ BitVec 32)) tuple2!3378)

(assert (=> b!33144 (= lt!48828 (appendBitFromByte!0 thiss!1379 (select (arr!1291 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33145 () Bool)

(declare-fun head!250 (List!413) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1424 array!1848 (_ BitVec 64) (_ BitVec 64)) List!413)

(assert (=> b!33145 (= e!21961 (= (head!250 (byteArrayBitContentToList!0 (_2!1776 lt!48828) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!250 (bitStreamReadBitsIntoList!0 (_2!1776 lt!48828) (_1!1777 lt!48838) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!6912 res!28360) b!33139))

(assert (= (and b!33139 res!28367) b!33130))

(assert (= (and b!33130 (not res!28363)) b!33144))

(assert (= (and b!33144 (not res!28357)) b!33134))

(assert (= (and b!33134 res!28368) b!33145))

(assert (= (and b!33134 (not res!28362)) b!33137))

(assert (= (and b!33137 (not res!28366)) b!33136))

(assert (= (and b!33136 (not res!28358)) b!33132))

(assert (= (and b!33132 (not res!28355)) b!33140))

(assert (= (and b!33140 res!28359) b!33142))

(assert (= (and b!33140 (not res!28354)) b!33133))

(assert (= (and b!33133 (not res!28365)) b!33138))

(assert (= (and b!33138 (not res!28356)) b!33131))

(assert (= (and b!33131 (not res!28361)) b!33141))

(assert (= (and b!33141 (not res!28364)) b!33135))

(assert (= start!6912 b!33143))

(declare-fun m!49095 () Bool)

(assert (=> b!33144 m!49095))

(declare-fun m!49097 () Bool)

(assert (=> b!33144 m!49097))

(assert (=> b!33144 m!49097))

(declare-fun m!49099 () Bool)

(assert (=> b!33144 m!49099))

(declare-fun m!49101 () Bool)

(assert (=> b!33144 m!49101))

(declare-fun m!49103 () Bool)

(assert (=> b!33144 m!49103))

(declare-fun m!49105 () Bool)

(assert (=> b!33130 m!49105))

(declare-fun m!49107 () Bool)

(assert (=> b!33130 m!49107))

(declare-fun m!49109 () Bool)

(assert (=> b!33130 m!49109))

(declare-fun m!49111 () Bool)

(assert (=> b!33135 m!49111))

(declare-fun m!49113 () Bool)

(assert (=> b!33135 m!49113))

(declare-fun m!49115 () Bool)

(assert (=> b!33145 m!49115))

(assert (=> b!33145 m!49115))

(declare-fun m!49117 () Bool)

(assert (=> b!33145 m!49117))

(declare-fun m!49119 () Bool)

(assert (=> b!33145 m!49119))

(assert (=> b!33145 m!49119))

(declare-fun m!49121 () Bool)

(assert (=> b!33145 m!49121))

(declare-fun m!49123 () Bool)

(assert (=> start!6912 m!49123))

(declare-fun m!49125 () Bool)

(assert (=> start!6912 m!49125))

(declare-fun m!49127 () Bool)

(assert (=> b!33137 m!49127))

(declare-fun m!49129 () Bool)

(assert (=> b!33136 m!49129))

(declare-fun m!49131 () Bool)

(assert (=> b!33143 m!49131))

(declare-fun m!49133 () Bool)

(assert (=> b!33141 m!49133))

(declare-fun m!49135 () Bool)

(assert (=> b!33133 m!49135))

(declare-fun m!49137 () Bool)

(assert (=> b!33139 m!49137))

(declare-fun m!49139 () Bool)

(assert (=> b!33134 m!49139))

(declare-fun m!49141 () Bool)

(assert (=> b!33134 m!49141))

(declare-fun m!49143 () Bool)

(assert (=> b!33134 m!49143))

(declare-fun m!49145 () Bool)

(assert (=> b!33134 m!49145))

(declare-fun m!49147 () Bool)

(assert (=> b!33134 m!49147))

(declare-fun m!49149 () Bool)

(assert (=> b!33134 m!49149))

(declare-fun m!49151 () Bool)

(assert (=> b!33134 m!49151))

(declare-fun m!49153 () Bool)

(assert (=> b!33131 m!49153))

(declare-fun m!49155 () Bool)

(assert (=> b!33131 m!49155))

(declare-fun m!49157 () Bool)

(assert (=> b!33131 m!49157))

(declare-fun m!49159 () Bool)

(assert (=> b!33131 m!49159))

(declare-fun m!49161 () Bool)

(assert (=> b!33131 m!49161))

(declare-fun m!49163 () Bool)

(assert (=> b!33131 m!49163))

(declare-fun m!49165 () Bool)

(assert (=> b!33131 m!49165))

(declare-fun m!49167 () Bool)

(assert (=> b!33131 m!49167))

(declare-fun m!49169 () Bool)

(assert (=> b!33138 m!49169))

(declare-fun m!49171 () Bool)

(assert (=> b!33142 m!49171))

(push 1)

