; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6940 () Bool)

(assert start!6940)

(declare-fun b!33822 () Bool)

(declare-fun res!29008 () Bool)

(declare-fun e!22476 () Bool)

(assert (=> b!33822 (=> res!29008 e!22476)))

(declare-datatypes ((array!1876 0))(
  ( (array!1877 (arr!1305 (Array (_ BitVec 32) (_ BitVec 8))) (size!830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1452 0))(
  ( (BitStream!1453 (buf!1158 array!1876) (currentByte!2525 (_ BitVec 32)) (currentBit!2520 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1452)

(declare-datatypes ((Unit!2515 0))(
  ( (Unit!2516) )
))
(declare-datatypes ((tuple2!3434 0))(
  ( (tuple2!3435 (_1!1804 Unit!2515) (_2!1804 BitStream!1452)) )
))
(declare-fun lt!49588 () tuple2!3434)

(assert (=> b!33822 (= res!29008 (not (= (size!830 (buf!1158 thiss!1379)) (size!830 (buf!1158 (_2!1804 lt!49588))))))))

(declare-fun b!33823 () Bool)

(declare-fun res!29020 () Bool)

(declare-fun e!22480 () Bool)

(assert (=> b!33823 (=> res!29020 e!22480)))

(declare-fun lt!49569 () tuple2!3434)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33823 (= res!29020 (not (invariant!0 (currentBit!2520 (_2!1804 lt!49569)) (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49569))))))))

(declare-fun b!33824 () Bool)

(assert (=> b!33824 (= e!22476 e!22480)))

(declare-fun res!29021 () Bool)

(assert (=> b!33824 (=> res!29021 e!22480)))

(assert (=> b!33824 (= res!29021 (not (= (size!830 (buf!1158 (_2!1804 lt!49569))) (size!830 (buf!1158 (_2!1804 lt!49588))))))))

(declare-fun lt!49571 () (_ BitVec 64))

(declare-fun lt!49568 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!33824 (= lt!49571 (bvsub (bvsub (bvadd lt!49568 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33824 (= lt!49568 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> b!33824 (= (size!830 (buf!1158 (_2!1804 lt!49588))) (size!830 (buf!1158 thiss!1379)))))

(declare-fun b!33825 () Bool)

(declare-fun res!29012 () Bool)

(assert (=> b!33825 (=> res!29012 e!22476)))

(assert (=> b!33825 (= res!29012 (not (invariant!0 (currentBit!2520 (_2!1804 lt!49588)) (currentByte!2525 (_2!1804 lt!49588)) (size!830 (buf!1158 (_2!1804 lt!49588))))))))

(declare-fun b!33826 () Bool)

(declare-fun e!22475 () Bool)

(declare-fun e!22474 () Bool)

(assert (=> b!33826 (= e!22475 e!22474)))

(declare-fun res!29017 () Bool)

(assert (=> b!33826 (=> res!29017 e!22474)))

(declare-datatypes ((List!427 0))(
  ( (Nil!424) (Cons!423 (h!542 Bool) (t!1177 List!427)) )
))
(declare-fun lt!49585 () List!427)

(declare-fun lt!49582 () List!427)

(assert (=> b!33826 (= res!29017 (not (= lt!49585 lt!49582)))))

(assert (=> b!33826 (= lt!49582 lt!49585)))

(declare-fun lt!49576 () List!427)

(declare-fun tail!144 (List!427) List!427)

(assert (=> b!33826 (= lt!49585 (tail!144 lt!49576))))

(declare-datatypes ((tuple2!3436 0))(
  ( (tuple2!3437 (_1!1805 BitStream!1452) (_2!1805 BitStream!1452)) )
))
(declare-fun lt!49581 () tuple2!3436)

(declare-fun lt!49584 () tuple2!3436)

(declare-fun lt!49574 () Unit!2515)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1452 BitStream!1452 BitStream!1452 BitStream!1452 (_ BitVec 64) List!427) Unit!2515)

(assert (=> b!33826 (= lt!49574 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1804 lt!49588) (_2!1804 lt!49588) (_1!1805 lt!49581) (_1!1805 lt!49584) (bvsub to!314 i!635) lt!49576))))

(declare-fun b!33827 () Bool)

(declare-fun e!22471 () Bool)

(assert (=> b!33827 (= e!22474 e!22471)))

(declare-fun res!29007 () Bool)

(assert (=> b!33827 (=> res!29007 e!22471)))

(declare-fun lt!49580 () Bool)

(declare-fun lt!49587 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1876 (_ BitVec 64)) Bool)

(assert (=> b!33827 (= res!29007 (not (= lt!49580 (bitAt!0 (buf!1158 (_1!1805 lt!49584)) lt!49587))))))

(assert (=> b!33827 (= lt!49580 (bitAt!0 (buf!1158 (_1!1805 lt!49581)) lt!49587))))

(declare-fun b!33828 () Bool)

(declare-fun e!22479 () Bool)

(declare-fun e!22478 () Bool)

(assert (=> b!33828 (= e!22479 e!22478)))

(declare-fun res!29009 () Bool)

(assert (=> b!33828 (=> res!29009 e!22478)))

(declare-fun isPrefixOf!0 (BitStream!1452 BitStream!1452) Bool)

(assert (=> b!33828 (= res!29009 (not (isPrefixOf!0 thiss!1379 (_2!1804 lt!49569))))))

(declare-fun lt!49579 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33828 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!49579)))

(assert (=> b!33828 (= lt!49579 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49586 () Unit!2515)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1452 BitStream!1452 (_ BitVec 64) (_ BitVec 64)) Unit!2515)

(assert (=> b!33828 (= lt!49586 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1804 lt!49569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1876)

(declare-fun appendBitFromByte!0 (BitStream!1452 (_ BitVec 8) (_ BitVec 32)) tuple2!3434)

(assert (=> b!33828 (= lt!49569 (appendBitFromByte!0 thiss!1379 (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!29019 () Bool)

(declare-fun e!22469 () Bool)

(assert (=> start!6940 (=> (not res!29019) (not e!22469))))

(assert (=> start!6940 (= res!29019 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!830 srcBuffer!2))))))))

(assert (=> start!6940 e!22469))

(assert (=> start!6940 true))

(declare-fun array_inv!779 (array!1876) Bool)

(assert (=> start!6940 (array_inv!779 srcBuffer!2)))

(declare-fun e!22477 () Bool)

(declare-fun inv!12 (BitStream!1452) Bool)

(assert (=> start!6940 (and (inv!12 thiss!1379) e!22477)))

(declare-fun b!33829 () Bool)

(declare-fun e!22470 () Bool)

(declare-fun lt!49578 () tuple2!3436)

(declare-fun head!264 (List!427) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1452 array!1876 (_ BitVec 64) (_ BitVec 64)) List!427)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1452 BitStream!1452 (_ BitVec 64)) List!427)

(assert (=> b!33829 (= e!22470 (= (head!264 (byteArrayBitContentToList!0 (_2!1804 lt!49569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!264 (bitStreamReadBitsIntoList!0 (_2!1804 lt!49569) (_1!1805 lt!49578) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33830 () Bool)

(assert (=> b!33830 (= e!22477 (array_inv!779 (buf!1158 thiss!1379)))))

(declare-fun b!33831 () Bool)

(declare-fun res!29005 () Bool)

(assert (=> b!33831 (=> res!29005 e!22480)))

(assert (=> b!33831 (= res!29005 (not (invariant!0 (currentBit!2520 (_2!1804 lt!49569)) (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49588))))))))

(declare-fun b!33832 () Bool)

(declare-fun e!22473 () Bool)

(declare-fun e!22472 () Bool)

(assert (=> b!33832 (= e!22473 e!22472)))

(declare-fun res!29010 () Bool)

(assert (=> b!33832 (=> res!29010 e!22472)))

(declare-fun lt!49567 () Bool)

(declare-fun lt!49566 () Bool)

(assert (=> b!33832 (= res!29010 (not (= lt!49567 lt!49566)))))

(assert (=> b!33832 (= lt!49567 (bitAt!0 (buf!1158 (_2!1804 lt!49569)) lt!49587))))

(declare-fun b!33833 () Bool)

(declare-fun e!22482 () Bool)

(assert (=> b!33833 (= e!22482 e!22476)))

(declare-fun res!29006 () Bool)

(assert (=> b!33833 (=> res!29006 e!22476)))

(assert (=> b!33833 (= res!29006 (not (= lt!49571 (bvsub (bvadd lt!49587 to!314) i!635))))))

(assert (=> b!33833 (= lt!49571 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588))))))

(declare-fun b!33834 () Bool)

(declare-fun res!29016 () Bool)

(assert (=> b!33834 (=> (not res!29016) (not e!22469))))

(assert (=> b!33834 (= res!29016 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33835 () Bool)

(assert (=> b!33835 (= e!22472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49587) (bvslt lt!49587 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569))))))))))

(assert (=> b!33835 (= lt!49567 (bitAt!0 (buf!1158 (_2!1804 lt!49588)) lt!49587))))

(declare-fun lt!49570 () Unit!2515)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1876 array!1876 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2515)

(assert (=> b!33835 (= lt!49570 (arrayBitRangesEqImpliesEq!0 (buf!1158 (_2!1804 lt!49569)) (buf!1158 (_2!1804 lt!49588)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49587 lt!49568))))

(declare-fun b!33836 () Bool)

(assert (=> b!33836 (= e!22480 e!22475)))

(declare-fun res!29018 () Bool)

(assert (=> b!33836 (=> res!29018 e!22475)))

(assert (=> b!33836 (= res!29018 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!33836 (= lt!49582 (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_1!1805 lt!49584) lt!49579))))

(assert (=> b!33836 (= lt!49576 (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_1!1805 lt!49581) (bvsub to!314 i!635)))))

(assert (=> b!33836 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!49579)))

(declare-fun lt!49575 () Unit!2515)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1452 array!1876 (_ BitVec 64)) Unit!2515)

(assert (=> b!33836 (= lt!49575 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!49588)) lt!49579))))

(declare-fun reader!0 (BitStream!1452 BitStream!1452) tuple2!3436)

(assert (=> b!33836 (= lt!49584 (reader!0 (_2!1804 lt!49569) (_2!1804 lt!49588)))))

(assert (=> b!33836 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49577 () Unit!2515)

(assert (=> b!33836 (= lt!49577 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1158 (_2!1804 lt!49588)) (bvsub to!314 i!635)))))

(assert (=> b!33836 (= lt!49581 (reader!0 thiss!1379 (_2!1804 lt!49588)))))

(declare-fun b!33837 () Bool)

(declare-fun res!29013 () Bool)

(assert (=> b!33837 (=> res!29013 e!22471)))

(assert (=> b!33837 (= res!29013 (not (= (head!264 lt!49576) lt!49580)))))

(declare-fun b!33838 () Bool)

(assert (=> b!33838 (= e!22469 (not e!22479))))

(declare-fun res!29011 () Bool)

(assert (=> b!33838 (=> res!29011 e!22479)))

(assert (=> b!33838 (= res!29011 (bvsge i!635 to!314))))

(assert (=> b!33838 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49572 () Unit!2515)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1452) Unit!2515)

