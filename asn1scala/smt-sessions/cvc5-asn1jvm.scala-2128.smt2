; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53952 () Bool)

(assert start!53952)

(declare-fun b!251029 () Bool)

(declare-fun res!210191 () Bool)

(declare-fun e!173963 () Bool)

(assert (=> b!251029 (=> (not res!210191) (not e!173963))))

(declare-datatypes ((array!13669 0))(
  ( (array!13670 (arr!6982 (Array (_ BitVec 32) (_ BitVec 8))) (size!5995 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10912 0))(
  ( (BitStream!10913 (buf!6494 array!13669) (currentByte!11943 (_ BitVec 32)) (currentBit!11938 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10912)

(declare-datatypes ((Unit!18132 0))(
  ( (Unit!18133) )
))
(declare-datatypes ((tuple2!21534 0))(
  ( (tuple2!21535 (_1!11695 Unit!18132) (_2!11695 BitStream!10912)) )
))
(declare-fun lt!390008 () tuple2!21534)

(declare-fun isPrefixOf!0 (BitStream!10912 BitStream!10912) Bool)

(assert (=> b!251029 (= res!210191 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390008)))))

(declare-fun b!251030 () Bool)

(declare-fun e!173961 () Bool)

(assert (=> b!251030 (= e!173963 e!173961)))

(declare-fun res!210194 () Bool)

(assert (=> b!251030 (=> (not res!210194) (not e!173961))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21536 0))(
  ( (tuple2!21537 (_1!11696 BitStream!10912) (_2!11696 Bool)) )
))
(declare-fun lt!389996 () tuple2!21536)

(assert (=> b!251030 (= res!210194 (and (= (_2!11696 lt!389996) bit!26) (= (_1!11696 lt!389996) (_2!11695 lt!390008))))))

(declare-fun readBitPure!0 (BitStream!10912) tuple2!21536)

(declare-fun readerFrom!0 (BitStream!10912 (_ BitVec 32) (_ BitVec 32)) BitStream!10912)

(assert (=> b!251030 (= lt!389996 (readBitPure!0 (readerFrom!0 (_2!11695 lt!390008) (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005))))))

(declare-fun b!251031 () Bool)

(declare-fun e!173960 () Bool)

(declare-fun array_inv!5736 (array!13669) Bool)

(assert (=> b!251031 (= e!173960 (array_inv!5736 (buf!6494 thiss!1005)))))

(declare-fun b!251032 () Bool)

(declare-fun res!210193 () Bool)

(declare-fun e!173962 () Bool)

(assert (=> b!251032 (=> (not res!210193) (not e!173962))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251032 (= res!210193 (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(declare-fun b!251033 () Bool)

(declare-fun lt!390003 () tuple2!21534)

(assert (=> b!251033 (= e!173962 (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(declare-fun b!251034 () Bool)

(declare-fun res!210200 () Bool)

(declare-fun e!173967 () Bool)

(assert (=> b!251034 (=> (not res!210200) (not e!173967))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251034 (= res!210200 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))) ((_ sign_extend 32) (currentByte!11943 thiss!1005)) ((_ sign_extend 32) (currentBit!11938 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251035 () Bool)

(declare-fun res!210195 () Bool)

(declare-fun e!173969 () Bool)

(assert (=> b!251035 (=> (not res!210195) (not e!173969))))

(assert (=> b!251035 (= res!210195 (isPrefixOf!0 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(declare-fun b!251036 () Bool)

(declare-fun lt!390002 () tuple2!21536)

(declare-datatypes ((tuple2!21538 0))(
  ( (tuple2!21539 (_1!11697 BitStream!10912) (_2!11697 BitStream!10912)) )
))
(declare-fun lt!390009 () tuple2!21538)

(assert (=> b!251036 (= e!173969 (not (or (not (_2!11696 lt!390002)) (not (= (_1!11696 lt!390002) (_2!11697 lt!390009))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10912 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21536)

(assert (=> b!251036 (= lt!390002 (checkBitsLoopPure!0 (_1!11697 lt!390009) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389997 () (_ BitVec 64))

(assert (=> b!251036 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) lt!389997)))

(declare-fun lt!389999 () Unit!18132)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10912 array!13669 (_ BitVec 64)) Unit!18132)

(assert (=> b!251036 (= lt!389999 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11695 lt!390008) (buf!6494 (_2!11695 lt!390003)) lt!389997))))

(declare-fun reader!0 (BitStream!10912 BitStream!10912) tuple2!21538)

(assert (=> b!251036 (= lt!390009 (reader!0 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(declare-fun b!251037 () Bool)

(declare-fun e!173964 () Bool)

(assert (=> b!251037 (= e!173964 e!173963)))

(declare-fun res!210190 () Bool)

(assert (=> b!251037 (=> (not res!210190) (not e!173963))))

(declare-fun lt!389998 () (_ BitVec 64))

(declare-fun lt!390007 () (_ BitVec 64))

(assert (=> b!251037 (= res!210190 (= lt!389998 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390007)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251037 (= lt!389998 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))))))

(assert (=> b!251037 (= lt!390007 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(declare-fun res!210192 () Bool)

(assert (=> start!53952 (=> (not res!210192) (not e!173967))))

(assert (=> start!53952 (= res!210192 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53952 e!173967))

(assert (=> start!53952 true))

(declare-fun inv!12 (BitStream!10912) Bool)

(assert (=> start!53952 (and (inv!12 thiss!1005) e!173960)))

(declare-fun b!251038 () Bool)

(declare-fun lt!390011 () tuple2!21538)

(assert (=> b!251038 (= e!173967 (not (= (_2!11696 (readBitPure!0 (_1!11697 lt!390011))) bit!26)))))

(declare-fun lt!390000 () tuple2!21538)

(assert (=> b!251038 (= lt!390000 (reader!0 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(assert (=> b!251038 (= lt!390011 (reader!0 thiss!1005 (_2!11695 lt!390003)))))

(declare-fun e!173968 () Bool)

(assert (=> b!251038 e!173968))

(declare-fun res!210198 () Bool)

(assert (=> b!251038 (=> (not res!210198) (not e!173968))))

(declare-fun lt!390004 () tuple2!21536)

(declare-fun lt!390006 () tuple2!21536)

(assert (=> b!251038 (= res!210198 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390004))) (currentByte!11943 (_1!11696 lt!390004)) (currentBit!11938 (_1!11696 lt!390004))) (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390006))) (currentByte!11943 (_1!11696 lt!390006)) (currentBit!11938 (_1!11696 lt!390006)))))))

(declare-fun lt!390001 () Unit!18132)

(declare-fun lt!390005 () BitStream!10912)

(declare-fun readBitPrefixLemma!0 (BitStream!10912 BitStream!10912) Unit!18132)

(assert (=> b!251038 (= lt!390001 (readBitPrefixLemma!0 lt!390005 (_2!11695 lt!390003)))))

(assert (=> b!251038 (= lt!390006 (readBitPure!0 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005))))))

(assert (=> b!251038 (= lt!390004 (readBitPure!0 lt!390005))))

(assert (=> b!251038 (= lt!390005 (BitStream!10913 (buf!6494 (_2!11695 lt!390008)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(assert (=> b!251038 e!173962))

(declare-fun res!210201 () Bool)

(assert (=> b!251038 (=> (not res!210201) (not e!173962))))

(assert (=> b!251038 (= res!210201 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390003)))))

(declare-fun lt!390010 () Unit!18132)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10912 BitStream!10912 BitStream!10912) Unit!18132)

(assert (=> b!251038 (= lt!390010 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(declare-fun e!173965 () Bool)

(assert (=> b!251038 e!173965))

(declare-fun res!210197 () Bool)

(assert (=> b!251038 (=> (not res!210197) (not e!173965))))

(assert (=> b!251038 (= res!210197 (= (size!5995 (buf!6494 (_2!11695 lt!390008))) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10912 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21534)

(assert (=> b!251038 (= lt!390003 (appendNBitsLoop!0 (_2!11695 lt!390008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251038 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390012 () Unit!18132)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10912 BitStream!10912 (_ BitVec 64) (_ BitVec 64)) Unit!18132)

(assert (=> b!251038 (= lt!390012 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11695 lt!390008) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251038 e!173964))

(declare-fun res!210199 () Bool)

(assert (=> b!251038 (=> (not res!210199) (not e!173964))))

(assert (=> b!251038 (= res!210199 (= (size!5995 (buf!6494 thiss!1005)) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(declare-fun appendBit!0 (BitStream!10912 Bool) tuple2!21534)

(assert (=> b!251038 (= lt!390008 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251039 () Bool)

(declare-fun res!210189 () Bool)

(assert (=> b!251039 (=> (not res!210189) (not e!173967))))

(assert (=> b!251039 (= res!210189 (bvslt from!289 nBits!297))))

(declare-fun b!251040 () Bool)

(assert (=> b!251040 (= e!173961 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!389996))) (currentByte!11943 (_1!11696 lt!389996)) (currentBit!11938 (_1!11696 lt!389996))) lt!389998))))

(declare-fun b!251041 () Bool)

(assert (=> b!251041 (= e!173965 e!173969)))

(declare-fun res!210196 () Bool)

(assert (=> b!251041 (=> (not res!210196) (not e!173969))))

(assert (=> b!251041 (= res!210196 (= (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003))) (bvadd (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))) lt!389997)))))

(assert (=> b!251041 (= lt!389997 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251042 () Bool)

(assert (=> b!251042 (= e!173968 (= (_2!11696 lt!390004) (_2!11696 lt!390006)))))

(assert (= (and start!53952 res!210192) b!251034))

(assert (= (and b!251034 res!210200) b!251039))

(assert (= (and b!251039 res!210189) b!251038))

(assert (= (and b!251038 res!210199) b!251037))

(assert (= (and b!251037 res!210190) b!251029))

(assert (= (and b!251029 res!210191) b!251030))

(assert (= (and b!251030 res!210194) b!251040))

(assert (= (and b!251038 res!210197) b!251041))

(assert (= (and b!251041 res!210196) b!251035))

(assert (= (and b!251035 res!210195) b!251036))

(assert (= (and b!251038 res!210201) b!251032))

(assert (= (and b!251032 res!210193) b!251033))

(assert (= (and b!251038 res!210198) b!251042))

(assert (= start!53952 b!251031))

(declare-fun m!377655 () Bool)

(assert (=> b!251036 m!377655))

(declare-fun m!377657 () Bool)

(assert (=> b!251036 m!377657))

(declare-fun m!377659 () Bool)

(assert (=> b!251036 m!377659))

(declare-fun m!377661 () Bool)

(assert (=> b!251036 m!377661))

(declare-fun m!377663 () Bool)

(assert (=> b!251040 m!377663))

(declare-fun m!377665 () Bool)

(assert (=> b!251038 m!377665))

(declare-fun m!377667 () Bool)

(assert (=> b!251038 m!377667))

(declare-fun m!377669 () Bool)

(assert (=> b!251038 m!377669))

(assert (=> b!251038 m!377661))

(declare-fun m!377671 () Bool)

(assert (=> b!251038 m!377671))

(declare-fun m!377673 () Bool)

(assert (=> b!251038 m!377673))

(declare-fun m!377675 () Bool)

(assert (=> b!251038 m!377675))

(declare-fun m!377677 () Bool)

(assert (=> b!251038 m!377677))

(declare-fun m!377679 () Bool)

(assert (=> b!251038 m!377679))

(declare-fun m!377681 () Bool)

(assert (=> b!251038 m!377681))

(declare-fun m!377683 () Bool)

(assert (=> b!251038 m!377683))

(declare-fun m!377685 () Bool)

(assert (=> b!251038 m!377685))

(declare-fun m!377687 () Bool)

(assert (=> b!251038 m!377687))

(declare-fun m!377689 () Bool)

(assert (=> b!251038 m!377689))

(declare-fun m!377691 () Bool)

(assert (=> b!251034 m!377691))

(declare-fun m!377693 () Bool)

(assert (=> start!53952 m!377693))

(declare-fun m!377695 () Bool)

(assert (=> b!251030 m!377695))

(assert (=> b!251030 m!377695))

(declare-fun m!377697 () Bool)

(assert (=> b!251030 m!377697))

(declare-fun m!377699 () Bool)

(assert (=> b!251035 m!377699))

(declare-fun m!377701 () Bool)

(assert (=> b!251041 m!377701))

(declare-fun m!377703 () Bool)

(assert (=> b!251041 m!377703))

(declare-fun m!377705 () Bool)

(assert (=> b!251031 m!377705))

(declare-fun m!377707 () Bool)

(assert (=> b!251029 m!377707))

(assert (=> b!251037 m!377703))

(declare-fun m!377709 () Bool)

(assert (=> b!251037 m!377709))

(declare-fun m!377711 () Bool)

(assert (=> b!251032 m!377711))

(declare-fun m!377713 () Bool)

(assert (=> b!251033 m!377713))

(push 1)

(assert (not start!53952))

(assert (not b!251031))

(assert (not b!251030))

(assert (not b!251032))

(assert (not b!251034))

(assert (not b!251041))

(assert (not b!251029))

(assert (not b!251033))

(assert (not b!251035))

(assert (not b!251037))

(assert (not b!251040))

(assert (not b!251036))

(assert (not b!251038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84130 () Bool)

(declare-datatypes ((tuple2!21556 0))(
  ( (tuple2!21557 (_1!11706 Bool) (_2!11706 BitStream!10912)) )
))
(declare-fun lt!390341 () tuple2!21556)

(declare-fun readBit!0 (BitStream!10912) tuple2!21556)

(assert (=> d!84130 (= lt!390341 (readBit!0 (readerFrom!0 (_2!11695 lt!390008) (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005))))))

(assert (=> d!84130 (= (readBitPure!0 (readerFrom!0 (_2!11695 lt!390008) (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005))) (tuple2!21537 (_2!11706 lt!390341) (_1!11706 lt!390341)))))

(declare-fun bs!21308 () Bool)

(assert (= bs!21308 d!84130))

(assert (=> bs!21308 m!377695))

(declare-fun m!377995 () Bool)

(assert (=> bs!21308 m!377995))

(assert (=> b!251030 d!84130))

(declare-fun d!84136 () Bool)

(declare-fun e!174092 () Bool)

(assert (=> d!84136 e!174092))

(declare-fun res!210381 () Bool)

(assert (=> d!84136 (=> (not res!210381) (not e!174092))))

(assert (=> d!84136 (= res!210381 (invariant!0 (currentBit!11938 (_2!11695 lt!390008)) (currentByte!11943 (_2!11695 lt!390008)) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(assert (=> d!84136 (= (readerFrom!0 (_2!11695 lt!390008) (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005)) (BitStream!10913 (buf!6494 (_2!11695 lt!390008)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(declare-fun b!251234 () Bool)

(assert (=> b!251234 (= e!174092 (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(assert (= (and d!84136 res!210381) b!251234))

(declare-fun m!377999 () Bool)

(assert (=> d!84136 m!377999))

(assert (=> b!251234 m!377711))

(assert (=> b!251030 d!84136))

(declare-fun d!84140 () Bool)

(declare-fun res!210390 () Bool)

(declare-fun e!174097 () Bool)

(assert (=> d!84140 (=> (not res!210390) (not e!174097))))

(assert (=> d!84140 (= res!210390 (= (size!5995 (buf!6494 thiss!1005)) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(assert (=> d!84140 (= (isPrefixOf!0 thiss!1005 (_2!11695 lt!390008)) e!174097)))

(declare-fun b!251241 () Bool)

(declare-fun res!210389 () Bool)

(assert (=> b!251241 (=> (not res!210389) (not e!174097))))

(assert (=> b!251241 (= res!210389 (bvsle (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)) (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008)))))))

(declare-fun b!251242 () Bool)

(declare-fun e!174098 () Bool)

(assert (=> b!251242 (= e!174097 e!174098)))

(declare-fun res!210388 () Bool)

(assert (=> b!251242 (=> res!210388 e!174098)))

(assert (=> b!251242 (= res!210388 (= (size!5995 (buf!6494 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251243 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13669 array!13669 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251243 (= e!174098 (arrayBitRangesEq!0 (buf!6494 thiss!1005) (buf!6494 (_2!11695 lt!390008)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005))))))

(assert (= (and d!84140 res!210390) b!251241))

(assert (= (and b!251241 res!210389) b!251242))

(assert (= (and b!251242 (not res!210388)) b!251243))

(assert (=> b!251241 m!377709))

(assert (=> b!251241 m!377703))

(assert (=> b!251243 m!377709))

(assert (=> b!251243 m!377709))

(declare-fun m!378001 () Bool)

(assert (=> b!251243 m!378001))

(assert (=> b!251029 d!84140))

(declare-fun d!84142 () Bool)

(declare-fun e!174101 () Bool)

(assert (=> d!84142 e!174101))

(declare-fun res!210396 () Bool)

(assert (=> d!84142 (=> (not res!210396) (not e!174101))))

(declare-fun lt!390362 () (_ BitVec 64))

(declare-fun lt!390359 () (_ BitVec 64))

(declare-fun lt!390361 () (_ BitVec 64))

(assert (=> d!84142 (= res!210396 (= lt!390361 (bvsub lt!390359 lt!390362)))))

(assert (=> d!84142 (or (= (bvand lt!390359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390359 lt!390362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84142 (= lt!390362 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!389996)))) ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!389996))) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!389996)))))))

(declare-fun lt!390358 () (_ BitVec 64))

(declare-fun lt!390357 () (_ BitVec 64))

(assert (=> d!84142 (= lt!390359 (bvmul lt!390358 lt!390357))))

(assert (=> d!84142 (or (= lt!390358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390357 (bvsdiv (bvmul lt!390358 lt!390357) lt!390358)))))

(assert (=> d!84142 (= lt!390357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84142 (= lt!390358 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!389996)))))))

(assert (=> d!84142 (= lt!390361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!389996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!389996)))))))

(assert (=> d!84142 (invariant!0 (currentBit!11938 (_1!11696 lt!389996)) (currentByte!11943 (_1!11696 lt!389996)) (size!5995 (buf!6494 (_1!11696 lt!389996))))))

(assert (=> d!84142 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!389996))) (currentByte!11943 (_1!11696 lt!389996)) (currentBit!11938 (_1!11696 lt!389996))) lt!390361)))

(declare-fun b!251248 () Bool)

(declare-fun res!210395 () Bool)

(assert (=> b!251248 (=> (not res!210395) (not e!174101))))

(assert (=> b!251248 (= res!210395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390361))))

(declare-fun b!251249 () Bool)

(declare-fun lt!390360 () (_ BitVec 64))

(assert (=> b!251249 (= e!174101 (bvsle lt!390361 (bvmul lt!390360 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251249 (or (= lt!390360 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390360 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390360)))))

(assert (=> b!251249 (= lt!390360 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!389996)))))))

(assert (= (and d!84142 res!210396) b!251248))

(assert (= (and b!251248 res!210395) b!251249))

(declare-fun m!378003 () Bool)

(assert (=> d!84142 m!378003))

(declare-fun m!378005 () Bool)

(assert (=> d!84142 m!378005))

(assert (=> b!251040 d!84142))

(declare-fun d!84144 () Bool)

(assert (=> d!84144 (= (array_inv!5736 (buf!6494 thiss!1005)) (bvsge (size!5995 (buf!6494 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!251031 d!84144))

(declare-fun d!84146 () Bool)

(declare-fun e!174102 () Bool)

(assert (=> d!84146 e!174102))

(declare-fun res!210398 () Bool)

(assert (=> d!84146 (=> (not res!210398) (not e!174102))))

(declare-fun lt!390368 () (_ BitVec 64))

(declare-fun lt!390367 () (_ BitVec 64))

(declare-fun lt!390365 () (_ BitVec 64))

(assert (=> d!84146 (= res!210398 (= lt!390367 (bvsub lt!390365 lt!390368)))))

(assert (=> d!84146 (or (= (bvand lt!390365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390368 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390365 lt!390368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84146 (= lt!390368 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390003))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390003)))))))

(declare-fun lt!390364 () (_ BitVec 64))

(declare-fun lt!390363 () (_ BitVec 64))

(assert (=> d!84146 (= lt!390365 (bvmul lt!390364 lt!390363))))

(assert (=> d!84146 (or (= lt!390364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390363 (bvsdiv (bvmul lt!390364 lt!390363) lt!390364)))))

(assert (=> d!84146 (= lt!390363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84146 (= lt!390364 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(assert (=> d!84146 (= lt!390367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390003))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390003)))))))

(assert (=> d!84146 (invariant!0 (currentBit!11938 (_2!11695 lt!390003)) (currentByte!11943 (_2!11695 lt!390003)) (size!5995 (buf!6494 (_2!11695 lt!390003))))))

(assert (=> d!84146 (= (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003))) lt!390367)))

(declare-fun b!251250 () Bool)

(declare-fun res!210397 () Bool)

(assert (=> b!251250 (=> (not res!210397) (not e!174102))))

(assert (=> b!251250 (= res!210397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390367))))

(declare-fun b!251251 () Bool)

(declare-fun lt!390366 () (_ BitVec 64))

(assert (=> b!251251 (= e!174102 (bvsle lt!390367 (bvmul lt!390366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251251 (or (= lt!390366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390366)))))

(assert (=> b!251251 (= lt!390366 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(assert (= (and d!84146 res!210398) b!251250))

(assert (= (and b!251250 res!210397) b!251251))

(declare-fun m!378007 () Bool)

(assert (=> d!84146 m!378007))

(declare-fun m!378009 () Bool)

(assert (=> d!84146 m!378009))

(assert (=> b!251041 d!84146))

(declare-fun d!84148 () Bool)

(declare-fun e!174103 () Bool)

(assert (=> d!84148 e!174103))

(declare-fun res!210400 () Bool)

(assert (=> d!84148 (=> (not res!210400) (not e!174103))))

(declare-fun lt!390374 () (_ BitVec 64))

(declare-fun lt!390371 () (_ BitVec 64))

(declare-fun lt!390373 () (_ BitVec 64))

(assert (=> d!84148 (= res!210400 (= lt!390373 (bvsub lt!390371 lt!390374)))))

(assert (=> d!84148 (or (= (bvand lt!390371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390371 lt!390374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84148 (= lt!390374 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008)))))))

(declare-fun lt!390370 () (_ BitVec 64))

(declare-fun lt!390369 () (_ BitVec 64))

(assert (=> d!84148 (= lt!390371 (bvmul lt!390370 lt!390369))))

(assert (=> d!84148 (or (= lt!390370 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390369 (bvsdiv (bvmul lt!390370 lt!390369) lt!390370)))))

(assert (=> d!84148 (= lt!390369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84148 (= lt!390370 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(assert (=> d!84148 (= lt!390373 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008)))))))

(assert (=> d!84148 (invariant!0 (currentBit!11938 (_2!11695 lt!390008)) (currentByte!11943 (_2!11695 lt!390008)) (size!5995 (buf!6494 (_2!11695 lt!390008))))))

(assert (=> d!84148 (= (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))) lt!390373)))

(declare-fun b!251252 () Bool)

(declare-fun res!210399 () Bool)

(assert (=> b!251252 (=> (not res!210399) (not e!174103))))

(assert (=> b!251252 (= res!210399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390373))))

(declare-fun b!251253 () Bool)

(declare-fun lt!390372 () (_ BitVec 64))

(assert (=> b!251253 (= e!174103 (bvsle lt!390373 (bvmul lt!390372 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251253 (or (= lt!390372 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390372 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390372)))))

(assert (=> b!251253 (= lt!390372 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))))))

(assert (= (and d!84148 res!210400) b!251252))

(assert (= (and b!251252 res!210399) b!251253))

(declare-fun m!378011 () Bool)

(assert (=> d!84148 m!378011))

(assert (=> d!84148 m!377999))

(assert (=> b!251041 d!84148))

(declare-fun d!84150 () Bool)

(assert (=> d!84150 (= (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390008)))) (and (bvsge (currentBit!11938 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11938 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11943 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390008)))) (and (= (currentBit!11938 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390008))))))))))

(assert (=> b!251032 d!84150))

(declare-fun d!84152 () Bool)

(assert (=> d!84152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))) ((_ sign_extend 32) (currentByte!11943 thiss!1005)) ((_ sign_extend 32) (currentBit!11938 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))) ((_ sign_extend 32) (currentByte!11943 thiss!1005)) ((_ sign_extend 32) (currentBit!11938 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21310 () Bool)

(assert (= bs!21310 d!84152))

(declare-fun m!378013 () Bool)

(assert (=> bs!21310 m!378013))

(assert (=> b!251034 d!84152))

(declare-fun d!84154 () Bool)

(assert (=> d!84154 (= (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390003)))) (and (bvsge (currentBit!11938 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11938 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11943 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390003)))) (and (= (currentBit!11938 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11943 thiss!1005) (size!5995 (buf!6494 (_2!11695 lt!390003))))))))))

(assert (=> b!251033 d!84154))

(declare-fun d!84156 () Bool)

(declare-fun res!210409 () Bool)

(declare-fun e!174108 () Bool)

(assert (=> d!84156 (=> (not res!210409) (not e!174108))))

(assert (=> d!84156 (= res!210409 (= (size!5995 (buf!6494 (_2!11695 lt!390008))) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(assert (=> d!84156 (= (isPrefixOf!0 (_2!11695 lt!390008) (_2!11695 lt!390003)) e!174108)))

(declare-fun b!251264 () Bool)

(declare-fun res!210408 () Bool)

(assert (=> b!251264 (=> (not res!210408) (not e!174108))))

(assert (=> b!251264 (= res!210408 (bvsle (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))) (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003)))))))

(declare-fun b!251265 () Bool)

(declare-fun e!174109 () Bool)

(assert (=> b!251265 (= e!174108 e!174109)))

(declare-fun res!210407 () Bool)

(assert (=> b!251265 (=> res!210407 e!174109)))

(assert (=> b!251265 (= res!210407 (= (size!5995 (buf!6494 (_2!11695 lt!390008))) #b00000000000000000000000000000000))))

(declare-fun b!251266 () Bool)

(assert (=> b!251266 (= e!174109 (arrayBitRangesEq!0 (buf!6494 (_2!11695 lt!390008)) (buf!6494 (_2!11695 lt!390003)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008)))))))

(assert (= (and d!84156 res!210409) b!251264))

(assert (= (and b!251264 res!210408) b!251265))

(assert (= (and b!251265 (not res!210407)) b!251266))

(assert (=> b!251264 m!377703))

(assert (=> b!251264 m!377701))

(assert (=> b!251266 m!377703))

(assert (=> b!251266 m!377703))

(declare-fun m!378015 () Bool)

(assert (=> b!251266 m!378015))

(assert (=> b!251035 d!84156))

(declare-fun d!84158 () Bool)

(declare-fun lt!390437 () tuple2!21556)

(declare-fun checkBitsLoop!0 (BitStream!10912 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21556)

(assert (=> d!84158 (= lt!390437 (checkBitsLoop!0 (_1!11697 lt!390009) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84158 (= (checkBitsLoopPure!0 (_1!11697 lt!390009) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21537 (_2!11706 lt!390437) (_1!11706 lt!390437)))))

(declare-fun bs!21311 () Bool)

(assert (= bs!21311 d!84158))

(declare-fun m!378017 () Bool)

(assert (=> bs!21311 m!378017))

(assert (=> b!251036 d!84158))

(declare-fun d!84160 () Bool)

(assert (=> d!84160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) lt!389997) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008)))) lt!389997))))

