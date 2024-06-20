; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14116 () Bool)

(assert start!14116)

(declare-fun b!73741 () Bool)

(declare-fun res!61019 () Bool)

(declare-fun e!48217 () Bool)

(assert (=> b!73741 (=> res!61019 e!48217)))

(declare-datatypes ((array!2999 0))(
  ( (array!3000 (arr!1993 (Array (_ BitVec 32) (_ BitVec 8))) (size!1402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2384 0))(
  ( (BitStream!2385 (buf!1783 array!2999) (currentByte!3509 (_ BitVec 32)) (currentBit!3504 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4857 0))(
  ( (Unit!4858) )
))
(declare-datatypes ((tuple2!6384 0))(
  ( (tuple2!6385 (_1!3306 Unit!4857) (_2!3306 BitStream!2384)) )
))
(declare-fun lt!118474 () tuple2!6384)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73741 (= res!61019 (not (invariant!0 (currentBit!3504 (_2!3306 lt!118474)) (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118474))))))))

(declare-fun b!73742 () Bool)

(declare-fun e!48225 () Bool)

(declare-fun e!48219 () Bool)

(assert (=> b!73742 (= e!48225 e!48219)))

(declare-fun res!61025 () Bool)

(assert (=> b!73742 (=> res!61025 e!48219)))

(declare-fun lt!118452 () Bool)

(declare-fun lt!118459 () Bool)

(assert (=> b!73742 (= res!61025 (not (= lt!118452 lt!118459)))))

(declare-fun lt!118461 () Bool)

(assert (=> b!73742 (= lt!118461 lt!118452)))

(declare-fun lt!118464 () tuple2!6384)

(declare-fun lt!118466 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2999 (_ BitVec 64)) Bool)

(assert (=> b!73742 (= lt!118452 (bitAt!0 (buf!1783 (_2!3306 lt!118464)) lt!118466))))

(declare-fun lt!118462 () (_ BitVec 64))

(declare-fun lt!118471 () Unit!4857)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2999 array!2999 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4857)