(assert (=> b!33838 (= lt!49572 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33838 (= lt!49587 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(declare-fun b!33839 () Bool)

(assert (=> b!33839 (= e!22471 e!22473)))

(declare-fun res!29022 () Bool)

(assert (=> b!33839 (=> res!29022 e!22473)))

(assert (=> b!33839 (= res!29022 (not (= (head!264 (byteArrayBitContentToList!0 (_2!1804 lt!49588) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!49566)))))

(assert (=> b!33839 (= lt!49566 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!33840 () Bool)

(declare-fun res!29004 () Bool)

(assert (=> b!33840 (=> res!29004 e!22475)))

(declare-fun length!153 (List!427) Int)

(assert (=> b!33840 (= res!29004 (<= (length!153 lt!49576) 0))))

(declare-fun b!33841 () Bool)

(assert (=> b!33841 (= e!22478 e!22482)))

(declare-fun res!29014 () Bool)

(assert (=> b!33841 (=> res!29014 e!22482)))

(assert (=> b!33841 (= res!29014 (not (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49588))))))

(assert (=> b!33841 (isPrefixOf!0 thiss!1379 (_2!1804 lt!49588))))

(declare-fun lt!49583 () Unit!2515)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1452 BitStream!1452 BitStream!1452) Unit!2515)

(assert (=> b!33841 (= lt!49583 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1804 lt!49569) (_2!1804 lt!49588)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1452 array!1876 (_ BitVec 64) (_ BitVec 64)) tuple2!3434)

(assert (=> b!33841 (= lt!49588 (appendBitsMSBFirstLoop!0 (_2!1804 lt!49569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33841 e!22470))

(declare-fun res!29015 () Bool)

(assert (=> b!33841 (=> (not res!29015) (not e!22470))))

(assert (=> b!33841 (= res!29015 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49573 () Unit!2515)

(assert (=> b!33841 (= lt!49573 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1158 (_2!1804 lt!49569)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!33841 (= lt!49578 (reader!0 thiss!1379 (_2!1804 lt!49569)))))

(assert (= (and start!6940 res!29019) b!33834))

(assert (= (and b!33834 res!29016) b!33838))

(assert (= (and b!33838 (not res!29011)) b!33828))

(assert (= (and b!33828 (not res!29009)) b!33841))

(assert (= (and b!33841 res!29015) b!33829))

(assert (= (and b!33841 (not res!29014)) b!33833))

(assert (= (and b!33833 (not res!29006)) b!33825))

(assert (= (and b!33825 (not res!29012)) b!33822))

(assert (= (and b!33822 (not res!29008)) b!33824))

(assert (= (and b!33824 (not res!29021)) b!33823))

(assert (= (and b!33823 (not res!29020)) b!33831))

(assert (= (and b!33831 (not res!29005)) b!33836))

(assert (= (and b!33836 (not res!29018)) b!33840))

(assert (= (and b!33840 (not res!29004)) b!33826))

(assert (= (and b!33826 (not res!29017)) b!33827))

(assert (= (and b!33827 (not res!29007)) b!33837))

(assert (= (and b!33837 (not res!29013)) b!33839))

(assert (= (and b!33839 (not res!29022)) b!33832))

(assert (= (and b!33832 (not res!29010)) b!33835))

(assert (= start!6940 b!33830))

(declare-fun m!50205 () Bool)

(assert (=> b!33836 m!50205))

(declare-fun m!50207 () Bool)

(assert (=> b!33836 m!50207))

(declare-fun m!50209 () Bool)

(assert (=> b!33836 m!50209))

(declare-fun m!50211 () Bool)

(assert (=> b!33836 m!50211))

(declare-fun m!50213 () Bool)

(assert (=> b!33836 m!50213))

(declare-fun m!50215 () Bool)

(assert (=> b!33836 m!50215))

(declare-fun m!50217 () Bool)

(assert (=> b!33836 m!50217))

(declare-fun m!50219 () Bool)

(assert (=> b!33836 m!50219))

(declare-fun m!50221 () Bool)

(assert (=> b!33831 m!50221))

(declare-fun m!50223 () Bool)

(assert (=> b!33824 m!50223))

(declare-fun m!50225 () Bool)

(assert (=> b!33833 m!50225))

(declare-fun m!50227 () Bool)

(assert (=> b!33826 m!50227))

(declare-fun m!50229 () Bool)

(assert (=> b!33826 m!50229))

(declare-fun m!50231 () Bool)

(assert (=> b!33834 m!50231))

(declare-fun m!50233 () Bool)

(assert (=> b!33840 m!50233))

(declare-fun m!50235 () Bool)

(assert (=> b!33823 m!50235))

(declare-fun m!50237 () Bool)

(assert (=> b!33835 m!50237))

(declare-fun m!50239 () Bool)

(assert (=> b!33835 m!50239))

(declare-fun m!50241 () Bool)

(assert (=> b!33832 m!50241))

(declare-fun m!50243 () Bool)

(assert (=> b!33827 m!50243))

(declare-fun m!50245 () Bool)

(assert (=> b!33827 m!50245))

(declare-fun m!50247 () Bool)

(assert (=> b!33837 m!50247))

(declare-fun m!50249 () Bool)

(assert (=> b!33828 m!50249))

(declare-fun m!50251 () Bool)

(assert (=> b!33828 m!50251))

(declare-fun m!50253 () Bool)

(assert (=> b!33828 m!50253))

(declare-fun m!50255 () Bool)

(assert (=> b!33828 m!50255))

(assert (=> b!33828 m!50251))

(declare-fun m!50257 () Bool)

(assert (=> b!33828 m!50257))

(declare-fun m!50259 () Bool)

(assert (=> b!33838 m!50259))

(declare-fun m!50261 () Bool)

(assert (=> b!33838 m!50261))

(declare-fun m!50263 () Bool)

(assert (=> b!33838 m!50263))

(declare-fun m!50265 () Bool)

(assert (=> b!33829 m!50265))

(assert (=> b!33829 m!50265))

(declare-fun m!50267 () Bool)

(assert (=> b!33829 m!50267))

(declare-fun m!50269 () Bool)

(assert (=> b!33829 m!50269))

(assert (=> b!33829 m!50269))

(declare-fun m!50271 () Bool)

(assert (=> b!33829 m!50271))

(declare-fun m!50273 () Bool)

(assert (=> b!33841 m!50273))

(declare-fun m!50275 () Bool)

(assert (=> b!33841 m!50275))

(declare-fun m!50277 () Bool)

(assert (=> b!33841 m!50277))

(declare-fun m!50279 () Bool)

(assert (=> b!33841 m!50279))

(declare-fun m!50281 () Bool)

(assert (=> b!33841 m!50281))

(declare-fun m!50283 () Bool)

(assert (=> b!33841 m!50283))

(declare-fun m!50285 () Bool)

(assert (=> b!33841 m!50285))

(declare-fun m!50287 () Bool)

(assert (=> b!33830 m!50287))

(declare-fun m!50289 () Bool)

(assert (=> b!33825 m!50289))

(declare-fun m!50291 () Bool)

(assert (=> start!6940 m!50291))

(declare-fun m!50293 () Bool)

(assert (=> start!6940 m!50293))

(declare-fun m!50295 () Bool)

(assert (=> b!33839 m!50295))

(assert (=> b!33839 m!50295))

(declare-fun m!50297 () Bool)

(assert (=> b!33839 m!50297))

(declare-fun m!50299 () Bool)

(assert (=> b!33839 m!50299))

(check-sat (not b!33826) (not b!33829) (not b!33838) (not b!33824) (not b!33828) (not b!33837) (not b!33833) (not b!33830) (not b!33839) (not b!33835) (not b!33825) (not b!33834) (not b!33823) (not b!33827) (not b!33841) (not b!33836) (not start!6940) (not b!33831) (not b!33832) (not b!33840))
(check-sat)
(get-model)

(declare-fun d!9594 () Bool)

(declare-fun e!22531 () Bool)

(assert (=> d!9594 e!22531))

(declare-fun res!29084 () Bool)

(assert (=> d!9594 (=> (not res!29084) (not e!22531))))

(declare-fun lt!49674 () (_ BitVec 64))

(declare-fun lt!49675 () (_ BitVec 64))

(declare-fun lt!49673 () (_ BitVec 64))

(assert (=> d!9594 (= res!29084 (= lt!49673 (bvsub lt!49675 lt!49674)))))

(assert (=> d!9594 (or (= (bvand lt!49675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49674 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49675 lt!49674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9594 (= lt!49674 (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569)))))))

(declare-fun lt!49670 () (_ BitVec 64))

(declare-fun lt!49672 () (_ BitVec 64))

(assert (=> d!9594 (= lt!49675 (bvmul lt!49670 lt!49672))))

(assert (=> d!9594 (or (= lt!49670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!49672 (bvsdiv (bvmul lt!49670 lt!49672) lt!49670)))))

(assert (=> d!9594 (= lt!49672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9594 (= lt!49670 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))))))

(assert (=> d!9594 (= lt!49673 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569)))))))

(assert (=> d!9594 (invariant!0 (currentBit!2520 (_2!1804 lt!49569)) (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49569))))))

(assert (=> d!9594 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))) lt!49673)))

(declare-fun b!33906 () Bool)

(declare-fun res!29085 () Bool)

(assert (=> b!33906 (=> (not res!29085) (not e!22531))))

(assert (=> b!33906 (= res!29085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49673))))

(declare-fun b!33907 () Bool)

(declare-fun lt!49671 () (_ BitVec 64))