(declare-fun bs!21312 () Bool)

(assert (= bs!21312 d!84160))

(declare-fun m!378019 () Bool)

(assert (=> bs!21312 m!378019))

(assert (=> b!251036 d!84160))

(declare-fun d!84162 () Bool)

(assert (=> d!84162 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390003)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) lt!389997)))

(declare-fun lt!390446 () Unit!18132)

(declare-fun choose!9 (BitStream!10912 array!13669 (_ BitVec 64) BitStream!10912) Unit!18132)

(assert (=> d!84162 (= lt!390446 (choose!9 (_2!11695 lt!390008) (buf!6494 (_2!11695 lt!390003)) lt!389997 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008)))))))

(assert (=> d!84162 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11695 lt!390008) (buf!6494 (_2!11695 lt!390003)) lt!389997) lt!390446)))

(declare-fun bs!21314 () Bool)

(assert (= bs!21314 d!84162))

(assert (=> bs!21314 m!377657))

(declare-fun m!378055 () Bool)

(assert (=> bs!21314 m!378055))

(assert (=> b!251036 d!84162))

(declare-fun b!251302 () Bool)

(declare-fun e!174131 () Unit!18132)

(declare-fun Unit!18141 () Unit!18132)

(assert (=> b!251302 (= e!174131 Unit!18141)))

