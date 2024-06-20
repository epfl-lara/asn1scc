; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1562 () Bool)

(assert start!1562)

(declare-fun b!7680 () Bool)

(declare-fun res!8420 () Bool)

(declare-fun e!4822 () Bool)

(assert (=> b!7680 (=> (not res!8420) (not e!4822))))

(declare-datatypes ((array!519 0))(
  ( (array!520 (arr!628 (Array (_ BitVec 32) (_ BitVec 8))) (size!226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!430 0))(
  ( (BitStream!431 (buf!559 array!519) (currentByte!1562 (_ BitVec 32)) (currentBit!1557 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!598 0))(
  ( (Unit!599) )
))
(declare-datatypes ((tuple2!1048 0))(
  ( (tuple2!1049 (_1!552 Unit!598) (_2!552 BitStream!430)) )
))
(declare-fun lt!9915 () tuple2!1048)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!430)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7680 (= res!8420 (= (bitIndex!0 (size!226 (buf!559 (_2!552 lt!9915))) (currentByte!1562 (_2!552 lt!9915)) (currentBit!1557 (_2!552 lt!9915))) (bvadd (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)) nBits!460)))))

(declare-fun b!7681 () Bool)

(declare-fun e!4824 () Bool)

(assert (=> b!7681 (= e!4824 e!4822)))

(declare-fun res!8422 () Bool)

(assert (=> b!7681 (=> (not res!8422) (not e!4822))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7681 (= res!8422 (invariant!0 (currentBit!1557 (_2!552 lt!9915)) (currentByte!1562 (_2!552 lt!9915)) (size!226 (buf!559 (_2!552 lt!9915)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!519)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!430 array!519 (_ BitVec 64) (_ BitVec 64)) tuple2!1048)

(assert (=> b!7681 (= lt!9915 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7682 () Bool)

(declare-fun e!4820 () Bool)

(assert (=> b!7682 (= e!4822 (not e!4820))))

(declare-fun res!8423 () Bool)

(assert (=> b!7682 (=> res!8423 e!4820)))

(declare-datatypes ((List!126 0))(
  ( (Nil!123) (Cons!122 (h!241 Bool) (t!876 List!126)) )
))
(declare-fun lt!9912 () List!126)

(declare-datatypes ((tuple2!1050 0))(
  ( (tuple2!1051 (_1!553 array!519) (_2!553 BitStream!430)) )
))
(declare-fun lt!9916 () tuple2!1050)

(declare-fun byteArrayBitContentToList!0 (BitStream!430 array!519 (_ BitVec 64) (_ BitVec 64)) List!126)

(assert (=> b!7682 (= res!8423 (not (= (byteArrayBitContentToList!0 (_2!552 lt!9915) (_1!553 lt!9916) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9912)))))

(declare-datatypes ((tuple2!1052 0))(
  ( (tuple2!1053 (_1!554 BitStream!430) (_2!554 BitStream!430)) )
))
(declare-fun lt!9914 () tuple2!1052)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!430 BitStream!430 (_ BitVec 64)) List!126)

(assert (=> b!7682 (= lt!9912 (bitStreamReadBitsIntoList!0 (_2!552 lt!9915) (_1!554 lt!9914) nBits!460))))

(declare-fun readBits!0 (BitStream!430 (_ BitVec 64)) tuple2!1050)

(assert (=> b!7682 (= lt!9916 (readBits!0 (_1!554 lt!9914) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7682 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) nBits!460)))

(declare-fun lt!9917 () Unit!598)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!430 array!519 (_ BitVec 64)) Unit!598)

(assert (=> b!7682 (= lt!9917 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!559 (_2!552 lt!9915)) nBits!460))))

(declare-fun reader!0 (BitStream!430 BitStream!430) tuple2!1052)

(assert (=> b!7682 (= lt!9914 (reader!0 thiss!1486 (_2!552 lt!9915)))))

(declare-fun b!7683 () Bool)

(declare-fun res!8418 () Bool)

(assert (=> b!7683 (=> (not res!8418) (not e!4822))))

(assert (=> b!7683 (= res!8418 (= (size!226 (buf!559 thiss!1486)) (size!226 (buf!559 (_2!552 lt!9915)))))))

(declare-fun b!7684 () Bool)

(declare-fun res!8419 () Bool)

(assert (=> b!7684 (=> res!8419 e!4820)))

(assert (=> b!7684 (= res!8419 (not (= lt!9912 (byteArrayBitContentToList!0 (_2!552 lt!9915) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7685 () Bool)

(declare-fun res!8421 () Bool)

(assert (=> b!7685 (=> (not res!8421) (not e!4824))))

(assert (=> b!7685 (= res!8421 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) nBits!460))))

(declare-fun res!8424 () Bool)

(assert (=> start!1562 (=> (not res!8424) (not e!4824))))

(assert (=> start!1562 (= res!8424 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!226 srcBuffer!6))))))))

(assert (=> start!1562 e!4824))

(assert (=> start!1562 true))

(declare-fun array_inv!221 (array!519) Bool)

(assert (=> start!1562 (array_inv!221 srcBuffer!6)))

(declare-fun e!4821 () Bool)

(declare-fun inv!12 (BitStream!430) Bool)

(assert (=> start!1562 (and (inv!12 thiss!1486) e!4821)))

(declare-fun b!7686 () Bool)

(declare-fun e!4823 () Bool)

(assert (=> b!7686 (= e!4820 e!4823)))

(declare-fun res!8425 () Bool)

(assert (=> b!7686 (=> res!8425 e!4823)))

(declare-fun checkByteArrayBitContent!0 (BitStream!430 array!519 array!519 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7686 (= res!8425 (not (checkByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9913 () Unit!598)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!430 array!519 array!519 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!598)

(assert (=> b!7686 (= lt!9913 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7687 () Bool)

(declare-fun res!8417 () Bool)

(assert (=> b!7687 (=> (not res!8417) (not e!4822))))

(declare-fun isPrefixOf!0 (BitStream!430 BitStream!430) Bool)

(assert (=> b!7687 (= res!8417 (isPrefixOf!0 thiss!1486 (_2!552 lt!9915)))))

(declare-fun b!7688 () Bool)

(assert (=> b!7688 (= e!4823 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!226 (_1!553 lt!9916)))))))))

(declare-fun b!7689 () Bool)

(assert (=> b!7689 (= e!4821 (array_inv!221 (buf!559 thiss!1486)))))

(assert (= (and start!1562 res!8424) b!7685))

(assert (= (and b!7685 res!8421) b!7681))

(assert (= (and b!7681 res!8422) b!7683))

(assert (= (and b!7683 res!8418) b!7680))

(assert (= (and b!7680 res!8420) b!7687))

(assert (= (and b!7687 res!8417) b!7682))

(assert (= (and b!7682 (not res!8423)) b!7684))

(assert (= (and b!7684 (not res!8419)) b!7686))

(assert (= (and b!7686 (not res!8425)) b!7688))

(assert (= start!1562 b!7689))

(declare-fun m!9819 () Bool)

(assert (=> b!7682 m!9819))