(assert (=> b!73742 (= lt!118471 (arrayBitRangesEqImpliesEq!0 (buf!1783 (_2!3306 lt!118474)) (buf!1783 (_2!3306 lt!118464)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118466 lt!118462))))

(declare-fun b!73743 () Bool)

(declare-fun res!61033 () Bool)

(declare-fun e!48220 () Bool)

(assert (=> b!73743 (=> res!61033 e!48220)))

(declare-datatypes ((List!767 0))(
  ( (Nil!764) (Cons!763 (h!882 Bool) (t!1517 List!767)) )
))
(declare-fun lt!118450 () List!767)

(declare-fun length!395 (List!767) Int)

(assert (=> b!73743 (= res!61033 (<= (length!395 lt!118450) 0))))

(declare-fun b!73744 () Bool)

(declare-fun res!61030 () Bool)

(assert (=> b!73744 (=> res!61030 e!48219)))

(declare-datatypes ((tuple2!6386 0))(
  ( (tuple2!6387 (_1!3307 BitStream!2384) (_2!3307 BitStream!2384)) )
))
(declare-fun lt!118460 () tuple2!6386)

(declare-datatypes ((tuple2!6388 0))(
  ( (tuple2!6389 (_1!3308 BitStream!2384) (_2!3308 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2384) tuple2!6388)

(assert (=> b!73744 (= res!61030 (not (= (_2!3308 (readBitPure!0 (_1!3307 lt!118460))) lt!118459)))))

(declare-fun b!73745 () Bool)

(declare-fun res!61031 () Bool)

(declare-fun e!48222 () Bool)

(assert (=> b!73745 (=> res!61031 e!48222)))

(assert (=> b!73745 (= res!61031 (not (invariant!0 (currentBit!3504 (_2!3306 lt!118464)) (currentByte!3509 (_2!3306 lt!118464)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))

(declare-fun b!73746 () Bool)

(declare-fun e!48213 () Bool)

(declare-fun thiss!1379 () BitStream!2384)

(declare-fun array_inv!1251 (array!2999) Bool)

(assert (=> b!73746 (= e!48213 (array_inv!1251 (buf!1783 thiss!1379)))))

(declare-fun b!73747 () Bool)

(declare-fun res!61028 () Bool)

(assert (=> b!73747 (=> res!61028 e!48217)))

(assert (=> b!73747 (= res!61028 (not (invariant!0 (currentBit!3504 (_2!3306 lt!118474)) (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))

(declare-fun b!73748 () Bool)

(assert (=> b!73748 (= e!48222 e!48217)))

(declare-fun res!61035 () Bool)

(assert (=> b!73748 (=> res!61035 e!48217)))

(assert (=> b!73748 (= res!61035 (not (= (size!1402 (buf!1783 (_2!3306 lt!118474))) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!118455 () (_ BitVec 64))

(assert (=> b!73748 (= lt!118455 (bvsub (bvsub (bvadd lt!118462 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73748 (= lt!118462 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> b!73748 (= (size!1402 (buf!1783 (_2!3306 lt!118464))) (size!1402 (buf!1783 thiss!1379)))))

(declare-fun b!73749 () Bool)

(declare-fun e!48227 () Bool)

(declare-fun e!48211 () Bool)

(assert (=> b!73749 (= e!48227 e!48211)))

(declare-fun res!61020 () Bool)

(assert (=> b!73749 (=> res!61020 e!48211)))

(declare-fun isPrefixOf!0 (BitStream!2384 BitStream!2384) Bool)

(assert (=> b!73749 (= res!61020 (not (isPrefixOf!0 thiss!1379 (_2!3306 lt!118474))))))

(declare-fun lt!118473 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73749 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118473)))

(assert (=> b!73749 (= lt!118473 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118458 () Unit!4857)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2384 BitStream!2384 (_ BitVec 64) (_ BitVec 64)) Unit!4857)

(assert (=> b!73749 (= lt!118458 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3306 lt!118474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2999)

(declare-fun appendBitFromByte!0 (BitStream!2384 (_ BitVec 8) (_ BitVec 32)) tuple2!6384)

(assert (=> b!73749 (= lt!118474 (appendBitFromByte!0 thiss!1379 (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!61016 () Bool)

(declare-fun e!48224 () Bool)

(assert (=> start!14116 (=> (not res!61016) (not e!48224))))

(assert (=> start!14116 (= res!61016 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1402 srcBuffer!2))))))))

(assert (=> start!14116 e!48224))

(assert (=> start!14116 true))

(assert (=> start!14116 (array_inv!1251 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2384) Bool)

(assert (=> start!14116 (and (inv!12 thiss!1379) e!48213)))

(declare-fun b!73750 () Bool)

(declare-fun e!48223 () Bool)

(assert (=> b!73750 (= e!48223 e!48222)))

(declare-fun res!61021 () Bool)

(assert (=> b!73750 (=> res!61021 e!48222)))

(assert (=> b!73750 (= res!61021 (not (= lt!118455 (bvsub (bvadd lt!118466 to!314) i!635))))))

(assert (=> b!73750 (= lt!118455 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464))))))

(declare-fun b!73751 () Bool)

(declare-fun e!48221 () Bool)

(declare-fun e!48216 () Bool)

(assert (=> b!73751 (= e!48221 e!48216)))

(declare-fun res!61018 () Bool)

(assert (=> b!73751 (=> res!61018 e!48216)))

(declare-fun lt!118456 () Bool)

(assert (=> b!73751 (= res!61018 (not (= lt!118456 lt!118459)))))

(assert (=> b!73751 (= lt!118459 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun lt!118472 () List!767)

(declare-fun head!586 (List!767) Bool)

(assert (=> b!73751 (= lt!118456 (head!586 lt!118472))))

(declare-fun b!73752 () Bool)

(declare-fun e!48215 () Bool)

(assert (=> b!73752 (= e!48220 e!48215)))

(declare-fun res!61034 () Bool)

(assert (=> b!73752 (=> res!61034 e!48215)))

(declare-fun lt!118465 () List!767)

(declare-fun lt!118470 () List!767)

(assert (=> b!73752 (= res!61034 (not (= lt!118465 lt!118470)))))

(assert (=> b!73752 (= lt!118470 lt!118465)))

(declare-fun tail!371 (List!767) List!767)

(assert (=> b!73752 (= lt!118465 (tail!371 lt!118450))))

(declare-fun lt!118457 () tuple2!6386)

(declare-fun lt!118469 () Unit!4857)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2384 BitStream!2384 BitStream!2384 BitStream!2384 (_ BitVec 64) List!767) Unit!4857)

(assert (=> b!73752 (= lt!118469 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3306 lt!118464) (_2!3306 lt!118464) (_1!3307 lt!118460) (_1!3307 lt!118457) (bvsub to!314 i!635) lt!118450))))

(declare-fun b!73753 () Bool)

(assert (=> b!73753 (= e!48211 e!48223)))

(declare-fun res!61027 () Bool)

(assert (=> b!73753 (=> res!61027 e!48223)))

(assert (=> b!73753 (= res!61027 (not (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118464))))))

(assert (=> b!73753 (isPrefixOf!0 thiss!1379 (_2!3306 lt!118464))))

(declare-fun lt!118453 () Unit!4857)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2384 BitStream!2384 BitStream!2384) Unit!4857)

(assert (=> b!73753 (= lt!118453 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3306 lt!118474) (_2!3306 lt!118464)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2384 array!2999 (_ BitVec 64) (_ BitVec 64)) tuple2!6384)

(assert (=> b!73753 (= lt!118464 (appendBitsMSBFirstLoop!0 (_2!3306 lt!118474) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!48212 () Bool)

(assert (=> b!73753 e!48212))

(declare-fun res!61032 () Bool)

(assert (=> b!73753 (=> (not res!61032) (not e!48212))))

(assert (=> b!73753 (= res!61032 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118468 () Unit!4857)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2384 array!2999 (_ BitVec 64)) Unit!4857)

(assert (=> b!73753 (= lt!118468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1783 (_2!3306 lt!118474)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118463 () tuple2!6386)

(declare-fun reader!0 (BitStream!2384 BitStream!2384) tuple2!6386)

(assert (=> b!73753 (= lt!118463 (reader!0 thiss!1379 (_2!3306 lt!118474)))))

(declare-fun b!73754 () Bool)

(declare-fun e!48218 () Bool)

(assert (=> b!73754 (= e!48218 e!48221)))

(declare-fun res!61022 () Bool)

(assert (=> b!73754 (=> res!61022 e!48221)))

(declare-fun lt!118467 () Bool)

(declare-fun lt!118449 () Bool)

(assert (=> b!73754 (= res!61022 (not (= lt!118467 lt!118449)))))

(assert (=> b!73754 (= lt!118467 (head!586 lt!118450))))

(declare-fun b!73755 () Bool)

(declare-fun res!61024 () Bool)

(assert (=> b!73755 (=> res!61024 e!48222)))

(assert (=> b!73755 (= res!61024 (not (= (size!1402 (buf!1783 thiss!1379)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))

(declare-fun b!73756 () Bool)

(declare-fun res!61029 () Bool)

(assert (=> b!73756 (=> (not res!61029) (not e!48224))))

(assert (=> b!73756 (= res!61029 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73757 () Bool)

(assert (=> b!73757 (= e!48216 e!48225)))

(declare-fun res!61017 () Bool)

(assert (=> b!73757 (=> res!61017 e!48225)))

(assert (=> b!73757 (= res!61017 (not (= lt!118461 lt!118459)))))

(assert (=> b!73757 (= lt!118461 (bitAt!0 (buf!1783 (_2!3306 lt!118474)) lt!118466))))

(declare-fun b!73758 () Bool)

(assert (=> b!73758 (= e!48219 (or (not (= lt!118467 lt!118456)) (= lt!118450 lt!118472)))))

(declare-fun b!73759 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2384 array!2999 (_ BitVec 64) (_ BitVec 64)) List!767)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2384 BitStream!2384 (_ BitVec 64)) List!767)

(assert (=> b!73759 (= e!48212 (= (head!586 (byteArrayBitContentToList!0 (_2!3306 lt!118474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!586 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118474) (_1!3307 lt!118463) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!73760 () Bool)

(assert (=> b!73760 (= e!48224 (not e!48227))))

(declare-fun res!61023 () Bool)

(assert (=> b!73760 (=> res!61023 e!48227)))

(assert (=> b!73760 (= res!61023 (bvsge i!635 to!314))))

(assert (=> b!73760 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118454 () Unit!4857)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2384) Unit!4857)

(assert (=> b!73760 (= lt!118454 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!73760 (= lt!118466 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(declare-fun b!73761 () Bool)

(assert (=> b!73761 (= e!48217 e!48220)))

(declare-fun res!61015 () Bool)

(assert (=> b!73761 (=> res!61015 e!48220)))

(assert (=> b!73761 (= res!61015 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!73761 (= lt!118470 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_1!3307 lt!118457) lt!118473))))

(assert (=> b!73761 (= lt!118450 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_1!3307 lt!118460) (bvsub to!314 i!635)))))

(assert (=> b!73761 (= lt!118472 (byteArrayBitContentToList!0 (_2!3306 lt!118464) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(assert (=> b!73761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118473)))

(declare-fun lt!118451 () Unit!4857)

(assert (=> b!73761 (= lt!118451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!118464)) lt!118473))))

(assert (=> b!73761 (= lt!118457 (reader!0 (_2!3306 lt!118474) (_2!3306 lt!118464)))))

(assert (=> b!73761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118448 () Unit!4857)

(assert (=> b!73761 (= lt!118448 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1783 (_2!3306 lt!118464)) (bvsub to!314 i!635)))))

(assert (=> b!73761 (= lt!118460 (reader!0 thiss!1379 (_2!3306 lt!118464)))))

(declare-fun b!73762 () Bool)

(assert (=> b!73762 (= e!48215 e!48218)))

(declare-fun res!61026 () Bool)

(assert (=> b!73762 (=> res!61026 e!48218)))

(assert (=> b!73762 (= res!61026 (not (= lt!118449 (bitAt!0 (buf!1783 (_1!3307 lt!118457)) lt!118466))))))

(assert (=> b!73762 (= lt!118449 (bitAt!0 (buf!1783 (_1!3307 lt!118460)) lt!118466))))

(assert (= (and start!14116 res!61016) b!73756))

(assert (= (and b!73756 res!61029) b!73760))

(assert (= (and b!73760 (not res!61023)) b!73749))

(assert (= (and b!73749 (not res!61020)) b!73753))

(assert (= (and b!73753 res!61032) b!73759))

(assert (= (and b!73753 (not res!61027)) b!73750))

(assert (= (and b!73750 (not res!61021)) b!73745))

(assert (= (and b!73745 (not res!61031)) b!73755))

(assert (= (and b!73755 (not res!61024)) b!73748))

(assert (= (and b!73748 (not res!61035)) b!73741))

(assert (= (and b!73741 (not res!61019)) b!73747))

(assert (= (and b!73747 (not res!61028)) b!73761))

(assert (= (and b!73761 (not res!61015)) b!73743))

(assert (= (and b!73743 (not res!61033)) b!73752))

(assert (= (and b!73752 (not res!61034)) b!73762))

(assert (= (and b!73762 (not res!61026)) b!73754))

(assert (= (and b!73754 (not res!61022)) b!73751))

(assert (= (and b!73751 (not res!61018)) b!73757))

(assert (= (and b!73757 (not res!61017)) b!73742))

(assert (= (and b!73742 (not res!61025)) b!73744))

(assert (= (and b!73744 (not res!61030)) b!73758))

(assert (= start!14116 b!73746))

(declare-fun m!118223 () Bool)

(assert (=> b!73753 m!118223))

(declare-fun m!118225 () Bool)

(assert (=> b!73753 m!118225))

(declare-fun m!118227 () Bool)

(assert (=> b!73753 m!118227))

(declare-fun m!118229 () Bool)

(assert (=> b!73753 m!118229))

(declare-fun m!118231 () Bool)

(assert (=> b!73753 m!118231))

(declare-fun m!118233 () Bool)

(assert (=> b!73753 m!118233))

(declare-fun m!118235 () Bool)

(assert (=> b!73753 m!118235))

(declare-fun m!118237 () Bool)

(assert (=> b!73762 m!118237))

(declare-fun m!118239 () Bool)

(assert (=> b!73762 m!118239))

(declare-fun m!118241 () Bool)

(assert (=> b!73754 m!118241))

(declare-fun m!118243 () Bool)

(assert (=> b!73745 m!118243))

(declare-fun m!118245 () Bool)

(assert (=> b!73752 m!118245))

(declare-fun m!118247 () Bool)

(assert (=> b!73752 m!118247))

(declare-fun m!118249 () Bool)

(assert (=> b!73747 m!118249))

(declare-fun m!118251 () Bool)

(assert (=> b!73746 m!118251))

(declare-fun m!118253 () Bool)

(assert (=> b!73757 m!118253))

(declare-fun m!118255 () Bool)

(assert (=> start!14116 m!118255))

(declare-fun m!118257 () Bool)

(assert (=> start!14116 m!118257))

(declare-fun m!118259 () Bool)

(assert (=> b!73743 m!118259))

(declare-fun m!118261 () Bool)

(assert (=> b!73751 m!118261))

(declare-fun m!118263 () Bool)

(assert (=> b!73751 m!118263))

(declare-fun m!118265 () Bool)

(assert (=> b!73742 m!118265))

(declare-fun m!118267 () Bool)

(assert (=> b!73742 m!118267))

(declare-fun m!118269 () Bool)

(assert (=> b!73759 m!118269))

(assert (=> b!73759 m!118269))

(declare-fun m!118271 () Bool)

(assert (=> b!73759 m!118271))

(declare-fun m!118273 () Bool)

(assert (=> b!73759 m!118273))

(assert (=> b!73759 m!118273))

(declare-fun m!118275 () Bool)

(assert (=> b!73759 m!118275))

(declare-fun m!118277 () Bool)

(assert (=> b!73756 m!118277))

(declare-fun m!118279 () Bool)

(assert (=> b!73761 m!118279))

(declare-fun m!118281 () Bool)

(assert (=> b!73761 m!118281))

(declare-fun m!118283 () Bool)

(assert (=> b!73761 m!118283))

(declare-fun m!118285 () Bool)

(assert (=> b!73761 m!118285))

(declare-fun m!118287 () Bool)

(assert (=> b!73761 m!118287))

(declare-fun m!118289 () Bool)

(assert (=> b!73761 m!118289))

(declare-fun m!118291 () Bool)

(assert (=> b!73761 m!118291))

(declare-fun m!118293 () Bool)

(assert (=> b!73761 m!118293))

(declare-fun m!118295 () Bool)

(assert (=> b!73761 m!118295))

(declare-fun m!118297 () Bool)

(assert (=> b!73744 m!118297))

(declare-fun m!118299 () Bool)

(assert (=> b!73750 m!118299))

(declare-fun m!118301 () Bool)

(assert (=> b!73741 m!118301))

(declare-fun m!118303 () Bool)

(assert (=> b!73749 m!118303))

(declare-fun m!118305 () Bool)

(assert (=> b!73749 m!118305))

(declare-fun m!118307 () Bool)

(assert (=> b!73749 m!118307))

(declare-fun m!118309 () Bool)

(assert (=> b!73749 m!118309))

(assert (=> b!73749 m!118305))

(declare-fun m!118311 () Bool)

(assert (=> b!73749 m!118311))

(declare-fun m!118313 () Bool)

(assert (=> b!73748 m!118313))

(declare-fun m!118315 () Bool)

(assert (=> b!73760 m!118315))

(declare-fun m!118317 () Bool)

(assert (=> b!73760 m!118317))

(declare-fun m!118319 () Bool)

(assert (=> b!73760 m!118319))

(push 1)

(assert (not b!73744))

(assert (not b!73746))

(assert (not b!73751))

(assert (not b!73761))

(assert (not start!14116))

(assert (not b!73745))

(assert (not b!73756))

(assert (not b!73742))

(assert (not b!73752))

(assert (not b!73749))

(assert (not b!73760))

(assert (not b!73759))

(assert (not b!73757))

(assert (not b!73743))

(assert (not b!73754))

(assert (not b!73762))

(assert (not b!73748))

(assert (not b!73741))

(assert (not b!73750))

(assert (not b!73753))

(assert (not b!73747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23342 () Bool)

(declare-fun size!1404 (List!767) Int)

(assert (=> d!23342 (= (length!395 lt!118450) (size!1404 lt!118450))))

(declare-fun bs!5604 () Bool)

(assert (= bs!5604 d!23342))

(declare-fun m!118447 () Bool)

(assert (=> bs!5604 m!118447))

(assert (=> b!73743 d!23342))

(declare-fun d!23344 () Bool)

(assert (=> d!23344 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118645 () Unit!4857)

(declare-fun choose!9 (BitStream!2384 array!2999 (_ BitVec 64) BitStream!2384) Unit!4857)

(assert (=> d!23344 (= lt!118645 (choose!9 thiss!1379 (buf!1783 (_2!3306 lt!118474)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2385 (buf!1783 (_2!3306 lt!118474)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(assert (=> d!23344 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1783 (_2!3306 lt!118474)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!118645)))

(declare-fun bs!5605 () Bool)

(assert (= bs!5605 d!23344))

(assert (=> bs!5605 m!118223))

(declare-fun m!118449 () Bool)

(assert (=> bs!5605 m!118449))

(assert (=> b!73753 d!23344))

(declare-fun d!23346 () Bool)

(declare-fun res!61084 () Bool)

(declare-fun e!48282 () Bool)

(assert (=> d!23346 (=> (not res!61084) (not e!48282))))

(assert (=> d!23346 (= res!61084 (= (size!1402 (buf!1783 (_2!3306 lt!118474))) (size!1402 (buf!1783 (_2!3306 lt!118464)))))))

(assert (=> d!23346 (= (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118464)) e!48282)))

(declare-fun b!73864 () Bool)

(declare-fun res!61083 () Bool)

(assert (=> b!73864 (=> (not res!61083) (not e!48282))))

(assert (=> b!73864 (= res!61083 (bvsle (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))) (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464)))))))

(declare-fun b!73865 () Bool)

(declare-fun e!48283 () Bool)

(assert (=> b!73865 (= e!48282 e!48283)))

(declare-fun res!61085 () Bool)

(assert (=> b!73865 (=> res!61085 e!48283)))

(assert (=> b!73865 (= res!61085 (= (size!1402 (buf!1783 (_2!3306 lt!118474))) #b00000000000000000000000000000000))))

(declare-fun b!73866 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2999 array!2999 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73866 (= e!48283 (arrayBitRangesEq!0 (buf!1783 (_2!3306 lt!118474)) (buf!1783 (_2!3306 lt!118464)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474)))))))

(assert (= (and d!23346 res!61084) b!73864))

(assert (= (and b!73864 res!61083) b!73865))

(assert (= (and b!73865 (not res!61085)) b!73866))

(assert (=> b!73864 m!118313))

(assert (=> b!73864 m!118299))

(assert (=> b!73866 m!118313))

(assert (=> b!73866 m!118313))

(declare-fun m!118451 () Bool)

(assert (=> b!73866 m!118451))

(assert (=> b!73753 d!23346))

(declare-fun d!23348 () Bool)

(declare-fun e!48312 () Bool)

(assert (=> d!23348 e!48312))

(declare-fun res!61129 () Bool)

(assert (=> d!23348 (=> (not res!61129) (not e!48312))))

(declare-fun lt!118803 () tuple2!6386)

(assert (=> d!23348 (= res!61129 (isPrefixOf!0 (_1!3307 lt!118803) (_2!3307 lt!118803)))))

(declare-fun lt!118800 () BitStream!2384)

(assert (=> d!23348 (= lt!118803 (tuple2!6387 lt!118800 (_2!3306 lt!118474)))))

(declare-fun lt!118810 () Unit!4857)

(declare-fun lt!118809 () Unit!4857)

(assert (=> d!23348 (= lt!118810 lt!118809)))

(assert (=> d!23348 (isPrefixOf!0 lt!118800 (_2!3306 lt!118474))))

(assert (=> d!23348 (= lt!118809 (lemmaIsPrefixTransitive!0 lt!118800 (_2!3306 lt!118474) (_2!3306 lt!118474)))))

(declare-fun lt!118801 () Unit!4857)

(declare-fun lt!118808 () Unit!4857)

(assert (=> d!23348 (= lt!118801 lt!118808)))

(assert (=> d!23348 (isPrefixOf!0 lt!118800 (_2!3306 lt!118474))))

(assert (=> d!23348 (= lt!118808 (lemmaIsPrefixTransitive!0 lt!118800 thiss!1379 (_2!3306 lt!118474)))))

(declare-fun lt!118797 () Unit!4857)

(declare-fun e!48313 () Unit!4857)

(assert (=> d!23348 (= lt!118797 e!48313)))

(declare-fun c!5433 () Bool)

(assert (=> d!23348 (= c!5433 (not (= (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!118799 () Unit!4857)

(declare-fun lt!118815 () Unit!4857)

(assert (=> d!23348 (= lt!118799 lt!118815)))

(assert (=> d!23348 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118474))))

(assert (=> d!23348 (= lt!118815 (lemmaIsPrefixRefl!0 (_2!3306 lt!118474)))))

(declare-fun lt!118805 () Unit!4857)

(declare-fun lt!118814 () Unit!4857)

(assert (=> d!23348 (= lt!118805 lt!118814)))

(assert (=> d!23348 (= lt!118814 (lemmaIsPrefixRefl!0 (_2!3306 lt!118474)))))

(declare-fun lt!118811 () Unit!4857)

(declare-fun lt!118798 () Unit!4857)

(assert (=> d!23348 (= lt!118811 lt!118798)))

(assert (=> d!23348 (isPrefixOf!0 lt!118800 lt!118800)))

(assert (=> d!23348 (= lt!118798 (lemmaIsPrefixRefl!0 lt!118800))))

(declare-fun lt!118816 () Unit!4857)

(declare-fun lt!118804 () Unit!4857)

(assert (=> d!23348 (= lt!118816 lt!118804)))

(assert (=> d!23348 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23348 (= lt!118804 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23348 (= lt!118800 (BitStream!2385 (buf!1783 (_2!3306 lt!118474)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(assert (=> d!23348 (isPrefixOf!0 thiss!1379 (_2!3306 lt!118474))))

(assert (=> d!23348 (= (reader!0 thiss!1379 (_2!3306 lt!118474)) lt!118803)))

(declare-fun b!73927 () Bool)

(declare-fun lt!118812 () Unit!4857)

(assert (=> b!73927 (= e!48313 lt!118812)))

(declare-fun lt!118806 () (_ BitVec 64))

(assert (=> b!73927 (= lt!118806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118813 () (_ BitVec 64))

(assert (=> b!73927 (= lt!118813 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2999 array!2999 (_ BitVec 64) (_ BitVec 64)) Unit!4857)

(assert (=> b!73927 (= lt!118812 (arrayBitRangesEqSymmetric!0 (buf!1783 thiss!1379) (buf!1783 (_2!3306 lt!118474)) lt!118806 lt!118813))))

(assert (=> b!73927 (arrayBitRangesEq!0 (buf!1783 (_2!3306 lt!118474)) (buf!1783 thiss!1379) lt!118806 lt!118813)))

(declare-fun b!73928 () Bool)

(declare-fun res!61130 () Bool)

(assert (=> b!73928 (=> (not res!61130) (not e!48312))))

(assert (=> b!73928 (= res!61130 (isPrefixOf!0 (_1!3307 lt!118803) thiss!1379))))

(declare-fun lt!118807 () (_ BitVec 64))

(declare-fun lt!118802 () (_ BitVec 64))

(declare-fun b!73929 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2384 (_ BitVec 64)) BitStream!2384)

(assert (=> b!73929 (= e!48312 (= (_1!3307 lt!118803) (withMovedBitIndex!0 (_2!3307 lt!118803) (bvsub lt!118807 lt!118802))))))

(assert (=> b!73929 (or (= (bvand lt!118807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118807 lt!118802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73929 (= lt!118802 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> b!73929 (= lt!118807 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(declare-fun b!73930 () Bool)

(declare-fun Unit!4863 () Unit!4857)

(assert (=> b!73930 (= e!48313 Unit!4863)))

(declare-fun b!73931 () Bool)

(declare-fun res!61131 () Bool)

(assert (=> b!73931 (=> (not res!61131) (not e!48312))))

(assert (=> b!73931 (= res!61131 (isPrefixOf!0 (_2!3307 lt!118803) (_2!3306 lt!118474)))))

(assert (= (and d!23348 c!5433) b!73927))

(assert (= (and d!23348 (not c!5433)) b!73930))

(assert (= (and d!23348 res!61129) b!73928))

(assert (= (and b!73928 res!61130) b!73931))

(assert (= (and b!73931 res!61131) b!73929))

(declare-fun m!118525 () Bool)

(assert (=> d!23348 m!118525))

(declare-fun m!118527 () Bool)

(assert (=> d!23348 m!118527))

(declare-fun m!118529 () Bool)

(assert (=> d!23348 m!118529))

(assert (=> d!23348 m!118307))

(assert (=> d!23348 m!118317))

(declare-fun m!118531 () Bool)

(assert (=> d!23348 m!118531))

(declare-fun m!118533 () Bool)

(assert (=> d!23348 m!118533))

(declare-fun m!118535 () Bool)

(assert (=> d!23348 m!118535))

(declare-fun m!118537 () Bool)

(assert (=> d!23348 m!118537))

(declare-fun m!118539 () Bool)

(assert (=> d!23348 m!118539))

(assert (=> d!23348 m!118315))

(declare-fun m!118541 () Bool)

(assert (=> b!73929 m!118541))

(assert (=> b!73929 m!118313))

(assert (=> b!73929 m!118319))

(declare-fun m!118543 () Bool)

(assert (=> b!73928 m!118543))

(assert (=> b!73927 m!118319))

(declare-fun m!118545 () Bool)

(assert (=> b!73927 m!118545))

(declare-fun m!118547 () Bool)

(assert (=> b!73927 m!118547))

(declare-fun m!118549 () Bool)

(assert (=> b!73931 m!118549))

(assert (=> b!73753 d!23348))

(declare-fun d!23370 () Bool)

(declare-fun res!61133 () Bool)

(declare-fun e!48314 () Bool)

(assert (=> d!23370 (=> (not res!61133) (not e!48314))))

(assert (=> d!23370 (= res!61133 (= (size!1402 (buf!1783 thiss!1379)) (size!1402 (buf!1783 (_2!3306 lt!118464)))))))

(assert (=> d!23370 (= (isPrefixOf!0 thiss!1379 (_2!3306 lt!118464)) e!48314)))

(declare-fun b!73932 () Bool)

(declare-fun res!61132 () Bool)

(assert (=> b!73932 (=> (not res!61132) (not e!48314))))

(assert (=> b!73932 (= res!61132 (bvsle (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)) (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464)))))))

(declare-fun b!73933 () Bool)

(declare-fun e!48315 () Bool)

(assert (=> b!73933 (= e!48314 e!48315)))

(declare-fun res!61134 () Bool)

(assert (=> b!73933 (=> res!61134 e!48315)))

(assert (=> b!73933 (= res!61134 (= (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!73934 () Bool)

(assert (=> b!73934 (= e!48315 (arrayBitRangesEq!0 (buf!1783 thiss!1379) (buf!1783 (_2!3306 lt!118464)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(assert (= (and d!23370 res!61133) b!73932))

(assert (= (and b!73932 res!61132) b!73933))

(assert (= (and b!73933 (not res!61134)) b!73934))

(assert (=> b!73932 m!118319))

(assert (=> b!73932 m!118299))

(assert (=> b!73934 m!118319))

(assert (=> b!73934 m!118319))

(declare-fun m!118553 () Bool)

(assert (=> b!73934 m!118553))

(assert (=> b!73753 d!23370))

(declare-fun d!23374 () Bool)

(assert (=> d!23374 (isPrefixOf!0 thiss!1379 (_2!3306 lt!118464))))

(declare-fun lt!118840 () Unit!4857)

(declare-fun choose!30 (BitStream!2384 BitStream!2384 BitStream!2384) Unit!4857)

(assert (=> d!23374 (= lt!118840 (choose!30 thiss!1379 (_2!3306 lt!118474) (_2!3306 lt!118464)))))

(assert (=> d!23374 (isPrefixOf!0 thiss!1379 (_2!3306 lt!118474))))

(assert (=> d!23374 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3306 lt!118474) (_2!3306 lt!118464)) lt!118840)))

(declare-fun bs!5617 () Bool)

(assert (= bs!5617 d!23374))

(assert (=> bs!5617 m!118231))

(declare-fun m!118585 () Bool)

(assert (=> bs!5617 m!118585))

(assert (=> bs!5617 m!118307))

(assert (=> b!73753 d!23374))

(declare-fun b!74006 () Bool)

(declare-fun res!61203 () Bool)

(declare-fun e!48355 () Bool)

(assert (=> b!74006 (=> (not res!61203) (not e!48355))))

(declare-fun lt!119018 () tuple2!6384)

(assert (=> b!74006 (= res!61203 (invariant!0 (currentBit!3504 (_2!3306 lt!119018)) (currentByte!3509 (_2!3306 lt!119018)) (size!1402 (buf!1783 (_2!3306 lt!119018)))))))

(declare-fun b!74007 () Bool)

(declare-fun e!48356 () Bool)

(declare-fun lt!118998 () (_ BitVec 64))

(assert (=> b!74007 (= e!48356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118998))))

(declare-fun b!74008 () Bool)

(declare-fun e!48354 () tuple2!6384)

(declare-fun lt!118993 () tuple2!6384)

(declare-fun Unit!4864 () Unit!4857)

(assert (=> b!74008 (= e!48354 (tuple2!6385 Unit!4864 (_2!3306 lt!118993)))))

(declare-fun lt!119026 () tuple2!6384)

(assert (=> b!74008 (= lt!119026 (appendBitFromByte!0 (_2!3306 lt!118474) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!118995 () (_ BitVec 64))

(assert (=> b!74008 (= lt!118995 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119025 () (_ BitVec 64))

(assert (=> b!74008 (= lt!119025 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118992 () Unit!4857)

(assert (=> b!74008 (= lt!118992 (validateOffsetBitsIneqLemma!0 (_2!3306 lt!118474) (_2!3306 lt!119026) lt!118995 lt!119025))))

(assert (=> b!74008 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!119026)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!119026))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!119026))) (bvsub lt!118995 lt!119025))))

(declare-fun lt!119008 () Unit!4857)

(assert (=> b!74008 (= lt!119008 lt!118992)))

(declare-fun lt!119014 () tuple2!6386)

(declare-fun call!937 () tuple2!6386)

(assert (=> b!74008 (= lt!119014 call!937)))

(declare-fun lt!119010 () (_ BitVec 64))

(assert (=> b!74008 (= lt!119010 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118988 () Unit!4857)

(assert (=> b!74008 (= lt!118988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!119026)) lt!119010))))

(assert (=> b!74008 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!119026)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!119010)))

(declare-fun lt!118990 () Unit!4857)

(assert (=> b!74008 (= lt!118990 lt!118988)))

(assert (=> b!74008 (= (head!586 (byteArrayBitContentToList!0 (_2!3306 lt!119026) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!586 (bitStreamReadBitsIntoList!0 (_2!3306 lt!119026) (_1!3307 lt!119014) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!118994 () Unit!4857)

(declare-fun Unit!4865 () Unit!4857)

(assert (=> b!74008 (= lt!118994 Unit!4865)))

(assert (=> b!74008 (= lt!118993 (appendBitsMSBFirstLoop!0 (_2!3306 lt!119026) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!118984 () Unit!4857)

(assert (=> b!74008 (= lt!118984 (lemmaIsPrefixTransitive!0 (_2!3306 lt!118474) (_2!3306 lt!119026) (_2!3306 lt!118993)))))

(assert (=> b!74008 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118993))))

(declare-fun lt!119017 () Unit!4857)

(assert (=> b!74008 (= lt!119017 lt!118984)))

(assert (=> b!74008 (= (size!1402 (buf!1783 (_2!3306 lt!118993))) (size!1402 (buf!1783 (_2!3306 lt!118474))))))

(declare-fun lt!118985 () Unit!4857)

(declare-fun Unit!4866 () Unit!4857)

(assert (=> b!74008 (= lt!118985 Unit!4866)))

(assert (=> b!74008 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118993))) (currentByte!3509 (_2!3306 lt!118993)) (currentBit!3504 (_2!3306 lt!118993))) (bvsub (bvadd (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119022 () Unit!4857)

(declare-fun Unit!4867 () Unit!4857)

(assert (=> b!74008 (= lt!119022 Unit!4867)))

(assert (=> b!74008 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118993))) (currentByte!3509 (_2!3306 lt!118993)) (currentBit!3504 (_2!3306 lt!118993))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119026))) (currentByte!3509 (_2!3306 lt!119026)) (currentBit!3504 (_2!3306 lt!119026))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119005 () Unit!4857)

(declare-fun Unit!4868 () Unit!4857)

(assert (=> b!74008 (= lt!119005 Unit!4868)))

(declare-fun lt!118999 () tuple2!6386)

(assert (=> b!74008 (= lt!118999 (reader!0 (_2!3306 lt!118474) (_2!3306 lt!118993)))))

(declare-fun lt!119023 () (_ BitVec 64))

(assert (=> b!74008 (= lt!119023 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119001 () Unit!4857)

(assert (=> b!74008 (= lt!119001 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!118993)) lt!119023))))

(assert (=> b!74008 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118993)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!119023)))

(declare-fun lt!118987 () Unit!4857)

(assert (=> b!74008 (= lt!118987 lt!119001)))

(declare-fun lt!119003 () tuple2!6386)

(assert (=> b!74008 (= lt!119003 (reader!0 (_2!3306 lt!119026) (_2!3306 lt!118993)))))

(declare-fun lt!118991 () (_ BitVec 64))

(assert (=> b!74008 (= lt!118991 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119016 () Unit!4857)

(assert (=> b!74008 (= lt!119016 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!119026) (buf!1783 (_2!3306 lt!118993)) lt!118991))))

(assert (=> b!74008 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118993)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!119026))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!119026))) lt!118991)))

(declare-fun lt!119000 () Unit!4857)

(assert (=> b!74008 (= lt!119000 lt!119016)))

(declare-fun lt!119011 () List!767)

(assert (=> b!74008 (= lt!119011 (byteArrayBitContentToList!0 (_2!3306 lt!118993) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119004 () List!767)

(assert (=> b!74008 (= lt!119004 (byteArrayBitContentToList!0 (_2!3306 lt!118993) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119012 () List!767)

(assert (=> b!74008 (= lt!119012 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118993) (_1!3307 lt!118999) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119027 () List!767)

(assert (=> b!74008 (= lt!119027 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118993) (_1!3307 lt!119003) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119009 () (_ BitVec 64))

(assert (=> b!74008 (= lt!119009 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!118986 () Unit!4857)

(assert (=> b!74008 (= lt!118986 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3306 lt!118993) (_2!3306 lt!118993) (_1!3307 lt!118999) (_1!3307 lt!119003) lt!119009 lt!119012))))

(assert (=> b!74008 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!118993) (_1!3307 lt!119003) (bvsub lt!119009 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!371 lt!119012))))

(declare-fun lt!118996 () Unit!4857)

(assert (=> b!74008 (= lt!118996 lt!118986)))

(declare-fun lt!119019 () Unit!4857)

(declare-fun lt!119002 () (_ BitVec 64))

(assert (=> b!74008 (= lt!119019 (arrayBitRangesEqImpliesEq!0 (buf!1783 (_2!3306 lt!119026)) (buf!1783 (_2!3306 lt!118993)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!119002 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119026))) (currentByte!3509 (_2!3306 lt!119026)) (currentBit!3504 (_2!3306 lt!119026)))))))

(assert (=> b!74008 (= (bitAt!0 (buf!1783 (_2!3306 lt!119026)) lt!119002) (bitAt!0 (buf!1783 (_2!3306 lt!118993)) lt!119002))))

(declare-fun lt!119020 () Unit!4857)

(assert (=> b!74008 (= lt!119020 lt!119019)))

(declare-fun b!74009 () Bool)

(declare-fun Unit!4869 () Unit!4857)

(assert (=> b!74009 (= e!48354 (tuple2!6385 Unit!4869 (_2!3306 lt!118474)))))

(assert (=> b!74009 (= (size!1402 (buf!1783 (_2!3306 lt!118474))) (size!1402 (buf!1783 (_2!3306 lt!118474))))))

(declare-fun lt!118989 () Unit!4857)

(declare-fun Unit!4870 () Unit!4857)

(assert (=> b!74009 (= lt!118989 Unit!4870)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2384 array!2999 array!2999 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!6400 0))(
  ( (tuple2!6401 (_1!3314 array!2999) (_2!3314 BitStream!2384)) )
))
(declare-fun readBits!0 (BitStream!2384 (_ BitVec 64)) tuple2!6400)

(assert (=> b!74009 (checkByteArrayBitContent!0 (_2!3306 lt!118474) srcBuffer!2 (_1!3314 (readBits!0 (_1!3307 call!937) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!74010 () Bool)

(declare-fun res!61202 () Bool)

(assert (=> b!74010 (=> (not res!61202) (not e!48355))))

(assert (=> b!74010 (= res!61202 (= (size!1402 (buf!1783 (_2!3306 lt!118474))) (size!1402 (buf!1783 (_2!3306 lt!119018)))))))

(declare-fun b!74011 () Bool)

(declare-fun res!61204 () Bool)

(assert (=> b!74011 (=> (not res!61204) (not e!48355))))

(assert (=> b!74011 (= res!61204 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!119018)))))

(declare-fun b!74012 () Bool)

(declare-fun res!61206 () Bool)

(assert (=> b!74012 (=> (not res!61206) (not e!48355))))

(assert (=> b!74012 (= res!61206 (= (size!1402 (buf!1783 (_2!3306 lt!119018))) (size!1402 (buf!1783 (_2!3306 lt!118474)))))))

(declare-fun d!23390 () Bool)

(assert (=> d!23390 e!48355))

(declare-fun res!61205 () Bool)

(assert (=> d!23390 (=> (not res!61205) (not e!48355))))

(declare-fun lt!119015 () (_ BitVec 64))

(assert (=> d!23390 (= res!61205 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119018))) (currentByte!3509 (_2!3306 lt!119018)) (currentBit!3504 (_2!3306 lt!119018))) (bvsub lt!119015 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23390 (or (= (bvand lt!119015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119015 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119006 () (_ BitVec 64))

(assert (=> d!23390 (= lt!119015 (bvadd lt!119006 to!314))))

(assert (=> d!23390 (or (not (= (bvand lt!119006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119006 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23390 (= lt!119006 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> d!23390 (= lt!119018 e!48354)))

(declare-fun c!5436 () Bool)

(assert (=> d!23390 (= c!5436 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!118997 () Unit!4857)

(declare-fun lt!119021 () Unit!4857)

(assert (=> d!23390 (= lt!118997 lt!119021)))

(assert (=> d!23390 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118474))))

(assert (=> d!23390 (= lt!119021 (lemmaIsPrefixRefl!0 (_2!3306 lt!118474)))))

(assert (=> d!23390 (= lt!119002 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> d!23390 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23390 (= (appendBitsMSBFirstLoop!0 (_2!3306 lt!118474) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!119018)))

(declare-fun bm!934 () Bool)

(assert (=> bm!934 (= call!937 (reader!0 (_2!3306 lt!118474) (ite c!5436 (_2!3306 lt!119026) (_2!3306 lt!118474))))))

(declare-fun b!74013 () Bool)

(declare-fun lt!119013 () tuple2!6386)

(assert (=> b!74013 (= e!48355 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!119018) (_1!3307 lt!119013) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3306 lt!119018) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!74013 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74013 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119007 () Unit!4857)

(declare-fun lt!119024 () Unit!4857)

(assert (=> b!74013 (= lt!119007 lt!119024)))

(assert (=> b!74013 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!119018)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118998)))

(assert (=> b!74013 (= lt!119024 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!119018)) lt!118998))))

(assert (=> b!74013 e!48356))

(declare-fun res!61201 () Bool)

(assert (=> b!74013 (=> (not res!61201) (not e!48356))))

(assert (=> b!74013 (= res!61201 (and (= (size!1402 (buf!1783 (_2!3306 lt!118474))) (size!1402 (buf!1783 (_2!3306 lt!119018)))) (bvsge lt!118998 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74013 (= lt!118998 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!74013 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74013 (= lt!119013 (reader!0 (_2!3306 lt!118474) (_2!3306 lt!119018)))))

(assert (= (and d!23390 c!5436) b!74008))

(assert (= (and d!23390 (not c!5436)) b!74009))

(assert (= (or b!74008 b!74009) bm!934))

(assert (= (and d!23390 res!61205) b!74006))

(assert (= (and b!74006 res!61203) b!74010))

(assert (= (and b!74010 res!61202) b!74011))

(assert (= (and b!74011 res!61204) b!74012))

(assert (= (and b!74012 res!61206) b!74013))

(assert (= (and b!74013 res!61201) b!74007))

(declare-fun m!118645 () Bool)

(assert (=> d!23390 m!118645))

(assert (=> d!23390 m!118313))

(assert (=> d!23390 m!118531))

(assert (=> d!23390 m!118533))

(declare-fun m!118647 () Bool)

(assert (=> b!74007 m!118647))

(declare-fun m!118649 () Bool)

(assert (=> bm!934 m!118649))

(declare-fun m!118651 () Bool)

(assert (=> b!74009 m!118651))

(declare-fun m!118653 () Bool)

(assert (=> b!74009 m!118653))

(declare-fun m!118655 () Bool)

(assert (=> b!74013 m!118655))

(declare-fun m!118657 () Bool)

(assert (=> b!74013 m!118657))

(declare-fun m!118659 () Bool)

(assert (=> b!74013 m!118659))

(declare-fun m!118661 () Bool)

(assert (=> b!74013 m!118661))

(declare-fun m!118663 () Bool)

(assert (=> b!74013 m!118663))

(declare-fun m!118665 () Bool)

(assert (=> b!74008 m!118665))

(declare-fun m!118667 () Bool)

(assert (=> b!74008 m!118667))

(declare-fun m!118669 () Bool)

(assert (=> b!74008 m!118669))

(declare-fun m!118671 () Bool)

(assert (=> b!74008 m!118671))

(declare-fun m!118673 () Bool)

(assert (=> b!74008 m!118673))

(assert (=> b!74008 m!118671))

(declare-fun m!118675 () Bool)

(assert (=> b!74008 m!118675))

(declare-fun m!118677 () Bool)

(assert (=> b!74008 m!118677))

(declare-fun m!118679 () Bool)

(assert (=> b!74008 m!118679))

(declare-fun m!118681 () Bool)

(assert (=> b!74008 m!118681))

(declare-fun m!118683 () Bool)

(assert (=> b!74008 m!118683))

(declare-fun m!118685 () Bool)

(assert (=> b!74008 m!118685))

(declare-fun m!118687 () Bool)

(assert (=> b!74008 m!118687))

(declare-fun m!118689 () Bool)

(assert (=> b!74008 m!118689))

(assert (=> b!74008 m!118313))

(declare-fun m!118691 () Bool)

(assert (=> b!74008 m!118691))

(declare-fun m!118693 () Bool)

(assert (=> b!74008 m!118693))

(declare-fun m!118695 () Bool)

(assert (=> b!74008 m!118695))

(declare-fun m!118697 () Bool)

(assert (=> b!74008 m!118697))

(declare-fun m!118699 () Bool)

(assert (=> b!74008 m!118699))

(assert (=> b!74008 m!118695))

(declare-fun m!118701 () Bool)

(assert (=> b!74008 m!118701))

(assert (=> b!74008 m!118691))

(declare-fun m!118703 () Bool)

(assert (=> b!74008 m!118703))

(declare-fun m!118705 () Bool)

(assert (=> b!74008 m!118705))

(declare-fun m!118707 () Bool)

(assert (=> b!74008 m!118707))

(declare-fun m!118709 () Bool)

(assert (=> b!74008 m!118709))

(assert (=> b!74008 m!118697))

(declare-fun m!118711 () Bool)

(assert (=> b!74008 m!118711))

(declare-fun m!118713 () Bool)

(assert (=> b!74008 m!118713))

(declare-fun m!118715 () Bool)

(assert (=> b!74008 m!118715))

(declare-fun m!118717 () Bool)

(assert (=> b!74008 m!118717))

(declare-fun m!118719 () Bool)

(assert (=> b!74008 m!118719))

(declare-fun m!118721 () Bool)

(assert (=> b!74008 m!118721))

(declare-fun m!118723 () Bool)

(assert (=> b!74008 m!118723))

(declare-fun m!118725 () Bool)

(assert (=> b!74008 m!118725))

(declare-fun m!118727 () Bool)

(assert (=> b!74006 m!118727))

(declare-fun m!118729 () Bool)

(assert (=> b!74011 m!118729))

(assert (=> b!73753 d!23390))

(declare-fun d!23424 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23424 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5624 () Bool)

(assert (= bs!5624 d!23424))

(declare-fun m!118731 () Bool)

(assert (=> bs!5624 m!118731))

(assert (=> b!73753 d!23424))

(declare-fun d!23426 () Bool)

(assert (=> d!23426 (= (bitAt!0 (buf!1783 (_2!3306 lt!118464)) lt!118466) (not (= (bvand ((_ sign_extend 24) (select (arr!1993 (buf!1783 (_2!3306 lt!118464))) ((_ extract 31 0) (bvsdiv lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5625 () Bool)

(assert (= bs!5625 d!23426))

(declare-fun m!118733 () Bool)

(assert (=> bs!5625 m!118733))

(declare-fun m!118735 () Bool)

(assert (=> bs!5625 m!118735))

(assert (=> b!73742 d!23426))

(declare-fun d!23428 () Bool)

(assert (=> d!23428 (= (bitAt!0 (buf!1783 (_2!3306 lt!118474)) lt!118466) (bitAt!0 (buf!1783 (_2!3306 lt!118464)) lt!118466))))

(declare-fun lt!119030 () Unit!4857)

(declare-fun choose!31 (array!2999 array!2999 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4857)

(assert (=> d!23428 (= lt!119030 (choose!31 (buf!1783 (_2!3306 lt!118474)) (buf!1783 (_2!3306 lt!118464)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118466 lt!118462))))

(assert (=> d!23428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118462))))

(assert (=> d!23428 (= (arrayBitRangesEqImpliesEq!0 (buf!1783 (_2!3306 lt!118474)) (buf!1783 (_2!3306 lt!118464)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118466 lt!118462) lt!119030)))

(declare-fun bs!5626 () Bool)

(assert (= bs!5626 d!23428))

(assert (=> bs!5626 m!118253))

(assert (=> bs!5626 m!118265))

(declare-fun m!118737 () Bool)

(assert (=> bs!5626 m!118737))

(assert (=> b!73742 d!23428))

(declare-fun d!23430 () Bool)

(declare-datatypes ((tuple2!6404 0))(
  ( (tuple2!6405 (_1!3316 Bool) (_2!3316 BitStream!2384)) )
))
(declare-fun lt!119033 () tuple2!6404)

(declare-fun readBit!0 (BitStream!2384) tuple2!6404)

(assert (=> d!23430 (= lt!119033 (readBit!0 (_1!3307 lt!118460)))))

(assert (=> d!23430 (= (readBitPure!0 (_1!3307 lt!118460)) (tuple2!6389 (_2!3316 lt!119033) (_1!3316 lt!119033)))))

(declare-fun bs!5627 () Bool)

(assert (= bs!5627 d!23430))

(declare-fun m!118739 () Bool)

(assert (=> bs!5627 m!118739))

(assert (=> b!73744 d!23430))

(declare-fun d!23432 () Bool)

(assert (=> d!23432 (= (head!586 lt!118450) (h!882 lt!118450))))

(assert (=> b!73754 d!23432))

(declare-fun d!23434 () Bool)

(assert (=> d!23434 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5628 () Bool)

(assert (= bs!5628 d!23434))

(assert (=> bs!5628 m!118305))

(declare-fun m!118741 () Bool)

(assert (=> bs!5628 m!118741))

(assert (=> b!73751 d!23434))

(declare-fun d!23436 () Bool)

(assert (=> d!23436 (= (head!586 lt!118472) (h!882 lt!118472))))

(assert (=> b!73751 d!23436))

(declare-fun d!23438 () Bool)

(declare-fun c!5439 () Bool)

(assert (=> d!23438 (= c!5439 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48359 () List!767)

(assert (=> d!23438 (= (byteArrayBitContentToList!0 (_2!3306 lt!118464) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!48359)))

(declare-fun b!74018 () Bool)

(assert (=> b!74018 (= e!48359 Nil!764)))

(declare-fun b!74019 () Bool)

(assert (=> b!74019 (= e!48359 (Cons!763 (not (= (bvand ((_ sign_extend 24) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3306 lt!118464) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23438 c!5439) b!74018))

(assert (= (and d!23438 (not c!5439)) b!74019))

(assert (=> b!74019 m!118305))

(assert (=> b!74019 m!118741))

(declare-fun m!118743 () Bool)

(assert (=> b!74019 m!118743))

(assert (=> b!73761 d!23438))

(declare-fun b!74029 () Bool)

(declare-datatypes ((tuple2!6406 0))(
  ( (tuple2!6407 (_1!3317 List!767) (_2!3317 BitStream!2384)) )
))
(declare-fun e!48364 () tuple2!6406)

(declare-fun lt!119041 () (_ BitVec 64))

(declare-fun lt!119042 () tuple2!6404)

(assert (=> b!74029 (= e!48364 (tuple2!6407 (Cons!763 (_1!3316 lt!119042) (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_2!3316 lt!119042) (bvsub lt!118473 lt!119041))) (_2!3316 lt!119042)))))

(assert (=> b!74029 (= lt!119042 (readBit!0 (_1!3307 lt!118457)))))

(assert (=> b!74029 (= lt!119041 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23440 () Bool)

(declare-fun e!48365 () Bool)

(assert (=> d!23440 e!48365))

(declare-fun c!5445 () Bool)

(assert (=> d!23440 (= c!5445 (= lt!118473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!119040 () List!767)

(assert (=> d!23440 (= lt!119040 (_1!3317 e!48364))))

(declare-fun c!5444 () Bool)

(assert (=> d!23440 (= c!5444 (= lt!118473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23440 (bvsge lt!118473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23440 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_1!3307 lt!118457) lt!118473) lt!119040)))

(declare-fun b!74028 () Bool)

(assert (=> b!74028 (= e!48364 (tuple2!6407 Nil!764 (_1!3307 lt!118457)))))

(declare-fun b!74030 () Bool)

(declare-fun isEmpty!236 (List!767) Bool)

(assert (=> b!74030 (= e!48365 (isEmpty!236 lt!119040))))

(declare-fun b!74031 () Bool)

(assert (=> b!74031 (= e!48365 (> (length!395 lt!119040) 0))))

(assert (= (and d!23440 c!5444) b!74028))

(assert (= (and d!23440 (not c!5444)) b!74029))

(assert (= (and d!23440 c!5445) b!74030))

(assert (= (and d!23440 (not c!5445)) b!74031))

(declare-fun m!118745 () Bool)

(assert (=> b!74029 m!118745))

(declare-fun m!118747 () Bool)

(assert (=> b!74029 m!118747))

(declare-fun m!118749 () Bool)

(assert (=> b!74030 m!118749))

(declare-fun m!118751 () Bool)

(assert (=> b!74031 m!118751))

(assert (=> b!73761 d!23440))

(declare-fun lt!119045 () tuple2!6404)

(declare-fun lt!119044 () (_ BitVec 64))

(declare-fun b!74033 () Bool)

(declare-fun e!48366 () tuple2!6406)

(assert (=> b!74033 (= e!48366 (tuple2!6407 (Cons!763 (_1!3316 lt!119045) (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_2!3316 lt!119045) (bvsub (bvsub to!314 i!635) lt!119044))) (_2!3316 lt!119045)))))

(assert (=> b!74033 (= lt!119045 (readBit!0 (_1!3307 lt!118460)))))

(assert (=> b!74033 (= lt!119044 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23442 () Bool)

(declare-fun e!48367 () Bool)

(assert (=> d!23442 e!48367))

(declare-fun c!5447 () Bool)

(assert (=> d!23442 (= c!5447 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!119043 () List!767)

(assert (=> d!23442 (= lt!119043 (_1!3317 e!48366))))

(declare-fun c!5446 () Bool)

(assert (=> d!23442 (= c!5446 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23442 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23442 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_1!3307 lt!118460) (bvsub to!314 i!635)) lt!119043)))

(declare-fun b!74032 () Bool)

(assert (=> b!74032 (= e!48366 (tuple2!6407 Nil!764 (_1!3307 lt!118460)))))

(declare-fun b!74034 () Bool)

(assert (=> b!74034 (= e!48367 (isEmpty!236 lt!119043))))

(declare-fun b!74035 () Bool)

(assert (=> b!74035 (= e!48367 (> (length!395 lt!119043) 0))))

(assert (= (and d!23442 c!5446) b!74032))

(assert (= (and d!23442 (not c!5446)) b!74033))

(assert (= (and d!23442 c!5447) b!74034))

(assert (= (and d!23442 (not c!5447)) b!74035))

(declare-fun m!118753 () Bool)

(assert (=> b!74033 m!118753))

(assert (=> b!74033 m!118739))

(declare-fun m!118755 () Bool)

(assert (=> b!74034 m!118755))

(declare-fun m!118757 () Bool)

(assert (=> b!74035 m!118757))

(assert (=> b!73761 d!23442))

(declare-fun d!23444 () Bool)

(assert (=> d!23444 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118473)))

(declare-fun lt!119046 () Unit!4857)

(assert (=> d!23444 (= lt!119046 (choose!9 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!118464)) lt!118473 (BitStream!2385 (buf!1783 (_2!3306 lt!118464)) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474)))))))

(assert (=> d!23444 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3306 lt!118474) (buf!1783 (_2!3306 lt!118464)) lt!118473) lt!119046)))

(declare-fun bs!5629 () Bool)

(assert (= bs!5629 d!23444))

(assert (=> bs!5629 m!118291))

(declare-fun m!118759 () Bool)

(assert (=> bs!5629 m!118759))

(assert (=> b!73761 d!23444))

(declare-fun d!23446 () Bool)

(assert (=> d!23446 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5630 () Bool)

(assert (= bs!5630 d!23446))

(declare-fun m!118761 () Bool)

(assert (=> bs!5630 m!118761))

(assert (=> b!73761 d!23446))

(declare-fun d!23448 () Bool)

(declare-fun e!48368 () Bool)

(assert (=> d!23448 e!48368))

(declare-fun res!61207 () Bool)

(assert (=> d!23448 (=> (not res!61207) (not e!48368))))

(declare-fun lt!119053 () tuple2!6386)

(assert (=> d!23448 (= res!61207 (isPrefixOf!0 (_1!3307 lt!119053) (_2!3307 lt!119053)))))

(declare-fun lt!119050 () BitStream!2384)

(assert (=> d!23448 (= lt!119053 (tuple2!6387 lt!119050 (_2!3306 lt!118464)))))

(declare-fun lt!119060 () Unit!4857)

(declare-fun lt!119059 () Unit!4857)

(assert (=> d!23448 (= lt!119060 lt!119059)))

(assert (=> d!23448 (isPrefixOf!0 lt!119050 (_2!3306 lt!118464))))

(assert (=> d!23448 (= lt!119059 (lemmaIsPrefixTransitive!0 lt!119050 (_2!3306 lt!118464) (_2!3306 lt!118464)))))

(declare-fun lt!119051 () Unit!4857)

(declare-fun lt!119058 () Unit!4857)

(assert (=> d!23448 (= lt!119051 lt!119058)))

(assert (=> d!23448 (isPrefixOf!0 lt!119050 (_2!3306 lt!118464))))

(assert (=> d!23448 (= lt!119058 (lemmaIsPrefixTransitive!0 lt!119050 thiss!1379 (_2!3306 lt!118464)))))

(declare-fun lt!119047 () Unit!4857)

(declare-fun e!48369 () Unit!4857)

(assert (=> d!23448 (= lt!119047 e!48369)))

(declare-fun c!5448 () Bool)

(assert (=> d!23448 (= c!5448 (not (= (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!119049 () Unit!4857)

(declare-fun lt!119065 () Unit!4857)

(assert (=> d!23448 (= lt!119049 lt!119065)))

(assert (=> d!23448 (isPrefixOf!0 (_2!3306 lt!118464) (_2!3306 lt!118464))))

(assert (=> d!23448 (= lt!119065 (lemmaIsPrefixRefl!0 (_2!3306 lt!118464)))))

(declare-fun lt!119055 () Unit!4857)

(declare-fun lt!119064 () Unit!4857)

(assert (=> d!23448 (= lt!119055 lt!119064)))

(assert (=> d!23448 (= lt!119064 (lemmaIsPrefixRefl!0 (_2!3306 lt!118464)))))

(declare-fun lt!119061 () Unit!4857)

(declare-fun lt!119048 () Unit!4857)

(assert (=> d!23448 (= lt!119061 lt!119048)))

(assert (=> d!23448 (isPrefixOf!0 lt!119050 lt!119050)))

(assert (=> d!23448 (= lt!119048 (lemmaIsPrefixRefl!0 lt!119050))))

(declare-fun lt!119066 () Unit!4857)

(declare-fun lt!119054 () Unit!4857)

(assert (=> d!23448 (= lt!119066 lt!119054)))

(assert (=> d!23448 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23448 (= lt!119054 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23448 (= lt!119050 (BitStream!2385 (buf!1783 (_2!3306 lt!118464)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(assert (=> d!23448 (isPrefixOf!0 thiss!1379 (_2!3306 lt!118464))))

(assert (=> d!23448 (= (reader!0 thiss!1379 (_2!3306 lt!118464)) lt!119053)))

(declare-fun b!74036 () Bool)

(declare-fun lt!119062 () Unit!4857)

(assert (=> b!74036 (= e!48369 lt!119062)))

(declare-fun lt!119056 () (_ BitVec 64))

(assert (=> b!74036 (= lt!119056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119063 () (_ BitVec 64))

(assert (=> b!74036 (= lt!119063 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(assert (=> b!74036 (= lt!119062 (arrayBitRangesEqSymmetric!0 (buf!1783 thiss!1379) (buf!1783 (_2!3306 lt!118464)) lt!119056 lt!119063))))

(assert (=> b!74036 (arrayBitRangesEq!0 (buf!1783 (_2!3306 lt!118464)) (buf!1783 thiss!1379) lt!119056 lt!119063)))

(declare-fun b!74037 () Bool)

(declare-fun res!61208 () Bool)

(assert (=> b!74037 (=> (not res!61208) (not e!48368))))

(assert (=> b!74037 (= res!61208 (isPrefixOf!0 (_1!3307 lt!119053) thiss!1379))))

(declare-fun lt!119052 () (_ BitVec 64))

(declare-fun lt!119057 () (_ BitVec 64))

(declare-fun b!74038 () Bool)

(assert (=> b!74038 (= e!48368 (= (_1!3307 lt!119053) (withMovedBitIndex!0 (_2!3307 lt!119053) (bvsub lt!119057 lt!119052))))))

(assert (=> b!74038 (or (= (bvand lt!119057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119057 lt!119052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74038 (= lt!119052 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464))))))

(assert (=> b!74038 (= lt!119057 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(declare-fun b!74039 () Bool)

(declare-fun Unit!4886 () Unit!4857)

(assert (=> b!74039 (= e!48369 Unit!4886)))

(declare-fun b!74040 () Bool)

(declare-fun res!61209 () Bool)

(assert (=> b!74040 (=> (not res!61209) (not e!48368))))

(assert (=> b!74040 (= res!61209 (isPrefixOf!0 (_2!3307 lt!119053) (_2!3306 lt!118464)))))

(assert (= (and d!23448 c!5448) b!74036))

(assert (= (and d!23448 (not c!5448)) b!74039))

(assert (= (and d!23448 res!61207) b!74037))

(assert (= (and b!74037 res!61208) b!74040))

(assert (= (and b!74040 res!61209) b!74038))

(declare-fun m!118763 () Bool)

(assert (=> d!23448 m!118763))

(declare-fun m!118765 () Bool)

(assert (=> d!23448 m!118765))

(declare-fun m!118767 () Bool)

(assert (=> d!23448 m!118767))

(assert (=> d!23448 m!118231))

(assert (=> d!23448 m!118317))

(declare-fun m!118769 () Bool)

(assert (=> d!23448 m!118769))

(declare-fun m!118771 () Bool)

(assert (=> d!23448 m!118771))

(declare-fun m!118773 () Bool)

(assert (=> d!23448 m!118773))

(declare-fun m!118775 () Bool)

(assert (=> d!23448 m!118775))

(declare-fun m!118777 () Bool)

(assert (=> d!23448 m!118777))

(assert (=> d!23448 m!118315))

(declare-fun m!118779 () Bool)

(assert (=> b!74038 m!118779))

(assert (=> b!74038 m!118299))

(assert (=> b!74038 m!118319))

(declare-fun m!118781 () Bool)

(assert (=> b!74037 m!118781))

(assert (=> b!74036 m!118319))

(declare-fun m!118783 () Bool)

(assert (=> b!74036 m!118783))

(declare-fun m!118785 () Bool)

(assert (=> b!74036 m!118785))

(declare-fun m!118787 () Bool)

(assert (=> b!74040 m!118787))

(assert (=> b!73761 d!23448))

(declare-fun d!23450 () Bool)

(assert (=> d!23450 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!119067 () Unit!4857)

(assert (=> d!23450 (= lt!119067 (choose!9 thiss!1379 (buf!1783 (_2!3306 lt!118464)) (bvsub to!314 i!635) (BitStream!2385 (buf!1783 (_2!3306 lt!118464)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(assert (=> d!23450 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1783 (_2!3306 lt!118464)) (bvsub to!314 i!635)) lt!119067)))

(declare-fun bs!5631 () Bool)

(assert (= bs!5631 d!23450))

(assert (=> bs!5631 m!118281))

(declare-fun m!118789 () Bool)

(assert (=> bs!5631 m!118789))

(assert (=> b!73761 d!23450))

(declare-fun d!23452 () Bool)

(declare-fun e!48370 () Bool)

(assert (=> d!23452 e!48370))

(declare-fun res!61210 () Bool)

(assert (=> d!23452 (=> (not res!61210) (not e!48370))))

(declare-fun lt!119074 () tuple2!6386)

(assert (=> d!23452 (= res!61210 (isPrefixOf!0 (_1!3307 lt!119074) (_2!3307 lt!119074)))))

(declare-fun lt!119071 () BitStream!2384)

(assert (=> d!23452 (= lt!119074 (tuple2!6387 lt!119071 (_2!3306 lt!118464)))))

(declare-fun lt!119081 () Unit!4857)

(declare-fun lt!119080 () Unit!4857)

(assert (=> d!23452 (= lt!119081 lt!119080)))

(assert (=> d!23452 (isPrefixOf!0 lt!119071 (_2!3306 lt!118464))))

(assert (=> d!23452 (= lt!119080 (lemmaIsPrefixTransitive!0 lt!119071 (_2!3306 lt!118464) (_2!3306 lt!118464)))))

(declare-fun lt!119072 () Unit!4857)

(declare-fun lt!119079 () Unit!4857)

(assert (=> d!23452 (= lt!119072 lt!119079)))

(assert (=> d!23452 (isPrefixOf!0 lt!119071 (_2!3306 lt!118464))))

(assert (=> d!23452 (= lt!119079 (lemmaIsPrefixTransitive!0 lt!119071 (_2!3306 lt!118474) (_2!3306 lt!118464)))))

(declare-fun lt!119068 () Unit!4857)

(declare-fun e!48371 () Unit!4857)

(assert (=> d!23452 (= lt!119068 e!48371)))

(declare-fun c!5449 () Bool)

(assert (=> d!23452 (= c!5449 (not (= (size!1402 (buf!1783 (_2!3306 lt!118474))) #b00000000000000000000000000000000)))))

(declare-fun lt!119070 () Unit!4857)

(declare-fun lt!119086 () Unit!4857)

(assert (=> d!23452 (= lt!119070 lt!119086)))

(assert (=> d!23452 (isPrefixOf!0 (_2!3306 lt!118464) (_2!3306 lt!118464))))

(assert (=> d!23452 (= lt!119086 (lemmaIsPrefixRefl!0 (_2!3306 lt!118464)))))

(declare-fun lt!119076 () Unit!4857)

(declare-fun lt!119085 () Unit!4857)

(assert (=> d!23452 (= lt!119076 lt!119085)))

(assert (=> d!23452 (= lt!119085 (lemmaIsPrefixRefl!0 (_2!3306 lt!118464)))))

(declare-fun lt!119082 () Unit!4857)

(declare-fun lt!119069 () Unit!4857)

(assert (=> d!23452 (= lt!119082 lt!119069)))

(assert (=> d!23452 (isPrefixOf!0 lt!119071 lt!119071)))

(assert (=> d!23452 (= lt!119069 (lemmaIsPrefixRefl!0 lt!119071))))

(declare-fun lt!119087 () Unit!4857)

(declare-fun lt!119075 () Unit!4857)

(assert (=> d!23452 (= lt!119087 lt!119075)))

(assert (=> d!23452 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118474))))

(assert (=> d!23452 (= lt!119075 (lemmaIsPrefixRefl!0 (_2!3306 lt!118474)))))

(assert (=> d!23452 (= lt!119071 (BitStream!2385 (buf!1783 (_2!3306 lt!118464)) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> d!23452 (isPrefixOf!0 (_2!3306 lt!118474) (_2!3306 lt!118464))))

(assert (=> d!23452 (= (reader!0 (_2!3306 lt!118474) (_2!3306 lt!118464)) lt!119074)))

(declare-fun b!74041 () Bool)

(declare-fun lt!119083 () Unit!4857)

(assert (=> b!74041 (= e!48371 lt!119083)))

(declare-fun lt!119077 () (_ BitVec 64))

(assert (=> b!74041 (= lt!119077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119084 () (_ BitVec 64))

(assert (=> b!74041 (= lt!119084 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(assert (=> b!74041 (= lt!119083 (arrayBitRangesEqSymmetric!0 (buf!1783 (_2!3306 lt!118474)) (buf!1783 (_2!3306 lt!118464)) lt!119077 lt!119084))))

(assert (=> b!74041 (arrayBitRangesEq!0 (buf!1783 (_2!3306 lt!118464)) (buf!1783 (_2!3306 lt!118474)) lt!119077 lt!119084)))

(declare-fun b!74042 () Bool)

(declare-fun res!61211 () Bool)

(assert (=> b!74042 (=> (not res!61211) (not e!48370))))

(assert (=> b!74042 (= res!61211 (isPrefixOf!0 (_1!3307 lt!119074) (_2!3306 lt!118474)))))

(declare-fun lt!119078 () (_ BitVec 64))

(declare-fun b!74043 () Bool)

(declare-fun lt!119073 () (_ BitVec 64))

(assert (=> b!74043 (= e!48370 (= (_1!3307 lt!119074) (withMovedBitIndex!0 (_2!3307 lt!119074) (bvsub lt!119078 lt!119073))))))

(assert (=> b!74043 (or (= (bvand lt!119078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119078 lt!119073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74043 (= lt!119073 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464))))))

(assert (=> b!74043 (= lt!119078 (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))))))

(declare-fun b!74044 () Bool)

(declare-fun Unit!4888 () Unit!4857)

(assert (=> b!74044 (= e!48371 Unit!4888)))

(declare-fun b!74045 () Bool)

(declare-fun res!61212 () Bool)

(assert (=> b!74045 (=> (not res!61212) (not e!48370))))

(assert (=> b!74045 (= res!61212 (isPrefixOf!0 (_2!3307 lt!119074) (_2!3306 lt!118464)))))

(assert (= (and d!23452 c!5449) b!74041))

(assert (= (and d!23452 (not c!5449)) b!74044))

(assert (= (and d!23452 res!61210) b!74042))

(assert (= (and b!74042 res!61211) b!74045))

(assert (= (and b!74045 res!61212) b!74043))

(declare-fun m!118791 () Bool)

(assert (=> d!23452 m!118791))

(declare-fun m!118793 () Bool)

(assert (=> d!23452 m!118793))

(declare-fun m!118795 () Bool)

(assert (=> d!23452 m!118795))

(assert (=> d!23452 m!118233))

(assert (=> d!23452 m!118533))

(assert (=> d!23452 m!118769))

(assert (=> d!23452 m!118771))

(declare-fun m!118797 () Bool)

(assert (=> d!23452 m!118797))

(declare-fun m!118799 () Bool)

(assert (=> d!23452 m!118799))

(declare-fun m!118801 () Bool)

(assert (=> d!23452 m!118801))

(assert (=> d!23452 m!118531))

(declare-fun m!118803 () Bool)

(assert (=> b!74043 m!118803))

(assert (=> b!74043 m!118299))

(assert (=> b!74043 m!118313))

(declare-fun m!118805 () Bool)

(assert (=> b!74042 m!118805))

(assert (=> b!74041 m!118313))

(declare-fun m!118807 () Bool)

(assert (=> b!74041 m!118807))

(declare-fun m!118809 () Bool)

(assert (=> b!74041 m!118809))

(declare-fun m!118811 () Bool)

(assert (=> b!74045 m!118811))

(assert (=> b!73761 d!23452))

(declare-fun d!23454 () Bool)

(assert (=> d!23454 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118473) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474)))) lt!118473))))

(declare-fun bs!5632 () Bool)

(assert (= bs!5632 d!23454))

(declare-fun m!118813 () Bool)

(assert (=> bs!5632 m!118813))

(assert (=> b!73761 d!23454))

(declare-fun d!23456 () Bool)

(declare-fun e!48374 () Bool)

(assert (=> d!23456 e!48374))

(declare-fun res!61217 () Bool)

(assert (=> d!23456 (=> (not res!61217) (not e!48374))))

(declare-fun lt!119102 () (_ BitVec 64))

(declare-fun lt!119105 () (_ BitVec 64))

(declare-fun lt!119101 () (_ BitVec 64))

(assert (=> d!23456 (= res!61217 (= lt!119102 (bvsub lt!119105 lt!119101)))))

(assert (=> d!23456 (or (= (bvand lt!119105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119105 lt!119101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23456 (= lt!119101 (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118464))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118464)))))))

(declare-fun lt!119104 () (_ BitVec 64))

(declare-fun lt!119100 () (_ BitVec 64))

(assert (=> d!23456 (= lt!119105 (bvmul lt!119104 lt!119100))))

(assert (=> d!23456 (or (= lt!119104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119100 (bvsdiv (bvmul lt!119104 lt!119100) lt!119104)))))

(assert (=> d!23456 (= lt!119100 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23456 (= lt!119104 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))))))

(assert (=> d!23456 (= lt!119102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118464))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118464)))))))

(assert (=> d!23456 (invariant!0 (currentBit!3504 (_2!3306 lt!118464)) (currentByte!3509 (_2!3306 lt!118464)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))

(assert (=> d!23456 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118464))) (currentByte!3509 (_2!3306 lt!118464)) (currentBit!3504 (_2!3306 lt!118464))) lt!119102)))

(declare-fun b!74050 () Bool)

(declare-fun res!61218 () Bool)

(assert (=> b!74050 (=> (not res!61218) (not e!48374))))

(assert (=> b!74050 (= res!61218 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119102))))

(declare-fun b!74051 () Bool)

(declare-fun lt!119103 () (_ BitVec 64))

(assert (=> b!74051 (= e!48374 (bvsle lt!119102 (bvmul lt!119103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74051 (or (= lt!119103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119103)))))

(assert (=> b!74051 (= lt!119103 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118464)))))))

(assert (= (and d!23456 res!61217) b!74050))

(assert (= (and b!74050 res!61218) b!74051))

(declare-fun m!118815 () Bool)

(assert (=> d!23456 m!118815))

(assert (=> d!23456 m!118243))

(assert (=> b!73750 d!23456))

(declare-fun d!23458 () Bool)

(assert (=> d!23458 (= (tail!371 lt!118450) (t!1517 lt!118450))))

(assert (=> b!73752 d!23458))

(declare-fun d!23460 () Bool)

(declare-fun e!48377 () Bool)

(assert (=> d!23460 e!48377))

(declare-fun res!61221 () Bool)

(assert (=> d!23460 (=> (not res!61221) (not e!48377))))

(declare-fun lt!119111 () (_ BitVec 64))

(assert (=> d!23460 (= res!61221 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!119111) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23460 (= lt!119111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119110 () Unit!4857)

(declare-fun choose!42 (BitStream!2384 BitStream!2384 BitStream!2384 BitStream!2384 (_ BitVec 64) List!767) Unit!4857)

(assert (=> d!23460 (= lt!119110 (choose!42 (_2!3306 lt!118464) (_2!3306 lt!118464) (_1!3307 lt!118460) (_1!3307 lt!118457) (bvsub to!314 i!635) lt!118450))))

(assert (=> d!23460 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23460 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3306 lt!118464) (_2!3306 lt!118464) (_1!3307 lt!118460) (_1!3307 lt!118457) (bvsub to!314 i!635) lt!118450) lt!119110)))

(declare-fun b!74054 () Bool)

(assert (=> b!74054 (= e!48377 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!118464) (_1!3307 lt!118457) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!371 lt!118450)))))

(assert (= (and d!23460 res!61221) b!74054))

(declare-fun m!118817 () Bool)

(assert (=> d!23460 m!118817))

(declare-fun m!118819 () Bool)

(assert (=> b!74054 m!118819))

(assert (=> b!74054 m!118245))

(assert (=> b!73752 d!23460))

(declare-fun d!23462 () Bool)

(assert (=> d!23462 (= (invariant!0 (currentBit!3504 (_2!3306 lt!118474)) (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118474)))) (and (bvsge (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (bvslt (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000001000) (bvsge (currentByte!3509 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118474)))) (and (= (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (= (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118474))))))))))

(assert (=> b!73741 d!23462))

(declare-fun d!23464 () Bool)

(assert (=> d!23464 (= (bitAt!0 (buf!1783 (_1!3307 lt!118457)) lt!118466) (not (= (bvand ((_ sign_extend 24) (select (arr!1993 (buf!1783 (_1!3307 lt!118457))) ((_ extract 31 0) (bvsdiv lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5633 () Bool)

(assert (= bs!5633 d!23464))

(declare-fun m!118821 () Bool)

(assert (=> bs!5633 m!118821))

(assert (=> bs!5633 m!118735))

(assert (=> b!73762 d!23464))

(declare-fun d!23466 () Bool)

(assert (=> d!23466 (= (bitAt!0 (buf!1783 (_1!3307 lt!118460)) lt!118466) (not (= (bvand ((_ sign_extend 24) (select (arr!1993 (buf!1783 (_1!3307 lt!118460))) ((_ extract 31 0) (bvsdiv lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5634 () Bool)

(assert (= bs!5634 d!23466))

(declare-fun m!118823 () Bool)

(assert (=> bs!5634 m!118823))

(assert (=> bs!5634 m!118735))

(assert (=> b!73762 d!23466))

(declare-fun d!23468 () Bool)

(assert (=> d!23468 (= (head!586 (byteArrayBitContentToList!0 (_2!3306 lt!118474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!882 (byteArrayBitContentToList!0 (_2!3306 lt!118474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73759 d!23468))

(declare-fun d!23470 () Bool)

(declare-fun c!5450 () Bool)

(assert (=> d!23470 (= c!5450 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48378 () List!767)

(assert (=> d!23470 (= (byteArrayBitContentToList!0 (_2!3306 lt!118474) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!48378)))

(declare-fun b!74055 () Bool)

(assert (=> b!74055 (= e!48378 Nil!764)))

(declare-fun b!74056 () Bool)

(assert (=> b!74056 (= e!48378 (Cons!763 (not (= (bvand ((_ sign_extend 24) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3306 lt!118474) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23470 c!5450) b!74055))

(assert (= (and d!23470 (not c!5450)) b!74056))

(assert (=> b!74056 m!118305))

(assert (=> b!74056 m!118741))

(declare-fun m!118825 () Bool)

(assert (=> b!74056 m!118825))

(assert (=> b!73759 d!23470))

(declare-fun d!23472 () Bool)

(assert (=> d!23472 (= (head!586 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118474) (_1!3307 lt!118463) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!882 (bitStreamReadBitsIntoList!0 (_2!3306 lt!118474) (_1!3307 lt!118463) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73759 d!23472))

(declare-fun lt!119113 () (_ BitVec 64))

(declare-fun b!74058 () Bool)

(declare-fun lt!119114 () tuple2!6404)

(declare-fun e!48379 () tuple2!6406)

(assert (=> b!74058 (= e!48379 (tuple2!6407 (Cons!763 (_1!3316 lt!119114) (bitStreamReadBitsIntoList!0 (_2!3306 lt!118474) (_2!3316 lt!119114) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!119113))) (_2!3316 lt!119114)))))

(assert (=> b!74058 (= lt!119114 (readBit!0 (_1!3307 lt!118463)))))

(assert (=> b!74058 (= lt!119113 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23474 () Bool)

(declare-fun e!48380 () Bool)

(assert (=> d!23474 e!48380))

(declare-fun c!5452 () Bool)

(assert (=> d!23474 (= c!5452 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!119112 () List!767)

(assert (=> d!23474 (= lt!119112 (_1!3317 e!48379))))

(declare-fun c!5451 () Bool)

(assert (=> d!23474 (= c!5451 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23474 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23474 (= (bitStreamReadBitsIntoList!0 (_2!3306 lt!118474) (_1!3307 lt!118463) #b0000000000000000000000000000000000000000000000000000000000000001) lt!119112)))

(declare-fun b!74057 () Bool)

(assert (=> b!74057 (= e!48379 (tuple2!6407 Nil!764 (_1!3307 lt!118463)))))

(declare-fun b!74059 () Bool)

(assert (=> b!74059 (= e!48380 (isEmpty!236 lt!119112))))

(declare-fun b!74060 () Bool)

(assert (=> b!74060 (= e!48380 (> (length!395 lt!119112) 0))))

(assert (= (and d!23474 c!5451) b!74057))

(assert (= (and d!23474 (not c!5451)) b!74058))

(assert (= (and d!23474 c!5452) b!74059))

(assert (= (and d!23474 (not c!5452)) b!74060))

(declare-fun m!118827 () Bool)

(assert (=> b!74058 m!118827))

(declare-fun m!118829 () Bool)

(assert (=> b!74058 m!118829))

(declare-fun m!118831 () Bool)

(assert (=> b!74059 m!118831))

(declare-fun m!118833 () Bool)

(assert (=> b!74060 m!118833))

(assert (=> b!73759 d!23474))

(declare-fun d!23476 () Bool)

(declare-fun e!48381 () Bool)

(assert (=> d!23476 e!48381))

(declare-fun res!61222 () Bool)

(assert (=> d!23476 (=> (not res!61222) (not e!48381))))

(declare-fun lt!119120 () (_ BitVec 64))

(declare-fun lt!119117 () (_ BitVec 64))

(declare-fun lt!119116 () (_ BitVec 64))

(assert (=> d!23476 (= res!61222 (= lt!119117 (bvsub lt!119120 lt!119116)))))

(assert (=> d!23476 (or (= (bvand lt!119120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119120 lt!119116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23476 (= lt!119116 (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474)))))))

(declare-fun lt!119119 () (_ BitVec 64))

(declare-fun lt!119115 () (_ BitVec 64))

(assert (=> d!23476 (= lt!119120 (bvmul lt!119119 lt!119115))))

(assert (=> d!23476 (or (= lt!119119 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119115 (bvsdiv (bvmul lt!119119 lt!119115) lt!119119)))))

(assert (=> d!23476 (= lt!119115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23476 (= lt!119119 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))))))

(assert (=> d!23476 (= lt!119117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474)))))))

(assert (=> d!23476 (invariant!0 (currentBit!3504 (_2!3306 lt!118474)) (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118474))))))

(assert (=> d!23476 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474))) lt!119117)))

(declare-fun b!74061 () Bool)

(declare-fun res!61223 () Bool)

(assert (=> b!74061 (=> (not res!61223) (not e!48381))))

(assert (=> b!74061 (= res!61223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119117))))

(declare-fun b!74062 () Bool)

(declare-fun lt!119118 () (_ BitVec 64))

(assert (=> b!74062 (= e!48381 (bvsle lt!119117 (bvmul lt!119118 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74062 (or (= lt!119118 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119118 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119118)))))

(assert (=> b!74062 (= lt!119118 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))))))

(assert (= (and d!23476 res!61222) b!74061))

(assert (= (and b!74061 res!61223) b!74062))

(declare-fun m!118835 () Bool)

(assert (=> d!23476 m!118835))

(assert (=> d!23476 m!118301))

(assert (=> b!73748 d!23476))

(declare-fun d!23478 () Bool)

(declare-fun res!61225 () Bool)

(declare-fun e!48382 () Bool)

(assert (=> d!23478 (=> (not res!61225) (not e!48382))))

(assert (=> d!23478 (= res!61225 (= (size!1402 (buf!1783 thiss!1379)) (size!1402 (buf!1783 thiss!1379))))))

(assert (=> d!23478 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48382)))

(declare-fun b!74063 () Bool)

(declare-fun res!61224 () Bool)

(assert (=> b!74063 (=> (not res!61224) (not e!48382))))

(assert (=> b!74063 (= res!61224 (bvsle (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)) (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(declare-fun b!74064 () Bool)

(declare-fun e!48383 () Bool)

(assert (=> b!74064 (= e!48382 e!48383)))

(declare-fun res!61226 () Bool)

(assert (=> b!74064 (=> res!61226 e!48383)))

(assert (=> b!74064 (= res!61226 (= (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74065 () Bool)

(assert (=> b!74065 (= e!48383 (arrayBitRangesEq!0 (buf!1783 thiss!1379) (buf!1783 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(assert (= (and d!23478 res!61225) b!74063))

(assert (= (and b!74063 res!61224) b!74064))

(assert (= (and b!74064 (not res!61226)) b!74065))

(assert (=> b!74063 m!118319))

(assert (=> b!74063 m!118319))

(assert (=> b!74065 m!118319))

(assert (=> b!74065 m!118319))

(declare-fun m!118837 () Bool)

(assert (=> b!74065 m!118837))

(assert (=> b!73760 d!23478))

(declare-fun d!23480 () Bool)

(assert (=> d!23480 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119123 () Unit!4857)

(declare-fun choose!11 (BitStream!2384) Unit!4857)

(assert (=> d!23480 (= lt!119123 (choose!11 thiss!1379))))

(assert (=> d!23480 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119123)))

(declare-fun bs!5636 () Bool)

(assert (= bs!5636 d!23480))

(assert (=> bs!5636 m!118315))

(declare-fun m!118839 () Bool)

(assert (=> bs!5636 m!118839))

(assert (=> b!73760 d!23480))

(declare-fun d!23482 () Bool)

(declare-fun e!48384 () Bool)

(assert (=> d!23482 e!48384))

(declare-fun res!61227 () Bool)

(assert (=> d!23482 (=> (not res!61227) (not e!48384))))

(declare-fun lt!119125 () (_ BitVec 64))

(declare-fun lt!119129 () (_ BitVec 64))

(declare-fun lt!119126 () (_ BitVec 64))

(assert (=> d!23482 (= res!61227 (= lt!119126 (bvsub lt!119129 lt!119125)))))

(assert (=> d!23482 (or (= (bvand lt!119129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119125 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119129 lt!119125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23482 (= lt!119125 (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379))))))

(declare-fun lt!119128 () (_ BitVec 64))

(declare-fun lt!119124 () (_ BitVec 64))

(assert (=> d!23482 (= lt!119129 (bvmul lt!119128 lt!119124))))

(assert (=> d!23482 (or (= lt!119128 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119124 (bvsdiv (bvmul lt!119128 lt!119124) lt!119128)))))

(assert (=> d!23482 (= lt!119124 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23482 (= lt!119128 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))))))

(assert (=> d!23482 (= lt!119126 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3509 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3504 thiss!1379))))))

(assert (=> d!23482 (invariant!0 (currentBit!3504 thiss!1379) (currentByte!3509 thiss!1379) (size!1402 (buf!1783 thiss!1379)))))

(assert (=> d!23482 (= (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)) lt!119126)))

(declare-fun b!74066 () Bool)

(declare-fun res!61228 () Bool)

(assert (=> b!74066 (=> (not res!61228) (not e!48384))))

(assert (=> b!74066 (= res!61228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119126))))

(declare-fun b!74067 () Bool)

(declare-fun lt!119127 () (_ BitVec 64))

(assert (=> b!74067 (= e!48384 (bvsle lt!119126 (bvmul lt!119127 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74067 (or (= lt!119127 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119127 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119127)))))

(assert (=> b!74067 (= lt!119127 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))))))

(assert (= (and d!23482 res!61227) b!74066))

(assert (= (and b!74066 res!61228) b!74067))

(declare-fun m!118841 () Bool)

(assert (=> d!23482 m!118841))

(declare-fun m!118843 () Bool)

(assert (=> d!23482 m!118843))

(assert (=> b!73760 d!23482))

(declare-fun d!23484 () Bool)

(declare-fun res!61230 () Bool)

(declare-fun e!48385 () Bool)

(assert (=> d!23484 (=> (not res!61230) (not e!48385))))

(assert (=> d!23484 (= res!61230 (= (size!1402 (buf!1783 thiss!1379)) (size!1402 (buf!1783 (_2!3306 lt!118474)))))))

(assert (=> d!23484 (= (isPrefixOf!0 thiss!1379 (_2!3306 lt!118474)) e!48385)))

(declare-fun b!74068 () Bool)

(declare-fun res!61229 () Bool)

(assert (=> b!74068 (=> (not res!61229) (not e!48385))))

(assert (=> b!74068 (= res!61229 (bvsle (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)) (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!118474))) (currentByte!3509 (_2!3306 lt!118474)) (currentBit!3504 (_2!3306 lt!118474)))))))

(declare-fun b!74069 () Bool)

(declare-fun e!48386 () Bool)

(assert (=> b!74069 (= e!48385 e!48386)))

(declare-fun res!61231 () Bool)

(assert (=> b!74069 (=> res!61231 e!48386)))

(assert (=> b!74069 (= res!61231 (= (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74070 () Bool)

(assert (=> b!74070 (= e!48386 (arrayBitRangesEq!0 (buf!1783 thiss!1379) (buf!1783 (_2!3306 lt!118474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379))))))

(assert (= (and d!23484 res!61230) b!74068))

(assert (= (and b!74068 res!61229) b!74069))

(assert (= (and b!74069 (not res!61231)) b!74070))

(assert (=> b!74068 m!118319))

(assert (=> b!74068 m!118313))

(assert (=> b!74070 m!118319))

(assert (=> b!74070 m!118319))

(declare-fun m!118845 () Bool)

(assert (=> b!74070 m!118845))

(assert (=> b!73749 d!23484))

(declare-fun d!23486 () Bool)

(assert (=> d!23486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) lt!118473) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474)))) lt!118473))))

(declare-fun bs!5637 () Bool)

(assert (= bs!5637 d!23486))

(assert (=> bs!5637 m!118835))

(assert (=> b!73749 d!23486))

(declare-fun d!23488 () Bool)

(declare-fun e!48389 () Bool)

(assert (=> d!23488 e!48389))

(declare-fun res!61234 () Bool)

(assert (=> d!23488 (=> (not res!61234) (not e!48389))))

(assert (=> d!23488 (= res!61234 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!119132 () Unit!4857)

(declare-fun choose!27 (BitStream!2384 BitStream!2384 (_ BitVec 64) (_ BitVec 64)) Unit!4857)

(assert (=> d!23488 (= lt!119132 (choose!27 thiss!1379 (_2!3306 lt!118474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23488 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23488 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3306 lt!118474) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!119132)))

(declare-fun b!74073 () Bool)

(assert (=> b!74073 (= e!48389 (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 (_2!3306 lt!118474)))) ((_ sign_extend 32) (currentByte!3509 (_2!3306 lt!118474))) ((_ sign_extend 32) (currentBit!3504 (_2!3306 lt!118474))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23488 res!61234) b!74073))

(declare-fun m!118847 () Bool)

(assert (=> d!23488 m!118847))

(declare-fun m!118849 () Bool)

(assert (=> b!74073 m!118849))

(assert (=> b!73749 d!23488))

(declare-fun b!74163 () Bool)

(declare-fun e!48429 () Bool)

(declare-fun e!48431 () Bool)

(assert (=> b!74163 (= e!48429 e!48431)))

(declare-fun res!61307 () Bool)

(assert (=> b!74163 (=> (not res!61307) (not e!48431))))

(declare-fun lt!119480 () (_ BitVec 8))

(declare-fun lt!119489 () tuple2!6388)

(declare-fun lt!119491 () tuple2!6384)

(assert (=> b!74163 (= res!61307 (and (= (_2!3308 lt!119489) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!119480)) #b00000000000000000000000000000000))) (= (_1!3308 lt!119489) (_2!3306 lt!119491))))))

(declare-fun lt!119486 () tuple2!6400)

(declare-fun lt!119484 () BitStream!2384)

(assert (=> b!74163 (= lt!119486 (readBits!0 lt!119484 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!74163 (= lt!119489 (readBitPure!0 lt!119484))))

(declare-fun readerFrom!0 (BitStream!2384 (_ BitVec 32) (_ BitVec 32)) BitStream!2384)

(assert (=> b!74163 (= lt!119484 (readerFrom!0 (_2!3306 lt!119491) (currentBit!3504 thiss!1379) (currentByte!3509 thiss!1379)))))

(declare-fun b!74164 () Bool)

(declare-fun res!61302 () Bool)

(declare-fun e!48428 () Bool)

(assert (=> b!74164 (=> (not res!61302) (not e!48428))))

(declare-fun lt!119483 () tuple2!6384)

(assert (=> b!74164 (= res!61302 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119483))) (currentByte!3509 (_2!3306 lt!119483)) (currentBit!3504 (_2!3306 lt!119483))) (bvadd (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!74165 () Bool)

(assert (=> b!74165 (= e!48431 (= (bitIndex!0 (size!1402 (buf!1783 (_1!3308 lt!119489))) (currentByte!3509 (_1!3308 lt!119489)) (currentBit!3504 (_1!3308 lt!119489))) (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119491))) (currentByte!3509 (_2!3306 lt!119491)) (currentBit!3504 (_2!3306 lt!119491)))))))

(declare-fun b!74166 () Bool)

(declare-fun res!61303 () Bool)

(assert (=> b!74166 (=> (not res!61303) (not e!48429))))

(declare-fun lt!119485 () (_ BitVec 64))

(declare-fun lt!119482 () (_ BitVec 64))

(assert (=> b!74166 (= res!61303 (= (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119491))) (currentByte!3509 (_2!3306 lt!119491)) (currentBit!3504 (_2!3306 lt!119491))) (bvadd lt!119485 lt!119482)))))

(assert (=> b!74166 (or (not (= (bvand lt!119485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119482 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119485 lt!119482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74166 (= lt!119482 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!74166 (= lt!119485 (bitIndex!0 (size!1402 (buf!1783 thiss!1379)) (currentByte!3509 thiss!1379) (currentBit!3504 thiss!1379)))))

(declare-fun b!74168 () Bool)

(declare-fun res!61305 () Bool)

(assert (=> b!74168 (=> (not res!61305) (not e!48429))))

(assert (=> b!74168 (= res!61305 (isPrefixOf!0 thiss!1379 (_2!3306 lt!119491)))))

(declare-fun b!74169 () Bool)

(declare-fun res!61308 () Bool)

(assert (=> b!74169 (=> (not res!61308) (not e!48428))))

(assert (=> b!74169 (= res!61308 (isPrefixOf!0 thiss!1379 (_2!3306 lt!119483)))))

(declare-fun b!74170 () Bool)

(declare-fun e!48430 () Bool)

(assert (=> b!74170 (= e!48428 e!48430)))

(declare-fun res!61306 () Bool)

(assert (=> b!74170 (=> (not res!61306) (not e!48430))))

(declare-fun lt!119490 () tuple2!6388)

(declare-fun lt!119487 () Bool)

(assert (=> b!74170 (= res!61306 (and (= (_2!3308 lt!119490) lt!119487) (= (_1!3308 lt!119490) (_2!3306 lt!119483))))))

(assert (=> b!74170 (= lt!119490 (readBitPure!0 (readerFrom!0 (_2!3306 lt!119483) (currentBit!3504 thiss!1379) (currentByte!3509 thiss!1379))))))

(declare-fun d!23490 () Bool)

(assert (=> d!23490 e!48429))

(declare-fun res!61301 () Bool)

(assert (=> d!23490 (=> (not res!61301) (not e!48429))))

(assert (=> d!23490 (= res!61301 (= (size!1402 (buf!1783 (_2!3306 lt!119491))) (size!1402 (buf!1783 thiss!1379))))))

(declare-fun lt!119481 () array!2999)

(assert (=> d!23490 (= lt!119480 (select (arr!1993 lt!119481) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23490 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1402 lt!119481)))))

(assert (=> d!23490 (= lt!119481 (array!3000 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!119488 () tuple2!6384)

(assert (=> d!23490 (= lt!119491 (tuple2!6385 (_1!3306 lt!119488) (_2!3306 lt!119488)))))

(assert (=> d!23490 (= lt!119488 lt!119483)))

(assert (=> d!23490 e!48428))

(declare-fun res!61304 () Bool)

(assert (=> d!23490 (=> (not res!61304) (not e!48428))))

(assert (=> d!23490 (= res!61304 (= (size!1402 (buf!1783 thiss!1379)) (size!1402 (buf!1783 (_2!3306 lt!119483)))))))

(declare-fun appendBit!0 (BitStream!2384 Bool) tuple2!6384)

(assert (=> d!23490 (= lt!119483 (appendBit!0 thiss!1379 lt!119487))))

(assert (=> d!23490 (= lt!119487 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23490 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23490 (= (appendBitFromByte!0 thiss!1379 (select (arr!1993 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!119491)))

(declare-fun b!74167 () Bool)

(assert (=> b!74167 (= e!48430 (= (bitIndex!0 (size!1402 (buf!1783 (_1!3308 lt!119490))) (currentByte!3509 (_1!3308 lt!119490)) (currentBit!3504 (_1!3308 lt!119490))) (bitIndex!0 (size!1402 (buf!1783 (_2!3306 lt!119483))) (currentByte!3509 (_2!3306 lt!119483)) (currentBit!3504 (_2!3306 lt!119483)))))))

(assert (= (and d!23490 res!61304) b!74164))

(assert (= (and b!74164 res!61302) b!74169))

(assert (= (and b!74169 res!61308) b!74170))

(assert (= (and b!74170 res!61306) b!74167))

(assert (= (and d!23490 res!61301) b!74166))

(assert (= (and b!74166 res!61303) b!74168))

(assert (= (and b!74168 res!61305) b!74163))

(assert (= (and b!74163 res!61307) b!74165))

(declare-fun m!119103 () Bool)

(assert (=> b!74169 m!119103))

(declare-fun m!119105 () Bool)

(assert (=> b!74168 m!119105))

(declare-fun m!119107 () Bool)

(assert (=> b!74164 m!119107))

(assert (=> b!74164 m!118319))

(declare-fun m!119109 () Bool)

(assert (=> b!74163 m!119109))

(declare-fun m!119111 () Bool)

(assert (=> b!74163 m!119111))

(declare-fun m!119113 () Bool)

(assert (=> b!74163 m!119113))

(declare-fun m!119115 () Bool)

(assert (=> b!74166 m!119115))

(assert (=> b!74166 m!118319))

(declare-fun m!119117 () Bool)

(assert (=> d!23490 m!119117))

(declare-fun m!119119 () Bool)

(assert (=> d!23490 m!119119))

(assert (=> d!23490 m!118741))

(declare-fun m!119121 () Bool)

(assert (=> b!74167 m!119121))

(assert (=> b!74167 m!119107))

(declare-fun m!119123 () Bool)

(assert (=> b!74170 m!119123))

(assert (=> b!74170 m!119123))

(declare-fun m!119125 () Bool)

(assert (=> b!74170 m!119125))

(declare-fun m!119127 () Bool)

(assert (=> b!74165 m!119127))

(assert (=> b!74165 m!119115))

(assert (=> b!73749 d!23490))

(declare-fun d!23540 () Bool)

(assert (=> d!23540 (= (array_inv!1251 srcBuffer!2) (bvsge (size!1402 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14116 d!23540))

(declare-fun d!23542 () Bool)

(assert (=> d!23542 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3504 thiss!1379) (currentByte!3509 thiss!1379) (size!1402 (buf!1783 thiss!1379))))))

(declare-fun bs!5649 () Bool)

(assert (= bs!5649 d!23542))

(assert (=> bs!5649 m!118843))

(assert (=> start!14116 d!23542))

(declare-fun d!23544 () Bool)

(assert (=> d!23544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1402 (buf!1783 thiss!1379))) ((_ sign_extend 32) (currentByte!3509 thiss!1379)) ((_ sign_extend 32) (currentBit!3504 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5650 () Bool)

(assert (= bs!5650 d!23544))

(assert (=> bs!5650 m!118841))

(assert (=> b!73756 d!23544))

(declare-fun d!23546 () Bool)

(assert (=> d!23546 (= (invariant!0 (currentBit!3504 (_2!3306 lt!118464)) (currentByte!3509 (_2!3306 lt!118464)) (size!1402 (buf!1783 (_2!3306 lt!118464)))) (and (bvsge (currentBit!3504 (_2!3306 lt!118464)) #b00000000000000000000000000000000) (bvslt (currentBit!3504 (_2!3306 lt!118464)) #b00000000000000000000000000001000) (bvsge (currentByte!3509 (_2!3306 lt!118464)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3509 (_2!3306 lt!118464)) (size!1402 (buf!1783 (_2!3306 lt!118464)))) (and (= (currentBit!3504 (_2!3306 lt!118464)) #b00000000000000000000000000000000) (= (currentByte!3509 (_2!3306 lt!118464)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))))

(assert (=> b!73745 d!23546))

(declare-fun d!23548 () Bool)

(assert (=> d!23548 (= (invariant!0 (currentBit!3504 (_2!3306 lt!118474)) (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118464)))) (and (bvsge (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (bvslt (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000001000) (bvsge (currentByte!3509 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118464)))) (and (= (currentBit!3504 (_2!3306 lt!118474)) #b00000000000000000000000000000000) (= (currentByte!3509 (_2!3306 lt!118474)) (size!1402 (buf!1783 (_2!3306 lt!118464))))))))))

(assert (=> b!73747 d!23548))

(declare-fun d!23550 () Bool)

(assert (=> d!23550 (= (bitAt!0 (buf!1783 (_2!3306 lt!118474)) lt!118466) (not (= (bvand ((_ sign_extend 24) (select (arr!1993 (buf!1783 (_2!3306 lt!118474))) ((_ extract 31 0) (bvsdiv lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118466 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5651 () Bool)

(assert (= bs!5651 d!23550))

(declare-fun m!119129 () Bool)

(assert (=> bs!5651 m!119129))

(assert (=> bs!5651 m!118735))

(assert (=> b!73757 d!23550))

(declare-fun d!23552 () Bool)

(assert (=> d!23552 (= (array_inv!1251 (buf!1783 thiss!1379)) (bvsge (size!1402 (buf!1783 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!73746 d!23552))

(push 1)

(assert (not b!73928))

(assert (not b!74011))

(assert (not b!74058))

(assert (not b!74166))

(assert (not d!23448))

(assert (not d!23454))

(assert (not b!73864))

(assert (not d!23444))

(assert (not b!73931))

(assert (not d!23490))

(assert (not b!74059))

(assert (not b!74031))

(assert (not b!74169))

(assert (not b!73934))

(assert (not b!74041))

(assert (not d!23446))

(assert (not d!23482))

(assert (not d!23476))

(assert (not d!23428))

(assert (not d!23460))

(assert (not b!74073))

(assert (not b!73929))

(assert (not b!74065))

(assert (not d!23348))

(assert (not b!74068))

(assert (not b!74056))

(assert (not b!74009))

(assert (not d!23456))

(assert (not bm!934))

(assert (not b!73866))

(assert (not b!74040))

(assert (not b!74060))

(assert (not d!23424))

(assert (not b!74170))

(assert (not b!74034))

(assert (not b!74054))

(assert (not b!73927))

(assert (not d!23452))

(assert (not d!23342))

(assert (not b!74033))

(assert (not b!74007))

(assert (not d!23544))

(assert (not b!74167))

(assert (not b!74163))

(assert (not b!74063))

(assert (not d!23390))

(assert (not b!73932))

(assert (not b!74043))

(assert (not b!74164))

(assert (not d!23480))

(assert (not b!74168))

(assert (not b!74006))

(assert (not b!74030))

(assert (not d!23450))

(assert (not d!23542))

(assert (not b!74042))

(assert (not d!23344))

(assert (not d!23486))

(assert (not d!23488))

(assert (not d!23374))

(assert (not b!74070))

(assert (not b!74037))

(assert (not b!74038))

(assert (not b!74029))

(assert (not b!74035))

(assert (not b!74036))

(assert (not b!74008))

(assert (not b!74045))

(assert (not b!74019))

(assert (not b!74165))

(assert (not d!23430))

(assert (not b!74013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