(declare-fun d!84170 () Bool)

(declare-fun e!174130 () Bool)

(assert (=> d!84170 e!174130))

(declare-fun res!210441 () Bool)

(assert (=> d!84170 (=> (not res!210441) (not e!174130))))

(declare-fun lt!390544 () tuple2!21538)

(assert (=> d!84170 (= res!210441 (isPrefixOf!0 (_1!11697 lt!390544) (_2!11697 lt!390544)))))

(declare-fun lt!390539 () BitStream!10912)

(assert (=> d!84170 (= lt!390544 (tuple2!21539 lt!390539 (_2!11695 lt!390003)))))

(declare-fun lt!390533 () Unit!18132)

(declare-fun lt!390536 () Unit!18132)

(assert (=> d!84170 (= lt!390533 lt!390536)))

(assert (=> d!84170 (isPrefixOf!0 lt!390539 (_2!11695 lt!390003))))

(assert (=> d!84170 (= lt!390536 (lemmaIsPrefixTransitive!0 lt!390539 (_2!11695 lt!390003) (_2!11695 lt!390003)))))

(declare-fun lt!390545 () Unit!18132)

(declare-fun lt!390538 () Unit!18132)

(assert (=> d!84170 (= lt!390545 lt!390538)))

(assert (=> d!84170 (isPrefixOf!0 lt!390539 (_2!11695 lt!390003))))