(assert (=> b!33907 (= e!22531 (bvsle lt!49673 (bvmul lt!49671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!33907 (or (= lt!49671 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!49671 #b0000000000000000000000000000000000000000000000000000000000001000) lt!49671)))))

(assert (=> b!33907 (= lt!49671 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))))))

(assert (= (and d!9594 res!29084) b!33906))

(assert (= (and b!33906 res!29085) b!33907))

(declare-fun m!50397 () Bool)

(assert (=> d!9594 m!50397))

(assert (=> d!9594 m!50235))

(assert (=> b!33824 d!9594))

(declare-fun d!9596 () Bool)

(assert (=> d!9596 (= (bitAt!0 (buf!1158 (_2!1804 lt!49588)) lt!49587) (not (= (bvand ((_ sign_extend 24) (select (arr!1305 (buf!1158 (_2!1804 lt!49588))) ((_ extract 31 0) (bvsdiv lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2639 () Bool)

(assert (= bs!2639 d!9596))

(declare-fun m!50399 () Bool)

(assert (=> bs!2639 m!50399))

(declare-fun m!50401 () Bool)

(assert (=> bs!2639 m!50401))

(assert (=> b!33835 d!9596))

(declare-fun d!9598 () Bool)

(assert (=> d!9598 (= (bitAt!0 (buf!1158 (_2!1804 lt!49569)) lt!49587) (bitAt!0 (buf!1158 (_2!1804 lt!49588)) lt!49587))))

(declare-fun lt!49678 () Unit!2515)

(declare-fun choose!31 (array!1876 array!1876 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2515)

(assert (=> d!9598 (= lt!49678 (choose!31 (buf!1158 (_2!1804 lt!49569)) (buf!1158 (_2!1804 lt!49588)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49587 lt!49568))))

(assert (=> d!9598 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49568))))

(assert (=> d!9598 (= (arrayBitRangesEqImpliesEq!0 (buf!1158 (_2!1804 lt!49569)) (buf!1158 (_2!1804 lt!49588)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!49587 lt!49568) lt!49678)))

(declare-fun bs!2640 () Bool)

(assert (= bs!2640 d!9598))

(assert (=> bs!2640 m!50241))

(assert (=> bs!2640 m!50237))

(declare-fun m!50403 () Bool)

(assert (=> bs!2640 m!50403))

(assert (=> b!33835 d!9598))

(declare-fun d!9600 () Bool)

(assert (=> d!9600 (= (invariant!0 (currentBit!2520 (_2!1804 lt!49588)) (currentByte!2525 (_2!1804 lt!49588)) (size!830 (buf!1158 (_2!1804 lt!49588)))) (and (bvsge (currentBit!2520 (_2!1804 lt!49588)) #b00000000000000000000000000000000) (bvslt (currentBit!2520 (_2!1804 lt!49588)) #b00000000000000000000000000001000) (bvsge (currentByte!2525 (_2!1804 lt!49588)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2525 (_2!1804 lt!49588)) (size!830 (buf!1158 (_2!1804 lt!49588)))) (and (= (currentBit!2520 (_2!1804 lt!49588)) #b00000000000000000000000000000000) (= (currentByte!2525 (_2!1804 lt!49588)) (size!830 (buf!1158 (_2!1804 lt!49588))))))))))

(assert (=> b!33825 d!9600))

(declare-fun d!9602 () Bool)

(assert (=> d!9602 (= (invariant!0 (currentBit!2520 (_2!1804 lt!49569)) (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49569)))) (and (bvsge (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (bvslt (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000001000) (bvsge (currentByte!2525 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49569)))) (and (= (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (= (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49569))))))))))

(assert (=> b!33823 d!9602))

(declare-fun d!9604 () Bool)

(assert (=> d!9604 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2641 () Bool)

(assert (= bs!2641 d!9604))

(declare-fun m!50405 () Bool)

(assert (=> bs!2641 m!50405))

(assert (=> b!33834 d!9604))

(declare-fun d!9606 () Bool)

(assert (=> d!9606 (= (array_inv!779 srcBuffer!2) (bvsge (size!830 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6940 d!9606))

(declare-fun d!9608 () Bool)

(assert (=> d!9608 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2520 thiss!1379) (currentByte!2525 thiss!1379) (size!830 (buf!1158 thiss!1379))))))

(declare-fun bs!2642 () Bool)

(assert (= bs!2642 d!9608))

(declare-fun m!50407 () Bool)

(assert (=> bs!2642 m!50407))

(assert (=> start!6940 d!9608))

(declare-fun d!9610 () Bool)

(assert (=> d!9610 (= (bitAt!0 (buf!1158 (_2!1804 lt!49569)) lt!49587) (not (= (bvand ((_ sign_extend 24) (select (arr!1305 (buf!1158 (_2!1804 lt!49569))) ((_ extract 31 0) (bvsdiv lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2643 () Bool)

(assert (= bs!2643 d!9610))

(declare-fun m!50409 () Bool)

(assert (=> bs!2643 m!50409))

(assert (=> bs!2643 m!50401))

(assert (=> b!33832 d!9610))

(declare-fun d!9612 () Bool)

(declare-fun e!22532 () Bool)

(assert (=> d!9612 e!22532))

(declare-fun res!29086 () Bool)

(assert (=> d!9612 (=> (not res!29086) (not e!22532))))

(declare-fun lt!49684 () (_ BitVec 64))

(declare-fun lt!49682 () (_ BitVec 64))

(declare-fun lt!49683 () (_ BitVec 64))

(assert (=> d!9612 (= res!29086 (= lt!49682 (bvsub lt!49684 lt!49683)))))

(assert (=> d!9612 (or (= (bvand lt!49684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!49683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!49684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!49684 lt!49683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9612 (= lt!49683 (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49588))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49588)))))))

(declare-fun lt!49679 () (_ BitVec 64))

(declare-fun lt!49681 () (_ BitVec 64))

(assert (=> d!9612 (= lt!49684 (bvmul lt!49679 lt!49681))))

(assert (=> d!9612 (or (= lt!49679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!49681 (bvsdiv (bvmul lt!49679 lt!49681) lt!49679)))))

(assert (=> d!9612 (= lt!49681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9612 (= lt!49679 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))))))

(assert (=> d!9612 (= lt!49682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49588))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49588)))))))

(assert (=> d!9612 (invariant!0 (currentBit!2520 (_2!1804 lt!49588)) (currentByte!2525 (_2!1804 lt!49588)) (size!830 (buf!1158 (_2!1804 lt!49588))))))

(assert (=> d!9612 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588))) lt!49682)))

(declare-fun b!33908 () Bool)

(declare-fun res!29087 () Bool)

(assert (=> b!33908 (=> (not res!29087) (not e!22532))))

(assert (=> b!33908 (= res!29087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!49682))))

(declare-fun b!33909 () Bool)

(declare-fun lt!49680 () (_ BitVec 64))

(assert (=> b!33909 (= e!22532 (bvsle lt!49682 (bvmul lt!49680 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!33909 (or (= lt!49680 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!49680 #b0000000000000000000000000000000000000000000000000000000000001000) lt!49680)))))

(assert (=> b!33909 (= lt!49680 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))))))

(assert (= (and d!9612 res!29086) b!33908))

(assert (= (and b!33908 res!29087) b!33909))

(declare-fun m!50411 () Bool)

(assert (=> d!9612 m!50411))

(assert (=> d!9612 m!50289))

(assert (=> b!33833 d!9612))

(declare-fun d!9614 () Bool)

(assert (=> d!9614 (= (invariant!0 (currentBit!2520 (_2!1804 lt!49569)) (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49588)))) (and (bvsge (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (bvslt (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000001000) (bvsge (currentByte!2525 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49588)))) (and (= (currentBit!2520 (_2!1804 lt!49569)) #b00000000000000000000000000000000) (= (currentByte!2525 (_2!1804 lt!49569)) (size!830 (buf!1158 (_2!1804 lt!49588))))))))))

(assert (=> b!33831 d!9614))

(declare-fun d!9616 () Bool)

(declare-fun size!832 (List!427) Int)

(assert (=> d!9616 (= (length!153 lt!49576) (size!832 lt!49576))))

(declare-fun bs!2644 () Bool)

(assert (= bs!2644 d!9616))

(declare-fun m!50413 () Bool)

(assert (=> bs!2644 m!50413))

(assert (=> b!33840 d!9616))

(declare-fun d!9618 () Bool)

(assert (=> d!9618 (= (array_inv!779 (buf!1158 thiss!1379)) (bvsge (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!33830 d!9618))

(declare-fun d!9620 () Bool)

(assert (=> d!9620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2645 () Bool)

(assert (= bs!2645 d!9620))

(declare-fun m!50415 () Bool)

(assert (=> bs!2645 m!50415))

(assert (=> b!33841 d!9620))

(declare-fun d!9622 () Bool)

(assert (=> d!9622 (isPrefixOf!0 thiss!1379 (_2!1804 lt!49588))))

(declare-fun lt!49687 () Unit!2515)

(declare-fun choose!30 (BitStream!1452 BitStream!1452 BitStream!1452) Unit!2515)

(assert (=> d!9622 (= lt!49687 (choose!30 thiss!1379 (_2!1804 lt!49569) (_2!1804 lt!49588)))))

(assert (=> d!9622 (isPrefixOf!0 thiss!1379 (_2!1804 lt!49569))))

(assert (=> d!9622 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1804 lt!49569) (_2!1804 lt!49588)) lt!49687)))

(declare-fun bs!2646 () Bool)

(assert (= bs!2646 d!9622))

(assert (=> bs!2646 m!50283))

(declare-fun m!50417 () Bool)

(assert (=> bs!2646 m!50417))

(assert (=> bs!2646 m!50249))

(assert (=> b!33841 d!9622))

(declare-fun d!9624 () Bool)

(declare-fun res!29095 () Bool)

(declare-fun e!22537 () Bool)

(assert (=> d!9624 (=> (not res!29095) (not e!22537))))

(assert (=> d!9624 (= res!29095 (= (size!830 (buf!1158 thiss!1379)) (size!830 (buf!1158 (_2!1804 lt!49588)))))))

(assert (=> d!9624 (= (isPrefixOf!0 thiss!1379 (_2!1804 lt!49588)) e!22537)))

(declare-fun b!33916 () Bool)

(declare-fun res!29094 () Bool)

(assert (=> b!33916 (=> (not res!29094) (not e!22537))))

(assert (=> b!33916 (= res!29094 (bvsle (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)) (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588)))))))

(declare-fun b!33917 () Bool)

(declare-fun e!22538 () Bool)

(assert (=> b!33917 (= e!22537 e!22538)))

(declare-fun res!29096 () Bool)

(assert (=> b!33917 (=> res!29096 e!22538)))

(assert (=> b!33917 (= res!29096 (= (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!33918 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1876 array!1876 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33918 (= e!22538 (arrayBitRangesEq!0 (buf!1158 thiss!1379) (buf!1158 (_2!1804 lt!49588)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(assert (= (and d!9624 res!29095) b!33916))

(assert (= (and b!33916 res!29094) b!33917))

(assert (= (and b!33917 (not res!29096)) b!33918))

(assert (=> b!33916 m!50263))

(assert (=> b!33916 m!50225))

(assert (=> b!33918 m!50263))

(assert (=> b!33918 m!50263))

(declare-fun m!50419 () Bool)

(assert (=> b!33918 m!50419))

(assert (=> b!33841 d!9624))

(declare-fun d!9626 () Bool)

(assert (=> d!9626 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!49690 () Unit!2515)

(declare-fun choose!9 (BitStream!1452 array!1876 (_ BitVec 64) BitStream!1452) Unit!2515)

(assert (=> d!9626 (= lt!49690 (choose!9 thiss!1379 (buf!1158 (_2!1804 lt!49569)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1453 (buf!1158 (_2!1804 lt!49569)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(assert (=> d!9626 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1158 (_2!1804 lt!49569)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!49690)))

(declare-fun bs!2647 () Bool)

(assert (= bs!2647 d!9626))

(assert (=> bs!2647 m!50277))

(declare-fun m!50421 () Bool)

(assert (=> bs!2647 m!50421))

(assert (=> b!33841 d!9626))

(declare-fun d!9628 () Bool)

(declare-fun res!29098 () Bool)

(declare-fun e!22539 () Bool)

(assert (=> d!9628 (=> (not res!29098) (not e!22539))))

(assert (=> d!9628 (= res!29098 (= (size!830 (buf!1158 (_2!1804 lt!49569))) (size!830 (buf!1158 (_2!1804 lt!49588)))))))

(assert (=> d!9628 (= (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49588)) e!22539)))

(declare-fun b!33919 () Bool)

(declare-fun res!29097 () Bool)

(assert (=> b!33919 (=> (not res!29097) (not e!22539))))

(assert (=> b!33919 (= res!29097 (bvsle (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))) (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588)))))))

(declare-fun b!33920 () Bool)

(declare-fun e!22540 () Bool)

(assert (=> b!33920 (= e!22539 e!22540)))

(declare-fun res!29099 () Bool)

(assert (=> b!33920 (=> res!29099 e!22540)))

(assert (=> b!33920 (= res!29099 (= (size!830 (buf!1158 (_2!1804 lt!49569))) #b00000000000000000000000000000000))))

(declare-fun b!33921 () Bool)

(assert (=> b!33921 (= e!22540 (arrayBitRangesEq!0 (buf!1158 (_2!1804 lt!49569)) (buf!1158 (_2!1804 lt!49588)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569)))))))

(assert (= (and d!9628 res!29098) b!33919))

(assert (= (and b!33919 res!29097) b!33920))

(assert (= (and b!33920 (not res!29099)) b!33921))

(assert (=> b!33919 m!50223))

(assert (=> b!33919 m!50225))

(assert (=> b!33921 m!50223))

(assert (=> b!33921 m!50223))

(declare-fun m!50423 () Bool)

(assert (=> b!33921 m!50423))

(assert (=> b!33841 d!9628))

(declare-fun lt!50109 () tuple2!3434)

(declare-fun bm!418 () Bool)

(declare-fun c!2257 () Bool)

(declare-fun lt!50093 () tuple2!3434)

(declare-fun call!421 () tuple2!3436)

(assert (=> bm!418 (= call!421 (reader!0 (ite c!2257 (_2!1804 lt!50109) (_2!1804 lt!49569)) (ite c!2257 (_2!1804 lt!50093) (_2!1804 lt!49569))))))

(declare-fun b!34099 () Bool)

(declare-fun e!22632 () tuple2!3434)

(declare-fun Unit!2519 () Unit!2515)

(assert (=> b!34099 (= e!22632 (tuple2!3435 Unit!2519 (_2!1804 lt!50093)))))

(assert (=> b!34099 (= lt!50109 (appendBitFromByte!0 (_2!1804 lt!49569) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!50106 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50106 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50107 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50107 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50112 () Unit!2515)

(assert (=> b!34099 (= lt!50112 (validateOffsetBitsIneqLemma!0 (_2!1804 lt!49569) (_2!1804 lt!50109) lt!50106 lt!50107))))

(assert (=> b!34099 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!50109)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!50109))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!50109))) (bvsub lt!50106 lt!50107))))

(declare-fun lt!50102 () Unit!2515)

(assert (=> b!34099 (= lt!50102 lt!50112)))

(declare-fun lt!50090 () tuple2!3436)

(assert (=> b!34099 (= lt!50090 (reader!0 (_2!1804 lt!49569) (_2!1804 lt!50109)))))

(declare-fun lt!50087 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50087 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50080 () Unit!2515)

(assert (=> b!34099 (= lt!50080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!50109)) lt!50087))))

(assert (=> b!34099 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!50109)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!50087)))

(declare-fun lt!50082 () Unit!2515)

(assert (=> b!34099 (= lt!50082 lt!50080)))

(assert (=> b!34099 (= (head!264 (byteArrayBitContentToList!0 (_2!1804 lt!50109) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!264 (bitStreamReadBitsIntoList!0 (_2!1804 lt!50109) (_1!1805 lt!50090) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50081 () Unit!2515)

(declare-fun Unit!2520 () Unit!2515)

(assert (=> b!34099 (= lt!50081 Unit!2520)))

(assert (=> b!34099 (= lt!50093 (appendBitsMSBFirstLoop!0 (_2!1804 lt!50109) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!50079 () Unit!2515)

(assert (=> b!34099 (= lt!50079 (lemmaIsPrefixTransitive!0 (_2!1804 lt!49569) (_2!1804 lt!50109) (_2!1804 lt!50093)))))

(assert (=> b!34099 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!50093))))

(declare-fun lt!50073 () Unit!2515)

(assert (=> b!34099 (= lt!50073 lt!50079)))

(assert (=> b!34099 (= (size!830 (buf!1158 (_2!1804 lt!50093))) (size!830 (buf!1158 (_2!1804 lt!49569))))))

(declare-fun lt!50099 () Unit!2515)

(declare-fun Unit!2521 () Unit!2515)

(assert (=> b!34099 (= lt!50099 Unit!2521)))

(assert (=> b!34099 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50093))) (currentByte!2525 (_2!1804 lt!50093)) (currentBit!2520 (_2!1804 lt!50093))) (bvsub (bvadd (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50101 () Unit!2515)

(declare-fun Unit!2522 () Unit!2515)

(assert (=> b!34099 (= lt!50101 Unit!2522)))

(assert (=> b!34099 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50093))) (currentByte!2525 (_2!1804 lt!50093)) (currentBit!2520 (_2!1804 lt!50093))) (bvsub (bvsub (bvadd (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50109))) (currentByte!2525 (_2!1804 lt!50109)) (currentBit!2520 (_2!1804 lt!50109))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50086 () Unit!2515)

(declare-fun Unit!2523 () Unit!2515)

(assert (=> b!34099 (= lt!50086 Unit!2523)))

(declare-fun lt!50076 () tuple2!3436)

(assert (=> b!34099 (= lt!50076 (reader!0 (_2!1804 lt!49569) (_2!1804 lt!50093)))))

(declare-fun lt!50111 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50111 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50096 () Unit!2515)

(assert (=> b!34099 (= lt!50096 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!50093)) lt!50111))))

(assert (=> b!34099 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!50093)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!50111)))

(declare-fun lt!50083 () Unit!2515)

(assert (=> b!34099 (= lt!50083 lt!50096)))

(declare-fun lt!50078 () tuple2!3436)

(assert (=> b!34099 (= lt!50078 call!421)))

(declare-fun lt!50084 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50084 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!50108 () Unit!2515)

(assert (=> b!34099 (= lt!50108 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!50109) (buf!1158 (_2!1804 lt!50093)) lt!50084))))

(assert (=> b!34099 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!50093)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!50109))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!50109))) lt!50084)))

(declare-fun lt!50070 () Unit!2515)

(assert (=> b!34099 (= lt!50070 lt!50108)))

(declare-fun lt!50074 () List!427)

(assert (=> b!34099 (= lt!50074 (byteArrayBitContentToList!0 (_2!1804 lt!50093) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50095 () List!427)

(assert (=> b!34099 (= lt!50095 (byteArrayBitContentToList!0 (_2!1804 lt!50093) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50113 () List!427)

(assert (=> b!34099 (= lt!50113 (bitStreamReadBitsIntoList!0 (_2!1804 lt!50093) (_1!1805 lt!50076) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!50091 () List!427)

(assert (=> b!34099 (= lt!50091 (bitStreamReadBitsIntoList!0 (_2!1804 lt!50093) (_1!1805 lt!50078) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!50088 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50088 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!50105 () Unit!2515)

(assert (=> b!34099 (= lt!50105 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1804 lt!50093) (_2!1804 lt!50093) (_1!1805 lt!50076) (_1!1805 lt!50078) lt!50088 lt!50113))))

(assert (=> b!34099 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!50093) (_1!1805 lt!50078) (bvsub lt!50088 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!144 lt!50113))))

(declare-fun lt!50071 () Unit!2515)

(assert (=> b!34099 (= lt!50071 lt!50105)))

(declare-fun lt!50110 () Unit!2515)

(declare-fun lt!50085 () (_ BitVec 64))

(assert (=> b!34099 (= lt!50110 (arrayBitRangesEqImpliesEq!0 (buf!1158 (_2!1804 lt!50109)) (buf!1158 (_2!1804 lt!50093)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!50085 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50109))) (currentByte!2525 (_2!1804 lt!50109)) (currentBit!2520 (_2!1804 lt!50109)))))))

(assert (=> b!34099 (= (bitAt!0 (buf!1158 (_2!1804 lt!50109)) lt!50085) (bitAt!0 (buf!1158 (_2!1804 lt!50093)) lt!50085))))

(declare-fun lt!50089 () Unit!2515)

(assert (=> b!34099 (= lt!50089 lt!50110)))

(declare-fun b!34100 () Bool)

(declare-fun res!29214 () Bool)

(declare-fun e!22631 () Bool)

(assert (=> b!34100 (=> (not res!29214) (not e!22631))))

(declare-fun lt!50075 () tuple2!3434)

(assert (=> b!34100 (= res!29214 (= (size!830 (buf!1158 (_2!1804 lt!49569))) (size!830 (buf!1158 (_2!1804 lt!50075)))))))

(declare-fun b!34101 () Bool)

(declare-fun res!29212 () Bool)

(assert (=> b!34101 (=> (not res!29212) (not e!22631))))

(assert (=> b!34101 (= res!29212 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!50075)))))

(declare-fun d!9630 () Bool)

(assert (=> d!9630 e!22631))

(declare-fun res!29213 () Bool)

(assert (=> d!9630 (=> (not res!29213) (not e!22631))))

(declare-fun lt!50072 () (_ BitVec 64))

(assert (=> d!9630 (= res!29213 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50075))) (currentByte!2525 (_2!1804 lt!50075)) (currentBit!2520 (_2!1804 lt!50075))) (bvsub lt!50072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9630 (or (= (bvand lt!50072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50092 () (_ BitVec 64))

(assert (=> d!9630 (= lt!50072 (bvadd lt!50092 to!314))))

(assert (=> d!9630 (or (not (= (bvand lt!50092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50092 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9630 (= lt!50092 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> d!9630 (= lt!50075 e!22632)))

(assert (=> d!9630 (= c!2257 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!50077 () Unit!2515)

(declare-fun lt!50104 () Unit!2515)

(assert (=> d!9630 (= lt!50077 lt!50104)))

(assert (=> d!9630 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49569))))

(assert (=> d!9630 (= lt!50104 (lemmaIsPrefixRefl!0 (_2!1804 lt!49569)))))

(assert (=> d!9630 (= lt!50085 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> d!9630 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9630 (= (appendBitsMSBFirstLoop!0 (_2!1804 lt!49569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!50075)))

(declare-fun b!34102 () Bool)

(declare-fun lt!50103 () tuple2!3436)

(assert (=> b!34102 (= e!22631 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!50075) (_1!1805 lt!50103) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1804 lt!50075) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!34102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!50100 () Unit!2515)

(declare-fun lt!50098 () Unit!2515)

(assert (=> b!34102 (= lt!50100 lt!50098)))

(declare-fun lt!50094 () (_ BitVec 64))

(assert (=> b!34102 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!50075)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!50094)))

(assert (=> b!34102 (= lt!50098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!50075)) lt!50094))))

(declare-fun e!22633 () Bool)

(assert (=> b!34102 e!22633))

(declare-fun res!29210 () Bool)

(assert (=> b!34102 (=> (not res!29210) (not e!22633))))

(assert (=> b!34102 (= res!29210 (and (= (size!830 (buf!1158 (_2!1804 lt!49569))) (size!830 (buf!1158 (_2!1804 lt!50075)))) (bvsge lt!50094 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34102 (= lt!50094 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!34102 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34102 (= lt!50103 (reader!0 (_2!1804 lt!49569) (_2!1804 lt!50075)))))

(declare-fun b!34103 () Bool)

(declare-fun res!29211 () Bool)

(assert (=> b!34103 (=> (not res!29211) (not e!22631))))

(assert (=> b!34103 (= res!29211 (invariant!0 (currentBit!2520 (_2!1804 lt!50075)) (currentByte!2525 (_2!1804 lt!50075)) (size!830 (buf!1158 (_2!1804 lt!50075)))))))

(declare-fun b!34104 () Bool)

(declare-fun Unit!2524 () Unit!2515)

(assert (=> b!34104 (= e!22632 (tuple2!3435 Unit!2524 (_2!1804 lt!49569)))))

(assert (=> b!34104 (= (size!830 (buf!1158 (_2!1804 lt!49569))) (size!830 (buf!1158 (_2!1804 lt!49569))))))

(declare-fun lt!50097 () Unit!2515)

(declare-fun Unit!2525 () Unit!2515)

(assert (=> b!34104 (= lt!50097 Unit!2525)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1452 array!1876 array!1876 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3442 0))(
  ( (tuple2!3443 (_1!1808 array!1876) (_2!1808 BitStream!1452)) )
))
(declare-fun readBits!0 (BitStream!1452 (_ BitVec 64)) tuple2!3442)

(assert (=> b!34104 (checkByteArrayBitContent!0 (_2!1804 lt!49569) srcBuffer!2 (_1!1808 (readBits!0 (_1!1805 call!421) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!34105 () Bool)

(declare-fun res!29215 () Bool)

(assert (=> b!34105 (=> (not res!29215) (not e!22631))))

(assert (=> b!34105 (= res!29215 (= (size!830 (buf!1158 (_2!1804 lt!50075))) (size!830 (buf!1158 (_2!1804 lt!49569)))))))

(declare-fun b!34106 () Bool)

(assert (=> b!34106 (= e!22633 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!50094))))

(assert (= (and d!9630 c!2257) b!34099))

(assert (= (and d!9630 (not c!2257)) b!34104))

(assert (= (or b!34099 b!34104) bm!418))

(assert (= (and d!9630 res!29213) b!34103))

(assert (= (and b!34103 res!29211) b!34100))

(assert (= (and b!34100 res!29214) b!34101))

(assert (= (and b!34101 res!29212) b!34105))

(assert (= (and b!34105 res!29215) b!34102))

(assert (= (and b!34102 res!29210) b!34106))

(declare-fun m!50661 () Bool)

(assert (=> b!34106 m!50661))

(declare-fun m!50663 () Bool)

(assert (=> b!34102 m!50663))

(declare-fun m!50665 () Bool)

(assert (=> b!34102 m!50665))

(declare-fun m!50667 () Bool)

(assert (=> b!34102 m!50667))

(declare-fun m!50669 () Bool)

(assert (=> b!34102 m!50669))

(declare-fun m!50671 () Bool)

(assert (=> b!34102 m!50671))

(declare-fun m!50673 () Bool)

(assert (=> b!34101 m!50673))

(declare-fun m!50675 () Bool)

(assert (=> b!34103 m!50675))

(declare-fun m!50677 () Bool)

(assert (=> bm!418 m!50677))

(declare-fun m!50679 () Bool)

(assert (=> b!34104 m!50679))

(declare-fun m!50681 () Bool)

(assert (=> b!34104 m!50681))

(declare-fun m!50683 () Bool)

(assert (=> d!9630 m!50683))

(assert (=> d!9630 m!50223))

(declare-fun m!50685 () Bool)

(assert (=> d!9630 m!50685))

(declare-fun m!50687 () Bool)

(assert (=> d!9630 m!50687))

(declare-fun m!50689 () Bool)

(assert (=> b!34099 m!50689))

(declare-fun m!50691 () Bool)

(assert (=> b!34099 m!50691))

(declare-fun m!50693 () Bool)

(assert (=> b!34099 m!50693))

(declare-fun m!50695 () Bool)

(assert (=> b!34099 m!50695))

(declare-fun m!50697 () Bool)

(assert (=> b!34099 m!50697))

(declare-fun m!50699 () Bool)

(assert (=> b!34099 m!50699))

(declare-fun m!50701 () Bool)

(assert (=> b!34099 m!50701))

(declare-fun m!50703 () Bool)

(assert (=> b!34099 m!50703))

(declare-fun m!50705 () Bool)

(assert (=> b!34099 m!50705))

(assert (=> b!34099 m!50701))

(declare-fun m!50707 () Bool)

(assert (=> b!34099 m!50707))

(declare-fun m!50709 () Bool)

(assert (=> b!34099 m!50709))

(declare-fun m!50711 () Bool)

(assert (=> b!34099 m!50711))

(declare-fun m!50713 () Bool)

(assert (=> b!34099 m!50713))

(declare-fun m!50715 () Bool)

(assert (=> b!34099 m!50715))

(declare-fun m!50717 () Bool)

(assert (=> b!34099 m!50717))

(declare-fun m!50719 () Bool)

(assert (=> b!34099 m!50719))

(declare-fun m!50721 () Bool)

(assert (=> b!34099 m!50721))

(declare-fun m!50723 () Bool)

(assert (=> b!34099 m!50723))

(declare-fun m!50725 () Bool)

(assert (=> b!34099 m!50725))

(declare-fun m!50727 () Bool)

(assert (=> b!34099 m!50727))

(declare-fun m!50729 () Bool)

(assert (=> b!34099 m!50729))

(declare-fun m!50731 () Bool)

(assert (=> b!34099 m!50731))

(assert (=> b!34099 m!50713))

(declare-fun m!50733 () Bool)

(assert (=> b!34099 m!50733))

(declare-fun m!50735 () Bool)

(assert (=> b!34099 m!50735))

(declare-fun m!50737 () Bool)

(assert (=> b!34099 m!50737))

(assert (=> b!34099 m!50721))

(declare-fun m!50739 () Bool)

(assert (=> b!34099 m!50739))

(assert (=> b!34099 m!50223))

(assert (=> b!34099 m!50735))

(declare-fun m!50741 () Bool)

(assert (=> b!34099 m!50741))

(declare-fun m!50743 () Bool)

(assert (=> b!34099 m!50743))

(declare-fun m!50745 () Bool)

(assert (=> b!34099 m!50745))

(declare-fun m!50747 () Bool)

(assert (=> b!34099 m!50747))

(declare-fun m!50749 () Bool)

(assert (=> b!34099 m!50749))

(assert (=> b!33841 d!9630))

(declare-fun b!34117 () Bool)

(declare-fun res!29223 () Bool)

(declare-fun e!22639 () Bool)

(assert (=> b!34117 (=> (not res!29223) (not e!22639))))

(declare-fun lt!50154 () tuple2!3436)

(assert (=> b!34117 (= res!29223 (isPrefixOf!0 (_1!1805 lt!50154) thiss!1379))))

(declare-fun b!34118 () Bool)

(declare-fun res!29222 () Bool)

(assert (=> b!34118 (=> (not res!29222) (not e!22639))))

(assert (=> b!34118 (= res!29222 (isPrefixOf!0 (_2!1805 lt!50154) (_2!1804 lt!49569)))))

(declare-fun b!34119 () Bool)

(declare-fun e!22638 () Unit!2515)

(declare-fun lt!50170 () Unit!2515)

(assert (=> b!34119 (= e!22638 lt!50170)))

(declare-fun lt!50172 () (_ BitVec 64))

(assert (=> b!34119 (= lt!50172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50169 () (_ BitVec 64))

(assert (=> b!34119 (= lt!50169 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1876 array!1876 (_ BitVec 64) (_ BitVec 64)) Unit!2515)

(assert (=> b!34119 (= lt!50170 (arrayBitRangesEqSymmetric!0 (buf!1158 thiss!1379) (buf!1158 (_2!1804 lt!49569)) lt!50172 lt!50169))))

(assert (=> b!34119 (arrayBitRangesEq!0 (buf!1158 (_2!1804 lt!49569)) (buf!1158 thiss!1379) lt!50172 lt!50169)))

(declare-fun b!34120 () Bool)

(declare-fun lt!50159 () (_ BitVec 64))

(declare-fun lt!50157 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1452 (_ BitVec 64)) BitStream!1452)

(assert (=> b!34120 (= e!22639 (= (_1!1805 lt!50154) (withMovedBitIndex!0 (_2!1805 lt!50154) (bvsub lt!50157 lt!50159))))))

(assert (=> b!34120 (or (= (bvand lt!50157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50157 lt!50159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34120 (= lt!50159 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> b!34120 (= lt!50157 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(declare-fun d!9744 () Bool)

(assert (=> d!9744 e!22639))

(declare-fun res!29224 () Bool)

(assert (=> d!9744 (=> (not res!29224) (not e!22639))))

(assert (=> d!9744 (= res!29224 (isPrefixOf!0 (_1!1805 lt!50154) (_2!1805 lt!50154)))))

(declare-fun lt!50156 () BitStream!1452)

(assert (=> d!9744 (= lt!50154 (tuple2!3437 lt!50156 (_2!1804 lt!49569)))))

(declare-fun lt!50166 () Unit!2515)

(declare-fun lt!50158 () Unit!2515)

(assert (=> d!9744 (= lt!50166 lt!50158)))

(assert (=> d!9744 (isPrefixOf!0 lt!50156 (_2!1804 lt!49569))))

(assert (=> d!9744 (= lt!50158 (lemmaIsPrefixTransitive!0 lt!50156 (_2!1804 lt!49569) (_2!1804 lt!49569)))))

(declare-fun lt!50167 () Unit!2515)

(declare-fun lt!50171 () Unit!2515)

(assert (=> d!9744 (= lt!50167 lt!50171)))

(assert (=> d!9744 (isPrefixOf!0 lt!50156 (_2!1804 lt!49569))))

(assert (=> d!9744 (= lt!50171 (lemmaIsPrefixTransitive!0 lt!50156 thiss!1379 (_2!1804 lt!49569)))))

(declare-fun lt!50155 () Unit!2515)

(assert (=> d!9744 (= lt!50155 e!22638)))

(declare-fun c!2260 () Bool)

(assert (=> d!9744 (= c!2260 (not (= (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50162 () Unit!2515)

(declare-fun lt!50160 () Unit!2515)

(assert (=> d!9744 (= lt!50162 lt!50160)))

(assert (=> d!9744 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49569))))

(assert (=> d!9744 (= lt!50160 (lemmaIsPrefixRefl!0 (_2!1804 lt!49569)))))

(declare-fun lt!50168 () Unit!2515)

(declare-fun lt!50165 () Unit!2515)

(assert (=> d!9744 (= lt!50168 lt!50165)))

(assert (=> d!9744 (= lt!50165 (lemmaIsPrefixRefl!0 (_2!1804 lt!49569)))))

(declare-fun lt!50164 () Unit!2515)

(declare-fun lt!50173 () Unit!2515)

(assert (=> d!9744 (= lt!50164 lt!50173)))

(assert (=> d!9744 (isPrefixOf!0 lt!50156 lt!50156)))

(assert (=> d!9744 (= lt!50173 (lemmaIsPrefixRefl!0 lt!50156))))

(declare-fun lt!50163 () Unit!2515)

(declare-fun lt!50161 () Unit!2515)

(assert (=> d!9744 (= lt!50163 lt!50161)))

(assert (=> d!9744 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9744 (= lt!50161 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9744 (= lt!50156 (BitStream!1453 (buf!1158 (_2!1804 lt!49569)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(assert (=> d!9744 (isPrefixOf!0 thiss!1379 (_2!1804 lt!49569))))

(assert (=> d!9744 (= (reader!0 thiss!1379 (_2!1804 lt!49569)) lt!50154)))

(declare-fun b!34121 () Bool)

(declare-fun Unit!2526 () Unit!2515)

(assert (=> b!34121 (= e!22638 Unit!2526)))

(assert (= (and d!9744 c!2260) b!34119))

(assert (= (and d!9744 (not c!2260)) b!34121))

(assert (= (and d!9744 res!29224) b!34117))

(assert (= (and b!34117 res!29223) b!34118))

(assert (= (and b!34118 res!29222) b!34120))

(declare-fun m!50751 () Bool)

(assert (=> b!34118 m!50751))

(declare-fun m!50753 () Bool)

(assert (=> d!9744 m!50753))

(assert (=> d!9744 m!50249))

(declare-fun m!50755 () Bool)

(assert (=> d!9744 m!50755))

(declare-fun m!50757 () Bool)

(assert (=> d!9744 m!50757))

(assert (=> d!9744 m!50687))

(declare-fun m!50759 () Bool)

(assert (=> d!9744 m!50759))

(assert (=> d!9744 m!50259))

(assert (=> d!9744 m!50261))

(declare-fun m!50761 () Bool)

(assert (=> d!9744 m!50761))

(declare-fun m!50763 () Bool)

(assert (=> d!9744 m!50763))

(assert (=> d!9744 m!50685))

(assert (=> b!34119 m!50263))

(declare-fun m!50765 () Bool)

(assert (=> b!34119 m!50765))

(declare-fun m!50767 () Bool)

(assert (=> b!34119 m!50767))

(declare-fun m!50769 () Bool)

(assert (=> b!34120 m!50769))

(assert (=> b!34120 m!50223))

(assert (=> b!34120 m!50263))

(declare-fun m!50771 () Bool)

(assert (=> b!34117 m!50771))

(assert (=> b!33841 d!9744))

(declare-fun d!9746 () Bool)

(declare-fun res!29226 () Bool)

(declare-fun e!22640 () Bool)

(assert (=> d!9746 (=> (not res!29226) (not e!22640))))

(assert (=> d!9746 (= res!29226 (= (size!830 (buf!1158 thiss!1379)) (size!830 (buf!1158 (_2!1804 lt!49569)))))))

(assert (=> d!9746 (= (isPrefixOf!0 thiss!1379 (_2!1804 lt!49569)) e!22640)))

(declare-fun b!34122 () Bool)

(declare-fun res!29225 () Bool)

(assert (=> b!34122 (=> (not res!29225) (not e!22640))))

(assert (=> b!34122 (= res!29225 (bvsle (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)) (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569)))))))

(declare-fun b!34123 () Bool)

(declare-fun e!22641 () Bool)

(assert (=> b!34123 (= e!22640 e!22641)))

(declare-fun res!29227 () Bool)

(assert (=> b!34123 (=> res!29227 e!22641)))

(assert (=> b!34123 (= res!29227 (= (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34124 () Bool)

(assert (=> b!34124 (= e!22641 (arrayBitRangesEq!0 (buf!1158 thiss!1379) (buf!1158 (_2!1804 lt!49569)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(assert (= (and d!9746 res!29226) b!34122))

(assert (= (and b!34122 res!29225) b!34123))

(assert (= (and b!34123 (not res!29227)) b!34124))

(assert (=> b!34122 m!50263))

(assert (=> b!34122 m!50223))

(assert (=> b!34124 m!50263))

(assert (=> b!34124 m!50263))

(declare-fun m!50773 () Bool)

(assert (=> b!34124 m!50773))

(assert (=> b!33828 d!9746))

(declare-fun d!9748 () Bool)

(assert (=> d!9748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!49579) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569)))) lt!49579))))

(declare-fun bs!2669 () Bool)

(assert (= bs!2669 d!9748))

(assert (=> bs!2669 m!50397))

(assert (=> b!33828 d!9748))

(declare-fun d!9750 () Bool)

(declare-fun e!22644 () Bool)

(assert (=> d!9750 e!22644))

(declare-fun res!29230 () Bool)

(assert (=> d!9750 (=> (not res!29230) (not e!22644))))

(assert (=> d!9750 (= res!29230 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!50176 () Unit!2515)

(declare-fun choose!27 (BitStream!1452 BitStream!1452 (_ BitVec 64) (_ BitVec 64)) Unit!2515)

(assert (=> d!9750 (= lt!50176 (choose!27 thiss!1379 (_2!1804 lt!49569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9750 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9750 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1804 lt!49569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50176)))

(declare-fun b!34127 () Bool)

(assert (=> b!34127 (= e!22644 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49569)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9750 res!29230) b!34127))

(declare-fun m!50775 () Bool)

(assert (=> d!9750 m!50775))

(declare-fun m!50777 () Bool)

(assert (=> b!34127 m!50777))

(assert (=> b!33828 d!9750))

(declare-fun b!34146 () Bool)

(declare-fun res!29254 () Bool)

(declare-fun e!22653 () Bool)

(assert (=> b!34146 (=> (not res!29254) (not e!22653))))

(declare-fun lt!50204 () tuple2!3434)

(assert (=> b!34146 (= res!29254 (isPrefixOf!0 thiss!1379 (_2!1804 lt!50204)))))

(declare-fun b!34147 () Bool)

(declare-fun e!22655 () Bool)

(declare-datatypes ((tuple2!3444 0))(
  ( (tuple2!3445 (_1!1809 BitStream!1452) (_2!1809 Bool)) )
))
(declare-fun lt!50203 () tuple2!3444)

(assert (=> b!34147 (= e!22655 (= (bitIndex!0 (size!830 (buf!1158 (_1!1809 lt!50203))) (currentByte!2525 (_1!1809 lt!50203)) (currentBit!2520 (_1!1809 lt!50203))) (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50204))) (currentByte!2525 (_2!1804 lt!50204)) (currentBit!2520 (_2!1804 lt!50204)))))))

(declare-fun b!34148 () Bool)

(declare-fun e!22656 () Bool)

(declare-fun e!22654 () Bool)

(assert (=> b!34148 (= e!22656 e!22654)))

(declare-fun res!29250 () Bool)

(assert (=> b!34148 (=> (not res!29250) (not e!22654))))

(declare-fun lt!50201 () tuple2!3434)

(declare-fun lt!50207 () tuple2!3444)

(declare-fun lt!50202 () Bool)

(assert (=> b!34148 (= res!29250 (and (= (_2!1809 lt!50207) lt!50202) (= (_1!1809 lt!50207) (_2!1804 lt!50201))))))

(declare-fun readBitPure!0 (BitStream!1452) tuple2!3444)

(declare-fun readerFrom!0 (BitStream!1452 (_ BitVec 32) (_ BitVec 32)) BitStream!1452)

(assert (=> b!34148 (= lt!50207 (readBitPure!0 (readerFrom!0 (_2!1804 lt!50201) (currentBit!2520 thiss!1379) (currentByte!2525 thiss!1379))))))

(declare-fun b!34149 () Bool)

(declare-fun res!29248 () Bool)

(assert (=> b!34149 (=> (not res!29248) (not e!22656))))

(assert (=> b!34149 (= res!29248 (isPrefixOf!0 thiss!1379 (_2!1804 lt!50201)))))

(declare-fun b!34150 () Bool)

(declare-fun res!29251 () Bool)

(assert (=> b!34150 (=> (not res!29251) (not e!22656))))

(assert (=> b!34150 (= res!29251 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50201))) (currentByte!2525 (_2!1804 lt!50201)) (currentBit!2520 (_2!1804 lt!50201))) (bvadd (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!34151 () Bool)

(assert (=> b!34151 (= e!22654 (= (bitIndex!0 (size!830 (buf!1158 (_1!1809 lt!50207))) (currentByte!2525 (_1!1809 lt!50207)) (currentBit!2520 (_1!1809 lt!50207))) (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50201))) (currentByte!2525 (_2!1804 lt!50201)) (currentBit!2520 (_2!1804 lt!50201)))))))

(declare-fun b!34152 () Bool)

(declare-fun res!29253 () Bool)

(assert (=> b!34152 (=> (not res!29253) (not e!22653))))

(declare-fun lt!50211 () (_ BitVec 64))

(declare-fun lt!50210 () (_ BitVec 64))

(assert (=> b!34152 (= res!29253 (= (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!50204))) (currentByte!2525 (_2!1804 lt!50204)) (currentBit!2520 (_2!1804 lt!50204))) (bvadd lt!50210 lt!50211)))))

(assert (=> b!34152 (or (not (= (bvand lt!50210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50211 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!50210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!50210 lt!50211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34152 (= lt!50211 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!34152 (= lt!50210 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(declare-fun d!9752 () Bool)

(assert (=> d!9752 e!22653))

(declare-fun res!29252 () Bool)

(assert (=> d!9752 (=> (not res!29252) (not e!22653))))

(assert (=> d!9752 (= res!29252 (= (size!830 (buf!1158 (_2!1804 lt!50204))) (size!830 (buf!1158 thiss!1379))))))

(declare-fun lt!50212 () (_ BitVec 8))

(declare-fun lt!50208 () array!1876)

(assert (=> d!9752 (= lt!50212 (select (arr!1305 lt!50208) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9752 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!830 lt!50208)))))

(assert (=> d!9752 (= lt!50208 (array!1877 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!50206 () tuple2!3434)

(assert (=> d!9752 (= lt!50204 (tuple2!3435 (_1!1804 lt!50206) (_2!1804 lt!50206)))))

(assert (=> d!9752 (= lt!50206 lt!50201)))

(assert (=> d!9752 e!22656))

(declare-fun res!29247 () Bool)

(assert (=> d!9752 (=> (not res!29247) (not e!22656))))

(assert (=> d!9752 (= res!29247 (= (size!830 (buf!1158 thiss!1379)) (size!830 (buf!1158 (_2!1804 lt!50201)))))))

(declare-fun appendBit!0 (BitStream!1452 Bool) tuple2!3434)

(assert (=> d!9752 (= lt!50201 (appendBit!0 thiss!1379 lt!50202))))

(assert (=> d!9752 (= lt!50202 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9752 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9752 (= (appendBitFromByte!0 thiss!1379 (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!50204)))

(declare-fun b!34145 () Bool)

(assert (=> b!34145 (= e!22653 e!22655)))

(declare-fun res!29249 () Bool)

(assert (=> b!34145 (=> (not res!29249) (not e!22655))))

(assert (=> b!34145 (= res!29249 (and (= (_2!1809 lt!50203) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!50212)) #b00000000000000000000000000000000))) (= (_1!1809 lt!50203) (_2!1804 lt!50204))))))

(declare-fun lt!50205 () tuple2!3442)

(declare-fun lt!50209 () BitStream!1452)

(assert (=> b!34145 (= lt!50205 (readBits!0 lt!50209 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!34145 (= lt!50203 (readBitPure!0 lt!50209))))

(assert (=> b!34145 (= lt!50209 (readerFrom!0 (_2!1804 lt!50204) (currentBit!2520 thiss!1379) (currentByte!2525 thiss!1379)))))

(assert (= (and d!9752 res!29247) b!34150))

(assert (= (and b!34150 res!29251) b!34149))

(assert (= (and b!34149 res!29248) b!34148))

(assert (= (and b!34148 res!29250) b!34151))

(assert (= (and d!9752 res!29252) b!34152))

(assert (= (and b!34152 res!29253) b!34146))

(assert (= (and b!34146 res!29254) b!34145))

(assert (= (and b!34145 res!29249) b!34147))

(declare-fun m!50779 () Bool)

(assert (=> b!34152 m!50779))

(assert (=> b!34152 m!50263))

(declare-fun m!50781 () Bool)

(assert (=> d!9752 m!50781))

(declare-fun m!50783 () Bool)

(assert (=> d!9752 m!50783))

(declare-fun m!50785 () Bool)

(assert (=> d!9752 m!50785))

(declare-fun m!50787 () Bool)

(assert (=> b!34150 m!50787))

(assert (=> b!34150 m!50263))

(declare-fun m!50789 () Bool)

(assert (=> b!34145 m!50789))

(declare-fun m!50791 () Bool)

(assert (=> b!34145 m!50791))

(declare-fun m!50793 () Bool)

(assert (=> b!34145 m!50793))

(declare-fun m!50795 () Bool)

(assert (=> b!34147 m!50795))

(assert (=> b!34147 m!50779))

(declare-fun m!50797 () Bool)

(assert (=> b!34148 m!50797))

(assert (=> b!34148 m!50797))

(declare-fun m!50799 () Bool)

(assert (=> b!34148 m!50799))

(declare-fun m!50801 () Bool)

(assert (=> b!34146 m!50801))

(declare-fun m!50803 () Bool)

(assert (=> b!34151 m!50803))

(assert (=> b!34151 m!50787))

(declare-fun m!50805 () Bool)

(assert (=> b!34149 m!50805))

(assert (=> b!33828 d!9752))

(declare-fun d!9754 () Bool)

(assert (=> d!9754 (= (head!264 (byteArrayBitContentToList!0 (_2!1804 lt!49588) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!542 (byteArrayBitContentToList!0 (_2!1804 lt!49588) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!33839 d!9754))

(declare-fun d!9756 () Bool)

(declare-fun c!2263 () Bool)

(assert (=> d!9756 (= c!2263 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22659 () List!427)

(assert (=> d!9756 (= (byteArrayBitContentToList!0 (_2!1804 lt!49588) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!22659)))

(declare-fun b!34157 () Bool)

(assert (=> b!34157 (= e!22659 Nil!424)))

(declare-fun b!34158 () Bool)

(assert (=> b!34158 (= e!22659 (Cons!423 (not (= (bvand ((_ sign_extend 24) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1804 lt!49588) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9756 c!2263) b!34157))

(assert (= (and d!9756 (not c!2263)) b!34158))

(assert (=> b!34158 m!50251))

(assert (=> b!34158 m!50785))

(declare-fun m!50807 () Bool)

(assert (=> b!34158 m!50807))

(assert (=> b!33839 d!9756))

(declare-fun d!9758 () Bool)

(assert (=> d!9758 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2670 () Bool)

(assert (= bs!2670 d!9758))

(assert (=> bs!2670 m!50251))

(assert (=> bs!2670 m!50785))

(assert (=> b!33839 d!9758))

(declare-fun d!9760 () Bool)

(assert (=> d!9760 (= (head!264 (byteArrayBitContentToList!0 (_2!1804 lt!49569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!542 (byteArrayBitContentToList!0 (_2!1804 lt!49569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33829 d!9760))

(declare-fun d!9762 () Bool)

(declare-fun c!2264 () Bool)

(assert (=> d!9762 (= c!2264 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22660 () List!427)

(assert (=> d!9762 (= (byteArrayBitContentToList!0 (_2!1804 lt!49569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!22660)))

(declare-fun b!34159 () Bool)

(assert (=> b!34159 (= e!22660 Nil!424)))

(declare-fun b!34160 () Bool)

(assert (=> b!34160 (= e!22660 (Cons!423 (not (= (bvand ((_ sign_extend 24) (select (arr!1305 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1804 lt!49569) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9762 c!2264) b!34159))

(assert (= (and d!9762 (not c!2264)) b!34160))

(assert (=> b!34160 m!50251))

(assert (=> b!34160 m!50785))

(declare-fun m!50809 () Bool)

(assert (=> b!34160 m!50809))

(assert (=> b!33829 d!9762))

(declare-fun d!9764 () Bool)

(assert (=> d!9764 (= (head!264 (bitStreamReadBitsIntoList!0 (_2!1804 lt!49569) (_1!1805 lt!49578) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!542 (bitStreamReadBitsIntoList!0 (_2!1804 lt!49569) (_1!1805 lt!49578) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!33829 d!9764))

(declare-fun b!34172 () Bool)

(declare-fun e!22666 () Bool)

(declare-fun lt!50219 () List!427)

(assert (=> b!34172 (= e!22666 (> (length!153 lt!50219) 0))))

(declare-datatypes ((tuple2!3446 0))(
  ( (tuple2!3447 (_1!1810 List!427) (_2!1810 BitStream!1452)) )
))
(declare-fun e!22665 () tuple2!3446)

(declare-fun lt!50220 () (_ BitVec 64))

(declare-datatypes ((tuple2!3448 0))(
  ( (tuple2!3449 (_1!1811 Bool) (_2!1811 BitStream!1452)) )
))
(declare-fun lt!50221 () tuple2!3448)

(declare-fun b!34170 () Bool)

(assert (=> b!34170 (= e!22665 (tuple2!3447 (Cons!423 (_1!1811 lt!50221) (bitStreamReadBitsIntoList!0 (_2!1804 lt!49569) (_2!1811 lt!50221) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!50220))) (_2!1811 lt!50221)))))

(declare-fun readBit!0 (BitStream!1452) tuple2!3448)

(assert (=> b!34170 (= lt!50221 (readBit!0 (_1!1805 lt!49578)))))

(assert (=> b!34170 (= lt!50220 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34171 () Bool)

(declare-fun isEmpty!90 (List!427) Bool)

(assert (=> b!34171 (= e!22666 (isEmpty!90 lt!50219))))

(declare-fun d!9766 () Bool)

(assert (=> d!9766 e!22666))

(declare-fun c!2270 () Bool)

(assert (=> d!9766 (= c!2270 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9766 (= lt!50219 (_1!1810 e!22665))))

(declare-fun c!2269 () Bool)

(assert (=> d!9766 (= c!2269 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9766 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9766 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!49569) (_1!1805 lt!49578) #b0000000000000000000000000000000000000000000000000000000000000001) lt!50219)))

(declare-fun b!34169 () Bool)

(assert (=> b!34169 (= e!22665 (tuple2!3447 Nil!424 (_1!1805 lt!49578)))))

(assert (= (and d!9766 c!2269) b!34169))

(assert (= (and d!9766 (not c!2269)) b!34170))

(assert (= (and d!9766 c!2270) b!34171))

(assert (= (and d!9766 (not c!2270)) b!34172))

(declare-fun m!50811 () Bool)

(assert (=> b!34172 m!50811))

(declare-fun m!50813 () Bool)

(assert (=> b!34170 m!50813))

(declare-fun m!50815 () Bool)

(assert (=> b!34170 m!50815))

(declare-fun m!50817 () Bool)

(assert (=> b!34171 m!50817))

(assert (=> b!33829 d!9766))

(declare-fun d!9768 () Bool)

(assert (=> d!9768 (= (bitAt!0 (buf!1158 (_1!1805 lt!49584)) lt!49587) (not (= (bvand ((_ sign_extend 24) (select (arr!1305 (buf!1158 (_1!1805 lt!49584))) ((_ extract 31 0) (bvsdiv lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2671 () Bool)

(assert (= bs!2671 d!9768))

(declare-fun m!50819 () Bool)

(assert (=> bs!2671 m!50819))

(assert (=> bs!2671 m!50401))

(assert (=> b!33827 d!9768))

(declare-fun d!9770 () Bool)

(assert (=> d!9770 (= (bitAt!0 (buf!1158 (_1!1805 lt!49581)) lt!49587) (not (= (bvand ((_ sign_extend 24) (select (arr!1305 (buf!1158 (_1!1805 lt!49581))) ((_ extract 31 0) (bvsdiv lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!49587 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2672 () Bool)

(assert (= bs!2672 d!9770))

(declare-fun m!50821 () Bool)

(assert (=> bs!2672 m!50821))

(assert (=> bs!2672 m!50401))

(assert (=> b!33827 d!9770))

(declare-fun d!9772 () Bool)

(declare-fun res!29256 () Bool)

(declare-fun e!22667 () Bool)

(assert (=> d!9772 (=> (not res!29256) (not e!22667))))

(assert (=> d!9772 (= res!29256 (= (size!830 (buf!1158 thiss!1379)) (size!830 (buf!1158 thiss!1379))))))

(assert (=> d!9772 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!22667)))

(declare-fun b!34173 () Bool)

(declare-fun res!29255 () Bool)

(assert (=> b!34173 (=> (not res!29255) (not e!22667))))

(assert (=> b!34173 (= res!29255 (bvsle (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)) (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(declare-fun b!34174 () Bool)

(declare-fun e!22668 () Bool)

(assert (=> b!34174 (= e!22667 e!22668)))

(declare-fun res!29257 () Bool)

(assert (=> b!34174 (=> res!29257 e!22668)))

(assert (=> b!34174 (= res!29257 (= (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!34175 () Bool)

(assert (=> b!34175 (= e!22668 (arrayBitRangesEq!0 (buf!1158 thiss!1379) (buf!1158 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(assert (= (and d!9772 res!29256) b!34173))

(assert (= (and b!34173 res!29255) b!34174))

(assert (= (and b!34174 (not res!29257)) b!34175))

(assert (=> b!34173 m!50263))

(assert (=> b!34173 m!50263))

(assert (=> b!34175 m!50263))

(assert (=> b!34175 m!50263))

(declare-fun m!50823 () Bool)

(assert (=> b!34175 m!50823))

(assert (=> b!33838 d!9772))

(declare-fun d!9774 () Bool)

(assert (=> d!9774 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!50224 () Unit!2515)

(declare-fun choose!11 (BitStream!1452) Unit!2515)

(assert (=> d!9774 (= lt!50224 (choose!11 thiss!1379))))

(assert (=> d!9774 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!50224)))

(declare-fun bs!2674 () Bool)

(assert (= bs!2674 d!9774))

(assert (=> bs!2674 m!50259))

(declare-fun m!50825 () Bool)

(assert (=> bs!2674 m!50825))

(assert (=> b!33838 d!9774))

(declare-fun d!9776 () Bool)

(declare-fun e!22669 () Bool)

(assert (=> d!9776 e!22669))

(declare-fun res!29258 () Bool)

(assert (=> d!9776 (=> (not res!29258) (not e!22669))))

(declare-fun lt!50228 () (_ BitVec 64))

(declare-fun lt!50229 () (_ BitVec 64))

(declare-fun lt!50230 () (_ BitVec 64))

(assert (=> d!9776 (= res!29258 (= lt!50228 (bvsub lt!50230 lt!50229)))))

(assert (=> d!9776 (or (= (bvand lt!50230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50230 lt!50229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9776 (= lt!50229 (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379))))))

(declare-fun lt!50225 () (_ BitVec 64))

(declare-fun lt!50227 () (_ BitVec 64))

(assert (=> d!9776 (= lt!50230 (bvmul lt!50225 lt!50227))))

(assert (=> d!9776 (or (= lt!50225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!50227 (bvsdiv (bvmul lt!50225 lt!50227) lt!50225)))))

(assert (=> d!9776 (= lt!50227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9776 (= lt!50225 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))))))

(assert (=> d!9776 (= lt!50228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2525 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2520 thiss!1379))))))

(assert (=> d!9776 (invariant!0 (currentBit!2520 thiss!1379) (currentByte!2525 thiss!1379) (size!830 (buf!1158 thiss!1379)))))

(assert (=> d!9776 (= (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)) lt!50228)))

(declare-fun b!34176 () Bool)

(declare-fun res!29259 () Bool)

(assert (=> b!34176 (=> (not res!29259) (not e!22669))))

(assert (=> b!34176 (= res!29259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!50228))))

(declare-fun b!34177 () Bool)

(declare-fun lt!50226 () (_ BitVec 64))

(assert (=> b!34177 (= e!22669 (bvsle lt!50228 (bvmul lt!50226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!34177 (or (= lt!50226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!50226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!50226)))))

(assert (=> b!34177 (= lt!50226 ((_ sign_extend 32) (size!830 (buf!1158 thiss!1379))))))

(assert (= (and d!9776 res!29258) b!34176))

(assert (= (and b!34176 res!29259) b!34177))

(assert (=> d!9776 m!50405))

(assert (=> d!9776 m!50407))

(assert (=> b!33838 d!9776))

(declare-fun d!9778 () Bool)

(assert (=> d!9778 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!50231 () Unit!2515)

(assert (=> d!9778 (= lt!50231 (choose!9 thiss!1379 (buf!1158 (_2!1804 lt!49588)) (bvsub to!314 i!635) (BitStream!1453 (buf!1158 (_2!1804 lt!49588)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379))))))

(assert (=> d!9778 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1158 (_2!1804 lt!49588)) (bvsub to!314 i!635)) lt!50231)))

(declare-fun bs!2675 () Bool)

(assert (= bs!2675 d!9778))

(assert (=> bs!2675 m!50213))

(declare-fun m!50827 () Bool)

(assert (=> bs!2675 m!50827))

(assert (=> b!33836 d!9778))

(declare-fun b!34181 () Bool)

(declare-fun e!22671 () Bool)

(declare-fun lt!50232 () List!427)

(assert (=> b!34181 (= e!22671 (> (length!153 lt!50232) 0))))

(declare-fun lt!50233 () (_ BitVec 64))

(declare-fun e!22670 () tuple2!3446)

(declare-fun b!34179 () Bool)

(declare-fun lt!50234 () tuple2!3448)

(assert (=> b!34179 (= e!22670 (tuple2!3447 (Cons!423 (_1!1811 lt!50234) (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_2!1811 lt!50234) (bvsub lt!49579 lt!50233))) (_2!1811 lt!50234)))))

(assert (=> b!34179 (= lt!50234 (readBit!0 (_1!1805 lt!49584)))))

(assert (=> b!34179 (= lt!50233 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34180 () Bool)

(assert (=> b!34180 (= e!22671 (isEmpty!90 lt!50232))))

(declare-fun d!9780 () Bool)

(assert (=> d!9780 e!22671))

(declare-fun c!2272 () Bool)

(assert (=> d!9780 (= c!2272 (= lt!49579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9780 (= lt!50232 (_1!1810 e!22670))))

(declare-fun c!2271 () Bool)

(assert (=> d!9780 (= c!2271 (= lt!49579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9780 (bvsge lt!49579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9780 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_1!1805 lt!49584) lt!49579) lt!50232)))

(declare-fun b!34178 () Bool)

(assert (=> b!34178 (= e!22670 (tuple2!3447 Nil!424 (_1!1805 lt!49584)))))

(assert (= (and d!9780 c!2271) b!34178))

(assert (= (and d!9780 (not c!2271)) b!34179))

(assert (= (and d!9780 c!2272) b!34180))

(assert (= (and d!9780 (not c!2272)) b!34181))

(declare-fun m!50829 () Bool)

(assert (=> b!34181 m!50829))

(declare-fun m!50831 () Bool)

(assert (=> b!34179 m!50831))

(declare-fun m!50833 () Bool)

(assert (=> b!34179 m!50833))

(declare-fun m!50835 () Bool)

(assert (=> b!34180 m!50835))

(assert (=> b!33836 d!9780))

(declare-fun b!34182 () Bool)

(declare-fun res!29261 () Bool)

(declare-fun e!22673 () Bool)

(assert (=> b!34182 (=> (not res!29261) (not e!22673))))

(declare-fun lt!50235 () tuple2!3436)

(assert (=> b!34182 (= res!29261 (isPrefixOf!0 (_1!1805 lt!50235) thiss!1379))))

(declare-fun b!34183 () Bool)

(declare-fun res!29260 () Bool)

(assert (=> b!34183 (=> (not res!29260) (not e!22673))))

(assert (=> b!34183 (= res!29260 (isPrefixOf!0 (_2!1805 lt!50235) (_2!1804 lt!49588)))))

(declare-fun b!34184 () Bool)

(declare-fun e!22672 () Unit!2515)

(declare-fun lt!50251 () Unit!2515)

(assert (=> b!34184 (= e!22672 lt!50251)))

(declare-fun lt!50253 () (_ BitVec 64))

(assert (=> b!34184 (= lt!50253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50250 () (_ BitVec 64))

(assert (=> b!34184 (= lt!50250 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(assert (=> b!34184 (= lt!50251 (arrayBitRangesEqSymmetric!0 (buf!1158 thiss!1379) (buf!1158 (_2!1804 lt!49588)) lt!50253 lt!50250))))

(assert (=> b!34184 (arrayBitRangesEq!0 (buf!1158 (_2!1804 lt!49588)) (buf!1158 thiss!1379) lt!50253 lt!50250)))

(declare-fun lt!50238 () (_ BitVec 64))

(declare-fun b!34185 () Bool)

(declare-fun lt!50240 () (_ BitVec 64))

(assert (=> b!34185 (= e!22673 (= (_1!1805 lt!50235) (withMovedBitIndex!0 (_2!1805 lt!50235) (bvsub lt!50238 lt!50240))))))

(assert (=> b!34185 (or (= (bvand lt!50238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50238 lt!50240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34185 (= lt!50240 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588))))))

(assert (=> b!34185 (= lt!50238 (bitIndex!0 (size!830 (buf!1158 thiss!1379)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(declare-fun d!9782 () Bool)

(assert (=> d!9782 e!22673))

(declare-fun res!29262 () Bool)

(assert (=> d!9782 (=> (not res!29262) (not e!22673))))

(assert (=> d!9782 (= res!29262 (isPrefixOf!0 (_1!1805 lt!50235) (_2!1805 lt!50235)))))

(declare-fun lt!50237 () BitStream!1452)

(assert (=> d!9782 (= lt!50235 (tuple2!3437 lt!50237 (_2!1804 lt!49588)))))

(declare-fun lt!50247 () Unit!2515)

(declare-fun lt!50239 () Unit!2515)

(assert (=> d!9782 (= lt!50247 lt!50239)))

(assert (=> d!9782 (isPrefixOf!0 lt!50237 (_2!1804 lt!49588))))

(assert (=> d!9782 (= lt!50239 (lemmaIsPrefixTransitive!0 lt!50237 (_2!1804 lt!49588) (_2!1804 lt!49588)))))

(declare-fun lt!50248 () Unit!2515)

(declare-fun lt!50252 () Unit!2515)

(assert (=> d!9782 (= lt!50248 lt!50252)))

(assert (=> d!9782 (isPrefixOf!0 lt!50237 (_2!1804 lt!49588))))

(assert (=> d!9782 (= lt!50252 (lemmaIsPrefixTransitive!0 lt!50237 thiss!1379 (_2!1804 lt!49588)))))

(declare-fun lt!50236 () Unit!2515)

(assert (=> d!9782 (= lt!50236 e!22672)))

(declare-fun c!2273 () Bool)

(assert (=> d!9782 (= c!2273 (not (= (size!830 (buf!1158 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!50243 () Unit!2515)

(declare-fun lt!50241 () Unit!2515)

(assert (=> d!9782 (= lt!50243 lt!50241)))

(assert (=> d!9782 (isPrefixOf!0 (_2!1804 lt!49588) (_2!1804 lt!49588))))

(assert (=> d!9782 (= lt!50241 (lemmaIsPrefixRefl!0 (_2!1804 lt!49588)))))

(declare-fun lt!50249 () Unit!2515)

(declare-fun lt!50246 () Unit!2515)

(assert (=> d!9782 (= lt!50249 lt!50246)))

(assert (=> d!9782 (= lt!50246 (lemmaIsPrefixRefl!0 (_2!1804 lt!49588)))))

(declare-fun lt!50245 () Unit!2515)

(declare-fun lt!50254 () Unit!2515)

(assert (=> d!9782 (= lt!50245 lt!50254)))

(assert (=> d!9782 (isPrefixOf!0 lt!50237 lt!50237)))

(assert (=> d!9782 (= lt!50254 (lemmaIsPrefixRefl!0 lt!50237))))

(declare-fun lt!50244 () Unit!2515)

(declare-fun lt!50242 () Unit!2515)

(assert (=> d!9782 (= lt!50244 lt!50242)))

(assert (=> d!9782 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9782 (= lt!50242 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9782 (= lt!50237 (BitStream!1453 (buf!1158 (_2!1804 lt!49588)) (currentByte!2525 thiss!1379) (currentBit!2520 thiss!1379)))))

(assert (=> d!9782 (isPrefixOf!0 thiss!1379 (_2!1804 lt!49588))))

(assert (=> d!9782 (= (reader!0 thiss!1379 (_2!1804 lt!49588)) lt!50235)))

(declare-fun b!34186 () Bool)

(declare-fun Unit!2527 () Unit!2515)

(assert (=> b!34186 (= e!22672 Unit!2527)))

(assert (= (and d!9782 c!2273) b!34184))

(assert (= (and d!9782 (not c!2273)) b!34186))

(assert (= (and d!9782 res!29262) b!34182))

(assert (= (and b!34182 res!29261) b!34183))

(assert (= (and b!34183 res!29260) b!34185))

(declare-fun m!50837 () Bool)

(assert (=> b!34183 m!50837))

(declare-fun m!50839 () Bool)

(assert (=> d!9782 m!50839))

(assert (=> d!9782 m!50283))

(declare-fun m!50841 () Bool)

(assert (=> d!9782 m!50841))

(declare-fun m!50843 () Bool)

(assert (=> d!9782 m!50843))

(declare-fun m!50845 () Bool)

(assert (=> d!9782 m!50845))

(declare-fun m!50847 () Bool)

(assert (=> d!9782 m!50847))

(assert (=> d!9782 m!50259))

(assert (=> d!9782 m!50261))

(declare-fun m!50849 () Bool)

(assert (=> d!9782 m!50849))

(declare-fun m!50851 () Bool)

(assert (=> d!9782 m!50851))

(declare-fun m!50853 () Bool)

(assert (=> d!9782 m!50853))

(assert (=> b!34184 m!50263))

(declare-fun m!50855 () Bool)

(assert (=> b!34184 m!50855))

(declare-fun m!50857 () Bool)

(assert (=> b!34184 m!50857))

(declare-fun m!50859 () Bool)

(assert (=> b!34185 m!50859))

(assert (=> b!34185 m!50225))

(assert (=> b!34185 m!50263))

(declare-fun m!50861 () Bool)

(assert (=> b!34182 m!50861))

(assert (=> b!33836 d!9782))

(declare-fun b!34190 () Bool)

(declare-fun e!22675 () Bool)

(declare-fun lt!50255 () List!427)

(assert (=> b!34190 (= e!22675 (> (length!153 lt!50255) 0))))

(declare-fun lt!50256 () (_ BitVec 64))

(declare-fun b!34188 () Bool)

(declare-fun e!22674 () tuple2!3446)

(declare-fun lt!50257 () tuple2!3448)

(assert (=> b!34188 (= e!22674 (tuple2!3447 (Cons!423 (_1!1811 lt!50257) (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_2!1811 lt!50257) (bvsub (bvsub to!314 i!635) lt!50256))) (_2!1811 lt!50257)))))

(assert (=> b!34188 (= lt!50257 (readBit!0 (_1!1805 lt!49581)))))

(assert (=> b!34188 (= lt!50256 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!34189 () Bool)

(assert (=> b!34189 (= e!22675 (isEmpty!90 lt!50255))))

(declare-fun d!9784 () Bool)

(assert (=> d!9784 e!22675))

(declare-fun c!2275 () Bool)

(assert (=> d!9784 (= c!2275 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9784 (= lt!50255 (_1!1810 e!22674))))

(declare-fun c!2274 () Bool)

(assert (=> d!9784 (= c!2274 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9784 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9784 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_1!1805 lt!49581) (bvsub to!314 i!635)) lt!50255)))

(declare-fun b!34187 () Bool)

(assert (=> b!34187 (= e!22674 (tuple2!3447 Nil!424 (_1!1805 lt!49581)))))

(assert (= (and d!9784 c!2274) b!34187))

(assert (= (and d!9784 (not c!2274)) b!34188))

(assert (= (and d!9784 c!2275) b!34189))

(assert (= (and d!9784 (not c!2275)) b!34190))

(declare-fun m!50863 () Bool)

(assert (=> b!34190 m!50863))

(declare-fun m!50865 () Bool)

(assert (=> b!34188 m!50865))

(declare-fun m!50867 () Bool)

(assert (=> b!34188 m!50867))

(declare-fun m!50869 () Bool)

(assert (=> b!34189 m!50869))

(assert (=> b!33836 d!9784))

(declare-fun d!9786 () Bool)

(assert (=> d!9786 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 thiss!1379)) ((_ sign_extend 32) (currentBit!2520 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2676 () Bool)

(assert (= bs!2676 d!9786))

(declare-fun m!50871 () Bool)

(assert (=> bs!2676 m!50871))

(assert (=> b!33836 d!9786))

(declare-fun d!9788 () Bool)

(assert (=> d!9788 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!49579) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569)))) lt!49579))))

(declare-fun bs!2677 () Bool)

(assert (= bs!2677 d!9788))

(declare-fun m!50873 () Bool)

(assert (=> bs!2677 m!50873))

(assert (=> b!33836 d!9788))

(declare-fun d!9790 () Bool)

(assert (=> d!9790 (validate_offset_bits!1 ((_ sign_extend 32) (size!830 (buf!1158 (_2!1804 lt!49588)))) ((_ sign_extend 32) (currentByte!2525 (_2!1804 lt!49569))) ((_ sign_extend 32) (currentBit!2520 (_2!1804 lt!49569))) lt!49579)))

(declare-fun lt!50258 () Unit!2515)

(assert (=> d!9790 (= lt!50258 (choose!9 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!49588)) lt!49579 (BitStream!1453 (buf!1158 (_2!1804 lt!49588)) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569)))))))

(assert (=> d!9790 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1804 lt!49569) (buf!1158 (_2!1804 lt!49588)) lt!49579) lt!50258)))

(declare-fun bs!2678 () Bool)

(assert (= bs!2678 d!9790))

(assert (=> bs!2678 m!50211))

(declare-fun m!50875 () Bool)

(assert (=> bs!2678 m!50875))

(assert (=> b!33836 d!9790))

(declare-fun b!34191 () Bool)

(declare-fun res!29264 () Bool)

(declare-fun e!22677 () Bool)

(assert (=> b!34191 (=> (not res!29264) (not e!22677))))

(declare-fun lt!50259 () tuple2!3436)

(assert (=> b!34191 (= res!29264 (isPrefixOf!0 (_1!1805 lt!50259) (_2!1804 lt!49569)))))

(declare-fun b!34192 () Bool)

(declare-fun res!29263 () Bool)

(assert (=> b!34192 (=> (not res!29263) (not e!22677))))

(assert (=> b!34192 (= res!29263 (isPrefixOf!0 (_2!1805 lt!50259) (_2!1804 lt!49588)))))

(declare-fun b!34193 () Bool)

(declare-fun e!22676 () Unit!2515)

(declare-fun lt!50275 () Unit!2515)

(assert (=> b!34193 (= e!22676 lt!50275)))

(declare-fun lt!50277 () (_ BitVec 64))

(assert (=> b!34193 (= lt!50277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50274 () (_ BitVec 64))

(assert (=> b!34193 (= lt!50274 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> b!34193 (= lt!50275 (arrayBitRangesEqSymmetric!0 (buf!1158 (_2!1804 lt!49569)) (buf!1158 (_2!1804 lt!49588)) lt!50277 lt!50274))))

(assert (=> b!34193 (arrayBitRangesEq!0 (buf!1158 (_2!1804 lt!49588)) (buf!1158 (_2!1804 lt!49569)) lt!50277 lt!50274)))

(declare-fun lt!50262 () (_ BitVec 64))

(declare-fun b!34194 () Bool)

(declare-fun lt!50264 () (_ BitVec 64))

(assert (=> b!34194 (= e!22677 (= (_1!1805 lt!50259) (withMovedBitIndex!0 (_2!1805 lt!50259) (bvsub lt!50262 lt!50264))))))

(assert (=> b!34194 (or (= (bvand lt!50262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50264 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!50262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!50262 lt!50264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!34194 (= lt!50264 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49588))) (currentByte!2525 (_2!1804 lt!49588)) (currentBit!2520 (_2!1804 lt!49588))))))

(assert (=> b!34194 (= lt!50262 (bitIndex!0 (size!830 (buf!1158 (_2!1804 lt!49569))) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(declare-fun d!9792 () Bool)

(assert (=> d!9792 e!22677))

(declare-fun res!29265 () Bool)

(assert (=> d!9792 (=> (not res!29265) (not e!22677))))

(assert (=> d!9792 (= res!29265 (isPrefixOf!0 (_1!1805 lt!50259) (_2!1805 lt!50259)))))

(declare-fun lt!50261 () BitStream!1452)

(assert (=> d!9792 (= lt!50259 (tuple2!3437 lt!50261 (_2!1804 lt!49588)))))

(declare-fun lt!50271 () Unit!2515)

(declare-fun lt!50263 () Unit!2515)

(assert (=> d!9792 (= lt!50271 lt!50263)))

(assert (=> d!9792 (isPrefixOf!0 lt!50261 (_2!1804 lt!49588))))

(assert (=> d!9792 (= lt!50263 (lemmaIsPrefixTransitive!0 lt!50261 (_2!1804 lt!49588) (_2!1804 lt!49588)))))

(declare-fun lt!50272 () Unit!2515)

(declare-fun lt!50276 () Unit!2515)

(assert (=> d!9792 (= lt!50272 lt!50276)))

(assert (=> d!9792 (isPrefixOf!0 lt!50261 (_2!1804 lt!49588))))

(assert (=> d!9792 (= lt!50276 (lemmaIsPrefixTransitive!0 lt!50261 (_2!1804 lt!49569) (_2!1804 lt!49588)))))

(declare-fun lt!50260 () Unit!2515)

(assert (=> d!9792 (= lt!50260 e!22676)))

(declare-fun c!2276 () Bool)

(assert (=> d!9792 (= c!2276 (not (= (size!830 (buf!1158 (_2!1804 lt!49569))) #b00000000000000000000000000000000)))))

(declare-fun lt!50267 () Unit!2515)

(declare-fun lt!50265 () Unit!2515)

(assert (=> d!9792 (= lt!50267 lt!50265)))

(assert (=> d!9792 (isPrefixOf!0 (_2!1804 lt!49588) (_2!1804 lt!49588))))

(assert (=> d!9792 (= lt!50265 (lemmaIsPrefixRefl!0 (_2!1804 lt!49588)))))

(declare-fun lt!50273 () Unit!2515)

(declare-fun lt!50270 () Unit!2515)

(assert (=> d!9792 (= lt!50273 lt!50270)))

(assert (=> d!9792 (= lt!50270 (lemmaIsPrefixRefl!0 (_2!1804 lt!49588)))))

(declare-fun lt!50269 () Unit!2515)

(declare-fun lt!50278 () Unit!2515)

(assert (=> d!9792 (= lt!50269 lt!50278)))

(assert (=> d!9792 (isPrefixOf!0 lt!50261 lt!50261)))

(assert (=> d!9792 (= lt!50278 (lemmaIsPrefixRefl!0 lt!50261))))

(declare-fun lt!50268 () Unit!2515)

(declare-fun lt!50266 () Unit!2515)

(assert (=> d!9792 (= lt!50268 lt!50266)))

(assert (=> d!9792 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49569))))

(assert (=> d!9792 (= lt!50266 (lemmaIsPrefixRefl!0 (_2!1804 lt!49569)))))

(assert (=> d!9792 (= lt!50261 (BitStream!1453 (buf!1158 (_2!1804 lt!49588)) (currentByte!2525 (_2!1804 lt!49569)) (currentBit!2520 (_2!1804 lt!49569))))))

(assert (=> d!9792 (isPrefixOf!0 (_2!1804 lt!49569) (_2!1804 lt!49588))))

(assert (=> d!9792 (= (reader!0 (_2!1804 lt!49569) (_2!1804 lt!49588)) lt!50259)))

(declare-fun b!34195 () Bool)

(declare-fun Unit!2528 () Unit!2515)

(assert (=> b!34195 (= e!22676 Unit!2528)))

(assert (= (and d!9792 c!2276) b!34193))

(assert (= (and d!9792 (not c!2276)) b!34195))

(assert (= (and d!9792 res!29265) b!34191))

(assert (= (and b!34191 res!29264) b!34192))

(assert (= (and b!34192 res!29263) b!34194))

(declare-fun m!50877 () Bool)

(assert (=> b!34192 m!50877))

(declare-fun m!50879 () Bool)

(assert (=> d!9792 m!50879))

(assert (=> d!9792 m!50281))

(declare-fun m!50881 () Bool)

(assert (=> d!9792 m!50881))

(declare-fun m!50883 () Bool)

(assert (=> d!9792 m!50883))

(assert (=> d!9792 m!50845))

(declare-fun m!50885 () Bool)

(assert (=> d!9792 m!50885))

(assert (=> d!9792 m!50685))

(assert (=> d!9792 m!50687))

(declare-fun m!50887 () Bool)

(assert (=> d!9792 m!50887))

(declare-fun m!50889 () Bool)

(assert (=> d!9792 m!50889))

(assert (=> d!9792 m!50853))

(assert (=> b!34193 m!50223))

(declare-fun m!50891 () Bool)

(assert (=> b!34193 m!50891))

(declare-fun m!50893 () Bool)

(assert (=> b!34193 m!50893))

(declare-fun m!50895 () Bool)

(assert (=> b!34194 m!50895))

(assert (=> b!34194 m!50225))

(assert (=> b!34194 m!50223))

(declare-fun m!50897 () Bool)

(assert (=> b!34191 m!50897))

(assert (=> b!33836 d!9792))

(declare-fun d!9794 () Bool)

(assert (=> d!9794 (= (tail!144 lt!49576) (t!1177 lt!49576))))

(assert (=> b!33826 d!9794))

(declare-fun d!9796 () Bool)

(declare-fun e!22680 () Bool)

(assert (=> d!9796 e!22680))

(declare-fun res!29268 () Bool)

(assert (=> d!9796 (=> (not res!29268) (not e!22680))))

(declare-fun lt!50284 () (_ BitVec 64))

(assert (=> d!9796 (= res!29268 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!50284 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!50284) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9796 (= lt!50284 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!50283 () Unit!2515)

(declare-fun choose!42 (BitStream!1452 BitStream!1452 BitStream!1452 BitStream!1452 (_ BitVec 64) List!427) Unit!2515)

(assert (=> d!9796 (= lt!50283 (choose!42 (_2!1804 lt!49588) (_2!1804 lt!49588) (_1!1805 lt!49581) (_1!1805 lt!49584) (bvsub to!314 i!635) lt!49576))))

(assert (=> d!9796 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9796 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1804 lt!49588) (_2!1804 lt!49588) (_1!1805 lt!49581) (_1!1805 lt!49584) (bvsub to!314 i!635) lt!49576) lt!50283)))

(declare-fun b!34198 () Bool)

(assert (=> b!34198 (= e!22680 (= (bitStreamReadBitsIntoList!0 (_2!1804 lt!49588) (_1!1805 lt!49584) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!144 lt!49576)))))

(assert (= (and d!9796 res!29268) b!34198))

(declare-fun m!50899 () Bool)

(assert (=> d!9796 m!50899))

(declare-fun m!50901 () Bool)

(assert (=> b!34198 m!50901))

(assert (=> b!34198 m!50227))

(assert (=> b!33826 d!9796))

(declare-fun d!9798 () Bool)

(assert (=> d!9798 (= (head!264 lt!49576) (h!542 lt!49576))))

(assert (=> b!33837 d!9798))

(check-sat (not d!9778) (not b!34101) (not b!34179) (not d!9616) (not d!9594) (not b!34102) (not d!9774) (not b!34194) (not b!34180) (not b!34150) (not d!9604) (not b!34146) (not b!34191) (not b!34099) (not b!34158) (not b!34185) (not d!9788) (not b!34117) (not d!9626) (not b!34193) (not d!9622) (not b!34106) (not b!34145) (not b!33921) (not bm!418) (not d!9744) (not d!9598) (not d!9608) (not d!9790) (not b!34184) (not b!34104) (not b!34189) (not b!34192) (not b!34188) (not b!33919) (not b!34173) (not b!34175) (not d!9796) (not d!9630) (not b!34148) (not b!34171) (not d!9776) (not b!34151) (not b!34118) (not b!34152) (not b!33916) (not b!34149) (not b!34182) (not d!9786) (not b!34103) (not b!34122) (not b!34127) (not b!34119) (not b!34172) (not d!9782) (not b!34170) (not d!9750) (not b!34190) (not d!9792) (not b!34198) (not b!34120) (not d!9612) (not b!34124) (not d!9620) (not b!33918) (not b!34181) (not b!34147) (not d!9748) (not b!34183) (not b!34160) (not d!9752))
(check-sat)