(declare-fun m!9821 () Bool)

(assert (=> b!7682 m!9821))

(declare-fun m!9823 () Bool)

(assert (=> b!7682 m!9823))

(declare-fun m!9825 () Bool)

(assert (=> b!7682 m!9825))

(declare-fun m!9827 () Bool)

(assert (=> b!7682 m!9827))

(declare-fun m!9829 () Bool)

(assert (=> b!7682 m!9829))

(declare-fun m!9831 () Bool)

(assert (=> b!7687 m!9831))

(declare-fun m!9833 () Bool)

(assert (=> b!7686 m!9833))

(declare-fun m!9835 () Bool)

(assert (=> b!7686 m!9835))

(declare-fun m!9837 () Bool)

(assert (=> b!7685 m!9837))

(declare-fun m!9839 () Bool)

(assert (=> b!7680 m!9839))

(declare-fun m!9841 () Bool)

(assert (=> b!7680 m!9841))

(declare-fun m!9843 () Bool)

(assert (=> b!7681 m!9843))

(declare-fun m!9845 () Bool)

(assert (=> b!7681 m!9845))

(declare-fun m!9847 () Bool)

(assert (=> b!7684 m!9847))

(declare-fun m!9849 () Bool)

(assert (=> start!1562 m!9849))

(declare-fun m!9851 () Bool)

(assert (=> start!1562 m!9851))

(declare-fun m!9853 () Bool)

(assert (=> b!7689 m!9853))

(push 1)

(assert (not b!7689))

(assert (not b!7682))

(assert (not b!7685))

(assert (not b!7687))

(assert (not b!7680))

(assert (not b!7681))

(assert (not b!7686))

(assert (not start!1562))