(assert (=> d!84170 (= lt!390538 (lemmaIsPrefixTransitive!0 lt!390539 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(declare-fun lt!390543 () Unit!18132)

(assert (=> d!84170 (= lt!390543 e!174131)))

(declare-fun c!11624 () Bool)

(assert (=> d!84170 (= c!11624 (not (= (size!5995 (buf!6494 (_2!11695 lt!390008))) #b00000000000000000000000000000000)))))

(declare-fun lt!390531 () Unit!18132)

(declare-fun lt!390526 () Unit!18132)

(assert (=> d!84170 (= lt!390531 lt!390526)))

(assert (=> d!84170 (isPrefixOf!0 (_2!11695 lt!390003) (_2!11695 lt!390003))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10912) Unit!18132)

(assert (=> d!84170 (= lt!390526 (lemmaIsPrefixRefl!0 (_2!11695 lt!390003)))))

(declare-fun lt!390532 () Unit!18132)

(declare-fun lt!390537 () Unit!18132)

(assert (=> d!84170 (= lt!390532 lt!390537)))

(assert (=> d!84170 (= lt!390537 (lemmaIsPrefixRefl!0 (_2!11695 lt!390003)))))

(declare-fun lt!390541 () Unit!18132)

(declare-fun lt!390528 () Unit!18132)

(assert (=> d!84170 (= lt!390541 lt!390528)))

(assert (=> d!84170 (isPrefixOf!0 lt!390539 lt!390539)))

(assert (=> d!84170 (= lt!390528 (lemmaIsPrefixRefl!0 lt!390539))))

(declare-fun lt!390542 () Unit!18132)

(declare-fun lt!390527 () Unit!18132)

(assert (=> d!84170 (= lt!390542 lt!390527)))

(assert (=> d!84170 (isPrefixOf!0 (_2!11695 lt!390008) (_2!11695 lt!390008))))

(assert (=> d!84170 (= lt!390527 (lemmaIsPrefixRefl!0 (_2!11695 lt!390008)))))

(assert (=> d!84170 (= lt!390539 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))))))

(assert (=> d!84170 (isPrefixOf!0 (_2!11695 lt!390008) (_2!11695 lt!390003))))

(assert (=> d!84170 (= (reader!0 (_2!11695 lt!390008) (_2!11695 lt!390003)) lt!390544)))

(declare-fun lt!390529 () (_ BitVec 64))

(declare-fun lt!390535 () (_ BitVec 64))

(declare-fun b!251303 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10912 (_ BitVec 64)) BitStream!10912)

(assert (=> b!251303 (= e!174130 (= (_1!11697 lt!390544) (withMovedBitIndex!0 (_2!11697 lt!390544) (bvsub lt!390535 lt!390529))))))

(assert (=> b!251303 (or (= (bvand lt!390535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390535 lt!390529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251303 (= lt!390529 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003))))))

(assert (=> b!251303 (= lt!390535 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))))))

(declare-fun b!251304 () Bool)

(declare-fun res!210440 () Bool)

(assert (=> b!251304 (=> (not res!210440) (not e!174130))))

(assert (=> b!251304 (= res!210440 (isPrefixOf!0 (_2!11697 lt!390544) (_2!11695 lt!390003)))))

(declare-fun b!251305 () Bool)

(declare-fun lt!390540 () Unit!18132)

(assert (=> b!251305 (= e!174131 lt!390540)))

(declare-fun lt!390534 () (_ BitVec 64))

(assert (=> b!251305 (= lt!390534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390530 () (_ BitVec 64))

(assert (=> b!251305 (= lt!390530 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13669 array!13669 (_ BitVec 64) (_ BitVec 64)) Unit!18132)

(assert (=> b!251305 (= lt!390540 (arrayBitRangesEqSymmetric!0 (buf!6494 (_2!11695 lt!390008)) (buf!6494 (_2!11695 lt!390003)) lt!390534 lt!390530))))

(assert (=> b!251305 (arrayBitRangesEq!0 (buf!6494 (_2!11695 lt!390003)) (buf!6494 (_2!11695 lt!390008)) lt!390534 lt!390530)))

(declare-fun b!251306 () Bool)

(declare-fun res!210439 () Bool)

(assert (=> b!251306 (=> (not res!210439) (not e!174130))))

(assert (=> b!251306 (= res!210439 (isPrefixOf!0 (_1!11697 lt!390544) (_2!11695 lt!390008)))))

(assert (= (and d!84170 c!11624) b!251305))

(assert (= (and d!84170 (not c!11624)) b!251302))

(assert (= (and d!84170 res!210441) b!251306))

(assert (= (and b!251306 res!210439) b!251304))

(assert (= (and b!251304 res!210440) b!251303))

(declare-fun m!378093 () Bool)

(assert (=> b!251306 m!378093))

(declare-fun m!378095 () Bool)

(assert (=> b!251303 m!378095))

(assert (=> b!251303 m!377701))

(assert (=> b!251303 m!377703))

(declare-fun m!378097 () Bool)

(assert (=> b!251304 m!378097))

(assert (=> d!84170 m!377699))

(declare-fun m!378099 () Bool)

(assert (=> d!84170 m!378099))

(declare-fun m!378101 () Bool)

(assert (=> d!84170 m!378101))

(declare-fun m!378103 () Bool)

(assert (=> d!84170 m!378103))

(declare-fun m!378105 () Bool)

(assert (=> d!84170 m!378105))

(declare-fun m!378107 () Bool)

(assert (=> d!84170 m!378107))

(declare-fun m!378109 () Bool)

(assert (=> d!84170 m!378109))

(declare-fun m!378111 () Bool)

(assert (=> d!84170 m!378111))

(declare-fun m!378113 () Bool)

(assert (=> d!84170 m!378113))

(declare-fun m!378115 () Bool)

(assert (=> d!84170 m!378115))

(declare-fun m!378117 () Bool)

(assert (=> d!84170 m!378117))

(assert (=> b!251305 m!377703))

(declare-fun m!378119 () Bool)

(assert (=> b!251305 m!378119))

(declare-fun m!378121 () Bool)

(assert (=> b!251305 m!378121))

(assert (=> b!251036 d!84170))

(assert (=> b!251038 d!84170))

(declare-fun d!84196 () Bool)

(declare-fun e!174136 () Bool)

(assert (=> d!84196 e!174136))

(declare-fun res!210450 () Bool)

(assert (=> d!84196 (=> (not res!210450) (not e!174136))))

(assert (=> d!84196 (= res!210450 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!390554 () Unit!18132)

(declare-fun choose!27 (BitStream!10912 BitStream!10912 (_ BitVec 64) (_ BitVec 64)) Unit!18132)

(assert (=> d!84196 (= lt!390554 (choose!27 thiss!1005 (_2!11695 lt!390008) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84196 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84196 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11695 lt!390008) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!390554)))

(declare-fun b!251315 () Bool)

(assert (=> b!251315 (= e!174136 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84196 res!210450) b!251315))

(declare-fun m!378123 () Bool)

(assert (=> d!84196 m!378123))

(assert (=> b!251315 m!377689))

(assert (=> b!251038 d!84196))

(declare-fun b!251319 () Bool)

(declare-fun e!174140 () Unit!18132)

(declare-fun Unit!18142 () Unit!18132)

(assert (=> b!251319 (= e!174140 Unit!18142)))

(declare-fun d!84198 () Bool)

(declare-fun e!174139 () Bool)

(assert (=> d!84198 e!174139))

(declare-fun res!210455 () Bool)

(assert (=> d!84198 (=> (not res!210455) (not e!174139))))

(declare-fun lt!390575 () tuple2!21538)

(assert (=> d!84198 (= res!210455 (isPrefixOf!0 (_1!11697 lt!390575) (_2!11697 lt!390575)))))

(declare-fun lt!390570 () BitStream!10912)

(assert (=> d!84198 (= lt!390575 (tuple2!21539 lt!390570 (_2!11695 lt!390003)))))

(declare-fun lt!390564 () Unit!18132)

(declare-fun lt!390567 () Unit!18132)

(assert (=> d!84198 (= lt!390564 lt!390567)))

(assert (=> d!84198 (isPrefixOf!0 lt!390570 (_2!11695 lt!390003))))

(assert (=> d!84198 (= lt!390567 (lemmaIsPrefixTransitive!0 lt!390570 (_2!11695 lt!390003) (_2!11695 lt!390003)))))

(declare-fun lt!390576 () Unit!18132)

(declare-fun lt!390569 () Unit!18132)

(assert (=> d!84198 (= lt!390576 lt!390569)))

(assert (=> d!84198 (isPrefixOf!0 lt!390570 (_2!11695 lt!390003))))

(assert (=> d!84198 (= lt!390569 (lemmaIsPrefixTransitive!0 lt!390570 thiss!1005 (_2!11695 lt!390003)))))

(declare-fun lt!390574 () Unit!18132)

(assert (=> d!84198 (= lt!390574 e!174140)))

(declare-fun c!11625 () Bool)

(assert (=> d!84198 (= c!11625 (not (= (size!5995 (buf!6494 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!390562 () Unit!18132)

(declare-fun lt!390557 () Unit!18132)

(assert (=> d!84198 (= lt!390562 lt!390557)))

(assert (=> d!84198 (isPrefixOf!0 (_2!11695 lt!390003) (_2!11695 lt!390003))))

(assert (=> d!84198 (= lt!390557 (lemmaIsPrefixRefl!0 (_2!11695 lt!390003)))))

(declare-fun lt!390563 () Unit!18132)

(declare-fun lt!390568 () Unit!18132)

(assert (=> d!84198 (= lt!390563 lt!390568)))

(assert (=> d!84198 (= lt!390568 (lemmaIsPrefixRefl!0 (_2!11695 lt!390003)))))

(declare-fun lt!390572 () Unit!18132)

(declare-fun lt!390559 () Unit!18132)

(assert (=> d!84198 (= lt!390572 lt!390559)))

(assert (=> d!84198 (isPrefixOf!0 lt!390570 lt!390570)))

(assert (=> d!84198 (= lt!390559 (lemmaIsPrefixRefl!0 lt!390570))))

(declare-fun lt!390573 () Unit!18132)

(declare-fun lt!390558 () Unit!18132)

(assert (=> d!84198 (= lt!390573 lt!390558)))

(assert (=> d!84198 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84198 (= lt!390558 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84198 (= lt!390570 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(assert (=> d!84198 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390003))))

(assert (=> d!84198 (= (reader!0 thiss!1005 (_2!11695 lt!390003)) lt!390575)))

(declare-fun lt!390560 () (_ BitVec 64))

(declare-fun b!251320 () Bool)

(declare-fun lt!390566 () (_ BitVec 64))

(assert (=> b!251320 (= e!174139 (= (_1!11697 lt!390575) (withMovedBitIndex!0 (_2!11697 lt!390575) (bvsub lt!390566 lt!390560))))))

(assert (=> b!251320 (or (= (bvand lt!390566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390566 lt!390560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251320 (= lt!390560 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003))))))

(assert (=> b!251320 (= lt!390566 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(declare-fun b!251321 () Bool)

(declare-fun res!210454 () Bool)

(assert (=> b!251321 (=> (not res!210454) (not e!174139))))

(assert (=> b!251321 (= res!210454 (isPrefixOf!0 (_2!11697 lt!390575) (_2!11695 lt!390003)))))

(declare-fun b!251322 () Bool)

(declare-fun lt!390571 () Unit!18132)

(assert (=> b!251322 (= e!174140 lt!390571)))

(declare-fun lt!390565 () (_ BitVec 64))

(assert (=> b!251322 (= lt!390565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390561 () (_ BitVec 64))

(assert (=> b!251322 (= lt!390561 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(assert (=> b!251322 (= lt!390571 (arrayBitRangesEqSymmetric!0 (buf!6494 thiss!1005) (buf!6494 (_2!11695 lt!390003)) lt!390565 lt!390561))))

(assert (=> b!251322 (arrayBitRangesEq!0 (buf!6494 (_2!11695 lt!390003)) (buf!6494 thiss!1005) lt!390565 lt!390561)))

(declare-fun b!251323 () Bool)

(declare-fun res!210453 () Bool)

(assert (=> b!251323 (=> (not res!210453) (not e!174139))))

(assert (=> b!251323 (= res!210453 (isPrefixOf!0 (_1!11697 lt!390575) thiss!1005))))

(assert (= (and d!84198 c!11625) b!251322))

(assert (= (and d!84198 (not c!11625)) b!251319))

(assert (= (and d!84198 res!210455) b!251323))

(assert (= (and b!251323 res!210453) b!251321))

(assert (= (and b!251321 res!210454) b!251320))

(declare-fun m!378125 () Bool)

(assert (=> b!251323 m!378125))

(declare-fun m!378127 () Bool)

(assert (=> b!251320 m!378127))

(assert (=> b!251320 m!377701))

(assert (=> b!251320 m!377709))

(declare-fun m!378129 () Bool)

(assert (=> b!251321 m!378129))

(assert (=> d!84198 m!377683))

(declare-fun m!378131 () Bool)

(assert (=> d!84198 m!378131))

(declare-fun m!378133 () Bool)

(assert (=> d!84198 m!378133))

(declare-fun m!378135 () Bool)

(assert (=> d!84198 m!378135))

(declare-fun m!378137 () Bool)

(assert (=> d!84198 m!378137))

(assert (=> d!84198 m!378107))

(assert (=> d!84198 m!378109))

(declare-fun m!378139 () Bool)

(assert (=> d!84198 m!378139))

(declare-fun m!378141 () Bool)

(assert (=> d!84198 m!378141))

(declare-fun m!378143 () Bool)

(assert (=> d!84198 m!378143))

(declare-fun m!378145 () Bool)

(assert (=> d!84198 m!378145))

(assert (=> b!251322 m!377709))

(declare-fun m!378147 () Bool)

(assert (=> b!251322 m!378147))

(declare-fun m!378149 () Bool)

(assert (=> b!251322 m!378149))

(assert (=> b!251038 d!84198))

(declare-fun d!84200 () Bool)

(declare-fun e!174145 () Bool)

(assert (=> d!84200 e!174145))

(declare-fun res!210462 () Bool)

(assert (=> d!84200 (=> (not res!210462) (not e!174145))))

(declare-fun lt!390590 () tuple2!21536)

(declare-fun lt!390589 () tuple2!21536)

(assert (=> d!84200 (= res!210462 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390590))) (currentByte!11943 (_1!11696 lt!390590)) (currentBit!11938 (_1!11696 lt!390590))) (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390589))) (currentByte!11943 (_1!11696 lt!390589)) (currentBit!11938 (_1!11696 lt!390589)))))))

(declare-fun lt!390591 () Unit!18132)

(declare-fun lt!390592 () BitStream!10912)

(declare-fun choose!50 (BitStream!10912 BitStream!10912 BitStream!10912 tuple2!21536 tuple2!21536 BitStream!10912 Bool tuple2!21536 tuple2!21536 BitStream!10912 Bool) Unit!18132)

(assert (=> d!84200 (= lt!390591 (choose!50 lt!390005 (_2!11695 lt!390003) lt!390592 lt!390590 (tuple2!21537 (_1!11696 lt!390590) (_2!11696 lt!390590)) (_1!11696 lt!390590) (_2!11696 lt!390590) lt!390589 (tuple2!21537 (_1!11696 lt!390589) (_2!11696 lt!390589)) (_1!11696 lt!390589) (_2!11696 lt!390589)))))

(assert (=> d!84200 (= lt!390589 (readBitPure!0 lt!390592))))

(assert (=> d!84200 (= lt!390590 (readBitPure!0 lt!390005))))

(assert (=> d!84200 (= lt!390592 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 lt!390005) (currentBit!11938 lt!390005)))))

(assert (=> d!84200 (invariant!0 (currentBit!11938 lt!390005) (currentByte!11943 lt!390005) (size!5995 (buf!6494 (_2!11695 lt!390003))))))

(assert (=> d!84200 (= (readBitPrefixLemma!0 lt!390005 (_2!11695 lt!390003)) lt!390591)))

(declare-fun b!251330 () Bool)

(assert (=> b!251330 (= e!174145 (= (_2!11696 lt!390590) (_2!11696 lt!390589)))))

(assert (= (and d!84200 res!210462) b!251330))

(assert (=> d!84200 m!377667))

(declare-fun m!378165 () Bool)

(assert (=> d!84200 m!378165))

(declare-fun m!378167 () Bool)

(assert (=> d!84200 m!378167))

(declare-fun m!378169 () Bool)

(assert (=> d!84200 m!378169))

(declare-fun m!378171 () Bool)

(assert (=> d!84200 m!378171))

(declare-fun m!378173 () Bool)

(assert (=> d!84200 m!378173))

(assert (=> b!251038 d!84200))

(declare-fun d!84206 () Bool)

(declare-fun lt!390593 () tuple2!21556)

(assert (=> d!84206 (= lt!390593 (readBit!0 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005))))))

(assert (=> d!84206 (= (readBitPure!0 (BitStream!10913 (buf!6494 (_2!11695 lt!390003)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005))) (tuple2!21537 (_2!11706 lt!390593) (_1!11706 lt!390593)))))

(declare-fun bs!21320 () Bool)

(assert (= bs!21320 d!84206))

(declare-fun m!378175 () Bool)

(assert (=> bs!21320 m!378175))

(assert (=> b!251038 d!84206))

(declare-fun d!84208 () Bool)

(assert (=> d!84208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21321 () Bool)

(assert (= bs!21321 d!84208))

(assert (=> bs!21321 m!378011))

(assert (=> b!251038 d!84208))

(declare-fun b!251359 () Bool)

(declare-fun e!174159 () Bool)

(declare-fun lt!390654 () (_ BitVec 64))

(assert (=> b!251359 (= e!174159 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390008)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) lt!390654))))

(declare-fun d!84210 () Bool)

(declare-fun e!174158 () Bool)

(assert (=> d!84210 e!174158))

(declare-fun res!210488 () Bool)

(assert (=> d!84210 (=> (not res!210488) (not e!174158))))

(declare-fun lt!390657 () tuple2!21534)

(assert (=> d!84210 (= res!210488 (= (size!5995 (buf!6494 (_2!11695 lt!390008))) (size!5995 (buf!6494 (_2!11695 lt!390657)))))))

(declare-fun choose!51 (BitStream!10912 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21534)

(assert (=> d!84210 (= lt!390657 (choose!51 (_2!11695 lt!390008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84210 (= (appendNBitsLoop!0 (_2!11695 lt!390008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!390657)))

(declare-fun b!251358 () Bool)

(declare-fun lt!390656 () tuple2!21536)

(declare-fun lt!390655 () tuple2!21538)

(assert (=> b!251358 (= e!174158 (and (_2!11696 lt!390656) (= (_1!11696 lt!390656) (_2!11697 lt!390655))))))

(assert (=> b!251358 (= lt!390656 (checkBitsLoopPure!0 (_1!11697 lt!390655) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!390658 () Unit!18132)

(declare-fun lt!390660 () Unit!18132)

(assert (=> b!251358 (= lt!390658 lt!390660)))

(assert (=> b!251358 (validate_offset_bits!1 ((_ sign_extend 32) (size!5995 (buf!6494 (_2!11695 lt!390657)))) ((_ sign_extend 32) (currentByte!11943 (_2!11695 lt!390008))) ((_ sign_extend 32) (currentBit!11938 (_2!11695 lt!390008))) lt!390654)))

(assert (=> b!251358 (= lt!390660 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11695 lt!390008) (buf!6494 (_2!11695 lt!390657)) lt!390654))))

(assert (=> b!251358 e!174159))

(declare-fun res!210487 () Bool)

(assert (=> b!251358 (=> (not res!210487) (not e!174159))))

(assert (=> b!251358 (= res!210487 (and (= (size!5995 (buf!6494 (_2!11695 lt!390008))) (size!5995 (buf!6494 (_2!11695 lt!390657)))) (bvsge lt!390654 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251358 (= lt!390654 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251358 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251358 (= lt!390655 (reader!0 (_2!11695 lt!390008) (_2!11695 lt!390657)))))

(declare-fun b!251357 () Bool)

(declare-fun res!210486 () Bool)

(assert (=> b!251357 (=> (not res!210486) (not e!174158))))

(assert (=> b!251357 (= res!210486 (isPrefixOf!0 (_2!11695 lt!390008) (_2!11695 lt!390657)))))

(declare-fun b!251356 () Bool)

(declare-fun res!210489 () Bool)

(assert (=> b!251356 (=> (not res!210489) (not e!174158))))

(declare-fun lt!390659 () (_ BitVec 64))

(declare-fun lt!390661 () (_ BitVec 64))

(assert (=> b!251356 (= res!210489 (= (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390657))) (currentByte!11943 (_2!11695 lt!390657)) (currentBit!11938 (_2!11695 lt!390657))) (bvadd lt!390659 lt!390661)))))

(assert (=> b!251356 (or (not (= (bvand lt!390659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390659 lt!390661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251356 (= lt!390661 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251356 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251356 (= lt!390659 (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390008))) (currentByte!11943 (_2!11695 lt!390008)) (currentBit!11938 (_2!11695 lt!390008))))))

(assert (= (and d!84210 res!210488) b!251356))

(assert (= (and b!251356 res!210489) b!251357))

(assert (= (and b!251357 res!210486) b!251358))

(assert (= (and b!251358 res!210487) b!251359))

(declare-fun m!378219 () Bool)

(assert (=> b!251357 m!378219))

(declare-fun m!378221 () Bool)

(assert (=> b!251359 m!378221))

(declare-fun m!378223 () Bool)

(assert (=> b!251356 m!378223))

(assert (=> b!251356 m!377703))

(declare-fun m!378225 () Bool)

(assert (=> d!84210 m!378225))

(declare-fun m!378227 () Bool)

(assert (=> b!251358 m!378227))

(declare-fun m!378229 () Bool)

(assert (=> b!251358 m!378229))

(declare-fun m!378231 () Bool)

(assert (=> b!251358 m!378231))

(declare-fun m!378233 () Bool)

(assert (=> b!251358 m!378233))

(assert (=> b!251038 d!84210))

(declare-fun d!84214 () Bool)

(assert (=> d!84214 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390003))))

(declare-fun lt!390664 () Unit!18132)

(declare-fun choose!30 (BitStream!10912 BitStream!10912 BitStream!10912) Unit!18132)

(assert (=> d!84214 (= lt!390664 (choose!30 thiss!1005 (_2!11695 lt!390008) (_2!11695 lt!390003)))))

(assert (=> d!84214 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390008))))

(assert (=> d!84214 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11695 lt!390008) (_2!11695 lt!390003)) lt!390664)))

(declare-fun bs!21322 () Bool)

(assert (= bs!21322 d!84214))

(assert (=> bs!21322 m!377683))

(declare-fun m!378235 () Bool)

(assert (=> bs!21322 m!378235))

(assert (=> bs!21322 m!377707))

(assert (=> b!251038 d!84214))

(declare-fun d!84216 () Bool)

(declare-fun lt!390665 () tuple2!21556)

(assert (=> d!84216 (= lt!390665 (readBit!0 (_1!11697 lt!390011)))))

(assert (=> d!84216 (= (readBitPure!0 (_1!11697 lt!390011)) (tuple2!21537 (_2!11706 lt!390665) (_1!11706 lt!390665)))))

(declare-fun bs!21323 () Bool)

(assert (= bs!21323 d!84216))

(declare-fun m!378237 () Bool)

(assert (=> bs!21323 m!378237))

(assert (=> b!251038 d!84216))

(declare-fun d!84218 () Bool)

(declare-fun res!210492 () Bool)

(declare-fun e!174160 () Bool)

(assert (=> d!84218 (=> (not res!210492) (not e!174160))))

(assert (=> d!84218 (= res!210492 (= (size!5995 (buf!6494 thiss!1005)) (size!5995 (buf!6494 (_2!11695 lt!390003)))))))

(assert (=> d!84218 (= (isPrefixOf!0 thiss!1005 (_2!11695 lt!390003)) e!174160)))

(declare-fun b!251360 () Bool)

(declare-fun res!210491 () Bool)

(assert (=> b!251360 (=> (not res!210491) (not e!174160))))

(assert (=> b!251360 (= res!210491 (bvsle (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)) (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390003))) (currentByte!11943 (_2!11695 lt!390003)) (currentBit!11938 (_2!11695 lt!390003)))))))

(declare-fun b!251361 () Bool)

(declare-fun e!174161 () Bool)

(assert (=> b!251361 (= e!174160 e!174161)))

(declare-fun res!210490 () Bool)

(assert (=> b!251361 (=> res!210490 e!174161)))

(assert (=> b!251361 (= res!210490 (= (size!5995 (buf!6494 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251362 () Bool)

(assert (=> b!251362 (= e!174161 (arrayBitRangesEq!0 (buf!6494 thiss!1005) (buf!6494 (_2!11695 lt!390003)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005))))))

(assert (= (and d!84218 res!210492) b!251360))

(assert (= (and b!251360 res!210491) b!251361))

(assert (= (and b!251361 (not res!210490)) b!251362))

(assert (=> b!251360 m!377709))

(assert (=> b!251360 m!377701))

(assert (=> b!251362 m!377709))

(assert (=> b!251362 m!377709))

(declare-fun m!378239 () Bool)

(assert (=> b!251362 m!378239))

(assert (=> b!251038 d!84218))

(declare-fun b!251372 () Bool)

(declare-fun res!210502 () Bool)

(declare-fun e!174167 () Bool)

(assert (=> b!251372 (=> (not res!210502) (not e!174167))))

(declare-fun lt!390676 () (_ BitVec 64))

(declare-fun lt!390674 () tuple2!21534)

(declare-fun lt!390675 () (_ BitVec 64))

(assert (=> b!251372 (= res!210502 (= (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390674))) (currentByte!11943 (_2!11695 lt!390674)) (currentBit!11938 (_2!11695 lt!390674))) (bvadd lt!390675 lt!390676)))))

(assert (=> b!251372 (or (not (= (bvand lt!390675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390676 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390675 lt!390676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251372 (= lt!390676 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!251372 (= lt!390675 (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)))))

(declare-fun b!251374 () Bool)

(declare-fun e!174166 () Bool)

(assert (=> b!251374 (= e!174167 e!174166)))

(declare-fun res!210503 () Bool)

(assert (=> b!251374 (=> (not res!210503) (not e!174166))))

(declare-fun lt!390677 () tuple2!21536)

(assert (=> b!251374 (= res!210503 (and (= (_2!11696 lt!390677) bit!26) (= (_1!11696 lt!390677) (_2!11695 lt!390674))))))

(assert (=> b!251374 (= lt!390677 (readBitPure!0 (readerFrom!0 (_2!11695 lt!390674) (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005))))))

(declare-fun b!251375 () Bool)

(assert (=> b!251375 (= e!174166 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390677))) (currentByte!11943 (_1!11696 lt!390677)) (currentBit!11938 (_1!11696 lt!390677))) (bitIndex!0 (size!5995 (buf!6494 (_2!11695 lt!390674))) (currentByte!11943 (_2!11695 lt!390674)) (currentBit!11938 (_2!11695 lt!390674)))))))

(declare-fun b!251373 () Bool)

(declare-fun res!210501 () Bool)

(assert (=> b!251373 (=> (not res!210501) (not e!174167))))

(assert (=> b!251373 (= res!210501 (isPrefixOf!0 thiss!1005 (_2!11695 lt!390674)))))

(declare-fun d!84220 () Bool)

(assert (=> d!84220 e!174167))

(declare-fun res!210504 () Bool)

(assert (=> d!84220 (=> (not res!210504) (not e!174167))))

(assert (=> d!84220 (= res!210504 (= (size!5995 (buf!6494 thiss!1005)) (size!5995 (buf!6494 (_2!11695 lt!390674)))))))

(declare-fun choose!16 (BitStream!10912 Bool) tuple2!21534)

(assert (=> d!84220 (= lt!390674 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84220 (validate_offset_bit!0 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))) ((_ sign_extend 32) (currentByte!11943 thiss!1005)) ((_ sign_extend 32) (currentBit!11938 thiss!1005)))))

(assert (=> d!84220 (= (appendBit!0 thiss!1005 bit!26) lt!390674)))

(assert (= (and d!84220 res!210504) b!251372))

(assert (= (and b!251372 res!210502) b!251373))

(assert (= (and b!251373 res!210501) b!251374))

(assert (= (and b!251374 res!210503) b!251375))

(declare-fun m!378241 () Bool)

(assert (=> d!84220 m!378241))

(declare-fun m!378243 () Bool)

(assert (=> d!84220 m!378243))

(declare-fun m!378245 () Bool)

(assert (=> b!251373 m!378245))

(declare-fun m!378247 () Bool)

(assert (=> b!251372 m!378247))

(assert (=> b!251372 m!377709))

(declare-fun m!378249 () Bool)

(assert (=> b!251375 m!378249))

(assert (=> b!251375 m!378247))

(declare-fun m!378251 () Bool)

(assert (=> b!251374 m!378251))

(assert (=> b!251374 m!378251))

(declare-fun m!378253 () Bool)

(assert (=> b!251374 m!378253))

(assert (=> b!251038 d!84220))

(declare-fun d!84222 () Bool)

(declare-fun e!174168 () Bool)

(assert (=> d!84222 e!174168))

(declare-fun res!210506 () Bool)

(assert (=> d!84222 (=> (not res!210506) (not e!174168))))

(declare-fun lt!390682 () (_ BitVec 64))

(declare-fun lt!390680 () (_ BitVec 64))

(declare-fun lt!390683 () (_ BitVec 64))

(assert (=> d!84222 (= res!210506 (= lt!390682 (bvsub lt!390680 lt!390683)))))

(assert (=> d!84222 (or (= (bvand lt!390680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390680 lt!390683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84222 (= lt!390683 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390006)))) ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!390006))) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!390006)))))))

(declare-fun lt!390679 () (_ BitVec 64))

(declare-fun lt!390678 () (_ BitVec 64))

(assert (=> d!84222 (= lt!390680 (bvmul lt!390679 lt!390678))))

(assert (=> d!84222 (or (= lt!390679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390678 (bvsdiv (bvmul lt!390679 lt!390678) lt!390679)))))

(assert (=> d!84222 (= lt!390678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84222 (= lt!390679 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390006)))))))

(assert (=> d!84222 (= lt!390682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!390006))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!390006)))))))

(assert (=> d!84222 (invariant!0 (currentBit!11938 (_1!11696 lt!390006)) (currentByte!11943 (_1!11696 lt!390006)) (size!5995 (buf!6494 (_1!11696 lt!390006))))))

(assert (=> d!84222 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390006))) (currentByte!11943 (_1!11696 lt!390006)) (currentBit!11938 (_1!11696 lt!390006))) lt!390682)))

(declare-fun b!251376 () Bool)

(declare-fun res!210505 () Bool)

(assert (=> b!251376 (=> (not res!210505) (not e!174168))))

(assert (=> b!251376 (= res!210505 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390682))))

(declare-fun b!251377 () Bool)

(declare-fun lt!390681 () (_ BitVec 64))

(assert (=> b!251377 (= e!174168 (bvsle lt!390682 (bvmul lt!390681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251377 (or (= lt!390681 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390681)))))

(assert (=> b!251377 (= lt!390681 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390006)))))))