(assert (not b!7684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2262 () Bool)

(declare-fun c!403 () Bool)

(assert (=> d!2262 (= c!403 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4888 () List!126)

(assert (=> d!2262 (= (byteArrayBitContentToList!0 (_2!552 lt!9915) srcBuffer!6 from!367 nBits!460) e!4888)))

(declare-fun b!7785 () Bool)

(assert (=> b!7785 (= e!4888 Nil!123)))

(declare-fun b!7786 () Bool)

(assert (=> b!7786 (= e!4888 (Cons!122 (not (= (bvand ((_ sign_extend 24) (select (arr!628 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!552 lt!9915) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2262 c!403) b!7785))

(assert (= (and d!2262 (not c!403)) b!7786))

(declare-fun m!9951 () Bool)

(assert (=> b!7786 m!9951))

(declare-fun m!9953 () Bool)

(assert (=> b!7786 m!9953))

(declare-fun m!9955 () Bool)

(assert (=> b!7786 m!9955))

(assert (=> b!7684 d!2262))

(declare-fun d!2268 () Bool)

(assert (=> d!2268 (= (array_inv!221 srcBuffer!6) (bvsge (size!226 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1562 d!2268))

(declare-fun d!2270 () Bool)

(assert (=> d!2270 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1557 thiss!1486) (currentByte!1562 thiss!1486) (size!226 (buf!559 thiss!1486))))))

(declare-fun bs!795 () Bool)

(assert (= bs!795 d!2270))

(declare-fun m!9963 () Bool)

(assert (=> bs!795 m!9963))

(assert (=> start!1562 d!2270))

(declare-fun d!2274 () Bool)

(assert (=> d!2274 (= (array_inv!221 (buf!559 thiss!1486)) (bvsge (size!226 (buf!559 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!7689 d!2274))

(declare-fun d!2276 () Bool)

(declare-fun e!4906 () Bool)

(assert (=> d!2276 e!4906))

(declare-fun res!8521 () Bool)

(assert (=> d!2276 (=> (not res!8521) (not e!4906))))

(declare-fun lt!10075 () tuple2!1052)

(assert (=> d!2276 (= res!8521 (isPrefixOf!0 (_1!554 lt!10075) (_2!554 lt!10075)))))

(declare-fun lt!10061 () BitStream!430)

(assert (=> d!2276 (= lt!10075 (tuple2!1053 lt!10061 (_2!552 lt!9915)))))

(declare-fun lt!10062 () Unit!598)

(declare-fun lt!10073 () Unit!598)

(assert (=> d!2276 (= lt!10062 lt!10073)))

(assert (=> d!2276 (isPrefixOf!0 lt!10061 (_2!552 lt!9915))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!430 BitStream!430 BitStream!430) Unit!598)

(assert (=> d!2276 (= lt!10073 (lemmaIsPrefixTransitive!0 lt!10061 (_2!552 lt!9915) (_2!552 lt!9915)))))

(declare-fun lt!10066 () Unit!598)

(declare-fun lt!10078 () Unit!598)

(assert (=> d!2276 (= lt!10066 lt!10078)))

(assert (=> d!2276 (isPrefixOf!0 lt!10061 (_2!552 lt!9915))))

(assert (=> d!2276 (= lt!10078 (lemmaIsPrefixTransitive!0 lt!10061 thiss!1486 (_2!552 lt!9915)))))

(declare-fun lt!10072 () Unit!598)

(declare-fun e!4907 () Unit!598)

(assert (=> d!2276 (= lt!10072 e!4907)))

(declare-fun c!414 () Bool)

(assert (=> d!2276 (= c!414 (not (= (size!226 (buf!559 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!10071 () Unit!598)

(declare-fun lt!10069 () Unit!598)

(assert (=> d!2276 (= lt!10071 lt!10069)))

(assert (=> d!2276 (isPrefixOf!0 (_2!552 lt!9915) (_2!552 lt!9915))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!430) Unit!598)

(assert (=> d!2276 (= lt!10069 (lemmaIsPrefixRefl!0 (_2!552 lt!9915)))))

(declare-fun lt!10077 () Unit!598)

(declare-fun lt!10067 () Unit!598)

(assert (=> d!2276 (= lt!10077 lt!10067)))

(assert (=> d!2276 (= lt!10067 (lemmaIsPrefixRefl!0 (_2!552 lt!9915)))))

(declare-fun lt!10065 () Unit!598)

(declare-fun lt!10063 () Unit!598)

(assert (=> d!2276 (= lt!10065 lt!10063)))

(assert (=> d!2276 (isPrefixOf!0 lt!10061 lt!10061)))

(assert (=> d!2276 (= lt!10063 (lemmaIsPrefixRefl!0 lt!10061))))

(declare-fun lt!10074 () Unit!598)

(declare-fun lt!10070 () Unit!598)

(assert (=> d!2276 (= lt!10074 lt!10070)))

(assert (=> d!2276 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2276 (= lt!10070 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2276 (= lt!10061 (BitStream!431 (buf!559 (_2!552 lt!9915)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)))))

(assert (=> d!2276 (isPrefixOf!0 thiss!1486 (_2!552 lt!9915))))

(assert (=> d!2276 (= (reader!0 thiss!1486 (_2!552 lt!9915)) lt!10075)))

(declare-fun b!7838 () Bool)

(declare-fun res!8522 () Bool)

(assert (=> b!7838 (=> (not res!8522) (not e!4906))))

(assert (=> b!7838 (= res!8522 (isPrefixOf!0 (_1!554 lt!10075) thiss!1486))))

(declare-fun b!7839 () Bool)

(declare-fun lt!10060 () Unit!598)

(assert (=> b!7839 (= e!4907 lt!10060)))

(declare-fun lt!10068 () (_ BitVec 64))

(assert (=> b!7839 (= lt!10068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10079 () (_ BitVec 64))

(assert (=> b!7839 (= lt!10079 (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!519 array!519 (_ BitVec 64) (_ BitVec 64)) Unit!598)

(assert (=> b!7839 (= lt!10060 (arrayBitRangesEqSymmetric!0 (buf!559 thiss!1486) (buf!559 (_2!552 lt!9915)) lt!10068 lt!10079))))

(declare-fun arrayBitRangesEq!0 (array!519 array!519 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7839 (arrayBitRangesEq!0 (buf!559 (_2!552 lt!9915)) (buf!559 thiss!1486) lt!10068 lt!10079)))

(declare-fun lt!10076 () (_ BitVec 64))

(declare-fun lt!10064 () (_ BitVec 64))

(declare-fun b!7840 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!430 (_ BitVec 64)) BitStream!430)

(assert (=> b!7840 (= e!4906 (= (_1!554 lt!10075) (withMovedBitIndex!0 (_2!554 lt!10075) (bvsub lt!10076 lt!10064))))))

(assert (=> b!7840 (or (= (bvand lt!10076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10064 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10076 lt!10064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7840 (= lt!10064 (bitIndex!0 (size!226 (buf!559 (_2!552 lt!9915))) (currentByte!1562 (_2!552 lt!9915)) (currentBit!1557 (_2!552 lt!9915))))))

(assert (=> b!7840 (= lt!10076 (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)))))

(declare-fun b!7841 () Bool)

(declare-fun res!8520 () Bool)

(assert (=> b!7841 (=> (not res!8520) (not e!4906))))

(assert (=> b!7841 (= res!8520 (isPrefixOf!0 (_2!554 lt!10075) (_2!552 lt!9915)))))

(declare-fun b!7842 () Bool)

(declare-fun Unit!612 () Unit!598)

(assert (=> b!7842 (= e!4907 Unit!612)))

(assert (= (and d!2276 c!414) b!7839))

(assert (= (and d!2276 (not c!414)) b!7842))

(assert (= (and d!2276 res!8521) b!7838))

(assert (= (and b!7838 res!8522) b!7841))

(assert (= (and b!7841 res!8520) b!7840))

(declare-fun m!9991 () Bool)

(assert (=> d!2276 m!9991))

(declare-fun m!9993 () Bool)

(assert (=> d!2276 m!9993))

(declare-fun m!9995 () Bool)

(assert (=> d!2276 m!9995))

(declare-fun m!9997 () Bool)

(assert (=> d!2276 m!9997))

(assert (=> d!2276 m!9831))

(declare-fun m!9999 () Bool)

(assert (=> d!2276 m!9999))

(declare-fun m!10001 () Bool)

(assert (=> d!2276 m!10001))

(declare-fun m!10003 () Bool)

(assert (=> d!2276 m!10003))

(declare-fun m!10005 () Bool)

(assert (=> d!2276 m!10005))

(declare-fun m!10007 () Bool)

(assert (=> d!2276 m!10007))

(declare-fun m!10009 () Bool)

(assert (=> d!2276 m!10009))

(declare-fun m!10011 () Bool)

(assert (=> b!7840 m!10011))

(assert (=> b!7840 m!9839))

(assert (=> b!7840 m!9841))

(declare-fun m!10013 () Bool)

(assert (=> b!7838 m!10013))

(declare-fun m!10015 () Bool)

(assert (=> b!7841 m!10015))

(assert (=> b!7839 m!9841))

(declare-fun m!10017 () Bool)

(assert (=> b!7839 m!10017))

(declare-fun m!10019 () Bool)

(assert (=> b!7839 m!10019))

(assert (=> b!7682 d!2276))

(declare-fun d!2284 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2284 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486))) nBits!460))))

(declare-fun bs!796 () Bool)

(assert (= bs!796 d!2284))

(declare-fun m!10021 () Bool)

(assert (=> bs!796 m!10021))

(assert (=> b!7682 d!2284))

(declare-fun b!7888 () Bool)

(declare-fun res!8559 () Bool)

(declare-fun e!4923 () Bool)

(assert (=> b!7888 (=> (not res!8559) (not e!4923))))

(declare-fun lt!10238 () tuple2!1050)

(assert (=> b!7888 (= res!8559 (bvsle (currentByte!1562 (_1!554 lt!9914)) (currentByte!1562 (_2!553 lt!10238))))))

(declare-fun b!7889 () Bool)

(declare-fun res!8558 () Bool)

(assert (=> b!7889 (=> (not res!8558) (not e!4923))))

(assert (=> b!7889 (= res!8558 (invariant!0 (currentBit!1557 (_2!553 lt!10238)) (currentByte!1562 (_2!553 lt!10238)) (size!226 (buf!559 (_2!553 lt!10238)))))))

(declare-fun b!7890 () Bool)

(assert (=> b!7890 (= e!4923 (= (byteArrayBitContentToList!0 (_2!553 lt!10238) (_1!553 lt!10238) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!553 lt!10238) (_1!554 lt!9914) nBits!460)))))

(declare-fun d!2286 () Bool)

(assert (=> d!2286 e!4923))

(declare-fun res!8560 () Bool)

(assert (=> d!2286 (=> (not res!8560) (not e!4923))))

(assert (=> d!2286 (= res!8560 (= (buf!559 (_2!553 lt!10238)) (buf!559 (_1!554 lt!9914))))))

(declare-datatypes ((tuple3!60 0))(
  ( (tuple3!61 (_1!567 Unit!598) (_2!567 BitStream!430) (_3!30 array!519)) )
))
(declare-fun lt!10236 () tuple3!60)

(assert (=> d!2286 (= lt!10238 (tuple2!1051 (_3!30 lt!10236) (_2!567 lt!10236)))))

(declare-fun readBitsLoop!0 (BitStream!430 (_ BitVec 64) array!519 (_ BitVec 64) (_ BitVec 64)) tuple3!60)

(assert (=> d!2286 (= lt!10236 (readBitsLoop!0 (_1!554 lt!9914) nBits!460 (array!520 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2286 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2286 (= (readBits!0 (_1!554 lt!9914) nBits!460) lt!10238)))

(declare-fun b!7891 () Bool)

(declare-fun res!8556 () Bool)

(assert (=> b!7891 (=> (not res!8556) (not e!4923))))

(declare-fun lt!10234 () (_ BitVec 64))

(assert (=> b!7891 (= res!8556 (= (bvadd lt!10234 nBits!460) (bitIndex!0 (size!226 (buf!559 (_2!553 lt!10238))) (currentByte!1562 (_2!553 lt!10238)) (currentBit!1557 (_2!553 lt!10238)))))))

(assert (=> b!7891 (or (not (= (bvand lt!10234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!10234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!10234 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7891 (= lt!10234 (bitIndex!0 (size!226 (buf!559 (_1!554 lt!9914))) (currentByte!1562 (_1!554 lt!9914)) (currentBit!1557 (_1!554 lt!9914))))))

(declare-fun b!7892 () Bool)

(declare-fun res!8557 () Bool)

(assert (=> b!7892 (=> (not res!8557) (not e!4923))))

(declare-fun lt!10232 () (_ BitVec 64))

(assert (=> b!7892 (= res!8557 (= (size!226 (_1!553 lt!10238)) ((_ extract 31 0) lt!10232)))))

(assert (=> b!7892 (and (bvslt lt!10232 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!10232 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!10235 () (_ BitVec 64))

(declare-fun lt!10237 () (_ BitVec 64))

(assert (=> b!7892 (= lt!10232 (bvsdiv lt!10235 lt!10237))))

(assert (=> b!7892 (and (not (= lt!10237 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!10235 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!10237 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!7892 (= lt!10237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!10231 () (_ BitVec 64))

(declare-fun lt!10233 () (_ BitVec 64))

(assert (=> b!7892 (= lt!10235 (bvsub lt!10231 lt!10233))))

(assert (=> b!7892 (or (= (bvand lt!10231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10231 lt!10233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7892 (= lt!10233 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10230 () (_ BitVec 64))

(assert (=> b!7892 (= lt!10231 (bvadd nBits!460 lt!10230))))

(assert (=> b!7892 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10230 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!10230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7892 (= lt!10230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!2286 res!8560) b!7891))

(assert (= (and b!7891 res!8556) b!7889))

(assert (= (and b!7889 res!8558) b!7892))

(assert (= (and b!7892 res!8557) b!7888))

(assert (= (and b!7888 res!8559) b!7890))

(declare-fun m!10101 () Bool)

(assert (=> b!7889 m!10101))

(declare-fun m!10103 () Bool)

(assert (=> b!7890 m!10103))

(declare-fun m!10105 () Bool)

(assert (=> b!7890 m!10105))

(declare-fun m!10107 () Bool)

(assert (=> d!2286 m!10107))

(declare-fun m!10109 () Bool)

(assert (=> b!7891 m!10109))

(declare-fun m!10111 () Bool)

(assert (=> b!7891 m!10111))

(assert (=> b!7682 d!2286))

(declare-fun b!7901 () Bool)

(declare-datatypes ((tuple2!1074 0))(
  ( (tuple2!1075 (_1!568 List!126) (_2!568 BitStream!430)) )
))
(declare-fun e!4929 () tuple2!1074)

(assert (=> b!7901 (= e!4929 (tuple2!1075 Nil!123 (_1!554 lt!9914)))))

(declare-fun b!7904 () Bool)

(declare-fun e!4928 () Bool)

(declare-fun lt!10245 () List!126)

(declare-fun length!19 (List!126) Int)

(assert (=> b!7904 (= e!4928 (> (length!19 lt!10245) 0))))

(declare-fun b!7903 () Bool)

(declare-fun isEmpty!24 (List!126) Bool)

(assert (=> b!7903 (= e!4928 (isEmpty!24 lt!10245))))

(declare-fun lt!10246 () (_ BitVec 64))

(declare-fun b!7902 () Bool)

(declare-datatypes ((tuple2!1076 0))(
  ( (tuple2!1077 (_1!569 Bool) (_2!569 BitStream!430)) )
))
(declare-fun lt!10247 () tuple2!1076)

(assert (=> b!7902 (= e!4929 (tuple2!1075 (Cons!122 (_1!569 lt!10247) (bitStreamReadBitsIntoList!0 (_2!552 lt!9915) (_2!569 lt!10247) (bvsub nBits!460 lt!10246))) (_2!569 lt!10247)))))

(declare-fun readBit!0 (BitStream!430) tuple2!1076)

(assert (=> b!7902 (= lt!10247 (readBit!0 (_1!554 lt!9914)))))

(assert (=> b!7902 (= lt!10246 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2306 () Bool)

(assert (=> d!2306 e!4928))

(declare-fun c!426 () Bool)

(assert (=> d!2306 (= c!426 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2306 (= lt!10245 (_1!568 e!4929))))

(declare-fun c!425 () Bool)

(assert (=> d!2306 (= c!425 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2306 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2306 (= (bitStreamReadBitsIntoList!0 (_2!552 lt!9915) (_1!554 lt!9914) nBits!460) lt!10245)))

(assert (= (and d!2306 c!425) b!7901))

(assert (= (and d!2306 (not c!425)) b!7902))

(assert (= (and d!2306 c!426) b!7903))

(assert (= (and d!2306 (not c!426)) b!7904))

(declare-fun m!10113 () Bool)

(assert (=> b!7904 m!10113))

(declare-fun m!10115 () Bool)

(assert (=> b!7903 m!10115))

(declare-fun m!10117 () Bool)

(assert (=> b!7902 m!10117))

(declare-fun m!10119 () Bool)

(assert (=> b!7902 m!10119))

(assert (=> b!7682 d!2306))

(declare-fun d!2308 () Bool)

(assert (=> d!2308 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) nBits!460)))

(declare-fun lt!10250 () Unit!598)

(declare-fun choose!9 (BitStream!430 array!519 (_ BitVec 64) BitStream!430) Unit!598)

(assert (=> d!2308 (= lt!10250 (choose!9 thiss!1486 (buf!559 (_2!552 lt!9915)) nBits!460 (BitStream!431 (buf!559 (_2!552 lt!9915)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486))))))

(assert (=> d!2308 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!559 (_2!552 lt!9915)) nBits!460) lt!10250)))

(declare-fun bs!800 () Bool)

(assert (= bs!800 d!2308))

(assert (=> bs!800 m!9821))

(declare-fun m!10121 () Bool)

(assert (=> bs!800 m!10121))

(assert (=> b!7682 d!2308))

(declare-fun d!2310 () Bool)

(declare-fun c!427 () Bool)

(assert (=> d!2310 (= c!427 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4930 () List!126)

(assert (=> d!2310 (= (byteArrayBitContentToList!0 (_2!552 lt!9915) (_1!553 lt!9916) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4930)))

(declare-fun b!7905 () Bool)

(assert (=> b!7905 (= e!4930 Nil!123)))

(declare-fun b!7906 () Bool)

(assert (=> b!7906 (= e!4930 (Cons!122 (not (= (bvand ((_ sign_extend 24) (select (arr!628 (_1!553 lt!9916)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!552 lt!9915) (_1!553 lt!9916) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2310 c!427) b!7905))

(assert (= (and d!2310 (not c!427)) b!7906))

(declare-fun m!10123 () Bool)

(assert (=> b!7906 m!10123))

(declare-fun m!10125 () Bool)

(assert (=> b!7906 m!10125))

(declare-fun m!10127 () Bool)

(assert (=> b!7906 m!10127))

(assert (=> b!7682 d!2310))

(declare-fun d!2312 () Bool)

(declare-fun res!8567 () Bool)

(declare-fun e!4935 () Bool)

(assert (=> d!2312 (=> (not res!8567) (not e!4935))))

(assert (=> d!2312 (= res!8567 (= (size!226 (buf!559 thiss!1486)) (size!226 (buf!559 (_2!552 lt!9915)))))))

(assert (=> d!2312 (= (isPrefixOf!0 thiss!1486 (_2!552 lt!9915)) e!4935)))

(declare-fun b!7913 () Bool)

(declare-fun res!8568 () Bool)

(assert (=> b!7913 (=> (not res!8568) (not e!4935))))

(assert (=> b!7913 (= res!8568 (bvsle (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)) (bitIndex!0 (size!226 (buf!559 (_2!552 lt!9915))) (currentByte!1562 (_2!552 lt!9915)) (currentBit!1557 (_2!552 lt!9915)))))))

(declare-fun b!7914 () Bool)

(declare-fun e!4936 () Bool)

(assert (=> b!7914 (= e!4935 e!4936)))

(declare-fun res!8569 () Bool)

(assert (=> b!7914 (=> res!8569 e!4936)))

(assert (=> b!7914 (= res!8569 (= (size!226 (buf!559 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!7915 () Bool)

(assert (=> b!7915 (= e!4936 (arrayBitRangesEq!0 (buf!559 thiss!1486) (buf!559 (_2!552 lt!9915)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486))))))

(assert (= (and d!2312 res!8567) b!7913))

(assert (= (and b!7913 res!8568) b!7914))

(assert (= (and b!7914 (not res!8569)) b!7915))

(assert (=> b!7913 m!9841))

(assert (=> b!7913 m!9839))

(assert (=> b!7915 m!9841))

(assert (=> b!7915 m!9841))

(declare-fun m!10129 () Bool)

(assert (=> b!7915 m!10129))

(assert (=> b!7687 d!2312))

(declare-fun d!2314 () Bool)

(assert (=> d!2314 (= (invariant!0 (currentBit!1557 (_2!552 lt!9915)) (currentByte!1562 (_2!552 lt!9915)) (size!226 (buf!559 (_2!552 lt!9915)))) (and (bvsge (currentBit!1557 (_2!552 lt!9915)) #b00000000000000000000000000000000) (bvslt (currentBit!1557 (_2!552 lt!9915)) #b00000000000000000000000000001000) (bvsge (currentByte!1562 (_2!552 lt!9915)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1562 (_2!552 lt!9915)) (size!226 (buf!559 (_2!552 lt!9915)))) (and (= (currentBit!1557 (_2!552 lt!9915)) #b00000000000000000000000000000000) (= (currentByte!1562 (_2!552 lt!9915)) (size!226 (buf!559 (_2!552 lt!9915))))))))))

(assert (=> b!7681 d!2314))

(declare-fun call!92 () tuple2!1052)

(declare-fun lt!10661 () tuple2!1048)

(declare-fun c!436 () Bool)

(declare-fun bm!89 () Bool)

(assert (=> bm!89 (= call!92 (reader!0 thiss!1486 (ite c!436 (_2!552 lt!10661) thiss!1486)))))

(declare-fun b!8014 () Bool)

(declare-fun e!4986 () tuple2!1048)

(declare-fun Unit!617 () Unit!598)

(assert (=> b!8014 (= e!4986 (tuple2!1049 Unit!617 thiss!1486))))

(assert (=> b!8014 (= (size!226 (buf!559 thiss!1486)) (size!226 (buf!559 thiss!1486)))))

(declare-fun lt!10697 () Unit!598)

(declare-fun Unit!618 () Unit!598)

(assert (=> b!8014 (= lt!10697 Unit!618)))

(assert (=> b!8014 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!553 (readBits!0 (_1!554 call!92) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8015 () Bool)

(declare-fun res!8657 () Bool)

(declare-fun e!4987 () Bool)

(assert (=> b!8015 (=> (not res!8657) (not e!4987))))

(declare-fun lt!10687 () tuple2!1048)

(assert (=> b!8015 (= res!8657 (invariant!0 (currentBit!1557 (_2!552 lt!10687)) (currentByte!1562 (_2!552 lt!10687)) (size!226 (buf!559 (_2!552 lt!10687)))))))

(declare-fun b!8016 () Bool)

(declare-fun res!8653 () Bool)

(assert (=> b!8016 (=> (not res!8653) (not e!4987))))

(assert (=> b!8016 (= res!8653 (= (size!226 (buf!559 (_2!552 lt!10687))) (size!226 (buf!559 thiss!1486))))))

(declare-fun d!2316 () Bool)

(assert (=> d!2316 e!4987))

(declare-fun res!8652 () Bool)

(assert (=> d!2316 (=> (not res!8652) (not e!4987))))

(declare-fun lt!10673 () (_ BitVec 64))

(assert (=> d!2316 (= res!8652 (= (bitIndex!0 (size!226 (buf!559 (_2!552 lt!10687))) (currentByte!1562 (_2!552 lt!10687)) (currentBit!1557 (_2!552 lt!10687))) (bvsub lt!10673 from!367)))))

(assert (=> d!2316 (or (= (bvand lt!10673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10673 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10664 () (_ BitVec 64))

(assert (=> d!2316 (= lt!10673 (bvadd lt!10664 from!367 nBits!460))))

(assert (=> d!2316 (or (not (= (bvand lt!10664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!10664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!10664 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2316 (= lt!10664 (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)))))

(assert (=> d!2316 (= lt!10687 e!4986)))

(assert (=> d!2316 (= c!436 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!10665 () Unit!598)

(declare-fun lt!10684 () Unit!598)

(assert (=> d!2316 (= lt!10665 lt!10684)))

(assert (=> d!2316 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2316 (= lt!10684 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!10682 () (_ BitVec 64))

(assert (=> d!2316 (= lt!10682 (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)))))

(assert (=> d!2316 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2316 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!10687)))

(declare-fun b!8017 () Bool)

(declare-fun res!8656 () Bool)

(assert (=> b!8017 (=> (not res!8656) (not e!4987))))

(assert (=> b!8017 (= res!8656 (isPrefixOf!0 thiss!1486 (_2!552 lt!10687)))))

(declare-fun b!8018 () Bool)

(declare-fun lt!10663 () tuple2!1052)

(assert (=> b!8018 (= e!4987 (= (bitStreamReadBitsIntoList!0 (_2!552 lt!10687) (_1!554 lt!10663) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!552 lt!10687) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8018 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8018 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!10675 () Unit!598)

(declare-fun lt!10667 () Unit!598)

(assert (=> b!8018 (= lt!10675 lt!10667)))

(declare-fun lt!10700 () (_ BitVec 64))

(assert (=> b!8018 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!10687)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) lt!10700)))

(assert (=> b!8018 (= lt!10667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!559 (_2!552 lt!10687)) lt!10700))))

(declare-fun e!4985 () Bool)

(assert (=> b!8018 e!4985))

(declare-fun res!8655 () Bool)

(assert (=> b!8018 (=> (not res!8655) (not e!4985))))

(assert (=> b!8018 (= res!8655 (and (= (size!226 (buf!559 thiss!1486)) (size!226 (buf!559 (_2!552 lt!10687)))) (bvsge lt!10700 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8018 (= lt!10700 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8018 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8018 (= lt!10663 (reader!0 thiss!1486 (_2!552 lt!10687)))))

(declare-fun b!8019 () Bool)

(declare-fun Unit!623 () Unit!598)

(assert (=> b!8019 (= e!4986 (tuple2!1049 Unit!623 (_2!552 lt!10661)))))

(declare-fun lt!10678 () tuple2!1048)

(declare-fun appendBitFromByte!0 (BitStream!430 (_ BitVec 8) (_ BitVec 32)) tuple2!1048)

(assert (=> b!8019 (= lt!10678 (appendBitFromByte!0 thiss!1486 (select (arr!628 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!10674 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10674 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10662 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10662 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10659 () Unit!598)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!430 BitStream!430 (_ BitVec 64) (_ BitVec 64)) Unit!598)

(assert (=> b!8019 (= lt!10659 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!552 lt!10678) lt!10674 lt!10662))))

(assert (=> b!8019 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!10678)))) ((_ sign_extend 32) (currentByte!1562 (_2!552 lt!10678))) ((_ sign_extend 32) (currentBit!1557 (_2!552 lt!10678))) (bvsub lt!10674 lt!10662))))

(declare-fun lt!10668 () Unit!598)

(assert (=> b!8019 (= lt!10668 lt!10659)))

(declare-fun lt!10696 () tuple2!1052)

(assert (=> b!8019 (= lt!10696 (reader!0 thiss!1486 (_2!552 lt!10678)))))

(declare-fun lt!10680 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10680 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!10671 () Unit!598)

(assert (=> b!8019 (= lt!10671 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!559 (_2!552 lt!10678)) lt!10680))))

(assert (=> b!8019 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!10678)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) lt!10680)))

(declare-fun lt!10666 () Unit!598)

(assert (=> b!8019 (= lt!10666 lt!10671)))

(declare-fun head!34 (List!126) Bool)

(assert (=> b!8019 (= (head!34 (byteArrayBitContentToList!0 (_2!552 lt!10678) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!34 (bitStreamReadBitsIntoList!0 (_2!552 lt!10678) (_1!554 lt!10696) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10657 () Unit!598)

(declare-fun Unit!624 () Unit!598)

(assert (=> b!8019 (= lt!10657 Unit!624)))

(assert (=> b!8019 (= lt!10661 (appendBitsMSBFirstLoop!0 (_2!552 lt!10678) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!10686 () Unit!598)

(assert (=> b!8019 (= lt!10686 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!552 lt!10678) (_2!552 lt!10661)))))

(assert (=> b!8019 (isPrefixOf!0 thiss!1486 (_2!552 lt!10661))))

(declare-fun lt!10660 () Unit!598)

(assert (=> b!8019 (= lt!10660 lt!10686)))

(assert (=> b!8019 (= (size!226 (buf!559 (_2!552 lt!10661))) (size!226 (buf!559 thiss!1486)))))

(declare-fun lt!10691 () Unit!598)

(declare-fun Unit!625 () Unit!598)

(assert (=> b!8019 (= lt!10691 Unit!625)))

(assert (=> b!8019 (= (bitIndex!0 (size!226 (buf!559 (_2!552 lt!10661))) (currentByte!1562 (_2!552 lt!10661)) (currentBit!1557 (_2!552 lt!10661))) (bvsub (bvadd (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!10679 () Unit!598)

(declare-fun Unit!626 () Unit!598)

(assert (=> b!8019 (= lt!10679 Unit!626)))

(assert (=> b!8019 (= (bitIndex!0 (size!226 (buf!559 (_2!552 lt!10661))) (currentByte!1562 (_2!552 lt!10661)) (currentBit!1557 (_2!552 lt!10661))) (bvsub (bvsub (bvadd (bitIndex!0 (size!226 (buf!559 (_2!552 lt!10678))) (currentByte!1562 (_2!552 lt!10678)) (currentBit!1557 (_2!552 lt!10678))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10689 () Unit!598)

(declare-fun Unit!627 () Unit!598)

(assert (=> b!8019 (= lt!10689 Unit!627)))

(declare-fun lt!10677 () tuple2!1052)

(assert (=> b!8019 (= lt!10677 call!92)))

(declare-fun lt!10669 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10669 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10670 () Unit!598)

(assert (=> b!8019 (= lt!10670 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!559 (_2!552 lt!10661)) lt!10669))))

(assert (=> b!8019 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!10661)))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) lt!10669)))

(declare-fun lt!10690 () Unit!598)

(assert (=> b!8019 (= lt!10690 lt!10670)))

(declare-fun lt!10693 () tuple2!1052)

(assert (=> b!8019 (= lt!10693 (reader!0 (_2!552 lt!10678) (_2!552 lt!10661)))))

(declare-fun lt!10676 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10676 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!10681 () Unit!598)

(assert (=> b!8019 (= lt!10681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!552 lt!10678) (buf!559 (_2!552 lt!10661)) lt!10676))))

(assert (=> b!8019 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!10661)))) ((_ sign_extend 32) (currentByte!1562 (_2!552 lt!10678))) ((_ sign_extend 32) (currentBit!1557 (_2!552 lt!10678))) lt!10676)))

(declare-fun lt!10699 () Unit!598)

(assert (=> b!8019 (= lt!10699 lt!10681)))

(declare-fun lt!10694 () List!126)

(assert (=> b!8019 (= lt!10694 (byteArrayBitContentToList!0 (_2!552 lt!10661) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10688 () List!126)

(assert (=> b!8019 (= lt!10688 (byteArrayBitContentToList!0 (_2!552 lt!10661) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10685 () List!126)

(assert (=> b!8019 (= lt!10685 (bitStreamReadBitsIntoList!0 (_2!552 lt!10661) (_1!554 lt!10677) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!10695 () List!126)

(assert (=> b!8019 (= lt!10695 (bitStreamReadBitsIntoList!0 (_2!552 lt!10661) (_1!554 lt!10693) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!10698 () (_ BitVec 64))

(assert (=> b!8019 (= lt!10698 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!10683 () Unit!598)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!430 BitStream!430 BitStream!430 BitStream!430 (_ BitVec 64) List!126) Unit!598)

(assert (=> b!8019 (= lt!10683 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!552 lt!10661) (_2!552 lt!10661) (_1!554 lt!10677) (_1!554 lt!10693) lt!10698 lt!10685))))

(declare-fun tail!42 (List!126) List!126)

(assert (=> b!8019 (= (bitStreamReadBitsIntoList!0 (_2!552 lt!10661) (_1!554 lt!10693) (bvsub lt!10698 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!42 lt!10685))))

(declare-fun lt!10672 () Unit!598)

(assert (=> b!8019 (= lt!10672 lt!10683)))

(declare-fun lt!10658 () Unit!598)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!519 array!519 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!598)

(assert (=> b!8019 (= lt!10658 (arrayBitRangesEqImpliesEq!0 (buf!559 (_2!552 lt!10678)) (buf!559 (_2!552 lt!10661)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!10682 (bitIndex!0 (size!226 (buf!559 (_2!552 lt!10678))) (currentByte!1562 (_2!552 lt!10678)) (currentBit!1557 (_2!552 lt!10678)))))))

(declare-fun bitAt!0 (array!519 (_ BitVec 64)) Bool)

(assert (=> b!8019 (= (bitAt!0 (buf!559 (_2!552 lt!10678)) lt!10682) (bitAt!0 (buf!559 (_2!552 lt!10661)) lt!10682))))

(declare-fun lt!10692 () Unit!598)

(assert (=> b!8019 (= lt!10692 lt!10658)))

(declare-fun b!8020 () Bool)

(assert (=> b!8020 (= e!4985 (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) lt!10700))))

(declare-fun b!8021 () Bool)

(declare-fun res!8654 () Bool)

(assert (=> b!8021 (=> (not res!8654) (not e!4987))))

(assert (=> b!8021 (= res!8654 (= (size!226 (buf!559 thiss!1486)) (size!226 (buf!559 (_2!552 lt!10687)))))))

(assert (= (and d!2316 c!436) b!8019))

(assert (= (and d!2316 (not c!436)) b!8014))

(assert (= (or b!8019 b!8014) bm!89))

(assert (= (and d!2316 res!8652) b!8015))

(assert (= (and b!8015 res!8657) b!8021))

(assert (= (and b!8021 res!8654) b!8017))

(assert (= (and b!8017 res!8656) b!8016))

(assert (= (and b!8016 res!8653) b!8018))

(assert (= (and b!8018 res!8655) b!8020))

(declare-fun m!10319 () Bool)

(assert (=> b!8014 m!10319))

(declare-fun m!10321 () Bool)

(assert (=> b!8014 m!10321))

(declare-fun m!10323 () Bool)

(assert (=> b!8019 m!10323))

(declare-fun m!10325 () Bool)

(assert (=> b!8019 m!10325))

(assert (=> b!8019 m!9841))

(declare-fun m!10327 () Bool)

(assert (=> b!8019 m!10327))

(declare-fun m!10329 () Bool)

(assert (=> b!8019 m!10329))

(declare-fun m!10331 () Bool)

(assert (=> b!8019 m!10331))

(declare-fun m!10333 () Bool)

(assert (=> b!8019 m!10333))

(declare-fun m!10335 () Bool)

(assert (=> b!8019 m!10335))

(declare-fun m!10337 () Bool)

(assert (=> b!8019 m!10337))

(declare-fun m!10339 () Bool)

(assert (=> b!8019 m!10339))

(declare-fun m!10341 () Bool)

(assert (=> b!8019 m!10341))

(assert (=> b!8019 m!9951))

(declare-fun m!10343 () Bool)

(assert (=> b!8019 m!10343))

(assert (=> b!8019 m!10329))

(declare-fun m!10345 () Bool)

(assert (=> b!8019 m!10345))

(assert (=> b!8019 m!10341))

(declare-fun m!10347 () Bool)

(assert (=> b!8019 m!10347))

(declare-fun m!10349 () Bool)

(assert (=> b!8019 m!10349))

(assert (=> b!8019 m!10327))

(declare-fun m!10351 () Bool)

(assert (=> b!8019 m!10351))

(declare-fun m!10353 () Bool)

(assert (=> b!8019 m!10353))

(declare-fun m!10355 () Bool)

(assert (=> b!8019 m!10355))

(declare-fun m!10357 () Bool)

(assert (=> b!8019 m!10357))

(declare-fun m!10361 () Bool)

(assert (=> b!8019 m!10361))

(declare-fun m!10363 () Bool)

(assert (=> b!8019 m!10363))

(declare-fun m!10365 () Bool)

(assert (=> b!8019 m!10365))

(declare-fun m!10367 () Bool)

(assert (=> b!8019 m!10367))

(declare-fun m!10369 () Bool)

(assert (=> b!8019 m!10369))

(declare-fun m!10371 () Bool)

(assert (=> b!8019 m!10371))

(declare-fun m!10373 () Bool)

(assert (=> b!8019 m!10373))

(declare-fun m!10375 () Bool)

(assert (=> b!8019 m!10375))

(declare-fun m!10377 () Bool)

(assert (=> b!8019 m!10377))

(assert (=> b!8019 m!9951))

(declare-fun m!10379 () Bool)

(assert (=> b!8019 m!10379))

(declare-fun m!10381 () Bool)

(assert (=> b!8019 m!10381))

(declare-fun m!10383 () Bool)

(assert (=> b!8019 m!10383))

(declare-fun m!10385 () Bool)

(assert (=> b!8015 m!10385))

(declare-fun m!10387 () Bool)

(assert (=> b!8017 m!10387))

(declare-fun m!10389 () Bool)

(assert (=> bm!89 m!10389))

(declare-fun m!10391 () Bool)

(assert (=> d!2316 m!10391))

(assert (=> d!2316 m!9841))

(assert (=> d!2316 m!10007))

(assert (=> d!2316 m!10005))

(declare-fun m!10393 () Bool)

(assert (=> b!8020 m!10393))

(declare-fun m!10395 () Bool)

(assert (=> b!8018 m!10395))

(declare-fun m!10397 () Bool)

(assert (=> b!8018 m!10397))

(declare-fun m!10399 () Bool)

(assert (=> b!8018 m!10399))

(declare-fun m!10401 () Bool)

(assert (=> b!8018 m!10401))

(declare-fun m!10403 () Bool)

(assert (=> b!8018 m!10403))

(assert (=> b!7681 d!2316))

(declare-fun d!2346 () Bool)

(declare-fun res!8665 () Bool)

(declare-fun e!4995 () Bool)

(assert (=> d!2346 (=> res!8665 e!4995)))

(assert (=> d!2346 (= res!8665 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2346 (= (checkByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4995)))

(declare-fun b!8031 () Bool)

(declare-fun e!4996 () Bool)

(assert (=> b!8031 (= e!4995 e!4996)))

(declare-fun res!8666 () Bool)

(assert (=> b!8031 (=> (not res!8666) (not e!4996))))

(assert (=> b!8031 (= res!8666 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!628 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!628 (_1!553 lt!9916)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!8032 () Bool)

(assert (=> b!8032 (= e!4996 (checkByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2346 (not res!8665)) b!8031))

(assert (= (and b!8031 res!8666) b!8032))

(assert (=> b!8031 m!9951))

(assert (=> b!8031 m!9953))

(assert (=> b!8031 m!10123))

(assert (=> b!8031 m!10125))

(declare-fun m!10405 () Bool)

(assert (=> b!8032 m!10405))

(assert (=> b!7686 d!2346))

(declare-fun d!2348 () Bool)

(assert (=> d!2348 (checkByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!10703 () Unit!598)

(declare-fun choose!65 (BitStream!430 array!519 array!519 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!598)

(assert (=> d!2348 (= lt!10703 (choose!65 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2348 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2348 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!552 lt!9915) srcBuffer!6 (_1!553 lt!9916) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!10703)))

(declare-fun bs!804 () Bool)

(assert (= bs!804 d!2348))

(assert (=> bs!804 m!9833))

(declare-fun m!10407 () Bool)

(assert (=> bs!804 m!10407))

(assert (=> b!7686 d!2348))

(declare-fun d!2350 () Bool)

(declare-fun e!4999 () Bool)

(assert (=> d!2350 e!4999))

(declare-fun res!8672 () Bool)

(assert (=> d!2350 (=> (not res!8672) (not e!4999))))

(declare-fun lt!10721 () (_ BitVec 64))

(declare-fun lt!10719 () (_ BitVec 64))

(declare-fun lt!10720 () (_ BitVec 64))

(assert (=> d!2350 (= res!8672 (= lt!10720 (bvsub lt!10721 lt!10719)))))

(assert (=> d!2350 (or (= (bvand lt!10721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10719 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10721 lt!10719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2350 (= lt!10719 (remainingBits!0 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))) ((_ sign_extend 32) (currentByte!1562 (_2!552 lt!9915))) ((_ sign_extend 32) (currentBit!1557 (_2!552 lt!9915)))))))

(declare-fun lt!10718 () (_ BitVec 64))

(declare-fun lt!10716 () (_ BitVec 64))

(assert (=> d!2350 (= lt!10721 (bvmul lt!10718 lt!10716))))

(assert (=> d!2350 (or (= lt!10718 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10716 (bvsdiv (bvmul lt!10718 lt!10716) lt!10718)))))

(assert (=> d!2350 (= lt!10716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2350 (= lt!10718 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))))))

(assert (=> d!2350 (= lt!10720 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1562 (_2!552 lt!9915))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1557 (_2!552 lt!9915)))))))

(assert (=> d!2350 (invariant!0 (currentBit!1557 (_2!552 lt!9915)) (currentByte!1562 (_2!552 lt!9915)) (size!226 (buf!559 (_2!552 lt!9915))))))

(assert (=> d!2350 (= (bitIndex!0 (size!226 (buf!559 (_2!552 lt!9915))) (currentByte!1562 (_2!552 lt!9915)) (currentBit!1557 (_2!552 lt!9915))) lt!10720)))

(declare-fun b!8037 () Bool)

(declare-fun res!8671 () Bool)

(assert (=> b!8037 (=> (not res!8671) (not e!4999))))

(assert (=> b!8037 (= res!8671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10720))))

(declare-fun b!8038 () Bool)

(declare-fun lt!10717 () (_ BitVec 64))

(assert (=> b!8038 (= e!4999 (bvsle lt!10720 (bvmul lt!10717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8038 (or (= lt!10717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10717)))))

(assert (=> b!8038 (= lt!10717 ((_ sign_extend 32) (size!226 (buf!559 (_2!552 lt!9915)))))))

(assert (= (and d!2350 res!8672) b!8037))

(assert (= (and b!8037 res!8671) b!8038))

(declare-fun m!10409 () Bool)

(assert (=> d!2350 m!10409))

(assert (=> d!2350 m!9843))

(assert (=> b!7680 d!2350))

(declare-fun d!2352 () Bool)

(declare-fun e!5000 () Bool)

(assert (=> d!2352 e!5000))

(declare-fun res!8674 () Bool)

(assert (=> d!2352 (=> (not res!8674) (not e!5000))))

(declare-fun lt!10725 () (_ BitVec 64))

(declare-fun lt!10727 () (_ BitVec 64))

(declare-fun lt!10726 () (_ BitVec 64))

(assert (=> d!2352 (= res!8674 (= lt!10726 (bvsub lt!10727 lt!10725)))))

(assert (=> d!2352 (or (= (bvand lt!10727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!10725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!10727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!10727 lt!10725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2352 (= lt!10725 (remainingBits!0 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486))))))

(declare-fun lt!10724 () (_ BitVec 64))

(declare-fun lt!10722 () (_ BitVec 64))

(assert (=> d!2352 (= lt!10727 (bvmul lt!10724 lt!10722))))

(assert (=> d!2352 (or (= lt!10724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!10722 (bvsdiv (bvmul lt!10724 lt!10722) lt!10724)))))

(assert (=> d!2352 (= lt!10722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2352 (= lt!10724 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))))))

(assert (=> d!2352 (= lt!10726 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1562 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1557 thiss!1486))))))

(assert (=> d!2352 (invariant!0 (currentBit!1557 thiss!1486) (currentByte!1562 thiss!1486) (size!226 (buf!559 thiss!1486)))))

(assert (=> d!2352 (= (bitIndex!0 (size!226 (buf!559 thiss!1486)) (currentByte!1562 thiss!1486) (currentBit!1557 thiss!1486)) lt!10726)))

(declare-fun b!8039 () Bool)

(declare-fun res!8673 () Bool)

(assert (=> b!8039 (=> (not res!8673) (not e!5000))))

(assert (=> b!8039 (= res!8673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!10726))))

(declare-fun b!8040 () Bool)

(declare-fun lt!10723 () (_ BitVec 64))

(assert (=> b!8040 (= e!5000 (bvsle lt!10726 (bvmul lt!10723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8040 (or (= lt!10723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!10723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!10723)))))

(assert (=> b!8040 (= lt!10723 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))))))

(assert (= (and d!2352 res!8674) b!8039))

(assert (= (and b!8039 res!8673) b!8040))

(declare-fun m!10411 () Bool)

(assert (=> d!2352 m!10411))

(assert (=> d!2352 m!9963))

(assert (=> b!7680 d!2352))

(declare-fun d!2354 () Bool)

(assert (=> d!2354 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!226 (buf!559 thiss!1486))) ((_ sign_extend 32) (currentByte!1562 thiss!1486)) ((_ sign_extend 32) (currentBit!1557 thiss!1486))) nBits!460))))

(declare-fun bs!805 () Bool)

(assert (= bs!805 d!2354))

(assert (=> bs!805 m!10411))

(assert (=> b!7685 d!2354))

(push 1)

(assert (not b!7902))

(assert (not b!8017))

(assert (not b!7889))

(assert (not d!2308))

(assert (not b!8014))

(assert (not b!7840))

(assert (not d!2354))

(assert (not b!7890))

(assert (not b!7903))

(assert (not d!2276))

(assert (not d!2316))

(assert (not b!8020))

(assert (not b!7838))

(assert (not b!8019))

(assert (not d!2352))

(assert (not b!8018))

(assert (not bm!89))

(assert (not b!7913))

(assert (not b!7904))

(assert (not b!7915))

(assert (not d!2350))

(assert (not b!8032))

(assert (not b!8015))

(assert (not b!7839))

(assert (not d!2348))

(assert (not d!2270))

(assert (not b!7786))

(assert (not d!2286))

(assert (not b!7906))

(assert (not b!7841))

(assert (not b!7891))

(assert (not d!2284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