(assert (= (and d!84222 res!210506) b!251376))

(assert (= (and b!251376 res!210505) b!251377))

(declare-fun m!378255 () Bool)

(assert (=> d!84222 m!378255))

(declare-fun m!378257 () Bool)

(assert (=> d!84222 m!378257))

(assert (=> b!251038 d!84222))

(declare-fun d!84224 () Bool)

(declare-fun lt!390684 () tuple2!21556)

(assert (=> d!84224 (= lt!390684 (readBit!0 lt!390005))))

(assert (=> d!84224 (= (readBitPure!0 lt!390005) (tuple2!21537 (_2!11706 lt!390684) (_1!11706 lt!390684)))))

(declare-fun bs!21324 () Bool)

(assert (= bs!21324 d!84224))

(declare-fun m!378259 () Bool)

(assert (=> bs!21324 m!378259))

(assert (=> b!251038 d!84224))

(declare-fun d!84226 () Bool)

(declare-fun e!174169 () Bool)

(assert (=> d!84226 e!174169))

(declare-fun res!210508 () Bool)

(assert (=> d!84226 (=> (not res!210508) (not e!174169))))

(declare-fun lt!390687 () (_ BitVec 64))

(declare-fun lt!390689 () (_ BitVec 64))

(declare-fun lt!390690 () (_ BitVec 64))

(assert (=> d!84226 (= res!210508 (= lt!390689 (bvsub lt!390687 lt!390690)))))

(assert (=> d!84226 (or (= (bvand lt!390687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390687 lt!390690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84226 (= lt!390690 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390004)))) ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!390004))) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!390004)))))))

(declare-fun lt!390686 () (_ BitVec 64))

(declare-fun lt!390685 () (_ BitVec 64))

(assert (=> d!84226 (= lt!390687 (bvmul lt!390686 lt!390685))))

(assert (=> d!84226 (or (= lt!390686 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390685 (bvsdiv (bvmul lt!390686 lt!390685) lt!390686)))))

(assert (=> d!84226 (= lt!390685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84226 (= lt!390686 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390004)))))))

(assert (=> d!84226 (= lt!390689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 (_1!11696 lt!390004))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 (_1!11696 lt!390004)))))))

(assert (=> d!84226 (invariant!0 (currentBit!11938 (_1!11696 lt!390004)) (currentByte!11943 (_1!11696 lt!390004)) (size!5995 (buf!6494 (_1!11696 lt!390004))))))

(assert (=> d!84226 (= (bitIndex!0 (size!5995 (buf!6494 (_1!11696 lt!390004))) (currentByte!11943 (_1!11696 lt!390004)) (currentBit!11938 (_1!11696 lt!390004))) lt!390689)))

(declare-fun b!251378 () Bool)

(declare-fun res!210507 () Bool)

(assert (=> b!251378 (=> (not res!210507) (not e!174169))))

(assert (=> b!251378 (= res!210507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390689))))

(declare-fun b!251379 () Bool)

(declare-fun lt!390688 () (_ BitVec 64))

(assert (=> b!251379 (= e!174169 (bvsle lt!390689 (bvmul lt!390688 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251379 (or (= lt!390688 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390688 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390688)))))

(assert (=> b!251379 (= lt!390688 ((_ sign_extend 32) (size!5995 (buf!6494 (_1!11696 lt!390004)))))))

(assert (= (and d!84226 res!210508) b!251378))

(assert (= (and b!251378 res!210507) b!251379))

(declare-fun m!378261 () Bool)

(assert (=> d!84226 m!378261))

(declare-fun m!378263 () Bool)

(assert (=> d!84226 m!378263))

(assert (=> b!251038 d!84226))

(assert (=> b!251037 d!84148))

(declare-fun d!84228 () Bool)

(declare-fun e!174170 () Bool)

(assert (=> d!84228 e!174170))

(declare-fun res!210510 () Bool)

(assert (=> d!84228 (=> (not res!210510) (not e!174170))))

(declare-fun lt!390696 () (_ BitVec 64))

(declare-fun lt!390693 () (_ BitVec 64))

(declare-fun lt!390695 () (_ BitVec 64))

(assert (=> d!84228 (= res!210510 (= lt!390695 (bvsub lt!390693 lt!390696)))))

(assert (=> d!84228 (or (= (bvand lt!390693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390693 lt!390696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84228 (= lt!390696 (remainingBits!0 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))) ((_ sign_extend 32) (currentByte!11943 thiss!1005)) ((_ sign_extend 32) (currentBit!11938 thiss!1005))))))

(declare-fun lt!390692 () (_ BitVec 64))

(declare-fun lt!390691 () (_ BitVec 64))

(assert (=> d!84228 (= lt!390693 (bvmul lt!390692 lt!390691))))

(assert (=> d!84228 (or (= lt!390692 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390691 (bvsdiv (bvmul lt!390692 lt!390691) lt!390692)))))

(assert (=> d!84228 (= lt!390691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84228 (= lt!390692 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))))))

(assert (=> d!84228 (= lt!390695 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11943 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11938 thiss!1005))))))

(assert (=> d!84228 (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 thiss!1005)))))

(assert (=> d!84228 (= (bitIndex!0 (size!5995 (buf!6494 thiss!1005)) (currentByte!11943 thiss!1005) (currentBit!11938 thiss!1005)) lt!390695)))

(declare-fun b!251380 () Bool)

(declare-fun res!210509 () Bool)

(assert (=> b!251380 (=> (not res!210509) (not e!174170))))

(assert (=> b!251380 (= res!210509 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390695))))

(declare-fun b!251381 () Bool)

(declare-fun lt!390694 () (_ BitVec 64))

(assert (=> b!251381 (= e!174170 (bvsle lt!390695 (bvmul lt!390694 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251381 (or (= lt!390694 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390694 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390694)))))

(assert (=> b!251381 (= lt!390694 ((_ sign_extend 32) (size!5995 (buf!6494 thiss!1005))))))

(assert (= (and d!84228 res!210510) b!251380))

(assert (= (and b!251380 res!210509) b!251381))

(assert (=> d!84228 m!378013))

(declare-fun m!378265 () Bool)

(assert (=> d!84228 m!378265))

(assert (=> b!251037 d!84228))

(declare-fun d!84230 () Bool)

(assert (=> d!84230 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11938 thiss!1005) (currentByte!11943 thiss!1005) (size!5995 (buf!6494 thiss!1005))))))

(declare-fun bs!21325 () Bool)

(assert (= bs!21325 d!84230))

(assert (=> bs!21325 m!378265))

(assert (=> start!53952 d!84230))

(push 1)

(assert (not b!251304))

(assert (not d!84226))

(assert (not b!251320))

(assert (not b!251359))

(assert (not b!251375))

(assert (not b!251305))

(assert (not d!84152))

(assert (not b!251357))

(assert (not d!84146))

(assert (not d!84160))

(assert (not b!251322))

(assert (not b!251356))

(assert (not b!251372))

(assert (not b!251323))

(assert (not b!251264))

(assert (not b!251362))

(assert (not b!251373))

(assert (not b!251266))

(assert (not d!84162))

(assert (not d!84196))

(assert (not d!84198))

(assert (not d!84206))

(assert (not d!84158))

(assert (not b!251303))

(assert (not b!251358))

(assert (not b!251315))

(assert (not d!84130))

(assert (not d!84220))

(assert (not d!84148))

(assert (not b!251321))

(assert (not b!251360))

(assert (not b!251241))

(assert (not d!84214))

(assert (not d!84210))

(assert (not d!84222))

(assert (not d!84230))

(assert (not b!251306))

(assert (not d!84224))

(assert (not d!84216))

(assert (not d!84228))

(assert (not b!251374))

(assert (not b!251234))

(assert (not d!84170))

(assert (not b!251243))

(assert (not d!84136))

(assert (not d!84208))

(assert (not d!84200))

(assert (not d!84142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

