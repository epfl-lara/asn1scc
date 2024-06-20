; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9408 () Bool)

(assert start!9408)

(declare-datatypes ((array!2297 0))(
  ( (array!2298 (arr!1558 (Array (_ BitVec 32) (_ BitVec 8))) (size!1038 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2297)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!46835 () Bool)

(declare-datatypes ((BitStream!1808 0))(
  ( (BitStream!1809 (buf!1387 array!2297) (currentByte!2892 (_ BitVec 32)) (currentBit!2887 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4532 0))(
  ( (tuple2!4533 (_1!2359 BitStream!1808) (_2!2359 BitStream!1808)) )
))
(declare-fun lt!72380 () tuple2!4532)

(declare-datatypes ((Unit!3313 0))(
  ( (Unit!3314) )
))
(declare-datatypes ((tuple2!4534 0))(
  ( (tuple2!4535 (_1!2360 Unit!3313) (_2!2360 BitStream!1808)) )
))
(declare-fun lt!72395 () tuple2!4534)

(declare-fun e!31110 () Bool)

(declare-datatypes ((List!545 0))(
  ( (Nil!542) (Cons!541 (h!660 Bool) (t!1295 List!545)) )
))
(declare-fun head!364 (List!545) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1808 array!2297 (_ BitVec 64) (_ BitVec 64)) List!545)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1808 BitStream!1808 (_ BitVec 64)) List!545)

(assert (=> b!46835 (= e!31110 (= (head!364 (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!364 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_1!2359 lt!72380) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46836 () Bool)

(declare-fun res!39541 () Bool)

(declare-fun e!31107 () Bool)

(assert (=> b!46836 (=> res!39541 e!31107)))

(declare-fun thiss!1379 () BitStream!1808)

(declare-fun lt!72389 () tuple2!4534)

(assert (=> b!46836 (= res!39541 (not (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))

(declare-fun res!39544 () Bool)

(declare-fun e!31116 () Bool)

(assert (=> start!9408 (=> (not res!39544) (not e!31116))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!9408 (= res!39544 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1038 srcBuffer!2))))))))

(assert (=> start!9408 e!31116))

(assert (=> start!9408 true))

(declare-fun array_inv!957 (array!2297) Bool)

(assert (=> start!9408 (array_inv!957 srcBuffer!2)))

(declare-fun e!31108 () Bool)

(declare-fun inv!12 (BitStream!1808) Bool)

(assert (=> start!9408 (and (inv!12 thiss!1379) e!31108)))

(declare-fun b!46837 () Bool)

(declare-fun res!39543 () Bool)

(declare-fun e!31118 () Bool)

(assert (=> b!46837 (=> res!39543 e!31118)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46837 (= res!39543 (not (invariant!0 (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72395))))))))

(declare-fun b!46838 () Bool)

(assert (=> b!46838 (= e!31108 (array_inv!957 (buf!1387 thiss!1379)))))

(declare-fun lt!72384 () (_ BitVec 64))

(declare-fun b!46839 () Bool)

(declare-fun e!31112 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46839 (= e!31112 (= lt!72384 (bvsub (bvsub (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46840 () Bool)

(declare-fun e!31117 () Bool)

(assert (=> b!46840 (= e!31116 (not e!31117))))

(declare-fun res!39535 () Bool)

(assert (=> b!46840 (=> res!39535 e!31117)))

(assert (=> b!46840 (= res!39535 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1808 BitStream!1808) Bool)

(assert (=> b!46840 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72386 () Unit!3313)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1808) Unit!3313)

(assert (=> b!46840 (= lt!72386 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!72396 () (_ BitVec 64))

(assert (=> b!46840 (= lt!72396 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!46841 () Bool)

(declare-fun res!39531 () Bool)

(assert (=> b!46841 (=> (not res!39531) (not e!31116))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46841 (= res!39531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46842 () Bool)

(declare-fun e!31109 () Bool)

(declare-fun e!31105 () Bool)

(assert (=> b!46842 (= e!31109 e!31105)))

(declare-fun res!39538 () Bool)

(assert (=> b!46842 (=> res!39538 e!31105)))

(declare-fun lt!72394 () List!545)

(declare-fun lt!72385 () List!545)

(assert (=> b!46842 (= res!39538 (not (= lt!72394 lt!72385)))))

(assert (=> b!46842 (= lt!72385 lt!72394)))

(declare-fun lt!72379 () List!545)

(declare-fun tail!231 (List!545) List!545)

(assert (=> b!46842 (= lt!72394 (tail!231 lt!72379))))

(declare-fun lt!72383 () Unit!3313)

(declare-fun lt!72381 () tuple2!4532)

(declare-fun lt!72388 () tuple2!4532)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1808 BitStream!1808 BitStream!1808 BitStream!1808 (_ BitVec 64) List!545) Unit!3313)

(assert (=> b!46842 (= lt!72383 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2360 lt!72389) (_2!2360 lt!72389) (_1!2359 lt!72381) (_1!2359 lt!72388) (bvsub to!314 i!635) lt!72379))))

(declare-fun b!46843 () Bool)

(declare-fun res!39542 () Bool)

(assert (=> b!46843 (=> res!39542 e!31109)))

(declare-fun length!240 (List!545) Int)

(assert (=> b!46843 (= res!39542 (<= (length!240 lt!72379) 0))))

(declare-fun b!46844 () Bool)

(declare-fun e!31115 () Bool)

(assert (=> b!46844 (= e!31117 e!31115)))

(declare-fun res!39536 () Bool)

(assert (=> b!46844 (=> res!39536 e!31115)))

(assert (=> b!46844 (= res!39536 (not (isPrefixOf!0 thiss!1379 (_2!2360 lt!72395))))))

(declare-fun lt!72387 () (_ BitVec 64))

(assert (=> b!46844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387)))

(assert (=> b!46844 (= lt!72387 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72393 () Unit!3313)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1808 BitStream!1808 (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> b!46844 (= lt!72393 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2360 lt!72395) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1808 (_ BitVec 8) (_ BitVec 32)) tuple2!4534)

(assert (=> b!46844 (= lt!72395 (appendBitFromByte!0 thiss!1379 (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46845 () Bool)

(declare-fun res!39539 () Bool)

(assert (=> b!46845 (=> res!39539 e!31118)))

(assert (=> b!46845 (= res!39539 (not (invariant!0 (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))

(declare-fun b!46846 () Bool)

(declare-fun e!31113 () Bool)

(assert (=> b!46846 (= e!31115 e!31113)))

(declare-fun res!39533 () Bool)

(assert (=> b!46846 (=> res!39533 e!31113)))

(assert (=> b!46846 (= res!39533 (not (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72389))))))

(assert (=> b!46846 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72389))))

(declare-fun lt!72391 () Unit!3313)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1808 BitStream!1808 BitStream!1808) Unit!3313)

(assert (=> b!46846 (= lt!72391 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2360 lt!72395) (_2!2360 lt!72389)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1808 array!2297 (_ BitVec 64) (_ BitVec 64)) tuple2!4534)

(assert (=> b!46846 (= lt!72389 (appendBitsMSBFirstLoop!0 (_2!2360 lt!72395) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46846 e!31110))

(declare-fun res!39545 () Bool)

(assert (=> b!46846 (=> (not res!39545) (not e!31110))))

(assert (=> b!46846 (= res!39545 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72382 () Unit!3313)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1808 array!2297 (_ BitVec 64)) Unit!3313)

(assert (=> b!46846 (= lt!72382 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1808 BitStream!1808) tuple2!4532)

(assert (=> b!46846 (= lt!72380 (reader!0 thiss!1379 (_2!2360 lt!72395)))))

(declare-fun b!46847 () Bool)

(declare-fun e!31114 () Bool)

(assert (=> b!46847 (= e!31105 e!31114)))

(declare-fun res!39540 () Bool)

(assert (=> b!46847 (=> res!39540 e!31114)))

(declare-fun lt!72390 () Bool)

(declare-fun bitAt!0 (array!2297 (_ BitVec 64)) Bool)

(assert (=> b!46847 (= res!39540 (not (= lt!72390 (bitAt!0 (buf!1387 (_1!2359 lt!72388)) lt!72396))))))

(assert (=> b!46847 (= lt!72390 (bitAt!0 (buf!1387 (_1!2359 lt!72381)) lt!72396))))

(declare-fun b!46848 () Bool)

(assert (=> b!46848 (= e!31113 e!31107)))

(declare-fun res!39532 () Bool)

(assert (=> b!46848 (=> res!39532 e!31107)))

(assert (=> b!46848 (= res!39532 (not (= lt!72384 (bvsub (bvadd lt!72396 to!314) i!635))))))

(assert (=> b!46848 (= lt!72384 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389))))))

(declare-fun b!46849 () Bool)

(assert (=> b!46849 (= e!31118 e!31109)))

(declare-fun res!39530 () Bool)

(assert (=> b!46849 (=> res!39530 e!31109)))

(assert (=> b!46849 (= res!39530 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!46849 (= lt!72385 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72388) lt!72387))))

(assert (=> b!46849 (= lt!72379 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72381) (bvsub to!314 i!635)))))

(assert (=> b!46849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387)))

(declare-fun lt!72392 () Unit!3313)

(assert (=> b!46849 (= lt!72392 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72389)) lt!72387))))

(assert (=> b!46849 (= lt!72388 (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72389)))))

(assert (=> b!46849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72397 () Unit!3313)

(assert (=> b!46849 (= lt!72397 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1387 (_2!2360 lt!72389)) (bvsub to!314 i!635)))))

(assert (=> b!46849 (= lt!72381 (reader!0 thiss!1379 (_2!2360 lt!72389)))))

(declare-fun b!46850 () Bool)

(assert (=> b!46850 (= e!31107 e!31118)))

(declare-fun res!39546 () Bool)

(assert (=> b!46850 (=> res!39546 e!31118)))

(assert (=> b!46850 (= res!39546 (not (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))

(assert (=> b!46850 e!31112))

(declare-fun res!39537 () Bool)

(assert (=> b!46850 (=> (not res!39537) (not e!31112))))

(assert (=> b!46850 (= res!39537 (= (size!1038 (buf!1387 (_2!2360 lt!72389))) (size!1038 (buf!1387 thiss!1379))))))

(declare-fun b!46851 () Bool)

(declare-fun res!39534 () Bool)

(assert (=> b!46851 (=> res!39534 e!31107)))

(assert (=> b!46851 (= res!39534 (not (invariant!0 (currentBit!2887 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72389)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))

(declare-fun b!46852 () Bool)

(assert (=> b!46852 (= e!31114 (= (head!364 lt!72379) lt!72390))))

(assert (= (and start!9408 res!39544) b!46841))

(assert (= (and b!46841 res!39531) b!46840))

(assert (= (and b!46840 (not res!39535)) b!46844))

(assert (= (and b!46844 (not res!39536)) b!46846))

(assert (= (and b!46846 res!39545) b!46835))

(assert (= (and b!46846 (not res!39533)) b!46848))

(assert (= (and b!46848 (not res!39532)) b!46851))

(assert (= (and b!46851 (not res!39534)) b!46836))

(assert (= (and b!46836 (not res!39541)) b!46850))

(assert (= (and b!46850 res!39537) b!46839))

(assert (= (and b!46850 (not res!39546)) b!46837))

(assert (= (and b!46837 (not res!39543)) b!46845))

(assert (= (and b!46845 (not res!39539)) b!46849))

(assert (= (and b!46849 (not res!39530)) b!46843))

(assert (= (and b!46843 (not res!39542)) b!46842))

(assert (= (and b!46842 (not res!39538)) b!46847))

(assert (= (and b!46847 (not res!39540)) b!46852))

(assert (= start!9408 b!46838))

(declare-fun m!71827 () Bool)

(assert (=> b!46845 m!71827))

(declare-fun m!71829 () Bool)

(assert (=> b!46844 m!71829))

(declare-fun m!71831 () Bool)

(assert (=> b!46844 m!71831))

(declare-fun m!71833 () Bool)

(assert (=> b!46844 m!71833))

(declare-fun m!71835 () Bool)

(assert (=> b!46844 m!71835))

(assert (=> b!46844 m!71829))

(declare-fun m!71837 () Bool)

(assert (=> b!46844 m!71837))

(declare-fun m!71839 () Bool)

(assert (=> b!46835 m!71839))

(assert (=> b!46835 m!71839))

(declare-fun m!71841 () Bool)

(assert (=> b!46835 m!71841))

(declare-fun m!71843 () Bool)

(assert (=> b!46835 m!71843))

(assert (=> b!46835 m!71843))

(declare-fun m!71845 () Bool)

(assert (=> b!46835 m!71845))

(declare-fun m!71847 () Bool)

(assert (=> b!46841 m!71847))

(declare-fun m!71849 () Bool)

(assert (=> b!46852 m!71849))

(declare-fun m!71851 () Bool)

(assert (=> b!46849 m!71851))

(declare-fun m!71853 () Bool)

(assert (=> b!46849 m!71853))

(declare-fun m!71855 () Bool)

(assert (=> b!46849 m!71855))

(declare-fun m!71857 () Bool)

(assert (=> b!46849 m!71857))

(declare-fun m!71859 () Bool)

(assert (=> b!46849 m!71859))

(declare-fun m!71861 () Bool)

(assert (=> b!46849 m!71861))

(declare-fun m!71863 () Bool)

(assert (=> b!46849 m!71863))

(declare-fun m!71865 () Bool)

(assert (=> b!46849 m!71865))

(declare-fun m!71867 () Bool)

(assert (=> start!9408 m!71867))

(declare-fun m!71869 () Bool)

(assert (=> start!9408 m!71869))

(declare-fun m!71871 () Bool)

(assert (=> b!46851 m!71871))

(declare-fun m!71873 () Bool)

(assert (=> b!46846 m!71873))

(declare-fun m!71875 () Bool)

(assert (=> b!46846 m!71875))

(declare-fun m!71877 () Bool)

(assert (=> b!46846 m!71877))

(declare-fun m!71879 () Bool)

(assert (=> b!46846 m!71879))

(declare-fun m!71881 () Bool)

(assert (=> b!46846 m!71881))

(declare-fun m!71883 () Bool)

(assert (=> b!46846 m!71883))

(declare-fun m!71885 () Bool)

(assert (=> b!46846 m!71885))

(declare-fun m!71887 () Bool)

(assert (=> b!46838 m!71887))

(declare-fun m!71889 () Bool)

(assert (=> b!46847 m!71889))

(declare-fun m!71891 () Bool)

(assert (=> b!46847 m!71891))

(declare-fun m!71893 () Bool)

(assert (=> b!46839 m!71893))

(declare-fun m!71895 () Bool)

(assert (=> b!46848 m!71895))

(declare-fun m!71897 () Bool)

(assert (=> b!46840 m!71897))

(declare-fun m!71899 () Bool)

(assert (=> b!46840 m!71899))

(declare-fun m!71901 () Bool)

(assert (=> b!46840 m!71901))

(declare-fun m!71903 () Bool)

(assert (=> b!46837 m!71903))

(declare-fun m!71905 () Bool)

(assert (=> b!46843 m!71905))

(declare-fun m!71907 () Bool)

(assert (=> b!46842 m!71907))

(declare-fun m!71909 () Bool)

(assert (=> b!46842 m!71909))

(push 1)

(assert (not b!46839))

(assert (not b!46835))

(assert (not b!46838))

(assert (not b!46847))

(assert (not b!46843))

(assert (not b!46841))

(assert (not b!46851))

(assert (not b!46848))

(assert (not b!46842))

(assert (not b!46846))

(assert (not b!46852))

(assert (not b!46840))

(assert (not b!46845))

(assert (not b!46837))

(assert (not b!46844))

(assert (not start!9408))

(assert (not b!46849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13736 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3611 () Bool)

(assert (= bs!3611 d!13736))

(declare-fun m!72131 () Bool)

(assert (=> bs!3611 m!72131))

(assert (=> b!46846 d!13736))

(declare-fun b!46997 () Bool)

(declare-fun res!39645 () Bool)

(declare-fun e!31191 () Bool)

(assert (=> b!46997 (=> (not res!39645) (not e!31191))))

(declare-fun lt!72785 () tuple2!4532)

(assert (=> b!46997 (= res!39645 (isPrefixOf!0 (_2!2359 lt!72785) (_2!2360 lt!72395)))))

(declare-fun b!46998 () Bool)

(declare-fun e!31190 () Unit!3313)

(declare-fun lt!72784 () Unit!3313)

(assert (=> b!46998 (= e!31190 lt!72784)))

(declare-fun lt!72789 () (_ BitVec 64))

(assert (=> b!46998 (= lt!72789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72778 () (_ BitVec 64))

(assert (=> b!46998 (= lt!72778 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2297 array!2297 (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> b!46998 (= lt!72784 (arrayBitRangesEqSymmetric!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) lt!72789 lt!72778))))

(declare-fun arrayBitRangesEq!0 (array!2297 array!2297 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46998 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 thiss!1379) lt!72789 lt!72778)))

(declare-fun lt!72772 () (_ BitVec 64))

(declare-fun b!46999 () Bool)

(declare-fun lt!72787 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1808 (_ BitVec 64)) BitStream!1808)

(assert (=> b!46999 (= e!31191 (= (_1!2359 lt!72785) (withMovedBitIndex!0 (_2!2359 lt!72785) (bvsub lt!72772 lt!72787))))))

(assert (=> b!46999 (or (= (bvand lt!72772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72772 lt!72787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46999 (= lt!72787 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> b!46999 (= lt!72772 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47000 () Bool)

(declare-fun res!39644 () Bool)

(assert (=> b!47000 (=> (not res!39644) (not e!31191))))

(assert (=> b!47000 (= res!39644 (isPrefixOf!0 (_1!2359 lt!72785) thiss!1379))))

(declare-fun b!47001 () Bool)

(declare-fun Unit!3325 () Unit!3313)

(assert (=> b!47001 (= e!31190 Unit!3325)))

(declare-fun d!13738 () Bool)

(assert (=> d!13738 e!31191))

(declare-fun res!39646 () Bool)

(assert (=> d!13738 (=> (not res!39646) (not e!31191))))

(assert (=> d!13738 (= res!39646 (isPrefixOf!0 (_1!2359 lt!72785) (_2!2359 lt!72785)))))

(declare-fun lt!72786 () BitStream!1808)

(assert (=> d!13738 (= lt!72785 (tuple2!4533 lt!72786 (_2!2360 lt!72395)))))

(declare-fun lt!72782 () Unit!3313)

(declare-fun lt!72779 () Unit!3313)

(assert (=> d!13738 (= lt!72782 lt!72779)))

(assert (=> d!13738 (isPrefixOf!0 lt!72786 (_2!2360 lt!72395))))

(assert (=> d!13738 (= lt!72779 (lemmaIsPrefixTransitive!0 lt!72786 (_2!2360 lt!72395) (_2!2360 lt!72395)))))

(declare-fun lt!72788 () Unit!3313)

(declare-fun lt!72776 () Unit!3313)

(assert (=> d!13738 (= lt!72788 lt!72776)))

(assert (=> d!13738 (isPrefixOf!0 lt!72786 (_2!2360 lt!72395))))

(assert (=> d!13738 (= lt!72776 (lemmaIsPrefixTransitive!0 lt!72786 thiss!1379 (_2!2360 lt!72395)))))

(declare-fun lt!72783 () Unit!3313)

(assert (=> d!13738 (= lt!72783 e!31190)))

(declare-fun c!3198 () Bool)

(assert (=> d!13738 (= c!3198 (not (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!72780 () Unit!3313)

(declare-fun lt!72771 () Unit!3313)

(assert (=> d!13738 (= lt!72780 lt!72771)))

(assert (=> d!13738 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!13738 (= lt!72771 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(declare-fun lt!72773 () Unit!3313)

(declare-fun lt!72777 () Unit!3313)

(assert (=> d!13738 (= lt!72773 lt!72777)))

(assert (=> d!13738 (= lt!72777 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(declare-fun lt!72790 () Unit!3313)

(declare-fun lt!72775 () Unit!3313)

(assert (=> d!13738 (= lt!72790 lt!72775)))

(assert (=> d!13738 (isPrefixOf!0 lt!72786 lt!72786)))

(assert (=> d!13738 (= lt!72775 (lemmaIsPrefixRefl!0 lt!72786))))

(declare-fun lt!72774 () Unit!3313)

(declare-fun lt!72781 () Unit!3313)

(assert (=> d!13738 (= lt!72774 lt!72781)))

(assert (=> d!13738 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13738 (= lt!72781 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13738 (= lt!72786 (BitStream!1809 (buf!1387 (_2!2360 lt!72395)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(assert (=> d!13738 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72395))))

(assert (=> d!13738 (= (reader!0 thiss!1379 (_2!2360 lt!72395)) lt!72785)))

(assert (= (and d!13738 c!3198) b!46998))

(assert (= (and d!13738 (not c!3198)) b!47001))

(assert (= (and d!13738 res!39646) b!47000))

(assert (= (and b!47000 res!39644) b!46997))

(assert (= (and b!46997 res!39645) b!46999))

(declare-fun m!72175 () Bool)

(assert (=> b!47000 m!72175))

(declare-fun m!72177 () Bool)

(assert (=> b!46999 m!72177))

(assert (=> b!46999 m!71893))

(assert (=> b!46999 m!71901))

(declare-fun m!72179 () Bool)

(assert (=> b!46997 m!72179))

(assert (=> b!46998 m!71901))

(declare-fun m!72181 () Bool)

(assert (=> b!46998 m!72181))

(declare-fun m!72183 () Bool)

(assert (=> b!46998 m!72183))

(declare-fun m!72185 () Bool)

(assert (=> d!13738 m!72185))

(declare-fun m!72187 () Bool)

(assert (=> d!13738 m!72187))

(declare-fun m!72189 () Bool)

(assert (=> d!13738 m!72189))

(assert (=> d!13738 m!71899))

(declare-fun m!72191 () Bool)

(assert (=> d!13738 m!72191))

(declare-fun m!72193 () Bool)

(assert (=> d!13738 m!72193))

(declare-fun m!72195 () Bool)

(assert (=> d!13738 m!72195))

(assert (=> d!13738 m!71831))

(assert (=> d!13738 m!71897))

(declare-fun m!72197 () Bool)

(assert (=> d!13738 m!72197))

(declare-fun m!72199 () Bool)

(assert (=> d!13738 m!72199))

(assert (=> b!46846 d!13738))

(declare-fun b!47029 () Bool)

(declare-fun res!39664 () Bool)

(declare-fun e!31205 () Bool)

(assert (=> b!47029 (=> (not res!39664) (not e!31205))))

(declare-fun lt!72922 () tuple2!4534)

(assert (=> b!47029 (= res!39664 (invariant!0 (currentBit!2887 (_2!2360 lt!72922)) (currentByte!2892 (_2!2360 lt!72922)) (size!1038 (buf!1387 (_2!2360 lt!72922)))))))

(declare-fun b!47030 () Bool)

(declare-fun e!31204 () tuple2!4534)

(declare-fun lt!72896 () tuple2!4534)

(declare-fun Unit!3326 () Unit!3313)

(assert (=> b!47030 (= e!31204 (tuple2!4535 Unit!3326 (_2!2360 lt!72896)))))

(declare-fun lt!72928 () tuple2!4534)

(assert (=> b!47030 (= lt!72928 (appendBitFromByte!0 (_2!2360 lt!72395) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!72889 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72889 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72900 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72900 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72910 () Unit!3313)

(assert (=> b!47030 (= lt!72910 (validateOffsetBitsIneqLemma!0 (_2!2360 lt!72395) (_2!2360 lt!72928) lt!72889 lt!72900))))

(assert (=> b!47030 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) (bvsub lt!72889 lt!72900))))

(declare-fun lt!72893 () Unit!3313)

(assert (=> b!47030 (= lt!72893 lt!72910)))

(declare-fun lt!72905 () tuple2!4532)

(assert (=> b!47030 (= lt!72905 (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72928)))))

(declare-fun lt!72921 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72921 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72917 () Unit!3313)

(assert (=> b!47030 (= lt!72917 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72928)) lt!72921))))

(assert (=> b!47030 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72921)))

(declare-fun lt!72883 () Unit!3313)

(assert (=> b!47030 (= lt!72883 lt!72917)))

(assert (=> b!47030 (= (head!364 (byteArrayBitContentToList!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!364 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72928) (_1!2359 lt!72905) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72914 () Unit!3313)

(declare-fun Unit!3327 () Unit!3313)

(assert (=> b!47030 (= lt!72914 Unit!3327)))

(assert (=> b!47030 (= lt!72896 (appendBitsMSBFirstLoop!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!72901 () Unit!3313)

(assert (=> b!47030 (= lt!72901 (lemmaIsPrefixTransitive!0 (_2!2360 lt!72395) (_2!2360 lt!72928) (_2!2360 lt!72896)))))

(assert (=> b!47030 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72896))))

(declare-fun lt!72882 () Unit!3313)

(assert (=> b!47030 (= lt!72882 lt!72901)))

(assert (=> b!47030 (= (size!1038 (buf!1387 (_2!2360 lt!72896))) (size!1038 (buf!1387 (_2!2360 lt!72395))))))

(declare-fun lt!72919 () Unit!3313)

(declare-fun Unit!3328 () Unit!3313)

(assert (=> b!47030 (= lt!72919 Unit!3328)))

(assert (=> b!47030 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72896))) (currentByte!2892 (_2!2360 lt!72896)) (currentBit!2887 (_2!2360 lt!72896))) (bvsub (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72899 () Unit!3313)

(declare-fun Unit!3329 () Unit!3313)

(assert (=> b!47030 (= lt!72899 Unit!3329)))

(assert (=> b!47030 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72896))) (currentByte!2892 (_2!2360 lt!72896)) (currentBit!2887 (_2!2360 lt!72896))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72918 () Unit!3313)

(declare-fun Unit!3330 () Unit!3313)

(assert (=> b!47030 (= lt!72918 Unit!3330)))

(declare-fun lt!72926 () tuple2!4532)

(assert (=> b!47030 (= lt!72926 (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72896)))))

(declare-fun lt!72888 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72888 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72903 () Unit!3313)

(assert (=> b!47030 (= lt!72903 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72896)) lt!72888))))

(assert (=> b!47030 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72888)))

(declare-fun lt!72907 () Unit!3313)

(assert (=> b!47030 (= lt!72907 lt!72903)))

(declare-fun lt!72913 () tuple2!4532)

(declare-fun call!568 () tuple2!4532)

(assert (=> b!47030 (= lt!72913 call!568)))

(declare-fun lt!72916 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72916 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72925 () Unit!3313)

(assert (=> b!47030 (= lt!72925 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!72896)) lt!72916))))

(assert (=> b!47030 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!72916)))

(declare-fun lt!72904 () Unit!3313)

(assert (=> b!47030 (= lt!72904 lt!72925)))

(declare-fun lt!72915 () List!545)

(assert (=> b!47030 (= lt!72915 (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72898 () List!545)

(assert (=> b!47030 (= lt!72898 (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72886 () List!545)

(assert (=> b!47030 (= lt!72886 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72926) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72912 () List!545)

(assert (=> b!47030 (= lt!72912 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72913) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72920 () (_ BitVec 64))

(assert (=> b!47030 (= lt!72920 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72902 () Unit!3313)

(assert (=> b!47030 (= lt!72902 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2360 lt!72896) (_2!2360 lt!72896) (_1!2359 lt!72926) (_1!2359 lt!72913) lt!72920 lt!72886))))

(assert (=> b!47030 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72913) (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!231 lt!72886))))

(declare-fun lt!72894 () Unit!3313)

(assert (=> b!47030 (= lt!72894 lt!72902)))

(declare-fun lt!72908 () (_ BitVec 64))

(declare-fun lt!72881 () Unit!3313)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2297 array!2297 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> b!47030 (= lt!72881 (arrayBitRangesEqImpliesEq!0 (buf!1387 (_2!2360 lt!72928)) (buf!1387 (_2!2360 lt!72896)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72908 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928)))))))

(assert (=> b!47030 (= (bitAt!0 (buf!1387 (_2!2360 lt!72928)) lt!72908) (bitAt!0 (buf!1387 (_2!2360 lt!72896)) lt!72908))))

(declare-fun lt!72892 () Unit!3313)

(assert (=> b!47030 (= lt!72892 lt!72881)))

(declare-fun b!47031 () Bool)

(declare-fun e!31203 () Bool)

(declare-fun lt!72909 () (_ BitVec 64))

(assert (=> b!47031 (= e!31203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72909))))

(declare-fun b!47032 () Bool)

(declare-fun Unit!3331 () Unit!3313)

(assert (=> b!47032 (= e!31204 (tuple2!4535 Unit!3331 (_2!2360 lt!72395)))))

(assert (=> b!47032 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72395))))))

(declare-fun lt!72927 () Unit!3313)

(declare-fun Unit!3332 () Unit!3313)

(assert (=> b!47032 (= lt!72927 Unit!3332)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1808 array!2297 array!2297 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4544 0))(
  ( (tuple2!4545 (_1!2365 array!2297) (_2!2365 BitStream!1808)) )
))
(declare-fun readBits!0 (BitStream!1808 (_ BitVec 64)) tuple2!4544)

(assert (=> b!47032 (checkByteArrayBitContent!0 (_2!2360 lt!72395) srcBuffer!2 (_1!2365 (readBits!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun c!3206 () Bool)

(declare-fun bm!565 () Bool)

(assert (=> bm!565 (= call!568 (reader!0 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun b!47033 () Bool)

(declare-fun res!39660 () Bool)

(assert (=> b!47033 (=> (not res!39660) (not e!31205))))

(assert (=> b!47033 (= res!39660 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72922)))))

(declare-fun b!47034 () Bool)

(declare-fun res!39662 () Bool)

(assert (=> b!47034 (=> (not res!39662) (not e!31205))))

(assert (=> b!47034 (= res!39662 (= (size!1038 (buf!1387 (_2!2360 lt!72922))) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(declare-fun lt!72887 () tuple2!4532)

(declare-fun b!47035 () Bool)

(assert (=> b!47035 (= e!31205 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72922) (_1!2359 lt!72887) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2360 lt!72922) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!47035 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47035 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72906 () Unit!3313)

(declare-fun lt!72897 () Unit!3313)

(assert (=> b!47035 (= lt!72906 lt!72897)))

(assert (=> b!47035 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72909)))

(assert (=> b!47035 (= lt!72897 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72922)) lt!72909))))

(assert (=> b!47035 e!31203))

(declare-fun res!39659 () Bool)

(assert (=> b!47035 (=> (not res!39659) (not e!31203))))

(assert (=> b!47035 (= res!39659 (and (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72922)))) (bvsge lt!72909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47035 (= lt!72909 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!47035 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47035 (= lt!72887 (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72922)))))

(declare-fun b!47028 () Bool)

(declare-fun res!39661 () Bool)

(assert (=> b!47028 (=> (not res!39661) (not e!31205))))

(assert (=> b!47028 (= res!39661 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72922)))))))

(declare-fun d!13760 () Bool)

(assert (=> d!13760 e!31205))

(declare-fun res!39663 () Bool)

(assert (=> d!13760 (=> (not res!39663) (not e!31205))))

(declare-fun lt!72911 () (_ BitVec 64))

(assert (=> d!13760 (= res!39663 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72922))) (currentByte!2892 (_2!2360 lt!72922)) (currentBit!2887 (_2!2360 lt!72922))) (bvsub lt!72911 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13760 (or (= (bvand lt!72911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72911 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72884 () (_ BitVec 64))

(assert (=> d!13760 (= lt!72911 (bvadd lt!72884 to!314))))

(assert (=> d!13760 (or (not (= (bvand lt!72884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!72884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!72884 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13760 (= lt!72884 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!13760 (= lt!72922 e!31204)))

(assert (=> d!13760 (= c!3206 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!72895 () Unit!3313)

(declare-fun lt!72885 () Unit!3313)

(assert (=> d!13760 (= lt!72895 lt!72885)))

(assert (=> d!13760 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!13760 (= lt!72885 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(assert (=> d!13760 (= lt!72908 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!13760 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13760 (= (appendBitsMSBFirstLoop!0 (_2!2360 lt!72395) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!72922)))

(assert (= (and d!13760 c!3206) b!47030))

(assert (= (and d!13760 (not c!3206)) b!47032))

(assert (= (or b!47030 b!47032) bm!565))

(assert (= (and d!13760 res!39663) b!47029))

(assert (= (and b!47029 res!39664) b!47028))

(assert (= (and b!47028 res!39661) b!47033))

(assert (= (and b!47033 res!39660) b!47034))

(assert (= (and b!47034 res!39662) b!47035))

(assert (= (and b!47035 res!39659) b!47031))

(declare-fun m!72213 () Bool)

(assert (=> b!47031 m!72213))

(declare-fun m!72215 () Bool)

(assert (=> bm!565 m!72215))

(declare-fun m!72217 () Bool)

(assert (=> b!47032 m!72217))

(declare-fun m!72219 () Bool)

(assert (=> b!47032 m!72219))

(declare-fun m!72221 () Bool)

(assert (=> d!13760 m!72221))

(assert (=> d!13760 m!71893))

(assert (=> d!13760 m!72193))

(assert (=> d!13760 m!72197))

(declare-fun m!72223 () Bool)

(assert (=> b!47033 m!72223))

(declare-fun m!72225 () Bool)

(assert (=> b!47030 m!72225))

(declare-fun m!72227 () Bool)

(assert (=> b!47030 m!72227))

(declare-fun m!72229 () Bool)

(assert (=> b!47030 m!72229))

(declare-fun m!72231 () Bool)

(assert (=> b!47030 m!72231))

(declare-fun m!72233 () Bool)

(assert (=> b!47030 m!72233))

(declare-fun m!72235 () Bool)

(assert (=> b!47030 m!72235))

(declare-fun m!72237 () Bool)

(assert (=> b!47030 m!72237))

(declare-fun m!72239 () Bool)

(assert (=> b!47030 m!72239))

(declare-fun m!72241 () Bool)

(assert (=> b!47030 m!72241))

(declare-fun m!72243 () Bool)

(assert (=> b!47030 m!72243))

(declare-fun m!72245 () Bool)

(assert (=> b!47030 m!72245))

(declare-fun m!72247 () Bool)

(assert (=> b!47030 m!72247))

(declare-fun m!72249 () Bool)

(assert (=> b!47030 m!72249))

(declare-fun m!72251 () Bool)

(assert (=> b!47030 m!72251))

(assert (=> b!47030 m!72237))

(declare-fun m!72253 () Bool)

(assert (=> b!47030 m!72253))

(declare-fun m!72255 () Bool)

(assert (=> b!47030 m!72255))

(declare-fun m!72257 () Bool)

(assert (=> b!47030 m!72257))

(declare-fun m!72259 () Bool)

(assert (=> b!47030 m!72259))

(declare-fun m!72261 () Bool)

(assert (=> b!47030 m!72261))

(declare-fun m!72263 () Bool)

(assert (=> b!47030 m!72263))

(declare-fun m!72265 () Bool)

(assert (=> b!47030 m!72265))

(declare-fun m!72267 () Bool)

(assert (=> b!47030 m!72267))

(declare-fun m!72269 () Bool)

(assert (=> b!47030 m!72269))

(declare-fun m!72271 () Bool)

(assert (=> b!47030 m!72271))

(declare-fun m!72273 () Bool)

(assert (=> b!47030 m!72273))

(declare-fun m!72275 () Bool)

(assert (=> b!47030 m!72275))

(declare-fun m!72277 () Bool)

(assert (=> b!47030 m!72277))

(declare-fun m!72279 () Bool)

(assert (=> b!47030 m!72279))

(declare-fun m!72281 () Bool)

(assert (=> b!47030 m!72281))

(assert (=> b!47030 m!72257))

(declare-fun m!72283 () Bool)

(assert (=> b!47030 m!72283))

(assert (=> b!47030 m!72271))

(declare-fun m!72285 () Bool)

(assert (=> b!47030 m!72285))

(assert (=> b!47030 m!72263))

(assert (=> b!47030 m!71893))

(declare-fun m!72287 () Bool)

(assert (=> b!47029 m!72287))

(declare-fun m!72289 () Bool)

(assert (=> b!47035 m!72289))

(declare-fun m!72291 () Bool)

(assert (=> b!47035 m!72291))

(declare-fun m!72293 () Bool)

(assert (=> b!47035 m!72293))

(declare-fun m!72295 () Bool)

(assert (=> b!47035 m!72295))

(declare-fun m!72297 () Bool)

(assert (=> b!47035 m!72297))

(assert (=> b!46846 d!13760))

(declare-fun d!13776 () Bool)

(assert (=> d!13776 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72389))))

(declare-fun lt!72934 () Unit!3313)

(declare-fun choose!30 (BitStream!1808 BitStream!1808 BitStream!1808) Unit!3313)

(assert (=> d!13776 (= lt!72934 (choose!30 thiss!1379 (_2!2360 lt!72395) (_2!2360 lt!72389)))))

(assert (=> d!13776 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72395))))

(assert (=> d!13776 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2360 lt!72395) (_2!2360 lt!72389)) lt!72934)))

(declare-fun bs!3614 () Bool)

(assert (= bs!3614 d!13776))

(assert (=> bs!3614 m!71875))

(declare-fun m!72299 () Bool)

(assert (=> bs!3614 m!72299))

(assert (=> bs!3614 m!71831))

(assert (=> b!46846 d!13776))

(declare-fun d!13778 () Bool)

(declare-fun res!39679 () Bool)

(declare-fun e!31217 () Bool)

(assert (=> d!13778 (=> (not res!39679) (not e!31217))))

(assert (=> d!13778 (= res!39679 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13778 (= (isPrefixOf!0 thiss!1379 (_2!2360 lt!72389)) e!31217)))

(declare-fun b!47056 () Bool)

(declare-fun res!39678 () Bool)

(assert (=> b!47056 (=> (not res!39678) (not e!31217))))

(assert (=> b!47056 (= res!39678 (bvsle (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47057 () Bool)

(declare-fun e!31218 () Bool)

(assert (=> b!47057 (= e!31217 e!31218)))

(declare-fun res!39677 () Bool)

(assert (=> b!47057 (=> res!39677 e!31218)))

(assert (=> b!47057 (= res!39677 (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47058 () Bool)

(assert (=> b!47058 (= e!31218 (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (= (and d!13778 res!39679) b!47056))

(assert (= (and b!47056 res!39678) b!47057))

(assert (= (and b!47057 (not res!39677)) b!47058))

(assert (=> b!47056 m!71901))

(assert (=> b!47056 m!71895))

(assert (=> b!47058 m!71901))

(assert (=> b!47058 m!71901))

(declare-fun m!72303 () Bool)

(assert (=> b!47058 m!72303))

(assert (=> b!46846 d!13778))

(declare-fun d!13784 () Bool)

(assert (=> d!13784 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72955 () Unit!3313)

(declare-fun choose!9 (BitStream!1808 array!2297 (_ BitVec 64) BitStream!1808) Unit!3313)

(assert (=> d!13784 (= lt!72955 (choose!9 thiss!1379 (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1809 (buf!1387 (_2!2360 lt!72395)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (=> d!13784 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72955)))

(declare-fun bs!3615 () Bool)

(assert (= bs!3615 d!13784))

(assert (=> bs!3615 m!71883))

(declare-fun m!72307 () Bool)

(assert (=> bs!3615 m!72307))

(assert (=> b!46846 d!13784))

(declare-fun d!13788 () Bool)

(declare-fun res!39691 () Bool)

(declare-fun e!31225 () Bool)

(assert (=> d!13788 (=> (not res!39691) (not e!31225))))

(assert (=> d!13788 (= res!39691 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13788 (= (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72389)) e!31225)))

(declare-fun b!47068 () Bool)

(declare-fun res!39690 () Bool)

(assert (=> b!47068 (=> (not res!39690) (not e!31225))))

(assert (=> b!47068 (= res!39690 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47069 () Bool)

(declare-fun e!31226 () Bool)

(assert (=> b!47069 (= e!31225 e!31226)))

(declare-fun res!39689 () Bool)

(assert (=> b!47069 (=> res!39689 e!31226)))

(assert (=> b!47069 (= res!39689 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000))))

(declare-fun b!47070 () Bool)

(assert (=> b!47070 (= e!31226 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (= (and d!13788 res!39691) b!47068))

(assert (= (and b!47068 res!39690) b!47069))

(assert (= (and b!47069 (not res!39689)) b!47070))

(assert (=> b!47068 m!71893))

(assert (=> b!47068 m!71895))

(assert (=> b!47070 m!71893))

(assert (=> b!47070 m!71893))

(declare-fun m!72309 () Bool)

(assert (=> b!47070 m!72309))

(assert (=> b!46846 d!13788))

(declare-fun d!13790 () Bool)

(assert (=> d!13790 (= (head!364 (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!660 (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46835 d!13790))

(declare-fun d!13794 () Bool)

(declare-fun c!3213 () Bool)

(assert (=> d!13794 (= c!3213 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31230 () List!545)

(assert (=> d!13794 (= (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!31230)))

(declare-fun b!47077 () Bool)

(assert (=> b!47077 (= e!31230 Nil!542)))

(declare-fun b!47078 () Bool)

(assert (=> b!47078 (= e!31230 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13794 c!3213) b!47077))

(assert (= (and d!13794 (not c!3213)) b!47078))

(assert (=> b!47078 m!71829))

(declare-fun m!72317 () Bool)

(assert (=> b!47078 m!72317))

(declare-fun m!72319 () Bool)

(assert (=> b!47078 m!72319))

(assert (=> b!46835 d!13794))

(declare-fun d!13804 () Bool)

(assert (=> d!13804 (= (head!364 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_1!2359 lt!72380) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!660 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_1!2359 lt!72380) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46835 d!13804))

(declare-fun b!47098 () Bool)

(declare-datatypes ((tuple2!4546 0))(
  ( (tuple2!4547 (_1!2366 List!545) (_2!2366 BitStream!1808)) )
))
(declare-fun e!31244 () tuple2!4546)

(assert (=> b!47098 (= e!31244 (tuple2!4547 Nil!542 (_1!2359 lt!72380)))))

(declare-fun b!47100 () Bool)

(declare-fun e!31243 () Bool)

(declare-fun lt!72986 () List!545)

(declare-fun isEmpty!138 (List!545) Bool)

(assert (=> b!47100 (= e!31243 (isEmpty!138 lt!72986))))

(declare-fun b!47101 () Bool)

(assert (=> b!47101 (= e!31243 (> (length!240 lt!72986) 0))))

(declare-fun lt!72988 () (_ BitVec 64))

(declare-datatypes ((tuple2!4548 0))(
  ( (tuple2!4549 (_1!2367 Bool) (_2!2367 BitStream!1808)) )
))
(declare-fun lt!72987 () tuple2!4548)

(declare-fun b!47099 () Bool)

(assert (=> b!47099 (= e!31244 (tuple2!4547 (Cons!541 (_1!2367 lt!72987) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_2!2367 lt!72987) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988))) (_2!2367 lt!72987)))))

(declare-fun readBit!0 (BitStream!1808) tuple2!4548)

(assert (=> b!47099 (= lt!72987 (readBit!0 (_1!2359 lt!72380)))))

(assert (=> b!47099 (= lt!72988 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13806 () Bool)

(assert (=> d!13806 e!31243))

(declare-fun c!3219 () Bool)

(assert (=> d!13806 (= c!3219 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13806 (= lt!72986 (_1!2366 e!31244))))

(declare-fun c!3218 () Bool)

(assert (=> d!13806 (= c!3218 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13806 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13806 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_1!2359 lt!72380) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72986)))

(assert (= (and d!13806 c!3218) b!47098))

(assert (= (and d!13806 (not c!3218)) b!47099))

(assert (= (and d!13806 c!3219) b!47100))

(assert (= (and d!13806 (not c!3219)) b!47101))

(declare-fun m!72333 () Bool)

(assert (=> b!47100 m!72333))

(declare-fun m!72335 () Bool)

(assert (=> b!47101 m!72335))

(declare-fun m!72337 () Bool)

(assert (=> b!47099 m!72337))

(declare-fun m!72339 () Bool)

(assert (=> b!47099 m!72339))

(assert (=> b!46835 d!13806))

(declare-fun d!13820 () Bool)

(assert (=> d!13820 (= (invariant!0 (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72389)))) (and (bvsge (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (bvslt (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000001000) (bvsge (currentByte!2892 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72389)))) (and (= (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (= (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))))

(assert (=> b!46845 d!13820))

(declare-fun d!13822 () Bool)

(declare-fun size!1040 (List!545) Int)

(assert (=> d!13822 (= (length!240 lt!72379) (size!1040 lt!72379))))

(declare-fun bs!3620 () Bool)

(assert (= bs!3620 d!13822))

(declare-fun m!72341 () Bool)

(assert (=> bs!3620 m!72341))

(assert (=> b!46843 d!13822))

(declare-fun d!13824 () Bool)

(declare-fun res!39707 () Bool)

(declare-fun e!31245 () Bool)

(assert (=> d!13824 (=> (not res!39707) (not e!31245))))

(assert (=> d!13824 (= res!39707 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!13824 (= (isPrefixOf!0 thiss!1379 (_2!2360 lt!72395)) e!31245)))

(declare-fun b!47102 () Bool)

(declare-fun res!39706 () Bool)

(assert (=> b!47102 (=> (not res!39706) (not e!31245))))

(assert (=> b!47102 (= res!39706 (bvsle (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun b!47103 () Bool)

(declare-fun e!31246 () Bool)

(assert (=> b!47103 (= e!31245 e!31246)))

(declare-fun res!39705 () Bool)

(assert (=> b!47103 (=> res!39705 e!31246)))

(assert (=> b!47103 (= res!39705 (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47104 () Bool)

(assert (=> b!47104 (= e!31246 (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (= (and d!13824 res!39707) b!47102))

(assert (= (and b!47102 res!39706) b!47103))

(assert (= (and b!47103 (not res!39705)) b!47104))

(assert (=> b!47102 m!71901))

(assert (=> b!47102 m!71893))

(assert (=> b!47104 m!71901))

(assert (=> b!47104 m!71901))

(declare-fun m!72343 () Bool)

(assert (=> b!47104 m!72343))

(assert (=> b!46844 d!13824))

(declare-fun d!13826 () Bool)

(assert (=> d!13826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72387))))

(declare-fun bs!3621 () Bool)

(assert (= bs!3621 d!13826))

(declare-fun m!72345 () Bool)

(assert (=> bs!3621 m!72345))

(assert (=> b!46844 d!13826))

(declare-fun d!13828 () Bool)

(declare-fun e!31249 () Bool)

(assert (=> d!13828 e!31249))

(declare-fun res!39710 () Bool)

(assert (=> d!13828 (=> (not res!39710) (not e!31249))))

(assert (=> d!13828 (= res!39710 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72991 () Unit!3313)

(declare-fun choose!27 (BitStream!1808 BitStream!1808 (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> d!13828 (= lt!72991 (choose!27 thiss!1379 (_2!2360 lt!72395) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13828 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13828 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2360 lt!72395) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72991)))

(declare-fun b!47107 () Bool)

(assert (=> b!47107 (= e!31249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13828 res!39710) b!47107))

(declare-fun m!72347 () Bool)

(assert (=> d!13828 m!72347))

(declare-fun m!72349 () Bool)

(assert (=> b!47107 m!72349))

(assert (=> b!46844 d!13828))

(declare-fun b!47140 () Bool)

(declare-fun res!39740 () Bool)

(declare-fun e!31266 () Bool)

(assert (=> b!47140 (=> (not res!39740) (not e!31266))))

(declare-fun lt!73086 () (_ BitVec 64))

(declare-fun lt!73076 () tuple2!4534)

(declare-fun lt!73087 () (_ BitVec 64))

(assert (=> b!47140 (= res!39740 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73076))) (currentByte!2892 (_2!2360 lt!73076)) (currentBit!2887 (_2!2360 lt!73076))) (bvadd lt!73086 lt!73087)))))

(assert (=> b!47140 (or (not (= (bvand lt!73086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73087 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73086 lt!73087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47140 (= lt!73087 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47140 (= lt!73086 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47141 () Bool)

(declare-fun res!39742 () Bool)

(assert (=> b!47141 (=> (not res!39742) (not e!31266))))

(assert (=> b!47141 (= res!39742 (isPrefixOf!0 thiss!1379 (_2!2360 lt!73076)))))

(declare-fun b!47142 () Bool)

(declare-fun e!31267 () Bool)

(declare-fun e!31265 () Bool)

(assert (=> b!47142 (= e!31267 e!31265)))

(declare-fun res!39737 () Bool)

(assert (=> b!47142 (=> (not res!39737) (not e!31265))))

(declare-fun lt!73078 () Bool)

(declare-fun lt!73083 () tuple2!4534)

(declare-datatypes ((tuple2!4550 0))(
  ( (tuple2!4551 (_1!2368 BitStream!1808) (_2!2368 Bool)) )
))
(declare-fun lt!73080 () tuple2!4550)

(assert (=> b!47142 (= res!39737 (and (= (_2!2368 lt!73080) lt!73078) (= (_1!2368 lt!73080) (_2!2360 lt!73083))))))

(declare-fun readBitPure!0 (BitStream!1808) tuple2!4550)

(declare-fun readerFrom!0 (BitStream!1808 (_ BitVec 32) (_ BitVec 32)) BitStream!1808)

(assert (=> b!47142 (= lt!73080 (readBitPure!0 (readerFrom!0 (_2!2360 lt!73083) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379))))))

(declare-fun b!47143 () Bool)

(declare-fun e!31264 () Bool)

(declare-fun lt!73079 () tuple2!4550)

(assert (=> b!47143 (= e!31264 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73079))) (currentByte!2892 (_1!2368 lt!73079)) (currentBit!2887 (_1!2368 lt!73079))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73076))) (currentByte!2892 (_2!2360 lt!73076)) (currentBit!2887 (_2!2360 lt!73076)))))))

(declare-fun b!47144 () Bool)

(assert (=> b!47144 (= e!31266 e!31264)))

(declare-fun res!39743 () Bool)

(assert (=> b!47144 (=> (not res!39743) (not e!31264))))

(declare-fun lt!73082 () (_ BitVec 8))

(assert (=> b!47144 (= res!39743 (and (= (_2!2368 lt!73079) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!73082)) #b00000000000000000000000000000000))) (= (_1!2368 lt!73079) (_2!2360 lt!73076))))))

(declare-fun lt!73084 () tuple2!4544)

(declare-fun lt!73077 () BitStream!1808)

(assert (=> b!47144 (= lt!73084 (readBits!0 lt!73077 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!47144 (= lt!73079 (readBitPure!0 lt!73077))))

(assert (=> b!47144 (= lt!73077 (readerFrom!0 (_2!2360 lt!73076) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379)))))

(declare-fun b!47146 () Bool)

(assert (=> b!47146 (= e!31265 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73080))) (currentByte!2892 (_1!2368 lt!73080)) (currentBit!2887 (_1!2368 lt!73080))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73083))) (currentByte!2892 (_2!2360 lt!73083)) (currentBit!2887 (_2!2360 lt!73083)))))))

(declare-fun b!47147 () Bool)

(declare-fun res!39741 () Bool)

(assert (=> b!47147 (=> (not res!39741) (not e!31267))))

(assert (=> b!47147 (= res!39741 (isPrefixOf!0 thiss!1379 (_2!2360 lt!73083)))))

(declare-fun b!47145 () Bool)

(declare-fun res!39738 () Bool)

(assert (=> b!47145 (=> (not res!39738) (not e!31267))))

(assert (=> b!47145 (= res!39738 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73083))) (currentByte!2892 (_2!2360 lt!73083)) (currentBit!2887 (_2!2360 lt!73083))) (bvadd (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!13830 () Bool)

(assert (=> d!13830 e!31266))

(declare-fun res!39739 () Bool)

(assert (=> d!13830 (=> (not res!39739) (not e!31266))))

(assert (=> d!13830 (= res!39739 (= (size!1038 (buf!1387 (_2!2360 lt!73076))) (size!1038 (buf!1387 thiss!1379))))))

(declare-fun lt!73085 () array!2297)

(assert (=> d!13830 (= lt!73082 (select (arr!1558 lt!73085) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13830 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1038 lt!73085)))))

(assert (=> d!13830 (= lt!73085 (array!2298 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!73081 () tuple2!4534)

(assert (=> d!13830 (= lt!73076 (tuple2!4535 (_1!2360 lt!73081) (_2!2360 lt!73081)))))

(assert (=> d!13830 (= lt!73081 lt!73083)))

(assert (=> d!13830 e!31267))

(declare-fun res!39736 () Bool)

(assert (=> d!13830 (=> (not res!39736) (not e!31267))))

(assert (=> d!13830 (= res!39736 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(declare-fun appendBit!0 (BitStream!1808 Bool) tuple2!4534)

(assert (=> d!13830 (= lt!73083 (appendBit!0 thiss!1379 lt!73078))))

(assert (=> d!13830 (= lt!73078 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13830 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13830 (= (appendBitFromByte!0 thiss!1379 (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!73076)))

(assert (= (and d!13830 res!39736) b!47145))

(assert (= (and b!47145 res!39738) b!47147))

(assert (= (and b!47147 res!39741) b!47142))

(assert (= (and b!47142 res!39737) b!47146))

(assert (= (and d!13830 res!39739) b!47140))

(assert (= (and b!47140 res!39740) b!47141))

(assert (= (and b!47141 res!39742) b!47144))

(assert (= (and b!47144 res!39743) b!47143))

(declare-fun m!72377 () Bool)

(assert (=> b!47141 m!72377))

(declare-fun m!72379 () Bool)

(assert (=> b!47142 m!72379))

(assert (=> b!47142 m!72379))

(declare-fun m!72381 () Bool)

(assert (=> b!47142 m!72381))

(declare-fun m!72383 () Bool)

(assert (=> b!47147 m!72383))

(declare-fun m!72385 () Bool)

(assert (=> b!47145 m!72385))

(assert (=> b!47145 m!71901))

(declare-fun m!72387 () Bool)

(assert (=> b!47140 m!72387))

(assert (=> b!47140 m!71901))

(declare-fun m!72389 () Bool)

(assert (=> b!47144 m!72389))

(declare-fun m!72391 () Bool)

(assert (=> b!47144 m!72391))

(declare-fun m!72393 () Bool)

(assert (=> b!47144 m!72393))

(declare-fun m!72395 () Bool)

(assert (=> b!47143 m!72395))

(assert (=> b!47143 m!72387))

(declare-fun m!72397 () Bool)

(assert (=> b!47146 m!72397))

(assert (=> b!47146 m!72385))

(declare-fun m!72399 () Bool)

(assert (=> d!13830 m!72399))

(declare-fun m!72401 () Bool)

(assert (=> d!13830 m!72401))

(assert (=> d!13830 m!72317))

(assert (=> b!46844 d!13830))

(declare-fun d!13834 () Bool)

(assert (=> d!13834 (= (tail!231 lt!72379) (t!1295 lt!72379))))

(assert (=> b!46842 d!13834))

(declare-fun d!13836 () Bool)

(declare-fun e!31270 () Bool)

(assert (=> d!13836 e!31270))

(declare-fun res!39746 () Bool)

(assert (=> d!13836 (=> (not res!39746) (not e!31270))))

(declare-fun lt!73093 () (_ BitVec 64))

(assert (=> d!13836 (= res!39746 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73093 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!73093) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13836 (= lt!73093 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73092 () Unit!3313)

(declare-fun choose!42 (BitStream!1808 BitStream!1808 BitStream!1808 BitStream!1808 (_ BitVec 64) List!545) Unit!3313)

(assert (=> d!13836 (= lt!73092 (choose!42 (_2!2360 lt!72389) (_2!2360 lt!72389) (_1!2359 lt!72381) (_1!2359 lt!72388) (bvsub to!314 i!635) lt!72379))))

(assert (=> d!13836 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13836 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2360 lt!72389) (_2!2360 lt!72389) (_1!2359 lt!72381) (_1!2359 lt!72388) (bvsub to!314 i!635) lt!72379) lt!73092)))

(declare-fun b!47150 () Bool)

(assert (=> b!47150 (= e!31270 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72388) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!231 lt!72379)))))

(assert (= (and d!13836 res!39746) b!47150))

(declare-fun m!72403 () Bool)

(assert (=> d!13836 m!72403))

(declare-fun m!72405 () Bool)

(assert (=> b!47150 m!72405))

(assert (=> b!47150 m!71907))

(assert (=> b!46842 d!13836))

(declare-fun d!13838 () Bool)

(assert (=> d!13838 (= (invariant!0 (currentBit!2887 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72389)) (size!1038 (buf!1387 (_2!2360 lt!72389)))) (and (bvsge (currentBit!2887 (_2!2360 lt!72389)) #b00000000000000000000000000000000) (bvslt (currentBit!2887 (_2!2360 lt!72389)) #b00000000000000000000000000001000) (bvsge (currentByte!2892 (_2!2360 lt!72389)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2892 (_2!2360 lt!72389)) (size!1038 (buf!1387 (_2!2360 lt!72389)))) (and (= (currentBit!2887 (_2!2360 lt!72389)) #b00000000000000000000000000000000) (= (currentByte!2892 (_2!2360 lt!72389)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))))))

(assert (=> b!46851 d!13838))

(declare-fun d!13840 () Bool)

(assert (=> d!13840 (= (head!364 lt!72379) (h!660 lt!72379))))

(assert (=> b!46852 d!13840))

(declare-fun d!13842 () Bool)

(assert (=> d!13842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3622 () Bool)

(assert (= bs!3622 d!13842))

(declare-fun m!72407 () Bool)

(assert (=> bs!3622 m!72407))

(assert (=> b!46841 d!13842))

(declare-fun d!13844 () Bool)

(declare-fun e!31273 () Bool)

(assert (=> d!13844 e!31273))

(declare-fun res!39752 () Bool)

(assert (=> d!13844 (=> (not res!39752) (not e!31273))))

(declare-fun lt!73109 () (_ BitVec 64))

(declare-fun lt!73108 () (_ BitVec 64))

(declare-fun lt!73111 () (_ BitVec 64))

(assert (=> d!13844 (= res!39752 (= lt!73109 (bvsub lt!73108 lt!73111)))))

(assert (=> d!13844 (or (= (bvand lt!73108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73108 lt!73111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13844 (= lt!73111 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun lt!73110 () (_ BitVec 64))

(declare-fun lt!73106 () (_ BitVec 64))

(assert (=> d!13844 (= lt!73108 (bvmul lt!73110 lt!73106))))

(assert (=> d!13844 (or (= lt!73110 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73106 (bvsdiv (bvmul lt!73110 lt!73106) lt!73110)))))

(assert (=> d!13844 (= lt!73106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13844 (= lt!73110 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!13844 (= lt!73109 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!13844 (invariant!0 (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72395))))))

(assert (=> d!13844 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) lt!73109)))

(declare-fun b!47155 () Bool)

(declare-fun res!39751 () Bool)

(assert (=> b!47155 (=> (not res!39751) (not e!31273))))

(assert (=> b!47155 (= res!39751 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73109))))

(declare-fun b!47156 () Bool)

(declare-fun lt!73107 () (_ BitVec 64))

(assert (=> b!47156 (= e!31273 (bvsle lt!73109 (bvmul lt!73107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47156 (or (= lt!73107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73107)))))

(assert (=> b!47156 (= lt!73107 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (= (and d!13844 res!39752) b!47155))

(assert (= (and b!47155 res!39751) b!47156))

(assert (=> d!13844 m!72345))

(assert (=> d!13844 m!71903))

(assert (=> b!46839 d!13844))

(declare-fun d!13846 () Bool)

(declare-fun res!39755 () Bool)

(declare-fun e!31274 () Bool)

(assert (=> d!13846 (=> (not res!39755) (not e!31274))))

(assert (=> d!13846 (= res!39755 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 thiss!1379))))))

(assert (=> d!13846 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!31274)))

(declare-fun b!47157 () Bool)

(declare-fun res!39754 () Bool)

(assert (=> b!47157 (=> (not res!39754) (not e!31274))))

(assert (=> b!47157 (= res!39754 (bvsle (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun b!47158 () Bool)

(declare-fun e!31275 () Bool)

(assert (=> b!47158 (= e!31274 e!31275)))

(declare-fun res!39753 () Bool)

(assert (=> b!47158 (=> res!39753 e!31275)))

(assert (=> b!47158 (= res!39753 (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47159 () Bool)

(assert (=> b!47159 (= e!31275 (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (= (and d!13846 res!39755) b!47157))

(assert (= (and b!47157 res!39754) b!47158))

(assert (= (and b!47158 (not res!39753)) b!47159))

(assert (=> b!47157 m!71901))

(assert (=> b!47157 m!71901))

(assert (=> b!47159 m!71901))

(assert (=> b!47159 m!71901))

(declare-fun m!72409 () Bool)

(assert (=> b!47159 m!72409))

(assert (=> b!46840 d!13846))

(declare-fun d!13848 () Bool)

(assert (=> d!13848 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!73114 () Unit!3313)

(declare-fun choose!11 (BitStream!1808) Unit!3313)

(assert (=> d!13848 (= lt!73114 (choose!11 thiss!1379))))

(assert (=> d!13848 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!73114)))

(declare-fun bs!3624 () Bool)

(assert (= bs!3624 d!13848))

(assert (=> bs!3624 m!71897))

(declare-fun m!72411 () Bool)

(assert (=> bs!3624 m!72411))

(assert (=> b!46840 d!13848))

(declare-fun d!13850 () Bool)

(declare-fun e!31276 () Bool)

(assert (=> d!13850 e!31276))

(declare-fun res!39757 () Bool)

(assert (=> d!13850 (=> (not res!39757) (not e!31276))))

(declare-fun lt!73120 () (_ BitVec 64))

(declare-fun lt!73118 () (_ BitVec 64))

(declare-fun lt!73117 () (_ BitVec 64))

(assert (=> d!13850 (= res!39757 (= lt!73118 (bvsub lt!73117 lt!73120)))))

(assert (=> d!13850 (or (= (bvand lt!73117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73117 lt!73120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13850 (= lt!73120 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))))))

(declare-fun lt!73119 () (_ BitVec 64))

(declare-fun lt!73115 () (_ BitVec 64))

(assert (=> d!13850 (= lt!73117 (bvmul lt!73119 lt!73115))))

(assert (=> d!13850 (or (= lt!73119 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73115 (bvsdiv (bvmul lt!73119 lt!73115) lt!73119)))))

(assert (=> d!13850 (= lt!73115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13850 (= lt!73119 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))))))

(assert (=> d!13850 (= lt!73118 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 thiss!1379))))))

(assert (=> d!13850 (invariant!0 (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379) (size!1038 (buf!1387 thiss!1379)))))

(assert (=> d!13850 (= (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) lt!73118)))

(declare-fun b!47160 () Bool)

(declare-fun res!39756 () Bool)

(assert (=> b!47160 (=> (not res!39756) (not e!31276))))

(assert (=> b!47160 (= res!39756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73118))))

(declare-fun b!47161 () Bool)

(declare-fun lt!73116 () (_ BitVec 64))

(assert (=> b!47161 (= e!31276 (bvsle lt!73118 (bvmul lt!73116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47161 (or (= lt!73116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73116)))))

(assert (=> b!47161 (= lt!73116 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))))))

(assert (= (and d!13850 res!39757) b!47160))

(assert (= (and b!47160 res!39756) b!47161))

(assert (=> d!13850 m!72407))

(declare-fun m!72413 () Bool)

(assert (=> d!13850 m!72413))

(assert (=> b!46840 d!13850))

(declare-fun d!13852 () Bool)

(assert (=> d!13852 (= (array_inv!957 srcBuffer!2) (bvsge (size!1038 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9408 d!13852))

(declare-fun d!13854 () Bool)

(assert (=> d!13854 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379) (size!1038 (buf!1387 thiss!1379))))))

(declare-fun bs!3625 () Bool)

(assert (= bs!3625 d!13854))

(assert (=> bs!3625 m!72413))

(assert (=> start!9408 d!13854))

(declare-fun d!13856 () Bool)

(assert (=> d!13856 (= (array_inv!957 (buf!1387 thiss!1379)) (bvsge (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46838 d!13856))

(declare-fun b!47162 () Bool)

(declare-fun res!39759 () Bool)

(declare-fun e!31278 () Bool)

(assert (=> b!47162 (=> (not res!39759) (not e!31278))))

(declare-fun lt!73135 () tuple2!4532)

(assert (=> b!47162 (= res!39759 (isPrefixOf!0 (_2!2359 lt!73135) (_2!2360 lt!72389)))))

(declare-fun b!47163 () Bool)

(declare-fun e!31277 () Unit!3313)

(declare-fun lt!73134 () Unit!3313)

(assert (=> b!47163 (= e!31277 lt!73134)))

(declare-fun lt!73139 () (_ BitVec 64))

(assert (=> b!47163 (= lt!73139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73128 () (_ BitVec 64))

(assert (=> b!47163 (= lt!73128 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(assert (=> b!47163 (= lt!73134 (arrayBitRangesEqSymmetric!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) lt!73139 lt!73128))))

(assert (=> b!47163 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 thiss!1379) lt!73139 lt!73128)))

(declare-fun b!47164 () Bool)

(declare-fun lt!73122 () (_ BitVec 64))

(declare-fun lt!73137 () (_ BitVec 64))

(assert (=> b!47164 (= e!31278 (= (_1!2359 lt!73135) (withMovedBitIndex!0 (_2!2359 lt!73135) (bvsub lt!73122 lt!73137))))))

(assert (=> b!47164 (or (= (bvand lt!73122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73122 lt!73137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47164 (= lt!73137 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389))))))

(assert (=> b!47164 (= lt!73122 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47165 () Bool)

(declare-fun res!39758 () Bool)

(assert (=> b!47165 (=> (not res!39758) (not e!31278))))

(assert (=> b!47165 (= res!39758 (isPrefixOf!0 (_1!2359 lt!73135) thiss!1379))))

(declare-fun b!47166 () Bool)

(declare-fun Unit!3333 () Unit!3313)

(assert (=> b!47166 (= e!31277 Unit!3333)))

(declare-fun d!13858 () Bool)

(assert (=> d!13858 e!31278))

(declare-fun res!39760 () Bool)

(assert (=> d!13858 (=> (not res!39760) (not e!31278))))

(assert (=> d!13858 (= res!39760 (isPrefixOf!0 (_1!2359 lt!73135) (_2!2359 lt!73135)))))

(declare-fun lt!73136 () BitStream!1808)

(assert (=> d!13858 (= lt!73135 (tuple2!4533 lt!73136 (_2!2360 lt!72389)))))

(declare-fun lt!73132 () Unit!3313)

(declare-fun lt!73129 () Unit!3313)

(assert (=> d!13858 (= lt!73132 lt!73129)))

(assert (=> d!13858 (isPrefixOf!0 lt!73136 (_2!2360 lt!72389))))

(assert (=> d!13858 (= lt!73129 (lemmaIsPrefixTransitive!0 lt!73136 (_2!2360 lt!72389) (_2!2360 lt!72389)))))

(declare-fun lt!73138 () Unit!3313)

(declare-fun lt!73126 () Unit!3313)

(assert (=> d!13858 (= lt!73138 lt!73126)))

(assert (=> d!13858 (isPrefixOf!0 lt!73136 (_2!2360 lt!72389))))

(assert (=> d!13858 (= lt!73126 (lemmaIsPrefixTransitive!0 lt!73136 thiss!1379 (_2!2360 lt!72389)))))

(declare-fun lt!73133 () Unit!3313)

(assert (=> d!13858 (= lt!73133 e!31277)))

(declare-fun c!3223 () Bool)

(assert (=> d!13858 (= c!3223 (not (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!73130 () Unit!3313)

(declare-fun lt!73121 () Unit!3313)

(assert (=> d!13858 (= lt!73130 lt!73121)))

(assert (=> d!13858 (isPrefixOf!0 (_2!2360 lt!72389) (_2!2360 lt!72389))))

(assert (=> d!13858 (= lt!73121 (lemmaIsPrefixRefl!0 (_2!2360 lt!72389)))))

(declare-fun lt!73123 () Unit!3313)

(declare-fun lt!73127 () Unit!3313)

(assert (=> d!13858 (= lt!73123 lt!73127)))

(assert (=> d!13858 (= lt!73127 (lemmaIsPrefixRefl!0 (_2!2360 lt!72389)))))

(declare-fun lt!73140 () Unit!3313)

(declare-fun lt!73125 () Unit!3313)

(assert (=> d!13858 (= lt!73140 lt!73125)))

(assert (=> d!13858 (isPrefixOf!0 lt!73136 lt!73136)))

(assert (=> d!13858 (= lt!73125 (lemmaIsPrefixRefl!0 lt!73136))))

(declare-fun lt!73124 () Unit!3313)

(declare-fun lt!73131 () Unit!3313)

(assert (=> d!13858 (= lt!73124 lt!73131)))

(assert (=> d!13858 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13858 (= lt!73131 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13858 (= lt!73136 (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(assert (=> d!13858 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72389))))

(assert (=> d!13858 (= (reader!0 thiss!1379 (_2!2360 lt!72389)) lt!73135)))

(assert (= (and d!13858 c!3223) b!47163))

(assert (= (and d!13858 (not c!3223)) b!47166))

(assert (= (and d!13858 res!39760) b!47165))

(assert (= (and b!47165 res!39758) b!47162))

(assert (= (and b!47162 res!39759) b!47164))

(declare-fun m!72415 () Bool)

(assert (=> b!47165 m!72415))

(declare-fun m!72417 () Bool)

(assert (=> b!47164 m!72417))

(assert (=> b!47164 m!71895))

(assert (=> b!47164 m!71901))

(declare-fun m!72419 () Bool)

(assert (=> b!47162 m!72419))

(assert (=> b!47163 m!71901))

(declare-fun m!72421 () Bool)

(assert (=> b!47163 m!72421))

(declare-fun m!72423 () Bool)

(assert (=> b!47163 m!72423))

(declare-fun m!72425 () Bool)

(assert (=> d!13858 m!72425))

(declare-fun m!72427 () Bool)

(assert (=> d!13858 m!72427))

(declare-fun m!72429 () Bool)

(assert (=> d!13858 m!72429))

(assert (=> d!13858 m!71899))

(declare-fun m!72431 () Bool)

(assert (=> d!13858 m!72431))

(declare-fun m!72433 () Bool)

(assert (=> d!13858 m!72433))

(declare-fun m!72435 () Bool)

(assert (=> d!13858 m!72435))

(assert (=> d!13858 m!71875))

(assert (=> d!13858 m!71897))

(declare-fun m!72437 () Bool)

(assert (=> d!13858 m!72437))

(declare-fun m!72439 () Bool)

(assert (=> d!13858 m!72439))

(assert (=> b!46849 d!13858))

(declare-fun b!47167 () Bool)

(declare-fun e!31280 () tuple2!4546)

(assert (=> b!47167 (= e!31280 (tuple2!4547 Nil!542 (_1!2359 lt!72381)))))

(declare-fun b!47169 () Bool)

(declare-fun e!31279 () Bool)

(declare-fun lt!73141 () List!545)

(assert (=> b!47169 (= e!31279 (isEmpty!138 lt!73141))))

(declare-fun b!47170 () Bool)

(assert (=> b!47170 (= e!31279 (> (length!240 lt!73141) 0))))

(declare-fun lt!73142 () tuple2!4548)

(declare-fun lt!73143 () (_ BitVec 64))

(declare-fun b!47168 () Bool)

(assert (=> b!47168 (= e!31280 (tuple2!4547 (Cons!541 (_1!2367 lt!73142) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73142) (bvsub (bvsub to!314 i!635) lt!73143))) (_2!2367 lt!73142)))))

(assert (=> b!47168 (= lt!73142 (readBit!0 (_1!2359 lt!72381)))))

(assert (=> b!47168 (= lt!73143 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13860 () Bool)

(assert (=> d!13860 e!31279))

(declare-fun c!3225 () Bool)

(assert (=> d!13860 (= c!3225 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13860 (= lt!73141 (_1!2366 e!31280))))

(declare-fun c!3224 () Bool)

(assert (=> d!13860 (= c!3224 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13860 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13860 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72381) (bvsub to!314 i!635)) lt!73141)))

(assert (= (and d!13860 c!3224) b!47167))

(assert (= (and d!13860 (not c!3224)) b!47168))

(assert (= (and d!13860 c!3225) b!47169))

(assert (= (and d!13860 (not c!3225)) b!47170))

(declare-fun m!72441 () Bool)

(assert (=> b!47169 m!72441))

(declare-fun m!72443 () Bool)

(assert (=> b!47170 m!72443))

(declare-fun m!72445 () Bool)

(assert (=> b!47168 m!72445))

(declare-fun m!72447 () Bool)

(assert (=> b!47168 m!72447))

(assert (=> b!46849 d!13860))

(declare-fun d!13862 () Bool)

(assert (=> d!13862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72387))))

(declare-fun bs!3626 () Bool)

(assert (= bs!3626 d!13862))

(declare-fun m!72449 () Bool)

(assert (=> bs!3626 m!72449))

(assert (=> b!46849 d!13862))

(declare-fun d!13864 () Bool)

(assert (=> d!13864 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3627 () Bool)

(assert (= bs!3627 d!13864))

(declare-fun m!72451 () Bool)

(assert (=> bs!3627 m!72451))

(assert (=> b!46849 d!13864))

(declare-fun d!13866 () Bool)

(assert (=> d!13866 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387)))

(declare-fun lt!73144 () Unit!3313)

(assert (=> d!13866 (= lt!73144 (choose!9 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72389)) lt!72387 (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!13866 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72389)) lt!72387) lt!73144)))

(declare-fun bs!3628 () Bool)

(assert (= bs!3628 d!13866))

(assert (=> bs!3628 m!71863))

(declare-fun m!72453 () Bool)

(assert (=> bs!3628 m!72453))

(assert (=> b!46849 d!13866))

(declare-fun d!13868 () Bool)

(assert (=> d!13868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!73145 () Unit!3313)

(assert (=> d!13868 (= lt!73145 (choose!9 thiss!1379 (buf!1387 (_2!2360 lt!72389)) (bvsub to!314 i!635) (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (=> d!13868 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1387 (_2!2360 lt!72389)) (bvsub to!314 i!635)) lt!73145)))

(declare-fun bs!3629 () Bool)

(assert (= bs!3629 d!13868))

(assert (=> bs!3629 m!71859))

(declare-fun m!72455 () Bool)

(assert (=> bs!3629 m!72455))

(assert (=> b!46849 d!13868))

(declare-fun b!47171 () Bool)

(declare-fun e!31282 () tuple2!4546)

(assert (=> b!47171 (= e!31282 (tuple2!4547 Nil!542 (_1!2359 lt!72388)))))

(declare-fun b!47173 () Bool)

(declare-fun e!31281 () Bool)

(declare-fun lt!73146 () List!545)

(assert (=> b!47173 (= e!31281 (isEmpty!138 lt!73146))))

(declare-fun b!47174 () Bool)

(assert (=> b!47174 (= e!31281 (> (length!240 lt!73146) 0))))

(declare-fun b!47172 () Bool)

(declare-fun lt!73147 () tuple2!4548)

(declare-fun lt!73148 () (_ BitVec 64))

(assert (=> b!47172 (= e!31282 (tuple2!4547 (Cons!541 (_1!2367 lt!73147) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73147) (bvsub lt!72387 lt!73148))) (_2!2367 lt!73147)))))

(assert (=> b!47172 (= lt!73147 (readBit!0 (_1!2359 lt!72388)))))

(assert (=> b!47172 (= lt!73148 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13870 () Bool)

(assert (=> d!13870 e!31281))

(declare-fun c!3227 () Bool)

(assert (=> d!13870 (= c!3227 (= lt!72387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13870 (= lt!73146 (_1!2366 e!31282))))

(declare-fun c!3226 () Bool)

(assert (=> d!13870 (= c!3226 (= lt!72387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13870 (bvsge lt!72387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13870 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72388) lt!72387) lt!73146)))

(assert (= (and d!13870 c!3226) b!47171))

(assert (= (and d!13870 (not c!3226)) b!47172))

(assert (= (and d!13870 c!3227) b!47173))

(assert (= (and d!13870 (not c!3227)) b!47174))

(declare-fun m!72457 () Bool)

(assert (=> b!47173 m!72457))

(declare-fun m!72459 () Bool)

(assert (=> b!47174 m!72459))

(declare-fun m!72461 () Bool)

(assert (=> b!47172 m!72461))

(declare-fun m!72463 () Bool)

(assert (=> b!47172 m!72463))

(assert (=> b!46849 d!13870))

(declare-fun b!47175 () Bool)

(declare-fun res!39762 () Bool)

(declare-fun e!31284 () Bool)

(assert (=> b!47175 (=> (not res!39762) (not e!31284))))

(declare-fun lt!73163 () tuple2!4532)

(assert (=> b!47175 (= res!39762 (isPrefixOf!0 (_2!2359 lt!73163) (_2!2360 lt!72389)))))

(declare-fun b!47176 () Bool)

(declare-fun e!31283 () Unit!3313)

(declare-fun lt!73162 () Unit!3313)

(assert (=> b!47176 (= e!31283 lt!73162)))

(declare-fun lt!73167 () (_ BitVec 64))

(assert (=> b!47176 (= lt!73167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73156 () (_ BitVec 64))

(assert (=> b!47176 (= lt!73156 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> b!47176 (= lt!73162 (arrayBitRangesEqSymmetric!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) lt!73167 lt!73156))))

(assert (=> b!47176 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 (_2!2360 lt!72395)) lt!73167 lt!73156)))

(declare-fun lt!73165 () (_ BitVec 64))

(declare-fun lt!73150 () (_ BitVec 64))

(declare-fun b!47177 () Bool)

(assert (=> b!47177 (= e!31284 (= (_1!2359 lt!73163) (withMovedBitIndex!0 (_2!2359 lt!73163) (bvsub lt!73150 lt!73165))))))

(assert (=> b!47177 (or (= (bvand lt!73150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73150 lt!73165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47177 (= lt!73165 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389))))))

(assert (=> b!47177 (= lt!73150 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(declare-fun b!47178 () Bool)

(declare-fun res!39761 () Bool)

(assert (=> b!47178 (=> (not res!39761) (not e!31284))))

(assert (=> b!47178 (= res!39761 (isPrefixOf!0 (_1!2359 lt!73163) (_2!2360 lt!72395)))))

(declare-fun b!47179 () Bool)

(declare-fun Unit!3334 () Unit!3313)

(assert (=> b!47179 (= e!31283 Unit!3334)))

(declare-fun d!13872 () Bool)

(assert (=> d!13872 e!31284))

(declare-fun res!39763 () Bool)

(assert (=> d!13872 (=> (not res!39763) (not e!31284))))

(assert (=> d!13872 (= res!39763 (isPrefixOf!0 (_1!2359 lt!73163) (_2!2359 lt!73163)))))

(declare-fun lt!73164 () BitStream!1808)

(assert (=> d!13872 (= lt!73163 (tuple2!4533 lt!73164 (_2!2360 lt!72389)))))

(declare-fun lt!73160 () Unit!3313)

(declare-fun lt!73157 () Unit!3313)

(assert (=> d!13872 (= lt!73160 lt!73157)))

(assert (=> d!13872 (isPrefixOf!0 lt!73164 (_2!2360 lt!72389))))

(assert (=> d!13872 (= lt!73157 (lemmaIsPrefixTransitive!0 lt!73164 (_2!2360 lt!72389) (_2!2360 lt!72389)))))

(declare-fun lt!73166 () Unit!3313)

(declare-fun lt!73154 () Unit!3313)

(assert (=> d!13872 (= lt!73166 lt!73154)))

(assert (=> d!13872 (isPrefixOf!0 lt!73164 (_2!2360 lt!72389))))

(assert (=> d!13872 (= lt!73154 (lemmaIsPrefixTransitive!0 lt!73164 (_2!2360 lt!72395) (_2!2360 lt!72389)))))

(declare-fun lt!73161 () Unit!3313)

(assert (=> d!13872 (= lt!73161 e!31283)))

(declare-fun c!3228 () Bool)

(assert (=> d!13872 (= c!3228 (not (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000)))))

(declare-fun lt!73158 () Unit!3313)

(declare-fun lt!73149 () Unit!3313)

(assert (=> d!13872 (= lt!73158 lt!73149)))

(assert (=> d!13872 (isPrefixOf!0 (_2!2360 lt!72389) (_2!2360 lt!72389))))

(assert (=> d!13872 (= lt!73149 (lemmaIsPrefixRefl!0 (_2!2360 lt!72389)))))

(declare-fun lt!73151 () Unit!3313)

(declare-fun lt!73155 () Unit!3313)

(assert (=> d!13872 (= lt!73151 lt!73155)))

(assert (=> d!13872 (= lt!73155 (lemmaIsPrefixRefl!0 (_2!2360 lt!72389)))))

(declare-fun lt!73168 () Unit!3313)

(declare-fun lt!73153 () Unit!3313)

(assert (=> d!13872 (= lt!73168 lt!73153)))

(assert (=> d!13872 (isPrefixOf!0 lt!73164 lt!73164)))

(assert (=> d!13872 (= lt!73153 (lemmaIsPrefixRefl!0 lt!73164))))

(declare-fun lt!73152 () Unit!3313)

(declare-fun lt!73159 () Unit!3313)

(assert (=> d!13872 (= lt!73152 lt!73159)))

(assert (=> d!13872 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!13872 (= lt!73159 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(assert (=> d!13872 (= lt!73164 (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!13872 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72389))))

(assert (=> d!13872 (= (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72389)) lt!73163)))

(assert (= (and d!13872 c!3228) b!47176))

(assert (= (and d!13872 (not c!3228)) b!47179))

(assert (= (and d!13872 res!39763) b!47178))

(assert (= (and b!47178 res!39761) b!47175))

(assert (= (and b!47175 res!39762) b!47177))

(declare-fun m!72465 () Bool)

(assert (=> b!47178 m!72465))

(declare-fun m!72467 () Bool)

(assert (=> b!47177 m!72467))

(assert (=> b!47177 m!71895))

(assert (=> b!47177 m!71893))

(declare-fun m!72469 () Bool)

(assert (=> b!47175 m!72469))

(assert (=> b!47176 m!71893))

(declare-fun m!72471 () Bool)

(assert (=> b!47176 m!72471))

(declare-fun m!72473 () Bool)

(assert (=> b!47176 m!72473))

(declare-fun m!72475 () Bool)

(assert (=> d!13872 m!72475))

(declare-fun m!72477 () Bool)

(assert (=> d!13872 m!72477))

(declare-fun m!72479 () Bool)

(assert (=> d!13872 m!72479))

(assert (=> d!13872 m!72197))

(declare-fun m!72481 () Bool)

(assert (=> d!13872 m!72481))

(assert (=> d!13872 m!72433))

(declare-fun m!72483 () Bool)

(assert (=> d!13872 m!72483))

(assert (=> d!13872 m!71873))

(assert (=> d!13872 m!72193))

(assert (=> d!13872 m!72437))

(declare-fun m!72485 () Bool)

(assert (=> d!13872 m!72485))

(assert (=> b!46849 d!13872))

(declare-fun d!13874 () Bool)

(assert (=> d!13874 (= (bitAt!0 (buf!1387 (_1!2359 lt!72388)) lt!72396) (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) ((_ extract 31 0) (bvsdiv lt!72396 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72396 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3630 () Bool)

(assert (= bs!3630 d!13874))

(declare-fun m!72487 () Bool)

(assert (=> bs!3630 m!72487))

(declare-fun m!72489 () Bool)

(assert (=> bs!3630 m!72489))

(assert (=> b!46847 d!13874))

(declare-fun d!13876 () Bool)

(assert (=> d!13876 (= (bitAt!0 (buf!1387 (_1!2359 lt!72381)) lt!72396) (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) ((_ extract 31 0) (bvsdiv lt!72396 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72396 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3631 () Bool)

(assert (= bs!3631 d!13876))

(declare-fun m!72491 () Bool)

(assert (=> bs!3631 m!72491))

(assert (=> bs!3631 m!72489))

(assert (=> b!46847 d!13876))

(declare-fun d!13878 () Bool)

(declare-fun e!31285 () Bool)

(assert (=> d!13878 e!31285))

(declare-fun res!39765 () Bool)

(assert (=> d!13878 (=> (not res!39765) (not e!31285))))

(declare-fun lt!73171 () (_ BitVec 64))

(declare-fun lt!73174 () (_ BitVec 64))

(declare-fun lt!73172 () (_ BitVec 64))

(assert (=> d!13878 (= res!39765 (= lt!73172 (bvsub lt!73171 lt!73174)))))

(assert (=> d!13878 (or (= (bvand lt!73171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73171 lt!73174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13878 (= lt!73174 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72389))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun lt!73173 () (_ BitVec 64))

(declare-fun lt!73169 () (_ BitVec 64))

(assert (=> d!13878 (= lt!73171 (bvmul lt!73173 lt!73169))))

(assert (=> d!13878 (or (= lt!73173 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73169 (bvsdiv (bvmul lt!73173 lt!73169) lt!73173)))))

(assert (=> d!13878 (= lt!73169 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13878 (= lt!73173 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13878 (= lt!73172 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72389))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72389)))))))

(assert (=> d!13878 (invariant!0 (currentBit!2887 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72389)) (size!1038 (buf!1387 (_2!2360 lt!72389))))))

(assert (=> d!13878 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389))) lt!73172)))

(declare-fun b!47180 () Bool)

(declare-fun res!39764 () Bool)

(assert (=> b!47180 (=> (not res!39764) (not e!31285))))

(assert (=> b!47180 (= res!39764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73172))))

(declare-fun b!47181 () Bool)

(declare-fun lt!73170 () (_ BitVec 64))

(assert (=> b!47181 (= e!31285 (bvsle lt!73172 (bvmul lt!73170 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47181 (or (= lt!73170 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73170 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73170)))))

(assert (=> b!47181 (= lt!73170 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (= (and d!13878 res!39765) b!47180))

(assert (= (and b!47180 res!39764) b!47181))

(declare-fun m!72493 () Bool)

(assert (=> d!13878 m!72493))

(assert (=> d!13878 m!71871))

(assert (=> b!46848 d!13878))

(declare-fun d!13880 () Bool)

(assert (=> d!13880 (= (invariant!0 (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72395)))) (and (bvsge (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (bvslt (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000001000) (bvsge (currentByte!2892 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72395)))) (and (= (currentBit!2887 (_2!2360 lt!72395)) #b00000000000000000000000000000000) (= (currentByte!2892 (_2!2360 lt!72395)) (size!1038 (buf!1387 (_2!2360 lt!72395))))))))))

(assert (=> b!46837 d!13880))

(push 1)

(assert (not d!13862))

(assert (not b!47070))

(assert (not d!13826))

(assert (not b!46998))

(assert (not b!47162))

(assert (not d!13872))

(assert (not b!47177))

(assert (not b!47147))

(assert (not d!13760))

(assert (not d!13738))

(assert (not b!47144))

(assert (not b!47100))

(assert (not b!47178))

(assert (not b!47102))

(assert (not b!47033))

(assert (not b!47175))

(assert (not b!47145))

(assert (not d!13776))

(assert (not b!47104))

(assert (not b!47174))

(assert (not b!47163))

(assert (not b!46997))

(assert (not b!47168))

(assert (not d!13836))

(assert (not d!13864))

(assert (not b!47000))

(assert (not b!47029))

(assert (not b!47032))

(assert (not b!47146))

(assert (not d!13844))

(assert (not b!47031))

(assert (not b!47159))

(assert (not d!13830))

(assert (not b!47176))

(assert (not b!47150))

(assert (not d!13828))

(assert (not b!47140))

(assert (not b!47056))

(assert (not b!47142))

(assert (not b!47170))

(assert (not b!47068))

(assert (not b!47058))

(assert (not d!13858))

(assert (not b!47165))

(assert (not b!47078))

(assert (not d!13850))

(assert (not d!13848))

(assert (not bm!565))

(assert (not b!47099))

(assert (not b!47169))

(assert (not d!13868))

(assert (not b!47035))

(assert (not d!13822))

(assert (not b!47157))

(assert (not b!47164))

(assert (not d!13784))

(assert (not d!13736))

(assert (not d!13866))

(assert (not d!13854))

(assert (not d!13878))

(assert (not b!47143))

(assert (not b!47107))

(assert (not b!46999))

(assert (not b!47172))

(assert (not b!47173))

(assert (not d!13842))

(assert (not b!47030))

(assert (not b!47101))

(assert (not b!47141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!13784 d!13736))

(declare-fun d!13920 () Bool)

(assert (=> d!13920 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!13920 true))

(declare-fun _$6!180 () Unit!3313)

(assert (=> d!13920 (= (choose!9 thiss!1379 (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1809 (buf!1387 (_2!2360 lt!72395)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))) _$6!180)))

(declare-fun bs!3643 () Bool)

(assert (= bs!3643 d!13920))

(assert (=> bs!3643 m!71883))

(assert (=> d!13784 d!13920))

(declare-fun d!13922 () Bool)

(assert (=> d!13922 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 thiss!1379)))))))

(assert (=> d!13736 d!13922))

(declare-fun b!47269 () Bool)

(declare-fun res!39832 () Bool)

(declare-fun lt!73404 () (_ BitVec 32))

(assert (=> b!47269 (= res!39832 (= lt!73404 #b00000000000000000000000000000000))))

(declare-fun e!31336 () Bool)

(assert (=> b!47269 (=> res!39832 e!31336)))

(declare-fun e!31333 () Bool)

(assert (=> b!47269 (= e!31333 e!31336)))

(declare-fun b!47270 () Bool)

(declare-fun e!31332 () Bool)

(declare-fun e!31335 () Bool)

(assert (=> b!47270 (= e!31332 e!31335)))

(declare-fun res!39831 () Bool)

(assert (=> b!47270 (=> (not res!39831) (not e!31335))))

(declare-fun e!31334 () Bool)

(assert (=> b!47270 (= res!39831 e!31334)))

(declare-fun res!39830 () Bool)

(assert (=> b!47270 (=> res!39830 e!31334)))

(declare-datatypes ((tuple4!14 0))(
  ( (tuple4!15 (_1!2373 (_ BitVec 32)) (_2!2373 (_ BitVec 32)) (_3!93 (_ BitVec 32)) (_4!7 (_ BitVec 32))) )
))
(declare-fun lt!73405 () tuple4!14)

(assert (=> b!47270 (= res!39830 (bvsge (_1!2373 lt!73405) (_2!2373 lt!73405)))))

(assert (=> b!47270 (= lt!73404 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73403 () (_ BitVec 32))

(assert (=> b!47270 (= lt!73403 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!14)

(assert (=> b!47270 (= lt!73405 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun d!13924 () Bool)

(declare-fun res!39833 () Bool)

(assert (=> d!13924 (=> res!39833 e!31332)))

(assert (=> d!13924 (= res!39833 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (=> d!13924 (= (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))) e!31332)))

(declare-fun b!47271 () Bool)

(declare-fun e!31337 () Bool)

(assert (=> b!47271 (= e!31335 e!31337)))

(declare-fun c!3240 () Bool)

(assert (=> b!47271 (= c!3240 (= (_3!93 lt!73405) (_4!7 lt!73405)))))

(declare-fun b!47272 () Bool)

(declare-fun call!574 () Bool)

(assert (=> b!47272 (= e!31336 call!574)))

(declare-fun bm!571 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!571 (= call!574 (byteRangesEq!0 (ite c!3240 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73405)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73405))) (ite c!3240 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73405)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_4!7 lt!73405))) (ite c!3240 lt!73403 #b00000000000000000000000000000000) lt!73404))))

(declare-fun b!47273 () Bool)

(assert (=> b!47273 (= e!31337 e!31333)))

(declare-fun res!39834 () Bool)

(assert (=> b!47273 (= res!39834 (byteRangesEq!0 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73405)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73405)) lt!73403 #b00000000000000000000000000001000))))

(assert (=> b!47273 (=> (not res!39834) (not e!31333))))

(declare-fun b!47274 () Bool)

(assert (=> b!47274 (= e!31337 call!574)))

(declare-fun b!47275 () Bool)

(declare-fun arrayRangesEq!8 (array!2297 array!2297 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!47275 (= e!31334 (arrayRangesEq!8 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) (_1!2373 lt!73405) (_2!2373 lt!73405)))))

(assert (= (and d!13924 (not res!39833)) b!47270))

(assert (= (and b!47270 (not res!39830)) b!47275))

(assert (= (and b!47270 res!39831) b!47271))

(assert (= (and b!47271 c!3240) b!47274))

(assert (= (and b!47271 (not c!3240)) b!47273))

(assert (= (and b!47273 res!39834) b!47269))

(assert (= (and b!47269 (not res!39832)) b!47272))

(assert (= (or b!47274 b!47272) bm!571))

(assert (=> b!47270 m!71901))

(declare-fun m!72697 () Bool)

(assert (=> b!47270 m!72697))

(declare-fun m!72699 () Bool)

(assert (=> bm!571 m!72699))

(declare-fun m!72701 () Bool)

(assert (=> bm!571 m!72701))

(declare-fun m!72703 () Bool)

(assert (=> bm!571 m!72703))

(declare-fun m!72705 () Bool)

(assert (=> bm!571 m!72705))

(declare-fun m!72707 () Bool)

(assert (=> bm!571 m!72707))

(assert (=> b!47273 m!72705))

(assert (=> b!47273 m!72707))

(assert (=> b!47273 m!72705))

(assert (=> b!47273 m!72707))

(declare-fun m!72709 () Bool)

(assert (=> b!47273 m!72709))

(declare-fun m!72711 () Bool)

(assert (=> b!47275 m!72711))

(assert (=> b!47058 d!13924))

(assert (=> b!47058 d!13850))

(assert (=> b!46998 d!13850))

(declare-fun d!13926 () Bool)

(assert (=> d!13926 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 thiss!1379) lt!72789 lt!72778)))

(declare-fun lt!73408 () Unit!3313)

(declare-fun choose!8 (array!2297 array!2297 (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> d!13926 (= lt!73408 (choose!8 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) lt!72789 lt!72778))))

(assert (=> d!13926 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72789) (bvsle lt!72789 lt!72778))))

(assert (=> d!13926 (= (arrayBitRangesEqSymmetric!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) lt!72789 lt!72778) lt!73408)))

(declare-fun bs!3644 () Bool)

(assert (= bs!3644 d!13926))

(assert (=> bs!3644 m!72183))

(declare-fun m!72713 () Bool)

(assert (=> bs!3644 m!72713))

(assert (=> b!46998 d!13926))

(declare-fun b!47276 () Bool)

(declare-fun res!39837 () Bool)

(declare-fun lt!73410 () (_ BitVec 32))

(assert (=> b!47276 (= res!39837 (= lt!73410 #b00000000000000000000000000000000))))

(declare-fun e!31342 () Bool)

(assert (=> b!47276 (=> res!39837 e!31342)))

(declare-fun e!31339 () Bool)

(assert (=> b!47276 (= e!31339 e!31342)))

(declare-fun b!47277 () Bool)

(declare-fun e!31338 () Bool)

(declare-fun e!31341 () Bool)

(assert (=> b!47277 (= e!31338 e!31341)))

(declare-fun res!39836 () Bool)

(assert (=> b!47277 (=> (not res!39836) (not e!31341))))

(declare-fun e!31340 () Bool)

(assert (=> b!47277 (= res!39836 e!31340)))

(declare-fun res!39835 () Bool)

(assert (=> b!47277 (=> res!39835 e!31340)))

(declare-fun lt!73411 () tuple4!14)

(assert (=> b!47277 (= res!39835 (bvsge (_1!2373 lt!73411) (_2!2373 lt!73411)))))

(assert (=> b!47277 (= lt!73410 ((_ extract 31 0) (bvsrem lt!72778 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73409 () (_ BitVec 32))

(assert (=> b!47277 (= lt!73409 ((_ extract 31 0) (bvsrem lt!72789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47277 (= lt!73411 (arrayBitIndices!0 lt!72789 lt!72778))))

(declare-fun d!13928 () Bool)

(declare-fun res!39838 () Bool)

(assert (=> d!13928 (=> res!39838 e!31338)))

(assert (=> d!13928 (= res!39838 (bvsge lt!72789 lt!72778))))

(assert (=> d!13928 (= (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 thiss!1379) lt!72789 lt!72778) e!31338)))

(declare-fun b!47278 () Bool)

(declare-fun e!31343 () Bool)

(assert (=> b!47278 (= e!31341 e!31343)))

(declare-fun c!3241 () Bool)

(assert (=> b!47278 (= c!3241 (= (_3!93 lt!73411) (_4!7 lt!73411)))))

(declare-fun b!47279 () Bool)

(declare-fun call!575 () Bool)

(assert (=> b!47279 (= e!31342 call!575)))

(declare-fun bm!572 () Bool)

(assert (=> bm!572 (= call!575 (byteRangesEq!0 (ite c!3241 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73411)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_4!7 lt!73411))) (ite c!3241 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73411)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73411))) (ite c!3241 lt!73409 #b00000000000000000000000000000000) lt!73410))))

(declare-fun b!47280 () Bool)

(assert (=> b!47280 (= e!31343 e!31339)))

(declare-fun res!39839 () Bool)

(assert (=> b!47280 (= res!39839 (byteRangesEq!0 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73411)) (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73411)) lt!73409 #b00000000000000000000000000001000))))

(assert (=> b!47280 (=> (not res!39839) (not e!31339))))

(declare-fun b!47281 () Bool)

(assert (=> b!47281 (= e!31343 call!575)))

(declare-fun b!47282 () Bool)

(assert (=> b!47282 (= e!31340 (arrayRangesEq!8 (buf!1387 (_2!2360 lt!72395)) (buf!1387 thiss!1379) (_1!2373 lt!73411) (_2!2373 lt!73411)))))

(assert (= (and d!13928 (not res!39838)) b!47277))

(assert (= (and b!47277 (not res!39835)) b!47282))

(assert (= (and b!47277 res!39836) b!47278))

(assert (= (and b!47278 c!3241) b!47281))

(assert (= (and b!47278 (not c!3241)) b!47280))

(assert (= (and b!47280 res!39839) b!47276))

(assert (= (and b!47276 (not res!39837)) b!47279))

(assert (= (or b!47281 b!47279) bm!572))

(declare-fun m!72715 () Bool)

(assert (=> b!47277 m!72715))

(declare-fun m!72717 () Bool)

(assert (=> bm!572 m!72717))

(declare-fun m!72719 () Bool)

(assert (=> bm!572 m!72719))

(declare-fun m!72721 () Bool)

(assert (=> bm!572 m!72721))

(declare-fun m!72723 () Bool)

(assert (=> bm!572 m!72723))

(declare-fun m!72725 () Bool)

(assert (=> bm!572 m!72725))

(assert (=> b!47280 m!72723))

(assert (=> b!47280 m!72725))

(assert (=> b!47280 m!72723))

(assert (=> b!47280 m!72725))

(declare-fun m!72727 () Bool)

(assert (=> b!47280 m!72727))

(declare-fun m!72729 () Bool)

(assert (=> b!47282 m!72729))

(assert (=> b!46998 d!13928))

(declare-fun d!13930 () Bool)

(assert (=> d!13930 (= (isEmpty!138 lt!72986) (is-Nil!542 lt!72986))))

(assert (=> b!47100 d!13930))

(declare-fun d!13932 () Bool)

(declare-fun c!3242 () Bool)

(assert (=> d!13932 (= c!3242 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31344 () List!545)

(assert (=> d!13932 (= (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!31344)))

(declare-fun b!47283 () Bool)

(assert (=> b!47283 (= e!31344 Nil!542)))

(declare-fun b!47284 () Bool)

(assert (=> b!47284 (= e!31344 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72395) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13932 c!3242) b!47283))

(assert (= (and d!13932 (not c!3242)) b!47284))

(declare-fun m!72731 () Bool)

(assert (=> b!47284 m!72731))

(declare-fun m!72733 () Bool)

(assert (=> b!47284 m!72733))

(declare-fun m!72735 () Bool)

(assert (=> b!47284 m!72735))

(assert (=> b!47078 d!13932))

(declare-fun d!13934 () Bool)

(declare-fun res!39842 () Bool)

(declare-fun e!31345 () Bool)

(assert (=> d!13934 (=> (not res!39842) (not e!31345))))

(assert (=> d!13934 (= res!39842 (= (size!1038 (buf!1387 (_1!2359 lt!72785))) (size!1038 (buf!1387 thiss!1379))))))

(assert (=> d!13934 (= (isPrefixOf!0 (_1!2359 lt!72785) thiss!1379) e!31345)))

(declare-fun b!47285 () Bool)

(declare-fun res!39841 () Bool)

(assert (=> b!47285 (=> (not res!39841) (not e!31345))))

(assert (=> b!47285 (= res!39841 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72785))) (currentByte!2892 (_1!2359 lt!72785)) (currentBit!2887 (_1!2359 lt!72785))) (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun b!47286 () Bool)

(declare-fun e!31346 () Bool)

(assert (=> b!47286 (= e!31345 e!31346)))

(declare-fun res!39840 () Bool)

(assert (=> b!47286 (=> res!39840 e!31346)))

(assert (=> b!47286 (= res!39840 (= (size!1038 (buf!1387 (_1!2359 lt!72785))) #b00000000000000000000000000000000))))

(declare-fun b!47287 () Bool)

(assert (=> b!47287 (= e!31346 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!72785)) (buf!1387 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72785))) (currentByte!2892 (_1!2359 lt!72785)) (currentBit!2887 (_1!2359 lt!72785)))))))

(assert (= (and d!13934 res!39842) b!47285))

(assert (= (and b!47285 res!39841) b!47286))

(assert (= (and b!47286 (not res!39840)) b!47287))

(declare-fun m!72737 () Bool)

(assert (=> b!47285 m!72737))

(assert (=> b!47285 m!71901))

(assert (=> b!47287 m!72737))

(assert (=> b!47287 m!72737))

(declare-fun m!72739 () Bool)

(assert (=> b!47287 m!72739))

(assert (=> b!47000 d!13934))

(assert (=> d!13868 d!13864))

(declare-fun d!13936 () Bool)

(assert (=> d!13936 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!13936 true))

(declare-fun _$6!181 () Unit!3313)

(assert (=> d!13936 (= (choose!9 thiss!1379 (buf!1387 (_2!2360 lt!72389)) (bvsub to!314 i!635) (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))) _$6!181)))

(declare-fun bs!3645 () Bool)

(assert (= bs!3645 d!13936))

(assert (=> bs!3645 m!71859))

(assert (=> d!13868 d!13936))

(assert (=> b!47056 d!13850))

(assert (=> b!47056 d!13878))

(declare-fun d!13938 () Bool)

(assert (=> d!13938 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))))))))

(assert (=> d!13826 d!13938))

(declare-fun d!13940 () Bool)

(assert (=> d!13940 (= (length!240 lt!73146) (size!1040 lt!73146))))

(declare-fun bs!3646 () Bool)

(assert (= bs!3646 d!13940))

(declare-fun m!72741 () Bool)

(assert (=> bs!3646 m!72741))

(assert (=> b!47174 d!13940))

(declare-fun d!13942 () Bool)

(declare-fun e!31347 () Bool)

(assert (=> d!13942 e!31347))

(declare-fun res!39844 () Bool)

(assert (=> d!13942 (=> (not res!39844) (not e!31347))))

(declare-fun lt!73414 () (_ BitVec 64))

(declare-fun lt!73415 () (_ BitVec 64))

(declare-fun lt!73417 () (_ BitVec 64))

(assert (=> d!13942 (= res!39844 (= lt!73415 (bvsub lt!73414 lt!73417)))))

(assert (=> d!13942 (or (= (bvand lt!73414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73417 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73414 lt!73417) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13942 (= lt!73417 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73080)))) ((_ sign_extend 32) (currentByte!2892 (_1!2368 lt!73080))) ((_ sign_extend 32) (currentBit!2887 (_1!2368 lt!73080)))))))

(declare-fun lt!73416 () (_ BitVec 64))

(declare-fun lt!73412 () (_ BitVec 64))

(assert (=> d!13942 (= lt!73414 (bvmul lt!73416 lt!73412))))

(assert (=> d!13942 (or (= lt!73416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73412 (bvsdiv (bvmul lt!73416 lt!73412) lt!73416)))))

(assert (=> d!13942 (= lt!73412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13942 (= lt!73416 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73080)))))))

(assert (=> d!13942 (= lt!73415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_1!2368 lt!73080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_1!2368 lt!73080)))))))

(assert (=> d!13942 (invariant!0 (currentBit!2887 (_1!2368 lt!73080)) (currentByte!2892 (_1!2368 lt!73080)) (size!1038 (buf!1387 (_1!2368 lt!73080))))))

(assert (=> d!13942 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73080))) (currentByte!2892 (_1!2368 lt!73080)) (currentBit!2887 (_1!2368 lt!73080))) lt!73415)))

(declare-fun b!47288 () Bool)

(declare-fun res!39843 () Bool)

(assert (=> b!47288 (=> (not res!39843) (not e!31347))))

(assert (=> b!47288 (= res!39843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73415))))

(declare-fun b!47289 () Bool)

(declare-fun lt!73413 () (_ BitVec 64))

(assert (=> b!47289 (= e!31347 (bvsle lt!73415 (bvmul lt!73413 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47289 (or (= lt!73413 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73413 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73413)))))

(assert (=> b!47289 (= lt!73413 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73080)))))))

(assert (= (and d!13942 res!39844) b!47288))

(assert (= (and b!47288 res!39843) b!47289))

(declare-fun m!72743 () Bool)

(assert (=> d!13942 m!72743))

(declare-fun m!72745 () Bool)

(assert (=> d!13942 m!72745))

(assert (=> b!47146 d!13942))

(declare-fun d!13944 () Bool)

(declare-fun e!31348 () Bool)

(assert (=> d!13944 e!31348))

(declare-fun res!39846 () Bool)

(assert (=> d!13944 (=> (not res!39846) (not e!31348))))

(declare-fun lt!73423 () (_ BitVec 64))

(declare-fun lt!73421 () (_ BitVec 64))

(declare-fun lt!73420 () (_ BitVec 64))

(assert (=> d!13944 (= res!39846 (= lt!73421 (bvsub lt!73420 lt!73423)))))

(assert (=> d!13944 (or (= (bvand lt!73420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73420 lt!73423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13944 (= lt!73423 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73083)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73083))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73083)))))))

(declare-fun lt!73422 () (_ BitVec 64))

(declare-fun lt!73418 () (_ BitVec 64))

(assert (=> d!13944 (= lt!73420 (bvmul lt!73422 lt!73418))))

(assert (=> d!13944 (or (= lt!73422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73418 (bvsdiv (bvmul lt!73422 lt!73418) lt!73422)))))

(assert (=> d!13944 (= lt!73418 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13944 (= lt!73422 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(assert (=> d!13944 (= lt!73421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73083))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73083)))))))

(assert (=> d!13944 (invariant!0 (currentBit!2887 (_2!2360 lt!73083)) (currentByte!2892 (_2!2360 lt!73083)) (size!1038 (buf!1387 (_2!2360 lt!73083))))))

(assert (=> d!13944 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73083))) (currentByte!2892 (_2!2360 lt!73083)) (currentBit!2887 (_2!2360 lt!73083))) lt!73421)))

(declare-fun b!47290 () Bool)

(declare-fun res!39845 () Bool)

(assert (=> b!47290 (=> (not res!39845) (not e!31348))))

(assert (=> b!47290 (= res!39845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73421))))

(declare-fun b!47291 () Bool)

(declare-fun lt!73419 () (_ BitVec 64))

(assert (=> b!47291 (= e!31348 (bvsle lt!73421 (bvmul lt!73419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47291 (or (= lt!73419 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73419 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73419)))))

(assert (=> b!47291 (= lt!73419 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(assert (= (and d!13944 res!39846) b!47290))

(assert (= (and b!47290 res!39845) b!47291))

(declare-fun m!72747 () Bool)

(assert (=> d!13944 m!72747))

(declare-fun m!72749 () Bool)

(assert (=> d!13944 m!72749))

(assert (=> b!47146 d!13944))

(declare-fun d!13946 () Bool)

(assert (=> d!13946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3647 () Bool)

(assert (= bs!3647 d!13946))

(assert (=> bs!3647 m!72345))

(assert (=> b!47107 d!13946))

(declare-fun d!13948 () Bool)

(declare-fun e!31351 () Bool)

(assert (=> d!13948 e!31351))

(declare-fun res!39849 () Bool)

(assert (=> d!13948 (=> (not res!39849) (not e!31351))))

(declare-fun lt!73429 () (_ BitVec 64))

(declare-fun lt!73428 () BitStream!1808)

(assert (=> d!13948 (= res!39849 (= (bvadd lt!73429 (bvsub lt!73122 lt!73137)) (bitIndex!0 (size!1038 (buf!1387 lt!73428)) (currentByte!2892 lt!73428) (currentBit!2887 lt!73428))))))

(assert (=> d!13948 (or (not (= (bvand lt!73429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73122 lt!73137) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73429 (bvsub lt!73122 lt!73137)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13948 (= lt!73429 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73135))) (currentByte!2892 (_2!2359 lt!73135)) (currentBit!2887 (_2!2359 lt!73135))))))

(declare-fun moveBitIndex!0 (BitStream!1808 (_ BitVec 64)) tuple2!4534)

(assert (=> d!13948 (= lt!73428 (_2!2360 (moveBitIndex!0 (_2!2359 lt!73135) (bvsub lt!73122 lt!73137))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1808 (_ BitVec 64)) Bool)

(assert (=> d!13948 (moveBitIndexPrecond!0 (_2!2359 lt!73135) (bvsub lt!73122 lt!73137))))

(assert (=> d!13948 (= (withMovedBitIndex!0 (_2!2359 lt!73135) (bvsub lt!73122 lt!73137)) lt!73428)))

(declare-fun b!47294 () Bool)

(assert (=> b!47294 (= e!31351 (= (size!1038 (buf!1387 (_2!2359 lt!73135))) (size!1038 (buf!1387 lt!73428))))))

(assert (= (and d!13948 res!39849) b!47294))

(declare-fun m!72751 () Bool)

(assert (=> d!13948 m!72751))

(declare-fun m!72753 () Bool)

(assert (=> d!13948 m!72753))

(declare-fun m!72755 () Bool)

(assert (=> d!13948 m!72755))

(declare-fun m!72757 () Bool)

(assert (=> d!13948 m!72757))

(assert (=> b!47164 d!13948))

(assert (=> b!47164 d!13878))

(assert (=> b!47164 d!13850))

(declare-fun b!47295 () Bool)

(declare-fun e!31353 () tuple2!4546)

(assert (=> b!47295 (= e!31353 (tuple2!4547 Nil!542 (_2!2367 lt!73147)))))

(declare-fun b!47297 () Bool)

(declare-fun e!31352 () Bool)

(declare-fun lt!73430 () List!545)

(assert (=> b!47297 (= e!31352 (isEmpty!138 lt!73430))))

(declare-fun b!47298 () Bool)

(assert (=> b!47298 (= e!31352 (> (length!240 lt!73430) 0))))

(declare-fun lt!73431 () tuple2!4548)

(declare-fun lt!73432 () (_ BitVec 64))

(declare-fun b!47296 () Bool)

(assert (=> b!47296 (= e!31353 (tuple2!4547 (Cons!541 (_1!2367 lt!73431) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73431) (bvsub (bvsub lt!72387 lt!73148) lt!73432))) (_2!2367 lt!73431)))))

(assert (=> b!47296 (= lt!73431 (readBit!0 (_2!2367 lt!73147)))))

(assert (=> b!47296 (= lt!73432 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!13950 () Bool)

(assert (=> d!13950 e!31352))

(declare-fun c!3244 () Bool)

(assert (=> d!13950 (= c!3244 (= (bvsub lt!72387 lt!73148) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13950 (= lt!73430 (_1!2366 e!31353))))

(declare-fun c!3243 () Bool)

(assert (=> d!13950 (= c!3243 (= (bvsub lt!72387 lt!73148) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13950 (bvsge (bvsub lt!72387 lt!73148) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13950 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73147) (bvsub lt!72387 lt!73148)) lt!73430)))

(assert (= (and d!13950 c!3243) b!47295))

(assert (= (and d!13950 (not c!3243)) b!47296))

(assert (= (and d!13950 c!3244) b!47297))

(assert (= (and d!13950 (not c!3244)) b!47298))

(declare-fun m!72759 () Bool)

(assert (=> b!47297 m!72759))

(declare-fun m!72761 () Bool)

(assert (=> b!47298 m!72761))

(declare-fun m!72763 () Bool)

(assert (=> b!47296 m!72763))

(declare-fun m!72765 () Bool)

(assert (=> b!47296 m!72765))

(assert (=> b!47172 d!13950))

(declare-fun d!13952 () Bool)

(declare-fun e!31360 () Bool)

(assert (=> d!13952 e!31360))

(declare-fun res!39852 () Bool)

(assert (=> d!13952 (=> (not res!39852) (not e!31360))))

(declare-fun increaseBitIndex!0 (BitStream!1808) tuple2!4534)

(assert (=> d!13952 (= res!39852 (= (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72388)))) (buf!1387 (_1!2359 lt!72388))))))

(declare-fun lt!73453 () Bool)

(assert (=> d!13952 (= lt!73453 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72388))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73451 () tuple2!4548)

(assert (=> d!13952 (= lt!73451 (tuple2!4549 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72388))))) #b00000000000000000000000000000000)) (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72388)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!13952 (validate_offset_bit!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2359 lt!72388)))) ((_ sign_extend 32) (currentByte!2892 (_1!2359 lt!72388))) ((_ sign_extend 32) (currentBit!2887 (_1!2359 lt!72388))))))

(assert (=> d!13952 (= (readBit!0 (_1!2359 lt!72388)) lt!73451)))

(declare-fun b!47301 () Bool)

(declare-fun lt!73448 () (_ BitVec 64))

(declare-fun lt!73447 () (_ BitVec 64))

(assert (=> b!47301 (= e!31360 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72388))))) (currentByte!2892 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72388)))) (currentBit!2887 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72388))))) (bvadd lt!73448 lt!73447)))))

(assert (=> b!47301 (or (not (= (bvand lt!73448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73447 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73448 lt!73447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47301 (= lt!73447 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47301 (= lt!73448 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)) (currentBit!2887 (_1!2359 lt!72388))))))

(declare-fun lt!73449 () Bool)

(assert (=> b!47301 (= lt!73449 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72388))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73452 () Bool)

(assert (=> b!47301 (= lt!73452 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72388))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73450 () Bool)

(assert (=> b!47301 (= lt!73450 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72388))) (currentByte!2892 (_1!2359 lt!72388)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72388))))) #b00000000000000000000000000000000)))))

(assert (= (and d!13952 res!39852) b!47301))

(declare-fun m!72767 () Bool)

(assert (=> d!13952 m!72767))

(declare-fun m!72769 () Bool)

(assert (=> d!13952 m!72769))

(declare-fun m!72771 () Bool)

(assert (=> d!13952 m!72771))

(declare-fun m!72773 () Bool)

(assert (=> d!13952 m!72773))

(assert (=> b!47301 m!72767))

(declare-fun m!72775 () Bool)

(assert (=> b!47301 m!72775))

(assert (=> b!47301 m!72771))

(declare-fun m!72777 () Bool)

(assert (=> b!47301 m!72777))

(assert (=> b!47301 m!72769))

(assert (=> b!47172 d!13952))

(assert (=> d!13866 d!13862))

(declare-fun d!13954 () Bool)

(assert (=> d!13954 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72387)))

(assert (=> d!13954 true))

(declare-fun _$6!182 () Unit!3313)

(assert (=> d!13954 (= (choose!9 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72389)) lt!72387 (BitStream!1809 (buf!1387 (_2!2360 lt!72389)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))) _$6!182)))

(declare-fun bs!3648 () Bool)

(assert (= bs!3648 d!13954))

(assert (=> bs!3648 m!71863))

(assert (=> d!13866 d!13954))

(declare-fun b!47312 () Bool)

(declare-fun res!39864 () Bool)

(declare-fun e!31363 () Bool)

(assert (=> b!47312 (=> (not res!39864) (not e!31363))))

(declare-fun lt!73477 () tuple2!4544)

(assert (=> b!47312 (= res!39864 (bvsle (currentByte!2892 lt!73077) (currentByte!2892 (_2!2365 lt!73477))))))

(declare-fun d!13956 () Bool)

(assert (=> d!13956 e!31363))

(declare-fun res!39867 () Bool)

(assert (=> d!13956 (=> (not res!39867) (not e!31363))))

(assert (=> d!13956 (= res!39867 (= (buf!1387 (_2!2365 lt!73477)) (buf!1387 lt!73077)))))

(declare-datatypes ((tuple3!172 0))(
  ( (tuple3!173 (_1!2374 Unit!3313) (_2!2374 BitStream!1808) (_3!94 array!2297)) )
))
(declare-fun lt!73479 () tuple3!172)

(assert (=> d!13956 (= lt!73477 (tuple2!4545 (_3!94 lt!73479) (_2!2374 lt!73479)))))

(declare-fun readBitsLoop!0 (BitStream!1808 (_ BitVec 64) array!2297 (_ BitVec 64) (_ BitVec 64)) tuple3!172)

(assert (=> d!13956 (= lt!73479 (readBitsLoop!0 lt!73077 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2298 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13956 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!13956 (= (readBits!0 lt!73077 #b0000000000000000000000000000000000000000000000000000000000000001) lt!73477)))

(declare-fun b!47313 () Bool)

(declare-fun res!39865 () Bool)

(assert (=> b!47313 (=> (not res!39865) (not e!31363))))

(declare-fun lt!73472 () (_ BitVec 64))

(assert (=> b!47313 (= res!39865 (= (bvadd lt!73472 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1038 (buf!1387 (_2!2365 lt!73477))) (currentByte!2892 (_2!2365 lt!73477)) (currentBit!2887 (_2!2365 lt!73477)))))))

(assert (=> b!47313 (or (not (= (bvand lt!73472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73472 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47313 (= lt!73472 (bitIndex!0 (size!1038 (buf!1387 lt!73077)) (currentByte!2892 lt!73077) (currentBit!2887 lt!73077)))))

(declare-fun b!47314 () Bool)

(assert (=> b!47314 (= e!31363 (= (byteArrayBitContentToList!0 (_2!2365 lt!73477) (_1!2365 lt!73477) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2365 lt!73477) lt!73077 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47315 () Bool)

(declare-fun res!39866 () Bool)

(assert (=> b!47315 (=> (not res!39866) (not e!31363))))

(assert (=> b!47315 (= res!39866 (invariant!0 (currentBit!2887 (_2!2365 lt!73477)) (currentByte!2892 (_2!2365 lt!73477)) (size!1038 (buf!1387 (_2!2365 lt!73477)))))))

(declare-fun b!47316 () Bool)

(declare-fun res!39863 () Bool)

(assert (=> b!47316 (=> (not res!39863) (not e!31363))))

(declare-fun lt!73473 () (_ BitVec 64))

(assert (=> b!47316 (= res!39863 (= (size!1038 (_1!2365 lt!73477)) ((_ extract 31 0) lt!73473)))))

(assert (=> b!47316 (and (bvslt lt!73473 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!73473 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!73478 () (_ BitVec 64))

(declare-fun lt!73480 () (_ BitVec 64))

(assert (=> b!47316 (= lt!73473 (bvsdiv lt!73478 lt!73480))))

(assert (=> b!47316 (and (not (= lt!73480 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!73478 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!73480 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!47316 (= lt!73480 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!73476 () (_ BitVec 64))

(declare-fun lt!73475 () (_ BitVec 64))

(assert (=> b!47316 (= lt!73478 (bvsub lt!73476 lt!73475))))

(assert (=> b!47316 (or (= (bvand lt!73476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73476 lt!73475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47316 (= lt!73475 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73474 () (_ BitVec 64))

(assert (=> b!47316 (= lt!73476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!73474))))

(assert (=> b!47316 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!73474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47316 (= lt!73474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!13956 res!39867) b!47313))

(assert (= (and b!47313 res!39865) b!47315))

(assert (= (and b!47315 res!39866) b!47316))

(assert (= (and b!47316 res!39863) b!47312))

(assert (= (and b!47312 res!39864) b!47314))

(declare-fun m!72779 () Bool)

(assert (=> d!13956 m!72779))

(declare-fun m!72781 () Bool)

(assert (=> b!47313 m!72781))

(declare-fun m!72783 () Bool)

(assert (=> b!47313 m!72783))

(declare-fun m!72785 () Bool)

(assert (=> b!47314 m!72785))

(declare-fun m!72787 () Bool)

(assert (=> b!47314 m!72787))

(declare-fun m!72789 () Bool)

(assert (=> b!47315 m!72789))

(assert (=> b!47144 d!13956))

(declare-fun d!13958 () Bool)

(declare-fun lt!73483 () tuple2!4548)

(assert (=> d!13958 (= lt!73483 (readBit!0 lt!73077))))

(assert (=> d!13958 (= (readBitPure!0 lt!73077) (tuple2!4551 (_2!2367 lt!73483) (_1!2367 lt!73483)))))

(declare-fun bs!3649 () Bool)

(assert (= bs!3649 d!13958))

(declare-fun m!72791 () Bool)

(assert (=> bs!3649 m!72791))

(assert (=> b!47144 d!13958))

(declare-fun d!13960 () Bool)

(declare-fun e!31366 () Bool)

(assert (=> d!13960 e!31366))

(declare-fun res!39871 () Bool)

(assert (=> d!13960 (=> (not res!39871) (not e!31366))))

(assert (=> d!13960 (= res!39871 (invariant!0 (currentBit!2887 (_2!2360 lt!73076)) (currentByte!2892 (_2!2360 lt!73076)) (size!1038 (buf!1387 (_2!2360 lt!73076)))))))

(assert (=> d!13960 (= (readerFrom!0 (_2!2360 lt!73076) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379)) (BitStream!1809 (buf!1387 (_2!2360 lt!73076)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47319 () Bool)

(assert (=> b!47319 (= e!31366 (invariant!0 (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379) (size!1038 (buf!1387 (_2!2360 lt!73076)))))))

(assert (= (and d!13960 res!39871) b!47319))

(declare-fun m!72793 () Bool)

(assert (=> d!13960 m!72793))

(declare-fun m!72795 () Bool)

(assert (=> b!47319 m!72795))

(assert (=> b!47144 d!13960))

(declare-fun d!13962 () Bool)

(declare-fun res!39874 () Bool)

(declare-fun e!31367 () Bool)

(assert (=> d!13962 (=> (not res!39874) (not e!31367))))

(assert (=> d!13962 (= res!39874 (= (size!1038 (buf!1387 (_1!2359 lt!73163))) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!13962 (= (isPrefixOf!0 (_1!2359 lt!73163) (_2!2360 lt!72395)) e!31367)))

(declare-fun b!47320 () Bool)

(declare-fun res!39873 () Bool)

(assert (=> b!47320 (=> (not res!39873) (not e!31367))))

(assert (=> b!47320 (= res!39873 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73163))) (currentByte!2892 (_1!2359 lt!73163)) (currentBit!2887 (_1!2359 lt!73163))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun b!47321 () Bool)

(declare-fun e!31368 () Bool)

(assert (=> b!47321 (= e!31367 e!31368)))

(declare-fun res!39872 () Bool)

(assert (=> b!47321 (=> res!39872 e!31368)))

(assert (=> b!47321 (= res!39872 (= (size!1038 (buf!1387 (_1!2359 lt!73163))) #b00000000000000000000000000000000))))

(declare-fun b!47322 () Bool)

(assert (=> b!47322 (= e!31368 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!73163)) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73163))) (currentByte!2892 (_1!2359 lt!73163)) (currentBit!2887 (_1!2359 lt!73163)))))))

(assert (= (and d!13962 res!39874) b!47320))

(assert (= (and b!47320 res!39873) b!47321))

(assert (= (and b!47321 (not res!39872)) b!47322))

(declare-fun m!72797 () Bool)

(assert (=> b!47320 m!72797))

(assert (=> b!47320 m!71893))

(assert (=> b!47322 m!72797))

(assert (=> b!47322 m!72797))

(declare-fun m!72799 () Bool)

(assert (=> b!47322 m!72799))

(assert (=> b!47178 d!13962))

(declare-fun d!13964 () Bool)

(declare-fun res!39877 () Bool)

(declare-fun e!31369 () Bool)

(assert (=> d!13964 (=> (not res!39877) (not e!31369))))

(assert (=> d!13964 (= res!39877 (= (size!1038 (buf!1387 (_2!2359 lt!73135))) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13964 (= (isPrefixOf!0 (_2!2359 lt!73135) (_2!2360 lt!72389)) e!31369)))

(declare-fun b!47323 () Bool)

(declare-fun res!39876 () Bool)

(assert (=> b!47323 (=> (not res!39876) (not e!31369))))

(assert (=> b!47323 (= res!39876 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73135))) (currentByte!2892 (_2!2359 lt!73135)) (currentBit!2887 (_2!2359 lt!73135))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47324 () Bool)

(declare-fun e!31370 () Bool)

(assert (=> b!47324 (= e!31369 e!31370)))

(declare-fun res!39875 () Bool)

(assert (=> b!47324 (=> res!39875 e!31370)))

(assert (=> b!47324 (= res!39875 (= (size!1038 (buf!1387 (_2!2359 lt!73135))) #b00000000000000000000000000000000))))

(declare-fun b!47325 () Bool)

(assert (=> b!47325 (= e!31370 (arrayBitRangesEq!0 (buf!1387 (_2!2359 lt!73135)) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73135))) (currentByte!2892 (_2!2359 lt!73135)) (currentBit!2887 (_2!2359 lt!73135)))))))

(assert (= (and d!13964 res!39877) b!47323))

(assert (= (and b!47323 res!39876) b!47324))

(assert (= (and b!47324 (not res!39875)) b!47325))

(assert (=> b!47323 m!72753))

(assert (=> b!47323 m!71895))

(assert (=> b!47325 m!72753))

(assert (=> b!47325 m!72753))

(declare-fun m!72801 () Bool)

(assert (=> b!47325 m!72801))

(assert (=> b!47162 d!13964))

(declare-fun d!13966 () Bool)

(assert (=> d!13966 (= (isEmpty!138 lt!73141) (is-Nil!542 lt!73141))))

(assert (=> b!47169 d!13966))

(assert (=> b!47176 d!13844))

(declare-fun d!13968 () Bool)

(assert (=> d!13968 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 (_2!2360 lt!72395)) lt!73167 lt!73156)))

(declare-fun lt!73484 () Unit!3313)

(assert (=> d!13968 (= lt!73484 (choose!8 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) lt!73167 lt!73156))))

(assert (=> d!13968 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73167) (bvsle lt!73167 lt!73156))))

(assert (=> d!13968 (= (arrayBitRangesEqSymmetric!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) lt!73167 lt!73156) lt!73484)))

(declare-fun bs!3650 () Bool)

(assert (= bs!3650 d!13968))

(assert (=> bs!3650 m!72473))

(declare-fun m!72803 () Bool)

(assert (=> bs!3650 m!72803))

(assert (=> b!47176 d!13968))

(declare-fun b!47326 () Bool)

(declare-fun res!39880 () Bool)

(declare-fun lt!73486 () (_ BitVec 32))

(assert (=> b!47326 (= res!39880 (= lt!73486 #b00000000000000000000000000000000))))

(declare-fun e!31375 () Bool)

(assert (=> b!47326 (=> res!39880 e!31375)))

(declare-fun e!31372 () Bool)

(assert (=> b!47326 (= e!31372 e!31375)))

(declare-fun b!47327 () Bool)

(declare-fun e!31371 () Bool)

(declare-fun e!31374 () Bool)

(assert (=> b!47327 (= e!31371 e!31374)))

(declare-fun res!39879 () Bool)

(assert (=> b!47327 (=> (not res!39879) (not e!31374))))

(declare-fun e!31373 () Bool)

(assert (=> b!47327 (= res!39879 e!31373)))

(declare-fun res!39878 () Bool)

(assert (=> b!47327 (=> res!39878 e!31373)))

(declare-fun lt!73487 () tuple4!14)

(assert (=> b!47327 (= res!39878 (bvsge (_1!2373 lt!73487) (_2!2373 lt!73487)))))

(assert (=> b!47327 (= lt!73486 ((_ extract 31 0) (bvsrem lt!73156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73485 () (_ BitVec 32))

(assert (=> b!47327 (= lt!73485 ((_ extract 31 0) (bvsrem lt!73167 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47327 (= lt!73487 (arrayBitIndices!0 lt!73167 lt!73156))))

(declare-fun d!13970 () Bool)

(declare-fun res!39881 () Bool)

(assert (=> d!13970 (=> res!39881 e!31371)))

(assert (=> d!13970 (= res!39881 (bvsge lt!73167 lt!73156))))

(assert (=> d!13970 (= (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 (_2!2360 lt!72395)) lt!73167 lt!73156) e!31371)))

(declare-fun b!47328 () Bool)

(declare-fun e!31376 () Bool)

(assert (=> b!47328 (= e!31374 e!31376)))

(declare-fun c!3245 () Bool)

(assert (=> b!47328 (= c!3245 (= (_3!93 lt!73487) (_4!7 lt!73487)))))

(declare-fun b!47329 () Bool)

(declare-fun call!576 () Bool)

(assert (=> b!47329 (= e!31375 call!576)))

(declare-fun bm!573 () Bool)

(assert (=> bm!573 (= call!576 (byteRangesEq!0 (ite c!3245 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73487)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_4!7 lt!73487))) (ite c!3245 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73487)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_4!7 lt!73487))) (ite c!3245 lt!73485 #b00000000000000000000000000000000) lt!73486))))

(declare-fun b!47330 () Bool)

(assert (=> b!47330 (= e!31376 e!31372)))

(declare-fun res!39882 () Bool)

(assert (=> b!47330 (= res!39882 (byteRangesEq!0 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73487)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73487)) lt!73485 #b00000000000000000000000000001000))))

(assert (=> b!47330 (=> (not res!39882) (not e!31372))))

(declare-fun b!47331 () Bool)

(assert (=> b!47331 (= e!31376 call!576)))

(declare-fun b!47332 () Bool)

(assert (=> b!47332 (= e!31373 (arrayRangesEq!8 (buf!1387 (_2!2360 lt!72389)) (buf!1387 (_2!2360 lt!72395)) (_1!2373 lt!73487) (_2!2373 lt!73487)))))

(assert (= (and d!13970 (not res!39881)) b!47327))

(assert (= (and b!47327 (not res!39878)) b!47332))

(assert (= (and b!47327 res!39879) b!47328))

(assert (= (and b!47328 c!3245) b!47331))

(assert (= (and b!47328 (not c!3245)) b!47330))

(assert (= (and b!47330 res!39882) b!47326))

(assert (= (and b!47326 (not res!39880)) b!47329))

(assert (= (or b!47331 b!47329) bm!573))

(declare-fun m!72805 () Bool)

(assert (=> b!47327 m!72805))

(declare-fun m!72807 () Bool)

(assert (=> bm!573 m!72807))

(declare-fun m!72809 () Bool)

(assert (=> bm!573 m!72809))

(declare-fun m!72811 () Bool)

(assert (=> bm!573 m!72811))

(declare-fun m!72813 () Bool)

(assert (=> bm!573 m!72813))

(declare-fun m!72815 () Bool)

(assert (=> bm!573 m!72815))

(assert (=> b!47330 m!72813))

(assert (=> b!47330 m!72815))

(assert (=> b!47330 m!72813))

(assert (=> b!47330 m!72815))

(declare-fun m!72817 () Bool)

(assert (=> b!47330 m!72817))

(declare-fun m!72819 () Bool)

(assert (=> b!47332 m!72819))

(assert (=> b!47176 d!13970))

(declare-fun d!13972 () Bool)

(assert (=> d!13972 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72389))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72389)))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72389))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72389))))))))

(assert (=> d!13878 d!13972))

(assert (=> d!13878 d!13838))

(declare-fun b!47333 () Bool)

(declare-fun res!39885 () Bool)

(declare-fun lt!73489 () (_ BitVec 32))

(assert (=> b!47333 (= res!39885 (= lt!73489 #b00000000000000000000000000000000))))

(declare-fun e!31381 () Bool)

(assert (=> b!47333 (=> res!39885 e!31381)))

(declare-fun e!31378 () Bool)

(assert (=> b!47333 (= e!31378 e!31381)))

(declare-fun b!47334 () Bool)

(declare-fun e!31377 () Bool)

(declare-fun e!31380 () Bool)

(assert (=> b!47334 (= e!31377 e!31380)))

(declare-fun res!39884 () Bool)

(assert (=> b!47334 (=> (not res!39884) (not e!31380))))

(declare-fun e!31379 () Bool)

(assert (=> b!47334 (= res!39884 e!31379)))

(declare-fun res!39883 () Bool)

(assert (=> b!47334 (=> res!39883 e!31379)))

(declare-fun lt!73490 () tuple4!14)

(assert (=> b!47334 (= res!39883 (bvsge (_1!2373 lt!73490) (_2!2373 lt!73490)))))

(assert (=> b!47334 (= lt!73489 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73488 () (_ BitVec 32))

(assert (=> b!47334 (= lt!73488 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47334 (= lt!73490 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun d!13974 () Bool)

(declare-fun res!39886 () Bool)

(assert (=> d!13974 (=> res!39886 e!31377)))

(assert (=> d!13974 (= res!39886 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (=> d!13974 (= (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))) e!31377)))

(declare-fun b!47335 () Bool)

(declare-fun e!31382 () Bool)

(assert (=> b!47335 (= e!31380 e!31382)))

(declare-fun c!3246 () Bool)

(assert (=> b!47335 (= c!3246 (= (_3!93 lt!73490) (_4!7 lt!73490)))))

(declare-fun b!47336 () Bool)

(declare-fun call!577 () Bool)

(assert (=> b!47336 (= e!31381 call!577)))

(declare-fun bm!574 () Bool)

(assert (=> bm!574 (= call!577 (byteRangesEq!0 (ite c!3246 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73490)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73490))) (ite c!3246 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73490)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_4!7 lt!73490))) (ite c!3246 lt!73488 #b00000000000000000000000000000000) lt!73489))))

(declare-fun b!47337 () Bool)

(assert (=> b!47337 (= e!31382 e!31378)))

(declare-fun res!39887 () Bool)

(assert (=> b!47337 (= res!39887 (byteRangesEq!0 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73490)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73490)) lt!73488 #b00000000000000000000000000001000))))

(assert (=> b!47337 (=> (not res!39887) (not e!31378))))

(declare-fun b!47338 () Bool)

(assert (=> b!47338 (= e!31382 call!577)))

(declare-fun b!47339 () Bool)

(assert (=> b!47339 (= e!31379 (arrayRangesEq!8 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72395)) (_1!2373 lt!73490) (_2!2373 lt!73490)))))

(assert (= (and d!13974 (not res!39886)) b!47334))

(assert (= (and b!47334 (not res!39883)) b!47339))

(assert (= (and b!47334 res!39884) b!47335))

(assert (= (and b!47335 c!3246) b!47338))

(assert (= (and b!47335 (not c!3246)) b!47337))

(assert (= (and b!47337 res!39887) b!47333))

(assert (= (and b!47333 (not res!39885)) b!47336))

(assert (= (or b!47338 b!47336) bm!574))

(assert (=> b!47334 m!71901))

(assert (=> b!47334 m!72697))

(declare-fun m!72821 () Bool)

(assert (=> bm!574 m!72821))

(declare-fun m!72823 () Bool)

(assert (=> bm!574 m!72823))

(declare-fun m!72825 () Bool)

(assert (=> bm!574 m!72825))

(declare-fun m!72827 () Bool)

(assert (=> bm!574 m!72827))

(declare-fun m!72829 () Bool)

(assert (=> bm!574 m!72829))

(assert (=> b!47337 m!72827))

(assert (=> b!47337 m!72829))

(assert (=> b!47337 m!72827))

(assert (=> b!47337 m!72829))

(declare-fun m!72831 () Bool)

(assert (=> b!47337 m!72831))

(declare-fun m!72833 () Bool)

(assert (=> b!47339 m!72833))

(assert (=> b!47104 d!13974))

(assert (=> b!47104 d!13850))

(declare-fun b!47340 () Bool)

(declare-fun res!39890 () Bool)

(declare-fun lt!73492 () (_ BitVec 32))

(assert (=> b!47340 (= res!39890 (= lt!73492 #b00000000000000000000000000000000))))

(declare-fun e!31387 () Bool)

(assert (=> b!47340 (=> res!39890 e!31387)))

(declare-fun e!31384 () Bool)

(assert (=> b!47340 (= e!31384 e!31387)))

(declare-fun b!47341 () Bool)

(declare-fun e!31383 () Bool)

(declare-fun e!31386 () Bool)

(assert (=> b!47341 (= e!31383 e!31386)))

(declare-fun res!39889 () Bool)

(assert (=> b!47341 (=> (not res!39889) (not e!31386))))

(declare-fun e!31385 () Bool)

(assert (=> b!47341 (= res!39889 e!31385)))

(declare-fun res!39888 () Bool)

(assert (=> b!47341 (=> res!39888 e!31385)))

(declare-fun lt!73493 () tuple4!14)

(assert (=> b!47341 (= res!39888 (bvsge (_1!2373 lt!73493) (_2!2373 lt!73493)))))

(assert (=> b!47341 (= lt!73492 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73491 () (_ BitVec 32))

(assert (=> b!47341 (= lt!73491 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47341 (= lt!73493 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun d!13976 () Bool)

(declare-fun res!39891 () Bool)

(assert (=> d!13976 (=> res!39891 e!31383)))

(assert (=> d!13976 (= res!39891 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!13976 (= (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))) e!31383)))

(declare-fun b!47342 () Bool)

(declare-fun e!31388 () Bool)

(assert (=> b!47342 (= e!31386 e!31388)))

(declare-fun c!3247 () Bool)

(assert (=> b!47342 (= c!3247 (= (_3!93 lt!73493) (_4!7 lt!73493)))))

(declare-fun b!47343 () Bool)

(declare-fun call!578 () Bool)

(assert (=> b!47343 (= e!31387 call!578)))

(declare-fun bm!575 () Bool)

(assert (=> bm!575 (= call!578 (byteRangesEq!0 (ite c!3247 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73493)) (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_4!7 lt!73493))) (ite c!3247 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73493)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_4!7 lt!73493))) (ite c!3247 lt!73491 #b00000000000000000000000000000000) lt!73492))))

(declare-fun b!47344 () Bool)

(assert (=> b!47344 (= e!31388 e!31384)))

(declare-fun res!39892 () Bool)

(assert (=> b!47344 (= res!39892 (byteRangesEq!0 (select (arr!1558 (buf!1387 (_2!2360 lt!72395))) (_3!93 lt!73493)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73493)) lt!73491 #b00000000000000000000000000001000))))

(assert (=> b!47344 (=> (not res!39892) (not e!31384))))

(declare-fun b!47345 () Bool)

(assert (=> b!47345 (= e!31388 call!578)))

(declare-fun b!47346 () Bool)

(assert (=> b!47346 (= e!31385 (arrayRangesEq!8 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72389)) (_1!2373 lt!73493) (_2!2373 lt!73493)))))

(assert (= (and d!13976 (not res!39891)) b!47341))

(assert (= (and b!47341 (not res!39888)) b!47346))

(assert (= (and b!47341 res!39889) b!47342))

(assert (= (and b!47342 c!3247) b!47345))

(assert (= (and b!47342 (not c!3247)) b!47344))

(assert (= (and b!47344 res!39892) b!47340))

(assert (= (and b!47340 (not res!39890)) b!47343))

(assert (= (or b!47345 b!47343) bm!575))

(assert (=> b!47341 m!71893))

(declare-fun m!72835 () Bool)

(assert (=> b!47341 m!72835))

(declare-fun m!72837 () Bool)

(assert (=> bm!575 m!72837))

(declare-fun m!72839 () Bool)

(assert (=> bm!575 m!72839))

(declare-fun m!72841 () Bool)

(assert (=> bm!575 m!72841))

(declare-fun m!72843 () Bool)

(assert (=> bm!575 m!72843))

(declare-fun m!72845 () Bool)

(assert (=> bm!575 m!72845))

(assert (=> b!47344 m!72843))

(assert (=> b!47344 m!72845))

(assert (=> b!47344 m!72843))

(assert (=> b!47344 m!72845))

(declare-fun m!72847 () Bool)

(assert (=> b!47344 m!72847))

(declare-fun m!72849 () Bool)

(assert (=> b!47346 m!72849))

(assert (=> b!47070 d!13976))

(assert (=> b!47070 d!13844))

(declare-fun d!13978 () Bool)

(declare-fun lt!73494 () tuple2!4548)

(assert (=> d!13978 (= lt!73494 (readBit!0 (readerFrom!0 (_2!2360 lt!73083) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379))))))

(assert (=> d!13978 (= (readBitPure!0 (readerFrom!0 (_2!2360 lt!73083) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379))) (tuple2!4551 (_2!2367 lt!73494) (_1!2367 lt!73494)))))

(declare-fun bs!3651 () Bool)

(assert (= bs!3651 d!13978))

(assert (=> bs!3651 m!72379))

(declare-fun m!72851 () Bool)

(assert (=> bs!3651 m!72851))

(assert (=> b!47142 d!13978))

(declare-fun d!13980 () Bool)

(declare-fun e!31389 () Bool)

(assert (=> d!13980 e!31389))

(declare-fun res!39893 () Bool)

(assert (=> d!13980 (=> (not res!39893) (not e!31389))))

(assert (=> d!13980 (= res!39893 (invariant!0 (currentBit!2887 (_2!2360 lt!73083)) (currentByte!2892 (_2!2360 lt!73083)) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(assert (=> d!13980 (= (readerFrom!0 (_2!2360 lt!73083) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379)) (BitStream!1809 (buf!1387 (_2!2360 lt!73083)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47347 () Bool)

(assert (=> b!47347 (= e!31389 (invariant!0 (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(assert (= (and d!13980 res!39893) b!47347))

(assert (=> d!13980 m!72749))

(declare-fun m!72853 () Bool)

(assert (=> b!47347 m!72853))

(assert (=> b!47142 d!13980))

(assert (=> b!47102 d!13850))

(assert (=> b!47102 d!13844))

(assert (=> b!47068 d!13844))

(assert (=> b!47068 d!13878))

(declare-fun d!13982 () Bool)

(declare-fun e!31390 () Bool)

(assert (=> d!13982 e!31390))

(declare-fun res!39895 () Bool)

(assert (=> d!13982 (=> (not res!39895) (not e!31390))))

(declare-fun lt!73500 () (_ BitVec 64))

(declare-fun lt!73498 () (_ BitVec 64))

(declare-fun lt!73497 () (_ BitVec 64))

(assert (=> d!13982 (= res!39895 (= lt!73498 (bvsub lt!73497 lt!73500)))))

(assert (=> d!13982 (or (= (bvand lt!73497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73497 lt!73500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13982 (= lt!73500 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73076)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73076))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73076)))))))

(declare-fun lt!73499 () (_ BitVec 64))

(declare-fun lt!73495 () (_ BitVec 64))

(assert (=> d!13982 (= lt!73497 (bvmul lt!73499 lt!73495))))

(assert (=> d!13982 (or (= lt!73499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73495 (bvsdiv (bvmul lt!73499 lt!73495) lt!73499)))))

(assert (=> d!13982 (= lt!73495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13982 (= lt!73499 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73076)))))))

(assert (=> d!13982 (= lt!73498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73076))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73076)))))))

(assert (=> d!13982 (invariant!0 (currentBit!2887 (_2!2360 lt!73076)) (currentByte!2892 (_2!2360 lt!73076)) (size!1038 (buf!1387 (_2!2360 lt!73076))))))

(assert (=> d!13982 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73076))) (currentByte!2892 (_2!2360 lt!73076)) (currentBit!2887 (_2!2360 lt!73076))) lt!73498)))

(declare-fun b!47348 () Bool)

(declare-fun res!39894 () Bool)

(assert (=> b!47348 (=> (not res!39894) (not e!31390))))

(assert (=> b!47348 (= res!39894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73498))))

(declare-fun b!47349 () Bool)

(declare-fun lt!73496 () (_ BitVec 64))

(assert (=> b!47349 (= e!31390 (bvsle lt!73498 (bvmul lt!73496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47349 (or (= lt!73496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73496)))))

(assert (=> b!47349 (= lt!73496 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73076)))))))

(assert (= (and d!13982 res!39895) b!47348))

(assert (= (and b!47348 res!39894) b!47349))

(declare-fun m!72855 () Bool)

(assert (=> d!13982 m!72855))

(assert (=> d!13982 m!72793))

(assert (=> b!47140 d!13982))

(assert (=> b!47140 d!13850))

(assert (=> d!13858 d!13846))

(assert (=> d!13858 d!13778))

(declare-fun d!13984 () Bool)

(assert (=> d!13984 (isPrefixOf!0 lt!73136 (_2!2360 lt!72389))))

(declare-fun lt!73501 () Unit!3313)

(assert (=> d!13984 (= lt!73501 (choose!30 lt!73136 thiss!1379 (_2!2360 lt!72389)))))

(assert (=> d!13984 (isPrefixOf!0 lt!73136 thiss!1379)))

(assert (=> d!13984 (= (lemmaIsPrefixTransitive!0 lt!73136 thiss!1379 (_2!2360 lt!72389)) lt!73501)))

(declare-fun bs!3652 () Bool)

(assert (= bs!3652 d!13984))

(assert (=> bs!3652 m!72425))

(declare-fun m!72857 () Bool)

(assert (=> bs!3652 m!72857))

(declare-fun m!72859 () Bool)

(assert (=> bs!3652 m!72859))

(assert (=> d!13858 d!13984))

(declare-fun d!13986 () Bool)

(declare-fun res!39898 () Bool)

(declare-fun e!31391 () Bool)

(assert (=> d!13986 (=> (not res!39898) (not e!31391))))

(assert (=> d!13986 (= res!39898 (= (size!1038 (buf!1387 lt!73136)) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13986 (= (isPrefixOf!0 lt!73136 (_2!2360 lt!72389)) e!31391)))

(declare-fun b!47350 () Bool)

(declare-fun res!39897 () Bool)

(assert (=> b!47350 (=> (not res!39897) (not e!31391))))

(assert (=> b!47350 (= res!39897 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!73136)) (currentByte!2892 lt!73136) (currentBit!2887 lt!73136)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47351 () Bool)

(declare-fun e!31392 () Bool)

(assert (=> b!47351 (= e!31391 e!31392)))

(declare-fun res!39896 () Bool)

(assert (=> b!47351 (=> res!39896 e!31392)))

(assert (=> b!47351 (= res!39896 (= (size!1038 (buf!1387 lt!73136)) #b00000000000000000000000000000000))))

(declare-fun b!47352 () Bool)

(assert (=> b!47352 (= e!31392 (arrayBitRangesEq!0 (buf!1387 lt!73136) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!73136)) (currentByte!2892 lt!73136) (currentBit!2887 lt!73136))))))

(assert (= (and d!13986 res!39898) b!47350))

(assert (= (and b!47350 res!39897) b!47351))

(assert (= (and b!47351 (not res!39896)) b!47352))

(declare-fun m!72861 () Bool)

(assert (=> b!47350 m!72861))

(assert (=> b!47350 m!71895))

(assert (=> b!47352 m!72861))

(assert (=> b!47352 m!72861))

(declare-fun m!72863 () Bool)

(assert (=> b!47352 m!72863))

(assert (=> d!13858 d!13986))

(declare-fun d!13988 () Bool)

(declare-fun res!39901 () Bool)

(declare-fun e!31393 () Bool)

(assert (=> d!13988 (=> (not res!39901) (not e!31393))))

(assert (=> d!13988 (= res!39901 (= (size!1038 (buf!1387 lt!73136)) (size!1038 (buf!1387 lt!73136))))))

(assert (=> d!13988 (= (isPrefixOf!0 lt!73136 lt!73136) e!31393)))

(declare-fun b!47353 () Bool)

(declare-fun res!39900 () Bool)

(assert (=> b!47353 (=> (not res!39900) (not e!31393))))

(assert (=> b!47353 (= res!39900 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!73136)) (currentByte!2892 lt!73136) (currentBit!2887 lt!73136)) (bitIndex!0 (size!1038 (buf!1387 lt!73136)) (currentByte!2892 lt!73136) (currentBit!2887 lt!73136))))))

(declare-fun b!47354 () Bool)

(declare-fun e!31394 () Bool)

(assert (=> b!47354 (= e!31393 e!31394)))

(declare-fun res!39899 () Bool)

(assert (=> b!47354 (=> res!39899 e!31394)))

(assert (=> b!47354 (= res!39899 (= (size!1038 (buf!1387 lt!73136)) #b00000000000000000000000000000000))))

(declare-fun b!47355 () Bool)

(assert (=> b!47355 (= e!31394 (arrayBitRangesEq!0 (buf!1387 lt!73136) (buf!1387 lt!73136) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!73136)) (currentByte!2892 lt!73136) (currentBit!2887 lt!73136))))))

(assert (= (and d!13988 res!39901) b!47353))

(assert (= (and b!47353 res!39900) b!47354))

(assert (= (and b!47354 (not res!39899)) b!47355))

(assert (=> b!47353 m!72861))

(assert (=> b!47353 m!72861))

(assert (=> b!47355 m!72861))

(assert (=> b!47355 m!72861))

(declare-fun m!72865 () Bool)

(assert (=> b!47355 m!72865))

(assert (=> d!13858 d!13988))

(declare-fun d!13990 () Bool)

(assert (=> d!13990 (isPrefixOf!0 lt!73136 lt!73136)))

(declare-fun lt!73502 () Unit!3313)

(assert (=> d!13990 (= lt!73502 (choose!11 lt!73136))))

(assert (=> d!13990 (= (lemmaIsPrefixRefl!0 lt!73136) lt!73502)))

(declare-fun bs!3653 () Bool)

(assert (= bs!3653 d!13990))

(assert (=> bs!3653 m!72429))

(declare-fun m!72867 () Bool)

(assert (=> bs!3653 m!72867))

(assert (=> d!13858 d!13990))

(declare-fun d!13992 () Bool)

(assert (=> d!13992 (isPrefixOf!0 lt!73136 (_2!2360 lt!72389))))

(declare-fun lt!73503 () Unit!3313)

(assert (=> d!13992 (= lt!73503 (choose!30 lt!73136 (_2!2360 lt!72389) (_2!2360 lt!72389)))))

(assert (=> d!13992 (isPrefixOf!0 lt!73136 (_2!2360 lt!72389))))

(assert (=> d!13992 (= (lemmaIsPrefixTransitive!0 lt!73136 (_2!2360 lt!72389) (_2!2360 lt!72389)) lt!73503)))

(declare-fun bs!3654 () Bool)

(assert (= bs!3654 d!13992))

(assert (=> bs!3654 m!72425))

(declare-fun m!72869 () Bool)

(assert (=> bs!3654 m!72869))

(assert (=> bs!3654 m!72425))

(assert (=> d!13858 d!13992))

(assert (=> d!13858 d!13848))

(declare-fun d!13994 () Bool)

(declare-fun res!39904 () Bool)

(declare-fun e!31395 () Bool)

(assert (=> d!13994 (=> (not res!39904) (not e!31395))))

(assert (=> d!13994 (= res!39904 (= (size!1038 (buf!1387 (_1!2359 lt!73135))) (size!1038 (buf!1387 (_2!2359 lt!73135)))))))

(assert (=> d!13994 (= (isPrefixOf!0 (_1!2359 lt!73135) (_2!2359 lt!73135)) e!31395)))

(declare-fun b!47356 () Bool)

(declare-fun res!39903 () Bool)

(assert (=> b!47356 (=> (not res!39903) (not e!31395))))

(assert (=> b!47356 (= res!39903 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73135))) (currentByte!2892 (_1!2359 lt!73135)) (currentBit!2887 (_1!2359 lt!73135))) (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73135))) (currentByte!2892 (_2!2359 lt!73135)) (currentBit!2887 (_2!2359 lt!73135)))))))

(declare-fun b!47357 () Bool)

(declare-fun e!31396 () Bool)

(assert (=> b!47357 (= e!31395 e!31396)))

(declare-fun res!39902 () Bool)

(assert (=> b!47357 (=> res!39902 e!31396)))

(assert (=> b!47357 (= res!39902 (= (size!1038 (buf!1387 (_1!2359 lt!73135))) #b00000000000000000000000000000000))))

(declare-fun b!47358 () Bool)

(assert (=> b!47358 (= e!31396 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!73135)) (buf!1387 (_2!2359 lt!73135)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73135))) (currentByte!2892 (_1!2359 lt!73135)) (currentBit!2887 (_1!2359 lt!73135)))))))

(assert (= (and d!13994 res!39904) b!47356))

(assert (= (and b!47356 res!39903) b!47357))

(assert (= (and b!47357 (not res!39902)) b!47358))

(declare-fun m!72871 () Bool)

(assert (=> b!47356 m!72871))

(assert (=> b!47356 m!72753))

(assert (=> b!47358 m!72871))

(assert (=> b!47358 m!72871))

(declare-fun m!72873 () Bool)

(assert (=> b!47358 m!72873))

(assert (=> d!13858 d!13994))

(declare-fun d!13996 () Bool)

(assert (=> d!13996 (isPrefixOf!0 (_2!2360 lt!72389) (_2!2360 lt!72389))))

(declare-fun lt!73504 () Unit!3313)

(assert (=> d!13996 (= lt!73504 (choose!11 (_2!2360 lt!72389)))))

(assert (=> d!13996 (= (lemmaIsPrefixRefl!0 (_2!2360 lt!72389)) lt!73504)))

(declare-fun bs!3655 () Bool)

(assert (= bs!3655 d!13996))

(assert (=> bs!3655 m!72433))

(declare-fun m!72875 () Bool)

(assert (=> bs!3655 m!72875))

(assert (=> d!13858 d!13996))

(declare-fun d!13998 () Bool)

(declare-fun res!39907 () Bool)

(declare-fun e!31397 () Bool)

(assert (=> d!13998 (=> (not res!39907) (not e!31397))))

(assert (=> d!13998 (= res!39907 (= (size!1038 (buf!1387 (_2!2360 lt!72389))) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!13998 (= (isPrefixOf!0 (_2!2360 lt!72389) (_2!2360 lt!72389)) e!31397)))

(declare-fun b!47359 () Bool)

(declare-fun res!39906 () Bool)

(assert (=> b!47359 (=> (not res!39906) (not e!31397))))

(assert (=> b!47359 (= res!39906 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47360 () Bool)

(declare-fun e!31398 () Bool)

(assert (=> b!47360 (= e!31397 e!31398)))

(declare-fun res!39905 () Bool)

(assert (=> b!47360 (=> res!39905 e!31398)))

(assert (=> b!47360 (= res!39905 (= (size!1038 (buf!1387 (_2!2360 lt!72389))) #b00000000000000000000000000000000))))

(declare-fun b!47361 () Bool)

(assert (=> b!47361 (= e!31398 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(assert (= (and d!13998 res!39907) b!47359))

(assert (= (and b!47359 res!39906) b!47360))

(assert (= (and b!47360 (not res!39905)) b!47361))

(assert (=> b!47359 m!71895))

(assert (=> b!47359 m!71895))

(assert (=> b!47361 m!71895))

(assert (=> b!47361 m!71895))

(declare-fun m!72877 () Bool)

(assert (=> b!47361 m!72877))

(assert (=> d!13858 d!13998))

(declare-fun b!47362 () Bool)

(declare-fun res!39909 () Bool)

(declare-fun e!31400 () Bool)

(assert (=> b!47362 (=> (not res!39909) (not e!31400))))

(declare-fun lt!73519 () tuple2!4532)

(assert (=> b!47362 (= res!39909 (isPrefixOf!0 (_2!2359 lt!73519) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun b!47363 () Bool)

(declare-fun e!31399 () Unit!3313)

(declare-fun lt!73518 () Unit!3313)

(assert (=> b!47363 (= e!31399 lt!73518)))

(declare-fun lt!73523 () (_ BitVec 64))

(assert (=> b!47363 (= lt!73523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73512 () (_ BitVec 64))

(assert (=> b!47363 (= lt!73512 (bitIndex!0 (size!1038 (buf!1387 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))) (currentByte!2892 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))) (currentBit!2887 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))))))

(assert (=> b!47363 (= lt!73518 (arrayBitRangesEqSymmetric!0 (buf!1387 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))) (buf!1387 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))) lt!73523 lt!73512))))

(assert (=> b!47363 (arrayBitRangesEq!0 (buf!1387 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))) (buf!1387 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))) lt!73523 lt!73512)))

(declare-fun b!47364 () Bool)

(declare-fun lt!73521 () (_ BitVec 64))

(declare-fun lt!73506 () (_ BitVec 64))

(assert (=> b!47364 (= e!31400 (= (_1!2359 lt!73519) (withMovedBitIndex!0 (_2!2359 lt!73519) (bvsub lt!73506 lt!73521))))))

(assert (=> b!47364 (or (= (bvand lt!73506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73506 lt!73521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47364 (= lt!73521 (bitIndex!0 (size!1038 (buf!1387 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))) (currentByte!2892 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))) (currentBit!2887 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))))))

(assert (=> b!47364 (= lt!73506 (bitIndex!0 (size!1038 (buf!1387 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))) (currentByte!2892 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))) (currentBit!2887 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))))))

(declare-fun b!47365 () Bool)

(declare-fun res!39908 () Bool)

(assert (=> b!47365 (=> (not res!39908) (not e!31400))))

(assert (=> b!47365 (= res!39908 (isPrefixOf!0 (_1!2359 lt!73519) (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))))))

(declare-fun b!47366 () Bool)

(declare-fun Unit!3345 () Unit!3313)

(assert (=> b!47366 (= e!31399 Unit!3345)))

(declare-fun d!14000 () Bool)

(assert (=> d!14000 e!31400))

(declare-fun res!39910 () Bool)

(assert (=> d!14000 (=> (not res!39910) (not e!31400))))

(assert (=> d!14000 (= res!39910 (isPrefixOf!0 (_1!2359 lt!73519) (_2!2359 lt!73519)))))

(declare-fun lt!73520 () BitStream!1808)

(assert (=> d!14000 (= lt!73519 (tuple2!4533 lt!73520 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun lt!73516 () Unit!3313)

(declare-fun lt!73513 () Unit!3313)

(assert (=> d!14000 (= lt!73516 lt!73513)))

(assert (=> d!14000 (isPrefixOf!0 lt!73520 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))))

(assert (=> d!14000 (= lt!73513 (lemmaIsPrefixTransitive!0 lt!73520 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun lt!73522 () Unit!3313)

(declare-fun lt!73510 () Unit!3313)

(assert (=> d!14000 (= lt!73522 lt!73510)))

(assert (=> d!14000 (isPrefixOf!0 lt!73520 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))))

(assert (=> d!14000 (= lt!73510 (lemmaIsPrefixTransitive!0 lt!73520 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun lt!73517 () Unit!3313)

(assert (=> d!14000 (= lt!73517 e!31399)))

(declare-fun c!3248 () Bool)

(assert (=> d!14000 (= c!3248 (not (= (size!1038 (buf!1387 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))) #b00000000000000000000000000000000)))))

(declare-fun lt!73514 () Unit!3313)

(declare-fun lt!73505 () Unit!3313)

(assert (=> d!14000 (= lt!73514 lt!73505)))

(assert (=> d!14000 (isPrefixOf!0 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))))

(assert (=> d!14000 (= lt!73505 (lemmaIsPrefixRefl!0 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun lt!73507 () Unit!3313)

(declare-fun lt!73511 () Unit!3313)

(assert (=> d!14000 (= lt!73507 lt!73511)))

(assert (=> d!14000 (= lt!73511 (lemmaIsPrefixRefl!0 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))))))

(declare-fun lt!73524 () Unit!3313)

(declare-fun lt!73509 () Unit!3313)

(assert (=> d!14000 (= lt!73524 lt!73509)))

(assert (=> d!14000 (isPrefixOf!0 lt!73520 lt!73520)))

(assert (=> d!14000 (= lt!73509 (lemmaIsPrefixRefl!0 lt!73520))))

(declare-fun lt!73508 () Unit!3313)

(declare-fun lt!73515 () Unit!3313)

(assert (=> d!14000 (= lt!73508 lt!73515)))

(assert (=> d!14000 (isPrefixOf!0 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))))

(assert (=> d!14000 (= lt!73515 (lemmaIsPrefixRefl!0 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))))))

(assert (=> d!14000 (= lt!73520 (BitStream!1809 (buf!1387 (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))) (currentByte!2892 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395))) (currentBit!2887 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)))))))

(assert (=> d!14000 (isPrefixOf!0 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395)))))

(assert (=> d!14000 (= (reader!0 (ite c!3206 (_2!2360 lt!72928) (_2!2360 lt!72395)) (ite c!3206 (_2!2360 lt!72896) (_2!2360 lt!72395))) lt!73519)))

(assert (= (and d!14000 c!3248) b!47363))

(assert (= (and d!14000 (not c!3248)) b!47366))

(assert (= (and d!14000 res!39910) b!47365))

(assert (= (and b!47365 res!39908) b!47362))

(assert (= (and b!47362 res!39909) b!47364))

(declare-fun m!72879 () Bool)

(assert (=> b!47365 m!72879))

(declare-fun m!72881 () Bool)

(assert (=> b!47364 m!72881))

(declare-fun m!72883 () Bool)

(assert (=> b!47364 m!72883))

(declare-fun m!72885 () Bool)

(assert (=> b!47364 m!72885))

(declare-fun m!72887 () Bool)

(assert (=> b!47362 m!72887))

(assert (=> b!47363 m!72885))

(declare-fun m!72889 () Bool)

(assert (=> b!47363 m!72889))

(declare-fun m!72891 () Bool)

(assert (=> b!47363 m!72891))

(declare-fun m!72893 () Bool)

(assert (=> d!14000 m!72893))

(declare-fun m!72895 () Bool)

(assert (=> d!14000 m!72895))

(declare-fun m!72897 () Bool)

(assert (=> d!14000 m!72897))

(declare-fun m!72899 () Bool)

(assert (=> d!14000 m!72899))

(declare-fun m!72901 () Bool)

(assert (=> d!14000 m!72901))

(declare-fun m!72903 () Bool)

(assert (=> d!14000 m!72903))

(declare-fun m!72905 () Bool)

(assert (=> d!14000 m!72905))

(declare-fun m!72907 () Bool)

(assert (=> d!14000 m!72907))

(declare-fun m!72909 () Bool)

(assert (=> d!14000 m!72909))

(declare-fun m!72911 () Bool)

(assert (=> d!14000 m!72911))

(declare-fun m!72913 () Bool)

(assert (=> d!14000 m!72913))

(assert (=> bm!565 d!14000))

(declare-fun d!14002 () Bool)

(assert (=> d!14002 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72388) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!231 lt!72379))))

(assert (=> d!14002 true))

(declare-fun _$34!32 () Unit!3313)

(assert (=> d!14002 (= (choose!42 (_2!2360 lt!72389) (_2!2360 lt!72389) (_1!2359 lt!72381) (_1!2359 lt!72388) (bvsub to!314 i!635) lt!72379) _$34!32)))

(declare-fun bs!3656 () Bool)

(assert (= bs!3656 d!14002))

(assert (=> bs!3656 m!72405))

(assert (=> bs!3656 m!71907))

(assert (=> d!13836 d!14002))

(declare-fun d!14004 () Bool)

(assert (=> d!14004 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72909) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72909))))

(declare-fun bs!3657 () Bool)

(assert (= bs!3657 d!14004))

(assert (=> bs!3657 m!72345))

(assert (=> b!47031 d!14004))

(declare-fun d!14006 () Bool)

(assert (=> d!14006 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))))))))

(assert (=> d!13862 d!14006))

(declare-fun d!14008 () Bool)

(assert (=> d!14008 (= (length!240 lt!72986) (size!1040 lt!72986))))

(declare-fun bs!3658 () Bool)

(assert (= bs!3658 d!14008))

(declare-fun m!72915 () Bool)

(assert (=> bs!3658 m!72915))

(assert (=> b!47101 d!14008))

(declare-fun d!14010 () Bool)

(assert (=> d!14010 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72395)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14010 true))

(declare-fun _$1!291 () Unit!3313)

(assert (=> d!14010 (= (choose!27 thiss!1379 (_2!2360 lt!72395) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!291)))

(declare-fun bs!3659 () Bool)

(assert (= bs!3659 d!14010))

(assert (=> bs!3659 m!72349))

(assert (=> d!13828 d!14010))

(declare-fun d!14012 () Bool)

(assert (=> d!14012 (= (invariant!0 (currentBit!2887 (_2!2360 lt!72922)) (currentByte!2892 (_2!2360 lt!72922)) (size!1038 (buf!1387 (_2!2360 lt!72922)))) (and (bvsge (currentBit!2887 (_2!2360 lt!72922)) #b00000000000000000000000000000000) (bvslt (currentBit!2887 (_2!2360 lt!72922)) #b00000000000000000000000000001000) (bvsge (currentByte!2892 (_2!2360 lt!72922)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2892 (_2!2360 lt!72922)) (size!1038 (buf!1387 (_2!2360 lt!72922)))) (and (= (currentBit!2887 (_2!2360 lt!72922)) #b00000000000000000000000000000000) (= (currentByte!2892 (_2!2360 lt!72922)) (size!1038 (buf!1387 (_2!2360 lt!72922))))))))))

(assert (=> b!47029 d!14012))

(declare-fun d!14014 () Bool)

(assert (=> d!14014 (= (invariant!0 (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379) (size!1038 (buf!1387 thiss!1379))) (and (bvsge (currentBit!2887 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2887 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2892 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2892 thiss!1379) (size!1038 (buf!1387 thiss!1379))) (and (= (currentBit!2887 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2892 thiss!1379) (size!1038 (buf!1387 thiss!1379)))))))))

(assert (=> d!13854 d!14014))

(assert (=> d!13776 d!13778))

(declare-fun d!14016 () Bool)

(assert (=> d!14016 (isPrefixOf!0 thiss!1379 (_2!2360 lt!72389))))

(assert (=> d!14016 true))

(declare-fun _$15!147 () Unit!3313)

(assert (=> d!14016 (= (choose!30 thiss!1379 (_2!2360 lt!72395) (_2!2360 lt!72389)) _$15!147)))

(declare-fun bs!3660 () Bool)

(assert (= bs!3660 d!14016))

(assert (=> bs!3660 m!71875))

(assert (=> d!13776 d!14016))

(assert (=> d!13776 d!13824))

(declare-fun b!47367 () Bool)

(declare-fun e!31402 () tuple2!4546)

(assert (=> b!47367 (= e!31402 (tuple2!4547 Nil!542 (_2!2367 lt!72987)))))

(declare-fun b!47369 () Bool)

(declare-fun e!31401 () Bool)

(declare-fun lt!73525 () List!545)

(assert (=> b!47369 (= e!31401 (isEmpty!138 lt!73525))))

(declare-fun b!47370 () Bool)

(assert (=> b!47370 (= e!31401 (> (length!240 lt!73525) 0))))

(declare-fun lt!73527 () (_ BitVec 64))

(declare-fun b!47368 () Bool)

(declare-fun lt!73526 () tuple2!4548)

(assert (=> b!47368 (= e!31402 (tuple2!4547 (Cons!541 (_1!2367 lt!73526) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_2!2367 lt!73526) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988) lt!73527))) (_2!2367 lt!73526)))))

(assert (=> b!47368 (= lt!73526 (readBit!0 (_2!2367 lt!72987)))))

(assert (=> b!47368 (= lt!73527 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14018 () Bool)

(assert (=> d!14018 e!31401))

(declare-fun c!3250 () Bool)

(assert (=> d!14018 (= c!3250 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14018 (= lt!73525 (_1!2366 e!31402))))

(declare-fun c!3249 () Bool)

(assert (=> d!14018 (= c!3249 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14018 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14018 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72395) (_2!2367 lt!72987) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72988)) lt!73525)))

(assert (= (and d!14018 c!3249) b!47367))

(assert (= (and d!14018 (not c!3249)) b!47368))

(assert (= (and d!14018 c!3250) b!47369))

(assert (= (and d!14018 (not c!3250)) b!47370))

(declare-fun m!72917 () Bool)

(assert (=> b!47369 m!72917))

(declare-fun m!72919 () Bool)

(assert (=> b!47370 m!72919))

(declare-fun m!72921 () Bool)

(assert (=> b!47368 m!72921))

(declare-fun m!72923 () Bool)

(assert (=> b!47368 m!72923))

(assert (=> b!47099 d!14018))

(declare-fun d!14020 () Bool)

(declare-fun e!31403 () Bool)

(assert (=> d!14020 e!31403))

(declare-fun res!39911 () Bool)

(assert (=> d!14020 (=> (not res!39911) (not e!31403))))

(assert (=> d!14020 (= res!39911 (= (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72380)))) (buf!1387 (_1!2359 lt!72380))))))

(declare-fun lt!73534 () Bool)

(assert (=> d!14020 (= lt!73534 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72380))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73532 () tuple2!4548)

(assert (=> d!14020 (= lt!73532 (tuple2!4549 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72380))))) #b00000000000000000000000000000000)) (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72380)))))))

(assert (=> d!14020 (validate_offset_bit!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2359 lt!72380)))) ((_ sign_extend 32) (currentByte!2892 (_1!2359 lt!72380))) ((_ sign_extend 32) (currentBit!2887 (_1!2359 lt!72380))))))

(assert (=> d!14020 (= (readBit!0 (_1!2359 lt!72380)) lt!73532)))

(declare-fun lt!73529 () (_ BitVec 64))

(declare-fun b!47371 () Bool)

(declare-fun lt!73528 () (_ BitVec 64))

(assert (=> b!47371 (= e!31403 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72380))))) (currentByte!2892 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72380)))) (currentBit!2887 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72380))))) (bvadd lt!73529 lt!73528)))))

(assert (=> b!47371 (or (not (= (bvand lt!73529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73528 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73529 lt!73528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47371 (= lt!73528 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47371 (= lt!73529 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)) (currentBit!2887 (_1!2359 lt!72380))))))

(declare-fun lt!73530 () Bool)

(assert (=> b!47371 (= lt!73530 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72380))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73533 () Bool)

(assert (=> b!47371 (= lt!73533 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72380))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73531 () Bool)

(assert (=> b!47371 (= lt!73531 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72380))) (currentByte!2892 (_1!2359 lt!72380)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72380))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14020 res!39911) b!47371))

(declare-fun m!72925 () Bool)

(assert (=> d!14020 m!72925))

(declare-fun m!72927 () Bool)

(assert (=> d!14020 m!72927))

(declare-fun m!72929 () Bool)

(assert (=> d!14020 m!72929))

(declare-fun m!72931 () Bool)

(assert (=> d!14020 m!72931))

(assert (=> b!47371 m!72925))

(declare-fun m!72933 () Bool)

(assert (=> b!47371 m!72933))

(assert (=> b!47371 m!72929))

(declare-fun m!72935 () Bool)

(assert (=> b!47371 m!72935))

(assert (=> b!47371 m!72927))

(assert (=> b!47099 d!14020))

(declare-fun d!14022 () Bool)

(declare-fun e!31404 () Bool)

(assert (=> d!14022 e!31404))

(declare-fun res!39912 () Bool)

(assert (=> d!14022 (=> (not res!39912) (not e!31404))))

(declare-fun lt!73536 () (_ BitVec 64))

(declare-fun lt!73535 () BitStream!1808)

(assert (=> d!14022 (= res!39912 (= (bvadd lt!73536 (bvsub lt!72772 lt!72787)) (bitIndex!0 (size!1038 (buf!1387 lt!73535)) (currentByte!2892 lt!73535) (currentBit!2887 lt!73535))))))

(assert (=> d!14022 (or (not (= (bvand lt!73536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72772 lt!72787) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73536 (bvsub lt!72772 lt!72787)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14022 (= lt!73536 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!72785))) (currentByte!2892 (_2!2359 lt!72785)) (currentBit!2887 (_2!2359 lt!72785))))))

(assert (=> d!14022 (= lt!73535 (_2!2360 (moveBitIndex!0 (_2!2359 lt!72785) (bvsub lt!72772 lt!72787))))))

(assert (=> d!14022 (moveBitIndexPrecond!0 (_2!2359 lt!72785) (bvsub lt!72772 lt!72787))))

(assert (=> d!14022 (= (withMovedBitIndex!0 (_2!2359 lt!72785) (bvsub lt!72772 lt!72787)) lt!73535)))

(declare-fun b!47372 () Bool)

(assert (=> b!47372 (= e!31404 (= (size!1038 (buf!1387 (_2!2359 lt!72785))) (size!1038 (buf!1387 lt!73535))))))

(assert (= (and d!14022 res!39912) b!47372))

(declare-fun m!72937 () Bool)

(assert (=> d!14022 m!72937))

(declare-fun m!72939 () Bool)

(assert (=> d!14022 m!72939))

(declare-fun m!72941 () Bool)

(assert (=> d!14022 m!72941))

(declare-fun m!72943 () Bool)

(assert (=> d!14022 m!72943))

(assert (=> b!46999 d!14022))

(assert (=> b!46999 d!13844))

(assert (=> b!46999 d!13850))

(declare-fun d!14024 () Bool)

(assert (=> d!14024 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 thiss!1379)))))))

(assert (=> d!13842 d!14024))

(assert (=> b!47163 d!13850))

(declare-fun d!14026 () Bool)

(assert (=> d!14026 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 thiss!1379) lt!73139 lt!73128)))

(declare-fun lt!73537 () Unit!3313)

(assert (=> d!14026 (= lt!73537 (choose!8 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) lt!73139 lt!73128))))

(assert (=> d!14026 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73139) (bvsle lt!73139 lt!73128))))

(assert (=> d!14026 (= (arrayBitRangesEqSymmetric!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!72389)) lt!73139 lt!73128) lt!73537)))

(declare-fun bs!3661 () Bool)

(assert (= bs!3661 d!14026))

(assert (=> bs!3661 m!72423))

(declare-fun m!72945 () Bool)

(assert (=> bs!3661 m!72945))

(assert (=> b!47163 d!14026))

(declare-fun b!47373 () Bool)

(declare-fun res!39915 () Bool)

(declare-fun lt!73539 () (_ BitVec 32))

(assert (=> b!47373 (= res!39915 (= lt!73539 #b00000000000000000000000000000000))))

(declare-fun e!31409 () Bool)

(assert (=> b!47373 (=> res!39915 e!31409)))

(declare-fun e!31406 () Bool)

(assert (=> b!47373 (= e!31406 e!31409)))

(declare-fun b!47374 () Bool)

(declare-fun e!31405 () Bool)

(declare-fun e!31408 () Bool)

(assert (=> b!47374 (= e!31405 e!31408)))

(declare-fun res!39914 () Bool)

(assert (=> b!47374 (=> (not res!39914) (not e!31408))))

(declare-fun e!31407 () Bool)

(assert (=> b!47374 (= res!39914 e!31407)))

(declare-fun res!39913 () Bool)

(assert (=> b!47374 (=> res!39913 e!31407)))

(declare-fun lt!73540 () tuple4!14)

(assert (=> b!47374 (= res!39913 (bvsge (_1!2373 lt!73540) (_2!2373 lt!73540)))))

(assert (=> b!47374 (= lt!73539 ((_ extract 31 0) (bvsrem lt!73128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73538 () (_ BitVec 32))

(assert (=> b!47374 (= lt!73538 ((_ extract 31 0) (bvsrem lt!73139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47374 (= lt!73540 (arrayBitIndices!0 lt!73139 lt!73128))))

(declare-fun d!14028 () Bool)

(declare-fun res!39916 () Bool)

(assert (=> d!14028 (=> res!39916 e!31405)))

(assert (=> d!14028 (= res!39916 (bvsge lt!73139 lt!73128))))

(assert (=> d!14028 (= (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72389)) (buf!1387 thiss!1379) lt!73139 lt!73128) e!31405)))

(declare-fun b!47375 () Bool)

(declare-fun e!31410 () Bool)

(assert (=> b!47375 (= e!31408 e!31410)))

(declare-fun c!3251 () Bool)

(assert (=> b!47375 (= c!3251 (= (_3!93 lt!73540) (_4!7 lt!73540)))))

(declare-fun b!47376 () Bool)

(declare-fun call!579 () Bool)

(assert (=> b!47376 (= e!31409 call!579)))

(declare-fun bm!576 () Bool)

(assert (=> bm!576 (= call!579 (byteRangesEq!0 (ite c!3251 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73540)) (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_4!7 lt!73540))) (ite c!3251 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73540)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73540))) (ite c!3251 lt!73538 #b00000000000000000000000000000000) lt!73539))))

(declare-fun b!47377 () Bool)

(assert (=> b!47377 (= e!31410 e!31406)))

(declare-fun res!39917 () Bool)

(assert (=> b!47377 (= res!39917 (byteRangesEq!0 (select (arr!1558 (buf!1387 (_2!2360 lt!72389))) (_3!93 lt!73540)) (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73540)) lt!73538 #b00000000000000000000000000001000))))

(assert (=> b!47377 (=> (not res!39917) (not e!31406))))

(declare-fun b!47378 () Bool)

(assert (=> b!47378 (= e!31410 call!579)))

(declare-fun b!47379 () Bool)

(assert (=> b!47379 (= e!31407 (arrayRangesEq!8 (buf!1387 (_2!2360 lt!72389)) (buf!1387 thiss!1379) (_1!2373 lt!73540) (_2!2373 lt!73540)))))

(assert (= (and d!14028 (not res!39916)) b!47374))

(assert (= (and b!47374 (not res!39913)) b!47379))

(assert (= (and b!47374 res!39914) b!47375))

(assert (= (and b!47375 c!3251) b!47378))

(assert (= (and b!47375 (not c!3251)) b!47377))

(assert (= (and b!47377 res!39917) b!47373))

(assert (= (and b!47373 (not res!39915)) b!47376))

(assert (= (or b!47378 b!47376) bm!576))

(declare-fun m!72947 () Bool)

(assert (=> b!47374 m!72947))

(declare-fun m!72949 () Bool)

(assert (=> bm!576 m!72949))

(declare-fun m!72951 () Bool)

(assert (=> bm!576 m!72951))

(declare-fun m!72953 () Bool)

(assert (=> bm!576 m!72953))

(declare-fun m!72955 () Bool)

(assert (=> bm!576 m!72955))

(declare-fun m!72957 () Bool)

(assert (=> bm!576 m!72957))

(assert (=> b!47377 m!72955))

(assert (=> b!47377 m!72957))

(assert (=> b!47377 m!72955))

(assert (=> b!47377 m!72957))

(declare-fun m!72959 () Bool)

(assert (=> b!47377 m!72959))

(declare-fun m!72961 () Bool)

(assert (=> b!47379 m!72961))

(assert (=> b!47163 d!14028))

(declare-fun d!14030 () Bool)

(declare-fun res!39920 () Bool)

(declare-fun e!31411 () Bool)

(assert (=> d!14030 (=> (not res!39920) (not e!31411))))

(assert (=> d!14030 (= res!39920 (= (size!1038 (buf!1387 (_2!2359 lt!72785))) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!14030 (= (isPrefixOf!0 (_2!2359 lt!72785) (_2!2360 lt!72395)) e!31411)))

(declare-fun b!47380 () Bool)

(declare-fun res!39919 () Bool)

(assert (=> b!47380 (=> (not res!39919) (not e!31411))))

(assert (=> b!47380 (= res!39919 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!72785))) (currentByte!2892 (_2!2359 lt!72785)) (currentBit!2887 (_2!2359 lt!72785))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun b!47381 () Bool)

(declare-fun e!31412 () Bool)

(assert (=> b!47381 (= e!31411 e!31412)))

(declare-fun res!39918 () Bool)

(assert (=> b!47381 (=> res!39918 e!31412)))

(assert (=> b!47381 (= res!39918 (= (size!1038 (buf!1387 (_2!2359 lt!72785))) #b00000000000000000000000000000000))))

(declare-fun b!47382 () Bool)

(assert (=> b!47382 (= e!31412 (arrayBitRangesEq!0 (buf!1387 (_2!2359 lt!72785)) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!72785))) (currentByte!2892 (_2!2359 lt!72785)) (currentBit!2887 (_2!2359 lt!72785)))))))

(assert (= (and d!14030 res!39920) b!47380))

(assert (= (and b!47380 res!39919) b!47381))

(assert (= (and b!47381 (not res!39918)) b!47382))

(assert (=> b!47380 m!72939))

(assert (=> b!47380 m!71893))

(assert (=> b!47382 m!72939))

(assert (=> b!47382 m!72939))

(declare-fun m!72963 () Bool)

(assert (=> b!47382 m!72963))

(assert (=> b!46997 d!14030))

(declare-fun d!14032 () Bool)

(declare-fun res!39923 () Bool)

(declare-fun e!31413 () Bool)

(assert (=> d!14032 (=> (not res!39923) (not e!31413))))

(assert (=> d!14032 (= res!39923 (= (size!1038 (buf!1387 (_1!2359 lt!73135))) (size!1038 (buf!1387 thiss!1379))))))

(assert (=> d!14032 (= (isPrefixOf!0 (_1!2359 lt!73135) thiss!1379) e!31413)))

(declare-fun b!47383 () Bool)

(declare-fun res!39922 () Bool)

(assert (=> b!47383 (=> (not res!39922) (not e!31413))))

(assert (=> b!47383 (= res!39922 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73135))) (currentByte!2892 (_1!2359 lt!73135)) (currentBit!2887 (_1!2359 lt!73135))) (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun b!47384 () Bool)

(declare-fun e!31414 () Bool)

(assert (=> b!47384 (= e!31413 e!31414)))

(declare-fun res!39921 () Bool)

(assert (=> b!47384 (=> res!39921 e!31414)))

(assert (=> b!47384 (= res!39921 (= (size!1038 (buf!1387 (_1!2359 lt!73135))) #b00000000000000000000000000000000))))

(declare-fun b!47385 () Bool)

(assert (=> b!47385 (= e!31414 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!73135)) (buf!1387 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73135))) (currentByte!2892 (_1!2359 lt!73135)) (currentBit!2887 (_1!2359 lt!73135)))))))

(assert (= (and d!14032 res!39923) b!47383))

(assert (= (and b!47383 res!39922) b!47384))

(assert (= (and b!47384 (not res!39921)) b!47385))

(assert (=> b!47383 m!72871))

(assert (=> b!47383 m!71901))

(assert (=> b!47385 m!72871))

(assert (=> b!47385 m!72871))

(declare-fun m!72965 () Bool)

(assert (=> b!47385 m!72965))

(assert (=> b!47165 d!14032))

(declare-fun d!14034 () Bool)

(declare-fun lt!73543 () Int)

(assert (=> d!14034 (>= lt!73543 0)))

(declare-fun e!31417 () Int)

(assert (=> d!14034 (= lt!73543 e!31417)))

(declare-fun c!3254 () Bool)

(assert (=> d!14034 (= c!3254 (is-Nil!542 lt!72379))))

(assert (=> d!14034 (= (size!1040 lt!72379) lt!73543)))

(declare-fun b!47390 () Bool)

(assert (=> b!47390 (= e!31417 0)))

(declare-fun b!47391 () Bool)

(assert (=> b!47391 (= e!31417 (+ 1 (size!1040 (t!1295 lt!72379))))))

(assert (= (and d!14034 c!3254) b!47390))

(assert (= (and d!14034 (not c!3254)) b!47391))

(declare-fun m!72967 () Bool)

(assert (=> b!47391 m!72967))

(assert (=> d!13822 d!14034))

(declare-fun d!14036 () Bool)

(declare-fun res!39926 () Bool)

(declare-fun e!31418 () Bool)

(assert (=> d!14036 (=> (not res!39926) (not e!31418))))

(assert (=> d!14036 (= res!39926 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!73083)))))))

(assert (=> d!14036 (= (isPrefixOf!0 thiss!1379 (_2!2360 lt!73083)) e!31418)))

(declare-fun b!47392 () Bool)

(declare-fun res!39925 () Bool)

(assert (=> b!47392 (=> (not res!39925) (not e!31418))))

(assert (=> b!47392 (= res!39925 (bvsle (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73083))) (currentByte!2892 (_2!2360 lt!73083)) (currentBit!2887 (_2!2360 lt!73083)))))))

(declare-fun b!47393 () Bool)

(declare-fun e!31419 () Bool)

(assert (=> b!47393 (= e!31418 e!31419)))

(declare-fun res!39924 () Bool)

(assert (=> b!47393 (=> res!39924 e!31419)))

(assert (=> b!47393 (= res!39924 (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47394 () Bool)

(assert (=> b!47394 (= e!31419 (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!73083)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (= (and d!14036 res!39926) b!47392))

(assert (= (and b!47392 res!39925) b!47393))

(assert (= (and b!47393 (not res!39924)) b!47394))

(assert (=> b!47392 m!71901))

(assert (=> b!47392 m!72385))

(assert (=> b!47394 m!71901))

(assert (=> b!47394 m!71901))

(declare-fun m!72969 () Bool)

(assert (=> b!47394 m!72969))

(assert (=> b!47147 d!14036))

(assert (=> d!13848 d!13846))

(declare-fun d!14038 () Bool)

(assert (=> d!14038 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14038 true))

(declare-fun _$14!229 () Unit!3313)

(assert (=> d!14038 (= (choose!11 thiss!1379) _$14!229)))

(declare-fun bs!3663 () Bool)

(assert (= bs!3663 d!14038))

(assert (=> bs!3663 m!71897))

(assert (=> d!13848 d!14038))

(declare-fun d!14040 () Bool)

(declare-fun e!31420 () Bool)

(assert (=> d!14040 e!31420))

(declare-fun res!39928 () Bool)

(assert (=> d!14040 (=> (not res!39928) (not e!31420))))

(declare-fun lt!73549 () (_ BitVec 64))

(declare-fun lt!73547 () (_ BitVec 64))

(declare-fun lt!73546 () (_ BitVec 64))

(assert (=> d!14040 (= res!39928 (= lt!73547 (bvsub lt!73546 lt!73549)))))

(assert (=> d!14040 (or (= (bvand lt!73546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73549 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73546 lt!73549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14040 (= lt!73549 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73079)))) ((_ sign_extend 32) (currentByte!2892 (_1!2368 lt!73079))) ((_ sign_extend 32) (currentBit!2887 (_1!2368 lt!73079)))))))

(declare-fun lt!73548 () (_ BitVec 64))

(declare-fun lt!73544 () (_ BitVec 64))

(assert (=> d!14040 (= lt!73546 (bvmul lt!73548 lt!73544))))

(assert (=> d!14040 (or (= lt!73548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73544 (bvsdiv (bvmul lt!73548 lt!73544) lt!73548)))))

(assert (=> d!14040 (= lt!73544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14040 (= lt!73548 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73079)))))))

(assert (=> d!14040 (= lt!73547 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_1!2368 lt!73079))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_1!2368 lt!73079)))))))

(assert (=> d!14040 (invariant!0 (currentBit!2887 (_1!2368 lt!73079)) (currentByte!2892 (_1!2368 lt!73079)) (size!1038 (buf!1387 (_1!2368 lt!73079))))))

(assert (=> d!14040 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73079))) (currentByte!2892 (_1!2368 lt!73079)) (currentBit!2887 (_1!2368 lt!73079))) lt!73547)))

(declare-fun b!47395 () Bool)

(declare-fun res!39927 () Bool)

(assert (=> b!47395 (=> (not res!39927) (not e!31420))))

(assert (=> b!47395 (= res!39927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73547))))

(declare-fun b!47396 () Bool)

(declare-fun lt!73545 () (_ BitVec 64))

(assert (=> b!47396 (= e!31420 (bvsle lt!73547 (bvmul lt!73545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47396 (or (= lt!73545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73545)))))

(assert (=> b!47396 (= lt!73545 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2368 lt!73079)))))))

(assert (= (and d!14040 res!39928) b!47395))

(assert (= (and b!47395 res!39927) b!47396))

(declare-fun m!72971 () Bool)

(assert (=> d!14040 m!72971))

(declare-fun m!72973 () Bool)

(assert (=> d!14040 m!72973))

(assert (=> b!47143 d!14040))

(assert (=> b!47143 d!13982))

(declare-fun b!47397 () Bool)

(declare-fun e!31422 () tuple2!4546)

(assert (=> b!47397 (= e!31422 (tuple2!4547 Nil!542 (_2!2367 lt!73142)))))

(declare-fun b!47399 () Bool)

(declare-fun e!31421 () Bool)

(declare-fun lt!73550 () List!545)

(assert (=> b!47399 (= e!31421 (isEmpty!138 lt!73550))))

(declare-fun b!47400 () Bool)

(assert (=> b!47400 (= e!31421 (> (length!240 lt!73550) 0))))

(declare-fun b!47398 () Bool)

(declare-fun lt!73552 () (_ BitVec 64))

(declare-fun lt!73551 () tuple2!4548)

(assert (=> b!47398 (= e!31422 (tuple2!4547 (Cons!541 (_1!2367 lt!73551) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73551) (bvsub (bvsub (bvsub to!314 i!635) lt!73143) lt!73552))) (_2!2367 lt!73551)))))

(assert (=> b!47398 (= lt!73551 (readBit!0 (_2!2367 lt!73142)))))

(assert (=> b!47398 (= lt!73552 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14042 () Bool)

(assert (=> d!14042 e!31421))

(declare-fun c!3256 () Bool)

(assert (=> d!14042 (= c!3256 (= (bvsub (bvsub to!314 i!635) lt!73143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14042 (= lt!73550 (_1!2366 e!31422))))

(declare-fun c!3255 () Bool)

(assert (=> d!14042 (= c!3255 (= (bvsub (bvsub to!314 i!635) lt!73143) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14042 (bvsge (bvsub (bvsub to!314 i!635) lt!73143) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14042 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73142) (bvsub (bvsub to!314 i!635) lt!73143)) lt!73550)))

(assert (= (and d!14042 c!3255) b!47397))

(assert (= (and d!14042 (not c!3255)) b!47398))

(assert (= (and d!14042 c!3256) b!47399))

(assert (= (and d!14042 (not c!3256)) b!47400))

(declare-fun m!72975 () Bool)

(assert (=> b!47399 m!72975))

(declare-fun m!72977 () Bool)

(assert (=> b!47400 m!72977))

(declare-fun m!72979 () Bool)

(assert (=> b!47398 m!72979))

(declare-fun m!72981 () Bool)

(assert (=> b!47398 m!72981))

(assert (=> b!47168 d!14042))

(declare-fun d!14044 () Bool)

(declare-fun e!31423 () Bool)

(assert (=> d!14044 e!31423))

(declare-fun res!39929 () Bool)

(assert (=> d!14044 (=> (not res!39929) (not e!31423))))

(assert (=> d!14044 (= res!39929 (= (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72381)))) (buf!1387 (_1!2359 lt!72381))))))

(declare-fun lt!73559 () Bool)

(assert (=> d!14044 (= lt!73559 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72381))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73557 () tuple2!4548)

(assert (=> d!14044 (= lt!73557 (tuple2!4549 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72381))))) #b00000000000000000000000000000000)) (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72381)))))))

(assert (=> d!14044 (validate_offset_bit!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_1!2359 lt!72381)))) ((_ sign_extend 32) (currentByte!2892 (_1!2359 lt!72381))) ((_ sign_extend 32) (currentBit!2887 (_1!2359 lt!72381))))))

(assert (=> d!14044 (= (readBit!0 (_1!2359 lt!72381)) lt!73557)))

(declare-fun lt!73553 () (_ BitVec 64))

(declare-fun b!47401 () Bool)

(declare-fun lt!73554 () (_ BitVec 64))

(assert (=> b!47401 (= e!31423 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72381))))) (currentByte!2892 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72381)))) (currentBit!2887 (_2!2360 (increaseBitIndex!0 (_1!2359 lt!72381))))) (bvadd lt!73554 lt!73553)))))

(assert (=> b!47401 (or (not (= (bvand lt!73554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73553 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73554 lt!73553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47401 (= lt!73553 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47401 (= lt!73554 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)) (currentBit!2887 (_1!2359 lt!72381))))))

(declare-fun lt!73555 () Bool)

(assert (=> b!47401 (= lt!73555 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72381))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73558 () Bool)

(assert (=> b!47401 (= lt!73558 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72381))))) #b00000000000000000000000000000000)))))

(declare-fun lt!73556 () Bool)

(assert (=> b!47401 (= lt!73556 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_1!2359 lt!72381))) (currentByte!2892 (_1!2359 lt!72381)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2887 (_1!2359 lt!72381))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14044 res!39929) b!47401))

(declare-fun m!72983 () Bool)

(assert (=> d!14044 m!72983))

(declare-fun m!72985 () Bool)

(assert (=> d!14044 m!72985))

(declare-fun m!72987 () Bool)

(assert (=> d!14044 m!72987))

(declare-fun m!72989 () Bool)

(assert (=> d!14044 m!72989))

(assert (=> b!47401 m!72983))

(declare-fun m!72991 () Bool)

(assert (=> b!47401 m!72991))

(assert (=> b!47401 m!72987))

(declare-fun m!72993 () Bool)

(assert (=> b!47401 m!72993))

(assert (=> b!47401 m!72985))

(assert (=> b!47168 d!14044))

(assert (=> b!47145 d!13944))

(assert (=> b!47145 d!13850))

(declare-fun d!14046 () Bool)

(assert (=> d!14046 (= (length!240 lt!73141) (size!1040 lt!73141))))

(declare-fun bs!3664 () Bool)

(assert (= bs!3664 d!14046))

(declare-fun m!72995 () Bool)

(assert (=> bs!3664 m!72995))

(assert (=> b!47170 d!14046))

(declare-fun d!14048 () Bool)

(assert (=> d!14048 (= (isEmpty!138 lt!73146) (is-Nil!542 lt!73146))))

(assert (=> b!47173 d!14048))

(declare-fun d!14050 () Bool)

(declare-fun res!39932 () Bool)

(declare-fun e!31424 () Bool)

(assert (=> d!14050 (=> (not res!39932) (not e!31424))))

(assert (=> d!14050 (= res!39932 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!73076)))))))

(assert (=> d!14050 (= (isPrefixOf!0 thiss!1379 (_2!2360 lt!73076)) e!31424)))

(declare-fun b!47402 () Bool)

(declare-fun res!39931 () Bool)

(assert (=> b!47402 (=> (not res!39931) (not e!31424))))

(assert (=> b!47402 (= res!39931 (bvsle (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73076))) (currentByte!2892 (_2!2360 lt!73076)) (currentBit!2887 (_2!2360 lt!73076)))))))

(declare-fun b!47403 () Bool)

(declare-fun e!31425 () Bool)

(assert (=> b!47403 (= e!31424 e!31425)))

(declare-fun res!39930 () Bool)

(assert (=> b!47403 (=> res!39930 e!31425)))

(assert (=> b!47403 (= res!39930 (= (size!1038 (buf!1387 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47404 () Bool)

(assert (=> b!47404 (= e!31425 (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 (_2!2360 lt!73076)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (= (and d!14050 res!39932) b!47402))

(assert (= (and b!47402 res!39931) b!47403))

(assert (= (and b!47403 (not res!39930)) b!47404))

(assert (=> b!47402 m!71901))

(assert (=> b!47402 m!72387))

(assert (=> b!47404 m!71901))

(assert (=> b!47404 m!71901))

(declare-fun m!72997 () Bool)

(assert (=> b!47404 m!72997))

(assert (=> b!47141 d!14050))

(declare-fun d!14052 () Bool)

(declare-fun res!39935 () Bool)

(declare-fun e!31426 () Bool)

(assert (=> d!14052 (=> (not res!39935) (not e!31426))))

(assert (=> d!14052 (= res!39935 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!14052 (= (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395)) e!31426)))

(declare-fun b!47405 () Bool)

(declare-fun res!39934 () Bool)

(assert (=> b!47405 (=> (not res!39934) (not e!31426))))

(assert (=> b!47405 (= res!39934 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun b!47406 () Bool)

(declare-fun e!31427 () Bool)

(assert (=> b!47406 (= e!31426 e!31427)))

(declare-fun res!39933 () Bool)

(assert (=> b!47406 (=> res!39933 e!31427)))

(assert (=> b!47406 (= res!39933 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000))))

(declare-fun b!47407 () Bool)

(assert (=> b!47407 (= e!31427 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (= (and d!14052 res!39935) b!47405))

(assert (= (and b!47405 res!39934) b!47406))

(assert (= (and b!47406 (not res!39933)) b!47407))

(assert (=> b!47405 m!71893))

(assert (=> b!47405 m!71893))

(assert (=> b!47407 m!71893))

(assert (=> b!47407 m!71893))

(declare-fun m!72999 () Bool)

(assert (=> b!47407 m!72999))

(assert (=> d!13738 d!14052))

(declare-fun d!14054 () Bool)

(declare-fun res!39938 () Bool)

(declare-fun e!31428 () Bool)

(assert (=> d!14054 (=> (not res!39938) (not e!31428))))

(assert (=> d!14054 (= res!39938 (= (size!1038 (buf!1387 lt!72786)) (size!1038 (buf!1387 lt!72786))))))

(assert (=> d!14054 (= (isPrefixOf!0 lt!72786 lt!72786) e!31428)))

(declare-fun b!47408 () Bool)

(declare-fun res!39937 () Bool)

(assert (=> b!47408 (=> (not res!39937) (not e!31428))))

(assert (=> b!47408 (= res!39937 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!72786)) (currentByte!2892 lt!72786) (currentBit!2887 lt!72786)) (bitIndex!0 (size!1038 (buf!1387 lt!72786)) (currentByte!2892 lt!72786) (currentBit!2887 lt!72786))))))

(declare-fun b!47409 () Bool)

(declare-fun e!31429 () Bool)

(assert (=> b!47409 (= e!31428 e!31429)))

(declare-fun res!39936 () Bool)

(assert (=> b!47409 (=> res!39936 e!31429)))

(assert (=> b!47409 (= res!39936 (= (size!1038 (buf!1387 lt!72786)) #b00000000000000000000000000000000))))

(declare-fun b!47410 () Bool)

(assert (=> b!47410 (= e!31429 (arrayBitRangesEq!0 (buf!1387 lt!72786) (buf!1387 lt!72786) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!72786)) (currentByte!2892 lt!72786) (currentBit!2887 lt!72786))))))

(assert (= (and d!14054 res!39938) b!47408))

(assert (= (and b!47408 res!39937) b!47409))

(assert (= (and b!47409 (not res!39936)) b!47410))

(declare-fun m!73001 () Bool)

(assert (=> b!47408 m!73001))

(assert (=> b!47408 m!73001))

(assert (=> b!47410 m!73001))

(assert (=> b!47410 m!73001))

(declare-fun m!73003 () Bool)

(assert (=> b!47410 m!73003))

(assert (=> d!13738 d!14054))

(declare-fun d!14056 () Bool)

(assert (=> d!14056 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(declare-fun lt!73560 () Unit!3313)

(assert (=> d!14056 (= lt!73560 (choose!11 (_2!2360 lt!72395)))))

(assert (=> d!14056 (= (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)) lt!73560)))

(declare-fun bs!3665 () Bool)

(assert (= bs!3665 d!14056))

(assert (=> bs!3665 m!72193))

(declare-fun m!73005 () Bool)

(assert (=> bs!3665 m!73005))

(assert (=> d!13738 d!14056))

(declare-fun d!14058 () Bool)

(declare-fun res!39941 () Bool)

(declare-fun e!31430 () Bool)

(assert (=> d!14058 (=> (not res!39941) (not e!31430))))

(assert (=> d!14058 (= res!39941 (= (size!1038 (buf!1387 (_1!2359 lt!72785))) (size!1038 (buf!1387 (_2!2359 lt!72785)))))))

(assert (=> d!14058 (= (isPrefixOf!0 (_1!2359 lt!72785) (_2!2359 lt!72785)) e!31430)))

(declare-fun b!47411 () Bool)

(declare-fun res!39940 () Bool)

(assert (=> b!47411 (=> (not res!39940) (not e!31430))))

(assert (=> b!47411 (= res!39940 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72785))) (currentByte!2892 (_1!2359 lt!72785)) (currentBit!2887 (_1!2359 lt!72785))) (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!72785))) (currentByte!2892 (_2!2359 lt!72785)) (currentBit!2887 (_2!2359 lt!72785)))))))

(declare-fun b!47412 () Bool)

(declare-fun e!31431 () Bool)

(assert (=> b!47412 (= e!31430 e!31431)))

(declare-fun res!39939 () Bool)

(assert (=> b!47412 (=> res!39939 e!31431)))

(assert (=> b!47412 (= res!39939 (= (size!1038 (buf!1387 (_1!2359 lt!72785))) #b00000000000000000000000000000000))))

(declare-fun b!47413 () Bool)

(assert (=> b!47413 (= e!31431 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!72785)) (buf!1387 (_2!2359 lt!72785)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!72785))) (currentByte!2892 (_1!2359 lt!72785)) (currentBit!2887 (_1!2359 lt!72785)))))))

(assert (= (and d!14058 res!39941) b!47411))

(assert (= (and b!47411 res!39940) b!47412))

(assert (= (and b!47412 (not res!39939)) b!47413))

(assert (=> b!47411 m!72737))

(assert (=> b!47411 m!72939))

(assert (=> b!47413 m!72737))

(assert (=> b!47413 m!72737))

(declare-fun m!73007 () Bool)

(assert (=> b!47413 m!73007))

(assert (=> d!13738 d!14058))

(declare-fun d!14060 () Bool)

(declare-fun res!39944 () Bool)

(declare-fun e!31432 () Bool)

(assert (=> d!14060 (=> (not res!39944) (not e!31432))))

(assert (=> d!14060 (= res!39944 (= (size!1038 (buf!1387 lt!72786)) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(assert (=> d!14060 (= (isPrefixOf!0 lt!72786 (_2!2360 lt!72395)) e!31432)))

(declare-fun b!47414 () Bool)

(declare-fun res!39943 () Bool)

(assert (=> b!47414 (=> (not res!39943) (not e!31432))))

(assert (=> b!47414 (= res!39943 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!72786)) (currentByte!2892 lt!72786) (currentBit!2887 lt!72786)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(declare-fun b!47415 () Bool)

(declare-fun e!31433 () Bool)

(assert (=> b!47415 (= e!31432 e!31433)))

(declare-fun res!39942 () Bool)

(assert (=> b!47415 (=> res!39942 e!31433)))

(assert (=> b!47415 (= res!39942 (= (size!1038 (buf!1387 lt!72786)) #b00000000000000000000000000000000))))

(declare-fun b!47416 () Bool)

(assert (=> b!47416 (= e!31433 (arrayBitRangesEq!0 (buf!1387 lt!72786) (buf!1387 (_2!2360 lt!72395)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!72786)) (currentByte!2892 lt!72786) (currentBit!2887 lt!72786))))))

(assert (= (and d!14060 res!39944) b!47414))

(assert (= (and b!47414 res!39943) b!47415))

(assert (= (and b!47415 (not res!39942)) b!47416))

(assert (=> b!47414 m!73001))

(assert (=> b!47414 m!71893))

(assert (=> b!47416 m!73001))

(assert (=> b!47416 m!73001))

(declare-fun m!73009 () Bool)

(assert (=> b!47416 m!73009))

(assert (=> d!13738 d!14060))

(declare-fun d!14062 () Bool)

(assert (=> d!14062 (isPrefixOf!0 lt!72786 (_2!2360 lt!72395))))

(declare-fun lt!73561 () Unit!3313)

(assert (=> d!14062 (= lt!73561 (choose!30 lt!72786 (_2!2360 lt!72395) (_2!2360 lt!72395)))))

(assert (=> d!14062 (isPrefixOf!0 lt!72786 (_2!2360 lt!72395))))

(assert (=> d!14062 (= (lemmaIsPrefixTransitive!0 lt!72786 (_2!2360 lt!72395) (_2!2360 lt!72395)) lt!73561)))

(declare-fun bs!3666 () Bool)

(assert (= bs!3666 d!14062))

(assert (=> bs!3666 m!72185))

(declare-fun m!73011 () Bool)

(assert (=> bs!3666 m!73011))

(assert (=> bs!3666 m!72185))

(assert (=> d!13738 d!14062))

(assert (=> d!13738 d!13848))

(assert (=> d!13738 d!13846))

(assert (=> d!13738 d!13824))

(declare-fun d!14064 () Bool)

(assert (=> d!14064 (isPrefixOf!0 lt!72786 (_2!2360 lt!72395))))

(declare-fun lt!73562 () Unit!3313)

(assert (=> d!14064 (= lt!73562 (choose!30 lt!72786 thiss!1379 (_2!2360 lt!72395)))))

(assert (=> d!14064 (isPrefixOf!0 lt!72786 thiss!1379)))

(assert (=> d!14064 (= (lemmaIsPrefixTransitive!0 lt!72786 thiss!1379 (_2!2360 lt!72395)) lt!73562)))

(declare-fun bs!3667 () Bool)

(assert (= bs!3667 d!14064))

(assert (=> bs!3667 m!72185))

(declare-fun m!73013 () Bool)

(assert (=> bs!3667 m!73013))

(declare-fun m!73015 () Bool)

(assert (=> bs!3667 m!73015))

(assert (=> d!13738 d!14064))

(declare-fun d!14066 () Bool)

(assert (=> d!14066 (isPrefixOf!0 lt!72786 lt!72786)))

(declare-fun lt!73563 () Unit!3313)

(assert (=> d!14066 (= lt!73563 (choose!11 lt!72786))))

(assert (=> d!14066 (= (lemmaIsPrefixRefl!0 lt!72786) lt!73563)))

(declare-fun bs!3668 () Bool)

(assert (= bs!3668 d!14066))

(assert (=> bs!3668 m!72189))

(declare-fun m!73017 () Bool)

(assert (=> bs!3668 m!73017))

(assert (=> d!13738 d!14066))

(declare-fun d!14068 () Bool)

(declare-fun e!31434 () Bool)

(assert (=> d!14068 e!31434))

(declare-fun res!39945 () Bool)

(assert (=> d!14068 (=> (not res!39945) (not e!31434))))

(declare-fun lt!73564 () BitStream!1808)

(declare-fun lt!73565 () (_ BitVec 64))

(assert (=> d!14068 (= res!39945 (= (bvadd lt!73565 (bvsub lt!73150 lt!73165)) (bitIndex!0 (size!1038 (buf!1387 lt!73564)) (currentByte!2892 lt!73564) (currentBit!2887 lt!73564))))))

(assert (=> d!14068 (or (not (= (bvand lt!73565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73150 lt!73165) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73565 (bvsub lt!73150 lt!73165)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14068 (= lt!73565 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73163))) (currentByte!2892 (_2!2359 lt!73163)) (currentBit!2887 (_2!2359 lt!73163))))))

(assert (=> d!14068 (= lt!73564 (_2!2360 (moveBitIndex!0 (_2!2359 lt!73163) (bvsub lt!73150 lt!73165))))))

(assert (=> d!14068 (moveBitIndexPrecond!0 (_2!2359 lt!73163) (bvsub lt!73150 lt!73165))))

(assert (=> d!14068 (= (withMovedBitIndex!0 (_2!2359 lt!73163) (bvsub lt!73150 lt!73165)) lt!73564)))

(declare-fun b!47417 () Bool)

(assert (=> b!47417 (= e!31434 (= (size!1038 (buf!1387 (_2!2359 lt!73163))) (size!1038 (buf!1387 lt!73564))))))

(assert (= (and d!14068 res!39945) b!47417))

(declare-fun m!73019 () Bool)

(assert (=> d!14068 m!73019))

(declare-fun m!73021 () Bool)

(assert (=> d!14068 m!73021))

(declare-fun m!73023 () Bool)

(assert (=> d!14068 m!73023))

(declare-fun m!73025 () Bool)

(assert (=> d!14068 m!73025))

(assert (=> b!47177 d!14068))

(assert (=> b!47177 d!13878))

(assert (=> b!47177 d!13844))

(declare-fun b!47418 () Bool)

(declare-fun res!39947 () Bool)

(declare-fun e!31436 () Bool)

(assert (=> b!47418 (=> (not res!39947) (not e!31436))))

(declare-fun lt!73580 () tuple2!4532)

(assert (=> b!47418 (= res!39947 (isPrefixOf!0 (_2!2359 lt!73580) (_2!2360 lt!72922)))))

(declare-fun b!47419 () Bool)

(declare-fun e!31435 () Unit!3313)

(declare-fun lt!73579 () Unit!3313)

(assert (=> b!47419 (= e!31435 lt!73579)))

(declare-fun lt!73584 () (_ BitVec 64))

(assert (=> b!47419 (= lt!73584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73573 () (_ BitVec 64))

(assert (=> b!47419 (= lt!73573 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> b!47419 (= lt!73579 (arrayBitRangesEqSymmetric!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72922)) lt!73584 lt!73573))))

(assert (=> b!47419 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72922)) (buf!1387 (_2!2360 lt!72395)) lt!73584 lt!73573)))

(declare-fun b!47420 () Bool)

(declare-fun lt!73582 () (_ BitVec 64))

(declare-fun lt!73567 () (_ BitVec 64))

(assert (=> b!47420 (= e!31436 (= (_1!2359 lt!73580) (withMovedBitIndex!0 (_2!2359 lt!73580) (bvsub lt!73567 lt!73582))))))

(assert (=> b!47420 (or (= (bvand lt!73567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73567 lt!73582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47420 (= lt!73582 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72922))) (currentByte!2892 (_2!2360 lt!72922)) (currentBit!2887 (_2!2360 lt!72922))))))

(assert (=> b!47420 (= lt!73567 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(declare-fun b!47421 () Bool)

(declare-fun res!39946 () Bool)

(assert (=> b!47421 (=> (not res!39946) (not e!31436))))

(assert (=> b!47421 (= res!39946 (isPrefixOf!0 (_1!2359 lt!73580) (_2!2360 lt!72395)))))

(declare-fun b!47422 () Bool)

(declare-fun Unit!3346 () Unit!3313)

(assert (=> b!47422 (= e!31435 Unit!3346)))

(declare-fun d!14070 () Bool)

(assert (=> d!14070 e!31436))

(declare-fun res!39948 () Bool)

(assert (=> d!14070 (=> (not res!39948) (not e!31436))))

(assert (=> d!14070 (= res!39948 (isPrefixOf!0 (_1!2359 lt!73580) (_2!2359 lt!73580)))))

(declare-fun lt!73581 () BitStream!1808)

(assert (=> d!14070 (= lt!73580 (tuple2!4533 lt!73581 (_2!2360 lt!72922)))))

(declare-fun lt!73577 () Unit!3313)

(declare-fun lt!73574 () Unit!3313)

(assert (=> d!14070 (= lt!73577 lt!73574)))

(assert (=> d!14070 (isPrefixOf!0 lt!73581 (_2!2360 lt!72922))))

(assert (=> d!14070 (= lt!73574 (lemmaIsPrefixTransitive!0 lt!73581 (_2!2360 lt!72922) (_2!2360 lt!72922)))))

(declare-fun lt!73583 () Unit!3313)

(declare-fun lt!73571 () Unit!3313)

(assert (=> d!14070 (= lt!73583 lt!73571)))

(assert (=> d!14070 (isPrefixOf!0 lt!73581 (_2!2360 lt!72922))))

(assert (=> d!14070 (= lt!73571 (lemmaIsPrefixTransitive!0 lt!73581 (_2!2360 lt!72395) (_2!2360 lt!72922)))))

(declare-fun lt!73578 () Unit!3313)

(assert (=> d!14070 (= lt!73578 e!31435)))

(declare-fun c!3257 () Bool)

(assert (=> d!14070 (= c!3257 (not (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000)))))

(declare-fun lt!73575 () Unit!3313)

(declare-fun lt!73566 () Unit!3313)

(assert (=> d!14070 (= lt!73575 lt!73566)))

(assert (=> d!14070 (isPrefixOf!0 (_2!2360 lt!72922) (_2!2360 lt!72922))))

(assert (=> d!14070 (= lt!73566 (lemmaIsPrefixRefl!0 (_2!2360 lt!72922)))))

(declare-fun lt!73568 () Unit!3313)

(declare-fun lt!73572 () Unit!3313)

(assert (=> d!14070 (= lt!73568 lt!73572)))

(assert (=> d!14070 (= lt!73572 (lemmaIsPrefixRefl!0 (_2!2360 lt!72922)))))

(declare-fun lt!73585 () Unit!3313)

(declare-fun lt!73570 () Unit!3313)

(assert (=> d!14070 (= lt!73585 lt!73570)))

(assert (=> d!14070 (isPrefixOf!0 lt!73581 lt!73581)))

(assert (=> d!14070 (= lt!73570 (lemmaIsPrefixRefl!0 lt!73581))))

(declare-fun lt!73569 () Unit!3313)

(declare-fun lt!73576 () Unit!3313)

(assert (=> d!14070 (= lt!73569 lt!73576)))

(assert (=> d!14070 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!14070 (= lt!73576 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(assert (=> d!14070 (= lt!73581 (BitStream!1809 (buf!1387 (_2!2360 lt!72922)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!14070 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72922))))

(assert (=> d!14070 (= (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72922)) lt!73580)))

(assert (= (and d!14070 c!3257) b!47419))

(assert (= (and d!14070 (not c!3257)) b!47422))

(assert (= (and d!14070 res!39948) b!47421))

(assert (= (and b!47421 res!39946) b!47418))

(assert (= (and b!47418 res!39947) b!47420))

(declare-fun m!73027 () Bool)

(assert (=> b!47421 m!73027))

(declare-fun m!73029 () Bool)

(assert (=> b!47420 m!73029))

(assert (=> b!47420 m!72221))

(assert (=> b!47420 m!71893))

(declare-fun m!73031 () Bool)

(assert (=> b!47418 m!73031))

(assert (=> b!47419 m!71893))

(declare-fun m!73033 () Bool)

(assert (=> b!47419 m!73033))

(declare-fun m!73035 () Bool)

(assert (=> b!47419 m!73035))

(declare-fun m!73037 () Bool)

(assert (=> d!14070 m!73037))

(declare-fun m!73039 () Bool)

(assert (=> d!14070 m!73039))

(declare-fun m!73041 () Bool)

(assert (=> d!14070 m!73041))

(assert (=> d!14070 m!72197))

(declare-fun m!73043 () Bool)

(assert (=> d!14070 m!73043))

(declare-fun m!73045 () Bool)

(assert (=> d!14070 m!73045))

(declare-fun m!73047 () Bool)

(assert (=> d!14070 m!73047))

(assert (=> d!14070 m!72223))

(assert (=> d!14070 m!72193))

(declare-fun m!73049 () Bool)

(assert (=> d!14070 m!73049))

(declare-fun m!73051 () Bool)

(assert (=> d!14070 m!73051))

(assert (=> b!47035 d!14070))

(declare-fun b!47423 () Bool)

(declare-fun e!31438 () tuple2!4546)

(assert (=> b!47423 (= e!31438 (tuple2!4547 Nil!542 (_1!2359 lt!72887)))))

(declare-fun b!47425 () Bool)

(declare-fun e!31437 () Bool)

(declare-fun lt!73586 () List!545)

(assert (=> b!47425 (= e!31437 (isEmpty!138 lt!73586))))

(declare-fun b!47426 () Bool)

(assert (=> b!47426 (= e!31437 (> (length!240 lt!73586) 0))))

(declare-fun lt!73588 () (_ BitVec 64))

(declare-fun lt!73587 () tuple2!4548)

(declare-fun b!47424 () Bool)

(assert (=> b!47424 (= e!31438 (tuple2!4547 (Cons!541 (_1!2367 lt!73587) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72922) (_2!2367 lt!73587) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!73588))) (_2!2367 lt!73587)))))

(assert (=> b!47424 (= lt!73587 (readBit!0 (_1!2359 lt!72887)))))

(assert (=> b!47424 (= lt!73588 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14072 () Bool)

(assert (=> d!14072 e!31437))

(declare-fun c!3259 () Bool)

(assert (=> d!14072 (= c!3259 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14072 (= lt!73586 (_1!2366 e!31438))))

(declare-fun c!3258 () Bool)

(assert (=> d!14072 (= c!3258 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14072 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14072 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72922) (_1!2359 lt!72887) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!73586)))

(assert (= (and d!14072 c!3258) b!47423))

(assert (= (and d!14072 (not c!3258)) b!47424))

(assert (= (and d!14072 c!3259) b!47425))

(assert (= (and d!14072 (not c!3259)) b!47426))

(declare-fun m!73053 () Bool)

(assert (=> b!47425 m!73053))

(declare-fun m!73055 () Bool)

(assert (=> b!47426 m!73055))

(declare-fun m!73057 () Bool)

(assert (=> b!47424 m!73057))

(declare-fun m!73059 () Bool)

(assert (=> b!47424 m!73059))

(assert (=> b!47035 d!14072))

(declare-fun d!14074 () Bool)

(assert (=> d!14074 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72909) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72909))))

(declare-fun bs!3669 () Bool)

(assert (= bs!3669 d!14074))

(declare-fun m!73061 () Bool)

(assert (=> bs!3669 m!73061))

(assert (=> b!47035 d!14074))

(declare-fun d!14076 () Bool)

(declare-fun c!3260 () Bool)

(assert (=> d!14076 (= c!3260 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31439 () List!545)

(assert (=> d!14076 (= (byteArrayBitContentToList!0 (_2!2360 lt!72922) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31439)))

(declare-fun b!47427 () Bool)

(assert (=> b!47427 (= e!31439 Nil!542)))

(declare-fun b!47428 () Bool)

(assert (=> b!47428 (= e!31439 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72922) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14076 c!3260) b!47427))

(assert (= (and d!14076 (not c!3260)) b!47428))

(assert (=> b!47428 m!72237))

(declare-fun m!73063 () Bool)

(assert (=> b!47428 m!73063))

(declare-fun m!73065 () Bool)

(assert (=> b!47428 m!73065))

(assert (=> b!47035 d!14076))

(declare-fun d!14078 () Bool)

(assert (=> d!14078 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72909)))

(declare-fun lt!73589 () Unit!3313)

(assert (=> d!14078 (= lt!73589 (choose!9 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72922)) lt!72909 (BitStream!1809 (buf!1387 (_2!2360 lt!72922)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!14078 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72922)) lt!72909) lt!73589)))

(declare-fun bs!3670 () Bool)

(assert (= bs!3670 d!14078))

(assert (=> bs!3670 m!72293))

(declare-fun m!73067 () Bool)

(assert (=> bs!3670 m!73067))

(assert (=> b!47035 d!14078))

(declare-fun d!14080 () Bool)

(declare-fun res!39951 () Bool)

(declare-fun e!31440 () Bool)

(assert (=> d!14080 (=> (not res!39951) (not e!31440))))

(assert (=> d!14080 (= res!39951 (= (size!1038 (buf!1387 (_2!2359 lt!73163))) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!14080 (= (isPrefixOf!0 (_2!2359 lt!73163) (_2!2360 lt!72389)) e!31440)))

(declare-fun b!47429 () Bool)

(declare-fun res!39950 () Bool)

(assert (=> b!47429 (=> (not res!39950) (not e!31440))))

(assert (=> b!47429 (= res!39950 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73163))) (currentByte!2892 (_2!2359 lt!73163)) (currentBit!2887 (_2!2359 lt!73163))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47430 () Bool)

(declare-fun e!31441 () Bool)

(assert (=> b!47430 (= e!31440 e!31441)))

(declare-fun res!39949 () Bool)

(assert (=> b!47430 (=> res!39949 e!31441)))

(assert (=> b!47430 (= res!39949 (= (size!1038 (buf!1387 (_2!2359 lt!73163))) #b00000000000000000000000000000000))))

(declare-fun b!47431 () Bool)

(assert (=> b!47431 (= e!31441 (arrayBitRangesEq!0 (buf!1387 (_2!2359 lt!73163)) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73163))) (currentByte!2892 (_2!2359 lt!73163)) (currentBit!2887 (_2!2359 lt!73163)))))))

(assert (= (and d!14080 res!39951) b!47429))

(assert (= (and b!47429 res!39950) b!47430))

(assert (= (and b!47430 (not res!39949)) b!47431))

(assert (=> b!47429 m!73021))

(assert (=> b!47429 m!71895))

(assert (=> b!47431 m!73021))

(assert (=> b!47431 m!73021))

(declare-fun m!73069 () Bool)

(assert (=> b!47431 m!73069))

(assert (=> b!47175 d!14080))

(declare-fun b!47432 () Bool)

(declare-fun e!31443 () tuple2!4546)

(assert (=> b!47432 (= e!31443 (tuple2!4547 Nil!542 (_1!2359 lt!72388)))))

(declare-fun b!47434 () Bool)

(declare-fun e!31442 () Bool)

(declare-fun lt!73590 () List!545)

(assert (=> b!47434 (= e!31442 (isEmpty!138 lt!73590))))

(declare-fun b!47435 () Bool)

(assert (=> b!47435 (= e!31442 (> (length!240 lt!73590) 0))))

(declare-fun lt!73592 () (_ BitVec 64))

(declare-fun b!47433 () Bool)

(declare-fun lt!73591 () tuple2!4548)

(assert (=> b!47433 (= e!31443 (tuple2!4547 (Cons!541 (_1!2367 lt!73591) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_2!2367 lt!73591) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73592))) (_2!2367 lt!73591)))))

(assert (=> b!47433 (= lt!73591 (readBit!0 (_1!2359 lt!72388)))))

(assert (=> b!47433 (= lt!73592 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14082 () Bool)

(assert (=> d!14082 e!31442))

(declare-fun c!3262 () Bool)

(assert (=> d!14082 (= c!3262 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14082 (= lt!73590 (_1!2366 e!31443))))

(declare-fun c!3261 () Bool)

(assert (=> d!14082 (= c!3261 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14082 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14082 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72389) (_1!2359 lt!72388) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!73590)))

(assert (= (and d!14082 c!3261) b!47432))

(assert (= (and d!14082 (not c!3261)) b!47433))

(assert (= (and d!14082 c!3262) b!47434))

(assert (= (and d!14082 (not c!3262)) b!47435))

(declare-fun m!73071 () Bool)

(assert (=> b!47434 m!73071))

(declare-fun m!73073 () Bool)

(assert (=> b!47435 m!73073))

(declare-fun m!73075 () Bool)

(assert (=> b!47433 m!73075))

(assert (=> b!47433 m!72463))

(assert (=> b!47150 d!14082))

(assert (=> b!47150 d!13834))

(declare-fun b!47436 () Bool)

(declare-fun res!39954 () Bool)

(declare-fun lt!73594 () (_ BitVec 32))

(assert (=> b!47436 (= res!39954 (= lt!73594 #b00000000000000000000000000000000))))

(declare-fun e!31448 () Bool)

(assert (=> b!47436 (=> res!39954 e!31448)))

(declare-fun e!31445 () Bool)

(assert (=> b!47436 (= e!31445 e!31448)))

(declare-fun b!47437 () Bool)

(declare-fun e!31444 () Bool)

(declare-fun e!31447 () Bool)

(assert (=> b!47437 (= e!31444 e!31447)))

(declare-fun res!39953 () Bool)

(assert (=> b!47437 (=> (not res!39953) (not e!31447))))

(declare-fun e!31446 () Bool)

(assert (=> b!47437 (= res!39953 e!31446)))

(declare-fun res!39952 () Bool)

(assert (=> b!47437 (=> res!39952 e!31446)))

(declare-fun lt!73595 () tuple4!14)

(assert (=> b!47437 (= res!39952 (bvsge (_1!2373 lt!73595) (_2!2373 lt!73595)))))

(assert (=> b!47437 (= lt!73594 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!73593 () (_ BitVec 32))

(assert (=> b!47437 (= lt!73593 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47437 (= lt!73595 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(declare-fun d!14084 () Bool)

(declare-fun res!39955 () Bool)

(assert (=> d!14084 (=> res!39955 e!31444)))

(assert (=> d!14084 (= res!39955 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))))))

(assert (=> d!14084 (= (arrayBitRangesEq!0 (buf!1387 thiss!1379) (buf!1387 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379))) e!31444)))

(declare-fun b!47438 () Bool)

(declare-fun e!31449 () Bool)

(assert (=> b!47438 (= e!31447 e!31449)))

(declare-fun c!3263 () Bool)

(assert (=> b!47438 (= c!3263 (= (_3!93 lt!73595) (_4!7 lt!73595)))))

(declare-fun b!47439 () Bool)

(declare-fun call!580 () Bool)

(assert (=> b!47439 (= e!31448 call!580)))

(declare-fun bm!577 () Bool)

(assert (=> bm!577 (= call!580 (byteRangesEq!0 (ite c!3263 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73595)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73595))) (ite c!3263 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73595)) (select (arr!1558 (buf!1387 thiss!1379)) (_4!7 lt!73595))) (ite c!3263 lt!73593 #b00000000000000000000000000000000) lt!73594))))

(declare-fun b!47440 () Bool)

(assert (=> b!47440 (= e!31449 e!31445)))

(declare-fun res!39956 () Bool)

(assert (=> b!47440 (= res!39956 (byteRangesEq!0 (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73595)) (select (arr!1558 (buf!1387 thiss!1379)) (_3!93 lt!73595)) lt!73593 #b00000000000000000000000000001000))))

(assert (=> b!47440 (=> (not res!39956) (not e!31445))))

(declare-fun b!47441 () Bool)

(assert (=> b!47441 (= e!31449 call!580)))

(declare-fun b!47442 () Bool)

(assert (=> b!47442 (= e!31446 (arrayRangesEq!8 (buf!1387 thiss!1379) (buf!1387 thiss!1379) (_1!2373 lt!73595) (_2!2373 lt!73595)))))

(assert (= (and d!14084 (not res!39955)) b!47437))

(assert (= (and b!47437 (not res!39952)) b!47442))

(assert (= (and b!47437 res!39953) b!47438))

(assert (= (and b!47438 c!3263) b!47441))

(assert (= (and b!47438 (not c!3263)) b!47440))

(assert (= (and b!47440 res!39956) b!47436))

(assert (= (and b!47436 (not res!39954)) b!47439))

(assert (= (or b!47441 b!47439) bm!577))

(assert (=> b!47437 m!71901))

(assert (=> b!47437 m!72697))

(declare-fun m!73077 () Bool)

(assert (=> bm!577 m!73077))

(declare-fun m!73079 () Bool)

(assert (=> bm!577 m!73079))

(assert (=> bm!577 m!73077))

(declare-fun m!73081 () Bool)

(assert (=> bm!577 m!73081))

(assert (=> bm!577 m!73081))

(assert (=> b!47440 m!73081))

(assert (=> b!47440 m!73081))

(assert (=> b!47440 m!73081))

(assert (=> b!47440 m!73081))

(declare-fun m!73083 () Bool)

(assert (=> b!47440 m!73083))

(declare-fun m!73085 () Bool)

(assert (=> b!47442 m!73085))

(assert (=> b!47159 d!14084))

(assert (=> b!47159 d!13850))

(declare-fun d!14086 () Bool)

(assert (=> d!14086 (= (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72389)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 thiss!1379)))))))

(assert (=> d!13864 d!14086))

(assert (=> b!47157 d!13850))

(declare-fun d!14088 () Bool)

(declare-fun e!31450 () Bool)

(assert (=> d!14088 e!31450))

(declare-fun res!39958 () Bool)

(assert (=> d!14088 (=> (not res!39958) (not e!31450))))

(declare-fun lt!73598 () (_ BitVec 64))

(declare-fun lt!73599 () (_ BitVec 64))

(declare-fun lt!73601 () (_ BitVec 64))

(assert (=> d!14088 (= res!39958 (= lt!73599 (bvsub lt!73598 lt!73601)))))

(assert (=> d!14088 (or (= (bvand lt!73598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73598 lt!73601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14088 (= lt!73601 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72922))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72922)))))))

(declare-fun lt!73600 () (_ BitVec 64))

(declare-fun lt!73596 () (_ BitVec 64))

(assert (=> d!14088 (= lt!73598 (bvmul lt!73600 lt!73596))))

(assert (=> d!14088 (or (= lt!73600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73596 (bvsdiv (bvmul lt!73600 lt!73596) lt!73600)))))

(assert (=> d!14088 (= lt!73596 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14088 (= lt!73600 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))))))

(assert (=> d!14088 (= lt!73599 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72922))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72922)))))))

(assert (=> d!14088 (invariant!0 (currentBit!2887 (_2!2360 lt!72922)) (currentByte!2892 (_2!2360 lt!72922)) (size!1038 (buf!1387 (_2!2360 lt!72922))))))

(assert (=> d!14088 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72922))) (currentByte!2892 (_2!2360 lt!72922)) (currentBit!2887 (_2!2360 lt!72922))) lt!73599)))

(declare-fun b!47443 () Bool)

(declare-fun res!39957 () Bool)

(assert (=> b!47443 (=> (not res!39957) (not e!31450))))

(assert (=> b!47443 (= res!39957 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73599))))

(declare-fun b!47444 () Bool)

(declare-fun lt!73597 () (_ BitVec 64))

(assert (=> b!47444 (= e!31450 (bvsle lt!73599 (bvmul lt!73597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47444 (or (= lt!73597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73597)))))

(assert (=> b!47444 (= lt!73597 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72922)))))))

(assert (= (and d!14088 res!39958) b!47443))

(assert (= (and b!47443 res!39957) b!47444))

(declare-fun m!73087 () Bool)

(assert (=> d!14088 m!73087))

(assert (=> d!14088 m!72287))

(assert (=> d!13760 d!14088))

(assert (=> d!13760 d!13844))

(assert (=> d!13760 d!14052))

(assert (=> d!13760 d!14056))

(declare-fun d!14090 () Bool)

(declare-fun res!39961 () Bool)

(declare-fun e!31451 () Bool)

(assert (=> d!14090 (=> (not res!39961) (not e!31451))))

(assert (=> d!14090 (= res!39961 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72922)))))))

(assert (=> d!14090 (= (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72922)) e!31451)))

(declare-fun b!47445 () Bool)

(declare-fun res!39960 () Bool)

(assert (=> b!47445 (=> (not res!39960) (not e!31451))))

(assert (=> b!47445 (= res!39960 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72922))) (currentByte!2892 (_2!2360 lt!72922)) (currentBit!2887 (_2!2360 lt!72922)))))))

(declare-fun b!47446 () Bool)

(declare-fun e!31452 () Bool)

(assert (=> b!47446 (= e!31451 e!31452)))

(declare-fun res!39959 () Bool)

(assert (=> b!47446 (=> res!39959 e!31452)))

(assert (=> b!47446 (= res!39959 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000))))

(declare-fun b!47447 () Bool)

(assert (=> b!47447 (= e!31452 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72922)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (= (and d!14090 res!39961) b!47445))

(assert (= (and b!47445 res!39960) b!47446))

(assert (= (and b!47446 (not res!39959)) b!47447))

(assert (=> b!47445 m!71893))

(assert (=> b!47445 m!72221))

(assert (=> b!47447 m!71893))

(assert (=> b!47447 m!71893))

(declare-fun m!73089 () Bool)

(assert (=> b!47447 m!73089))

(assert (=> b!47033 d!14090))

(declare-fun d!14092 () Bool)

(assert (=> d!14092 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72921) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72921))))

(declare-fun bs!3671 () Bool)

(assert (= bs!3671 d!14092))

(declare-fun m!73091 () Bool)

(assert (=> bs!3671 m!73091))

(assert (=> b!47030 d!14092))

(declare-fun d!14094 () Bool)

(declare-fun c!3264 () Bool)

(assert (=> d!14094 (= c!3264 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31453 () List!545)

(assert (=> d!14094 (= (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!31453)))

(declare-fun b!47448 () Bool)

(assert (=> b!47448 (= e!31453 Nil!542)))

(declare-fun b!47449 () Bool)

(assert (=> b!47449 (= e!31453 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14094 c!3264) b!47448))

(assert (= (and d!14094 (not c!3264)) b!47449))

(declare-fun m!73093 () Bool)

(assert (=> b!47449 m!73093))

(declare-fun m!73095 () Bool)

(assert (=> b!47449 m!73095))

(declare-fun m!73097 () Bool)

(assert (=> b!47449 m!73097))

(assert (=> b!47030 d!14094))

(declare-fun d!14096 () Bool)

(assert (=> d!14096 (= (bitAt!0 (buf!1387 (_2!2360 lt!72928)) lt!72908) (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_2!2360 lt!72928))) ((_ extract 31 0) (bvsdiv lt!72908 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72908 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3672 () Bool)

(assert (= bs!3672 d!14096))

(declare-fun m!73099 () Bool)

(assert (=> bs!3672 m!73099))

(declare-fun m!73101 () Bool)

(assert (=> bs!3672 m!73101))

(assert (=> b!47030 d!14096))

(declare-fun b!47450 () Bool)

(declare-fun e!31455 () tuple2!4546)

(assert (=> b!47450 (= e!31455 (tuple2!4547 Nil!542 (_1!2359 lt!72913)))))

(declare-fun b!47452 () Bool)

(declare-fun e!31454 () Bool)

(declare-fun lt!73602 () List!545)

(assert (=> b!47452 (= e!31454 (isEmpty!138 lt!73602))))

(declare-fun b!47453 () Bool)

(assert (=> b!47453 (= e!31454 (> (length!240 lt!73602) 0))))

(declare-fun lt!73604 () (_ BitVec 64))

(declare-fun b!47451 () Bool)

(declare-fun lt!73603 () tuple2!4548)

(assert (=> b!47451 (= e!31455 (tuple2!4547 (Cons!541 (_1!2367 lt!73603) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_2!2367 lt!73603) (bvsub (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001) lt!73604))) (_2!2367 lt!73603)))))

(assert (=> b!47451 (= lt!73603 (readBit!0 (_1!2359 lt!72913)))))

(assert (=> b!47451 (= lt!73604 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14098 () Bool)

(assert (=> d!14098 e!31454))

(declare-fun c!3266 () Bool)

(assert (=> d!14098 (= c!3266 (= (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14098 (= lt!73602 (_1!2366 e!31455))))

(declare-fun c!3265 () Bool)

(assert (=> d!14098 (= c!3265 (= (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14098 (bvsge (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14098 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72913) (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!73602)))

(assert (= (and d!14098 c!3265) b!47450))

(assert (= (and d!14098 (not c!3265)) b!47451))

(assert (= (and d!14098 c!3266) b!47452))

(assert (= (and d!14098 (not c!3266)) b!47453))

(declare-fun m!73103 () Bool)

(assert (=> b!47452 m!73103))

(declare-fun m!73105 () Bool)

(assert (=> b!47453 m!73105))

(declare-fun m!73107 () Bool)

(assert (=> b!47451 m!73107))

(declare-fun m!73109 () Bool)

(assert (=> b!47451 m!73109))

(assert (=> b!47030 d!14098))

(declare-fun d!14100 () Bool)

(declare-fun c!3267 () Bool)

(assert (=> d!14100 (= c!3267 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31456 () List!545)

(assert (=> d!14100 (= (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31456)))

(declare-fun b!47454 () Bool)

(assert (=> b!47454 (= e!31456 Nil!542)))

(declare-fun b!47455 () Bool)

(assert (=> b!47455 (= e!31456 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14100 c!3267) b!47454))

(assert (= (and d!14100 (not c!3267)) b!47455))

(assert (=> b!47455 m!72237))

(assert (=> b!47455 m!73063))

(assert (=> b!47455 m!72253))

(assert (=> b!47030 d!14100))

(declare-fun d!14102 () Bool)

(declare-fun e!31457 () Bool)

(assert (=> d!14102 e!31457))

(declare-fun res!39962 () Bool)

(assert (=> d!14102 (=> (not res!39962) (not e!31457))))

(assert (=> d!14102 (= res!39962 (or (= (bvand lt!72889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72889 lt!72900) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!73605 () Unit!3313)

(assert (=> d!14102 (= lt!73605 (choose!27 (_2!2360 lt!72395) (_2!2360 lt!72928) lt!72889 lt!72900))))

(assert (=> d!14102 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72900) (bvsle lt!72900 lt!72889))))

(assert (=> d!14102 (= (validateOffsetBitsIneqLemma!0 (_2!2360 lt!72395) (_2!2360 lt!72928) lt!72889 lt!72900) lt!73605)))

(declare-fun b!47456 () Bool)

(assert (=> b!47456 (= e!31457 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) (bvsub lt!72889 lt!72900)))))

(assert (= (and d!14102 res!39962) b!47456))

(declare-fun m!73111 () Bool)

(assert (=> d!14102 m!73111))

(assert (=> b!47456 m!72251))

(assert (=> b!47030 d!14102))

(declare-fun b!47457 () Bool)

(declare-fun res!39964 () Bool)

(declare-fun e!31459 () Bool)

(assert (=> b!47457 (=> (not res!39964) (not e!31459))))

(declare-fun lt!73620 () tuple2!4532)

(assert (=> b!47457 (= res!39964 (isPrefixOf!0 (_2!2359 lt!73620) (_2!2360 lt!72896)))))

(declare-fun b!47458 () Bool)

(declare-fun e!31458 () Unit!3313)

(declare-fun lt!73619 () Unit!3313)

(assert (=> b!47458 (= e!31458 lt!73619)))

(declare-fun lt!73624 () (_ BitVec 64))

(assert (=> b!47458 (= lt!73624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73613 () (_ BitVec 64))

(assert (=> b!47458 (= lt!73613 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> b!47458 (= lt!73619 (arrayBitRangesEqSymmetric!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72896)) lt!73624 lt!73613))))

(assert (=> b!47458 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72896)) (buf!1387 (_2!2360 lt!72395)) lt!73624 lt!73613)))

(declare-fun lt!73622 () (_ BitVec 64))

(declare-fun b!47459 () Bool)

(declare-fun lt!73607 () (_ BitVec 64))

(assert (=> b!47459 (= e!31459 (= (_1!2359 lt!73620) (withMovedBitIndex!0 (_2!2359 lt!73620) (bvsub lt!73607 lt!73622))))))

(assert (=> b!47459 (or (= (bvand lt!73607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73622 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73607 lt!73622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47459 (= lt!73622 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72896))) (currentByte!2892 (_2!2360 lt!72896)) (currentBit!2887 (_2!2360 lt!72896))))))

(assert (=> b!47459 (= lt!73607 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(declare-fun b!47460 () Bool)

(declare-fun res!39963 () Bool)

(assert (=> b!47460 (=> (not res!39963) (not e!31459))))

(assert (=> b!47460 (= res!39963 (isPrefixOf!0 (_1!2359 lt!73620) (_2!2360 lt!72395)))))

(declare-fun b!47461 () Bool)

(declare-fun Unit!3347 () Unit!3313)

(assert (=> b!47461 (= e!31458 Unit!3347)))

(declare-fun d!14104 () Bool)

(assert (=> d!14104 e!31459))

(declare-fun res!39965 () Bool)

(assert (=> d!14104 (=> (not res!39965) (not e!31459))))

(assert (=> d!14104 (= res!39965 (isPrefixOf!0 (_1!2359 lt!73620) (_2!2359 lt!73620)))))

(declare-fun lt!73621 () BitStream!1808)

(assert (=> d!14104 (= lt!73620 (tuple2!4533 lt!73621 (_2!2360 lt!72896)))))

(declare-fun lt!73617 () Unit!3313)

(declare-fun lt!73614 () Unit!3313)

(assert (=> d!14104 (= lt!73617 lt!73614)))

(assert (=> d!14104 (isPrefixOf!0 lt!73621 (_2!2360 lt!72896))))

(assert (=> d!14104 (= lt!73614 (lemmaIsPrefixTransitive!0 lt!73621 (_2!2360 lt!72896) (_2!2360 lt!72896)))))

(declare-fun lt!73623 () Unit!3313)

(declare-fun lt!73611 () Unit!3313)

(assert (=> d!14104 (= lt!73623 lt!73611)))

(assert (=> d!14104 (isPrefixOf!0 lt!73621 (_2!2360 lt!72896))))

(assert (=> d!14104 (= lt!73611 (lemmaIsPrefixTransitive!0 lt!73621 (_2!2360 lt!72395) (_2!2360 lt!72896)))))

(declare-fun lt!73618 () Unit!3313)

(assert (=> d!14104 (= lt!73618 e!31458)))

(declare-fun c!3268 () Bool)

(assert (=> d!14104 (= c!3268 (not (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000)))))

(declare-fun lt!73615 () Unit!3313)

(declare-fun lt!73606 () Unit!3313)

(assert (=> d!14104 (= lt!73615 lt!73606)))

(assert (=> d!14104 (isPrefixOf!0 (_2!2360 lt!72896) (_2!2360 lt!72896))))

(assert (=> d!14104 (= lt!73606 (lemmaIsPrefixRefl!0 (_2!2360 lt!72896)))))

(declare-fun lt!73608 () Unit!3313)

(declare-fun lt!73612 () Unit!3313)

(assert (=> d!14104 (= lt!73608 lt!73612)))

(assert (=> d!14104 (= lt!73612 (lemmaIsPrefixRefl!0 (_2!2360 lt!72896)))))

(declare-fun lt!73625 () Unit!3313)

(declare-fun lt!73610 () Unit!3313)

(assert (=> d!14104 (= lt!73625 lt!73610)))

(assert (=> d!14104 (isPrefixOf!0 lt!73621 lt!73621)))

(assert (=> d!14104 (= lt!73610 (lemmaIsPrefixRefl!0 lt!73621))))

(declare-fun lt!73609 () Unit!3313)

(declare-fun lt!73616 () Unit!3313)

(assert (=> d!14104 (= lt!73609 lt!73616)))

(assert (=> d!14104 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!14104 (= lt!73616 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(assert (=> d!14104 (= lt!73621 (BitStream!1809 (buf!1387 (_2!2360 lt!72896)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!14104 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72896))))

(assert (=> d!14104 (= (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72896)) lt!73620)))

(assert (= (and d!14104 c!3268) b!47458))

(assert (= (and d!14104 (not c!3268)) b!47461))

(assert (= (and d!14104 res!39965) b!47460))

(assert (= (and b!47460 res!39963) b!47457))

(assert (= (and b!47457 res!39964) b!47459))

(declare-fun m!73113 () Bool)

(assert (=> b!47460 m!73113))

(declare-fun m!73115 () Bool)

(assert (=> b!47459 m!73115))

(assert (=> b!47459 m!72231))

(assert (=> b!47459 m!71893))

(declare-fun m!73117 () Bool)

(assert (=> b!47457 m!73117))

(assert (=> b!47458 m!71893))

(declare-fun m!73119 () Bool)

(assert (=> b!47458 m!73119))

(declare-fun m!73121 () Bool)

(assert (=> b!47458 m!73121))

(declare-fun m!73123 () Bool)

(assert (=> d!14104 m!73123))

(declare-fun m!73125 () Bool)

(assert (=> d!14104 m!73125))

(declare-fun m!73127 () Bool)

(assert (=> d!14104 m!73127))

(assert (=> d!14104 m!72197))

(declare-fun m!73129 () Bool)

(assert (=> d!14104 m!73129))

(declare-fun m!73131 () Bool)

(assert (=> d!14104 m!73131))

(declare-fun m!73133 () Bool)

(assert (=> d!14104 m!73133))

(assert (=> d!14104 m!72233))

(assert (=> d!14104 m!72193))

(declare-fun m!73135 () Bool)

(assert (=> d!14104 m!73135))

(declare-fun m!73137 () Bool)

(assert (=> d!14104 m!73137))

(assert (=> b!47030 d!14104))

(declare-fun d!14106 () Bool)

(assert (=> d!14106 (= (bitAt!0 (buf!1387 (_2!2360 lt!72896)) lt!72908) (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (buf!1387 (_2!2360 lt!72896))) ((_ extract 31 0) (bvsdiv lt!72908 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72908 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3673 () Bool)

(assert (= bs!3673 d!14106))

(declare-fun m!73139 () Bool)

(assert (=> bs!3673 m!73139))

(assert (=> bs!3673 m!73101))

(assert (=> b!47030 d!14106))

(declare-fun d!14108 () Bool)

(assert (=> d!14108 (= (head!364 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72928) (_1!2359 lt!72905) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!660 (bitStreamReadBitsIntoList!0 (_2!2360 lt!72928) (_1!2359 lt!72905) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47030 d!14108))

(declare-fun d!14110 () Bool)

(assert (=> d!14110 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!72916)))

(declare-fun lt!73626 () Unit!3313)

(assert (=> d!14110 (= lt!73626 (choose!9 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!72896)) lt!72916 (BitStream!1809 (buf!1387 (_2!2360 lt!72896)) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928)))))))

(assert (=> d!14110 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!72896)) lt!72916) lt!73626)))

(declare-fun bs!3674 () Bool)

(assert (= bs!3674 d!14110))

(assert (=> bs!3674 m!72229))

(declare-fun m!73141 () Bool)

(assert (=> bs!3674 m!73141))

(assert (=> b!47030 d!14110))

(declare-fun b!47462 () Bool)

(declare-fun res!39967 () Bool)

(declare-fun e!31461 () Bool)

(assert (=> b!47462 (=> (not res!39967) (not e!31461))))

(declare-fun lt!73641 () tuple2!4532)

(assert (=> b!47462 (= res!39967 (isPrefixOf!0 (_2!2359 lt!73641) (_2!2360 lt!72928)))))

(declare-fun b!47463 () Bool)

(declare-fun e!31460 () Unit!3313)

(declare-fun lt!73640 () Unit!3313)

(assert (=> b!47463 (= e!31460 lt!73640)))

(declare-fun lt!73645 () (_ BitVec 64))

(assert (=> b!47463 (= lt!73645 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!73634 () (_ BitVec 64))

(assert (=> b!47463 (= lt!73634 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> b!47463 (= lt!73640 (arrayBitRangesEqSymmetric!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72928)) lt!73645 lt!73634))))

(assert (=> b!47463 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72928)) (buf!1387 (_2!2360 lt!72395)) lt!73645 lt!73634)))

(declare-fun lt!73628 () (_ BitVec 64))

(declare-fun b!47464 () Bool)

(declare-fun lt!73643 () (_ BitVec 64))

(assert (=> b!47464 (= e!31461 (= (_1!2359 lt!73641) (withMovedBitIndex!0 (_2!2359 lt!73641) (bvsub lt!73628 lt!73643))))))

(assert (=> b!47464 (or (= (bvand lt!73628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73643 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73628 lt!73643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47464 (= lt!73643 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))))))

(assert (=> b!47464 (= lt!73628 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(declare-fun b!47465 () Bool)

(declare-fun res!39966 () Bool)

(assert (=> b!47465 (=> (not res!39966) (not e!31461))))

(assert (=> b!47465 (= res!39966 (isPrefixOf!0 (_1!2359 lt!73641) (_2!2360 lt!72395)))))

(declare-fun b!47466 () Bool)

(declare-fun Unit!3348 () Unit!3313)

(assert (=> b!47466 (= e!31460 Unit!3348)))

(declare-fun d!14112 () Bool)

(assert (=> d!14112 e!31461))

(declare-fun res!39968 () Bool)

(assert (=> d!14112 (=> (not res!39968) (not e!31461))))

(assert (=> d!14112 (= res!39968 (isPrefixOf!0 (_1!2359 lt!73641) (_2!2359 lt!73641)))))

(declare-fun lt!73642 () BitStream!1808)

(assert (=> d!14112 (= lt!73641 (tuple2!4533 lt!73642 (_2!2360 lt!72928)))))

(declare-fun lt!73638 () Unit!3313)

(declare-fun lt!73635 () Unit!3313)

(assert (=> d!14112 (= lt!73638 lt!73635)))

(assert (=> d!14112 (isPrefixOf!0 lt!73642 (_2!2360 lt!72928))))

(assert (=> d!14112 (= lt!73635 (lemmaIsPrefixTransitive!0 lt!73642 (_2!2360 lt!72928) (_2!2360 lt!72928)))))

(declare-fun lt!73644 () Unit!3313)

(declare-fun lt!73632 () Unit!3313)

(assert (=> d!14112 (= lt!73644 lt!73632)))

(assert (=> d!14112 (isPrefixOf!0 lt!73642 (_2!2360 lt!72928))))

(assert (=> d!14112 (= lt!73632 (lemmaIsPrefixTransitive!0 lt!73642 (_2!2360 lt!72395) (_2!2360 lt!72928)))))

(declare-fun lt!73639 () Unit!3313)

(assert (=> d!14112 (= lt!73639 e!31460)))

(declare-fun c!3269 () Bool)

(assert (=> d!14112 (= c!3269 (not (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000)))))

(declare-fun lt!73636 () Unit!3313)

(declare-fun lt!73627 () Unit!3313)

(assert (=> d!14112 (= lt!73636 lt!73627)))

(assert (=> d!14112 (isPrefixOf!0 (_2!2360 lt!72928) (_2!2360 lt!72928))))

(assert (=> d!14112 (= lt!73627 (lemmaIsPrefixRefl!0 (_2!2360 lt!72928)))))

(declare-fun lt!73629 () Unit!3313)

(declare-fun lt!73633 () Unit!3313)

(assert (=> d!14112 (= lt!73629 lt!73633)))

(assert (=> d!14112 (= lt!73633 (lemmaIsPrefixRefl!0 (_2!2360 lt!72928)))))

(declare-fun lt!73646 () Unit!3313)

(declare-fun lt!73631 () Unit!3313)

(assert (=> d!14112 (= lt!73646 lt!73631)))

(assert (=> d!14112 (isPrefixOf!0 lt!73642 lt!73642)))

(assert (=> d!14112 (= lt!73631 (lemmaIsPrefixRefl!0 lt!73642))))

(declare-fun lt!73630 () Unit!3313)

(declare-fun lt!73637 () Unit!3313)

(assert (=> d!14112 (= lt!73630 lt!73637)))

(assert (=> d!14112 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72395))))

(assert (=> d!14112 (= lt!73637 (lemmaIsPrefixRefl!0 (_2!2360 lt!72395)))))

(assert (=> d!14112 (= lt!73642 (BitStream!1809 (buf!1387 (_2!2360 lt!72928)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(assert (=> d!14112 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72928))))

(assert (=> d!14112 (= (reader!0 (_2!2360 lt!72395) (_2!2360 lt!72928)) lt!73641)))

(assert (= (and d!14112 c!3269) b!47463))

(assert (= (and d!14112 (not c!3269)) b!47466))

(assert (= (and d!14112 res!39968) b!47465))

(assert (= (and b!47465 res!39966) b!47462))

(assert (= (and b!47462 res!39967) b!47464))

(declare-fun m!73143 () Bool)

(assert (=> b!47465 m!73143))

(declare-fun m!73145 () Bool)

(assert (=> b!47464 m!73145))

(assert (=> b!47464 m!72257))

(assert (=> b!47464 m!71893))

(declare-fun m!73147 () Bool)

(assert (=> b!47462 m!73147))

(assert (=> b!47463 m!71893))

(declare-fun m!73149 () Bool)

(assert (=> b!47463 m!73149))

(declare-fun m!73151 () Bool)

(assert (=> b!47463 m!73151))

(declare-fun m!73153 () Bool)

(assert (=> d!14112 m!73153))

(declare-fun m!73155 () Bool)

(assert (=> d!14112 m!73155))

(declare-fun m!73157 () Bool)

(assert (=> d!14112 m!73157))

(assert (=> d!14112 m!72197))

(declare-fun m!73159 () Bool)

(assert (=> d!14112 m!73159))

(declare-fun m!73161 () Bool)

(assert (=> d!14112 m!73161))

(declare-fun m!73163 () Bool)

(assert (=> d!14112 m!73163))

(declare-fun m!73165 () Bool)

(assert (=> d!14112 m!73165))

(assert (=> d!14112 m!72193))

(declare-fun m!73167 () Bool)

(assert (=> d!14112 m!73167))

(declare-fun m!73169 () Bool)

(assert (=> d!14112 m!73169))

(assert (=> b!47030 d!14112))

(declare-fun d!14114 () Bool)

(declare-fun e!31462 () Bool)

(assert (=> d!14114 e!31462))

(declare-fun res!39970 () Bool)

(assert (=> d!14114 (=> (not res!39970) (not e!31462))))

(declare-fun lt!73652 () (_ BitVec 64))

(declare-fun lt!73649 () (_ BitVec 64))

(declare-fun lt!73650 () (_ BitVec 64))

(assert (=> d!14114 (= res!39970 (= lt!73650 (bvsub lt!73649 lt!73652)))))

(assert (=> d!14114 (or (= (bvand lt!73649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73649 lt!73652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14114 (= lt!73652 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72896))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72896)))))))

(declare-fun lt!73651 () (_ BitVec 64))

(declare-fun lt!73647 () (_ BitVec 64))

(assert (=> d!14114 (= lt!73649 (bvmul lt!73651 lt!73647))))

(assert (=> d!14114 (or (= lt!73651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73647 (bvsdiv (bvmul lt!73651 lt!73647) lt!73651)))))

(assert (=> d!14114 (= lt!73647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14114 (= lt!73651 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))))))

(assert (=> d!14114 (= lt!73650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72896))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72896)))))))

(assert (=> d!14114 (invariant!0 (currentBit!2887 (_2!2360 lt!72896)) (currentByte!2892 (_2!2360 lt!72896)) (size!1038 (buf!1387 (_2!2360 lt!72896))))))

(assert (=> d!14114 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72896))) (currentByte!2892 (_2!2360 lt!72896)) (currentBit!2887 (_2!2360 lt!72896))) lt!73650)))

(declare-fun b!47467 () Bool)

(declare-fun res!39969 () Bool)

(assert (=> b!47467 (=> (not res!39969) (not e!31462))))

(assert (=> b!47467 (= res!39969 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73650))))

(declare-fun b!47468 () Bool)

(declare-fun lt!73648 () (_ BitVec 64))

(assert (=> b!47468 (= e!31462 (bvsle lt!73650 (bvmul lt!73648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47468 (or (= lt!73648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73648)))))

(assert (=> b!47468 (= lt!73648 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))))))

(assert (= (and d!14114 res!39970) b!47467))

(assert (= (and b!47467 res!39969) b!47468))

(declare-fun m!73171 () Bool)

(assert (=> d!14114 m!73171))

(declare-fun m!73173 () Bool)

(assert (=> d!14114 m!73173))

(assert (=> b!47030 d!14114))

(declare-fun b!47469 () Bool)

(declare-fun res!39975 () Bool)

(declare-fun e!31465 () Bool)

(assert (=> b!47469 (=> (not res!39975) (not e!31465))))

(declare-fun lt!73663 () (_ BitVec 64))

(declare-fun lt!73664 () (_ BitVec 64))

(declare-fun lt!73653 () tuple2!4534)

(assert (=> b!47469 (= res!39975 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73653))) (currentByte!2892 (_2!2360 lt!73653)) (currentBit!2887 (_2!2360 lt!73653))) (bvadd lt!73663 lt!73664)))))

(assert (=> b!47469 (or (not (= (bvand lt!73663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73664 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73663 lt!73664) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47469 (= lt!73664 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47469 (= lt!73663 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))))))

(declare-fun b!47470 () Bool)

(declare-fun res!39977 () Bool)

(assert (=> b!47470 (=> (not res!39977) (not e!31465))))

(assert (=> b!47470 (= res!39977 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!73653)))))

(declare-fun b!47471 () Bool)

(declare-fun e!31466 () Bool)

(declare-fun e!31464 () Bool)

(assert (=> b!47471 (= e!31466 e!31464)))

(declare-fun res!39972 () Bool)

(assert (=> b!47471 (=> (not res!39972) (not e!31464))))

(declare-fun lt!73657 () tuple2!4550)

(declare-fun lt!73660 () tuple2!4534)

(declare-fun lt!73655 () Bool)

(assert (=> b!47471 (= res!39972 (and (= (_2!2368 lt!73657) lt!73655) (= (_1!2368 lt!73657) (_2!2360 lt!73660))))))

(assert (=> b!47471 (= lt!73657 (readBitPure!0 (readerFrom!0 (_2!2360 lt!73660) (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395)))))))

(declare-fun b!47472 () Bool)

(declare-fun e!31463 () Bool)

(declare-fun lt!73656 () tuple2!4550)

(assert (=> b!47472 (= e!31463 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73656))) (currentByte!2892 (_1!2368 lt!73656)) (currentBit!2887 (_1!2368 lt!73656))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73653))) (currentByte!2892 (_2!2360 lt!73653)) (currentBit!2887 (_2!2360 lt!73653)))))))

(declare-fun b!47473 () Bool)

(assert (=> b!47473 (= e!31465 e!31463)))

(declare-fun res!39978 () Bool)

(assert (=> b!47473 (=> (not res!39978) (not e!31463))))

(declare-fun lt!73659 () (_ BitVec 8))

(assert (=> b!47473 (= res!39978 (and (= (_2!2368 lt!73656) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!73659)) #b00000000000000000000000000000000))) (= (_1!2368 lt!73656) (_2!2360 lt!73653))))))

(declare-fun lt!73661 () tuple2!4544)

(declare-fun lt!73654 () BitStream!1808)

(assert (=> b!47473 (= lt!73661 (readBits!0 lt!73654 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!47473 (= lt!73656 (readBitPure!0 lt!73654))))

(assert (=> b!47473 (= lt!73654 (readerFrom!0 (_2!2360 lt!73653) (currentBit!2887 (_2!2360 lt!72395)) (currentByte!2892 (_2!2360 lt!72395))))))

(declare-fun b!47475 () Bool)

(assert (=> b!47475 (= e!31464 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73657))) (currentByte!2892 (_1!2368 lt!73657)) (currentBit!2887 (_1!2368 lt!73657))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73660))) (currentByte!2892 (_2!2360 lt!73660)) (currentBit!2887 (_2!2360 lt!73660)))))))

(declare-fun b!47476 () Bool)

(declare-fun res!39976 () Bool)

(assert (=> b!47476 (=> (not res!39976) (not e!31466))))

(assert (=> b!47476 (= res!39976 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!73660)))))

(declare-fun b!47474 () Bool)

(declare-fun res!39973 () Bool)

(assert (=> b!47474 (=> (not res!39973) (not e!31466))))

(assert (=> b!47474 (= res!39973 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73660))) (currentByte!2892 (_2!2360 lt!73660)) (currentBit!2887 (_2!2360 lt!73660))) (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!14116 () Bool)

(assert (=> d!14116 e!31465))

(declare-fun res!39974 () Bool)

(assert (=> d!14116 (=> (not res!39974) (not e!31465))))

(assert (=> d!14116 (= res!39974 (= (size!1038 (buf!1387 (_2!2360 lt!73653))) (size!1038 (buf!1387 (_2!2360 lt!72395)))))))

(declare-fun lt!73662 () array!2297)

(assert (=> d!14116 (= lt!73659 (select (arr!1558 lt!73662) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14116 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1038 lt!73662)))))

(assert (=> d!14116 (= lt!73662 (array!2298 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!73658 () tuple2!4534)

(assert (=> d!14116 (= lt!73653 (tuple2!4535 (_1!2360 lt!73658) (_2!2360 lt!73658)))))

(assert (=> d!14116 (= lt!73658 lt!73660)))

(assert (=> d!14116 e!31466))

(declare-fun res!39971 () Bool)

(assert (=> d!14116 (=> (not res!39971) (not e!31466))))

(assert (=> d!14116 (= res!39971 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!73660)))))))

(assert (=> d!14116 (= lt!73660 (appendBit!0 (_2!2360 lt!72395) lt!73655))))

(assert (=> d!14116 (= lt!73655 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14116 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14116 (= (appendBitFromByte!0 (_2!2360 lt!72395) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!73653)))

(assert (= (and d!14116 res!39971) b!47474))

(assert (= (and b!47474 res!39973) b!47476))

(assert (= (and b!47476 res!39976) b!47471))

(assert (= (and b!47471 res!39972) b!47475))

(assert (= (and d!14116 res!39974) b!47469))

(assert (= (and b!47469 res!39975) b!47470))

(assert (= (and b!47470 res!39977) b!47473))

(assert (= (and b!47473 res!39978) b!47472))

(declare-fun m!73175 () Bool)

(assert (=> b!47470 m!73175))

(declare-fun m!73177 () Bool)

(assert (=> b!47471 m!73177))

(assert (=> b!47471 m!73177))

(declare-fun m!73179 () Bool)

(assert (=> b!47471 m!73179))

(declare-fun m!73181 () Bool)

(assert (=> b!47476 m!73181))

(declare-fun m!73183 () Bool)

(assert (=> b!47474 m!73183))

(assert (=> b!47474 m!71893))

(declare-fun m!73185 () Bool)

(assert (=> b!47469 m!73185))

(assert (=> b!47469 m!71893))

(declare-fun m!73187 () Bool)

(assert (=> b!47473 m!73187))

(declare-fun m!73189 () Bool)

(assert (=> b!47473 m!73189))

(declare-fun m!73191 () Bool)

(assert (=> b!47473 m!73191))

(declare-fun m!73193 () Bool)

(assert (=> b!47472 m!73193))

(assert (=> b!47472 m!73185))

(declare-fun m!73195 () Bool)

(assert (=> b!47475 m!73195))

(assert (=> b!47475 m!73183))

(declare-fun m!73197 () Bool)

(assert (=> d!14116 m!73197))

(declare-fun m!73199 () Bool)

(assert (=> d!14116 m!73199))

(assert (=> d!14116 m!73063))

(assert (=> b!47030 d!14116))

(declare-fun d!14118 () Bool)

(assert (=> d!14118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!72916) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928)))) lt!72916))))

(declare-fun bs!3675 () Bool)

(assert (= bs!3675 d!14118))

(declare-fun m!73201 () Bool)

(assert (=> bs!3675 m!73201))

(assert (=> b!47030 d!14118))

(declare-fun d!14120 () Bool)

(assert (=> d!14120 (= (head!364 (byteArrayBitContentToList!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!660 (byteArrayBitContentToList!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47030 d!14120))

(declare-fun b!47477 () Bool)

(declare-fun e!31468 () tuple2!4546)

(assert (=> b!47477 (= e!31468 (tuple2!4547 Nil!542 (_1!2359 lt!72913)))))

(declare-fun b!47479 () Bool)

(declare-fun e!31467 () Bool)

(declare-fun lt!73665 () List!545)

(assert (=> b!47479 (= e!31467 (isEmpty!138 lt!73665))))

(declare-fun b!47480 () Bool)

(assert (=> b!47480 (= e!31467 (> (length!240 lt!73665) 0))))

(declare-fun lt!73667 () (_ BitVec 64))

(declare-fun lt!73666 () tuple2!4548)

(declare-fun b!47478 () Bool)

(assert (=> b!47478 (= e!31468 (tuple2!4547 (Cons!541 (_1!2367 lt!73666) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_2!2367 lt!73666) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73667))) (_2!2367 lt!73666)))))

(assert (=> b!47478 (= lt!73666 (readBit!0 (_1!2359 lt!72913)))))

(assert (=> b!47478 (= lt!73667 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14122 () Bool)

(assert (=> d!14122 e!31467))

(declare-fun c!3271 () Bool)

(assert (=> d!14122 (= c!3271 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14122 (= lt!73665 (_1!2366 e!31468))))

(declare-fun c!3270 () Bool)

(assert (=> d!14122 (= c!3270 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14122 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14122 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72913) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!73665)))

(assert (= (and d!14122 c!3270) b!47477))

(assert (= (and d!14122 (not c!3270)) b!47478))

(assert (= (and d!14122 c!3271) b!47479))

(assert (= (and d!14122 (not c!3271)) b!47480))

(declare-fun m!73203 () Bool)

(assert (=> b!47479 m!73203))

(declare-fun m!73205 () Bool)

(assert (=> b!47480 m!73205))

(declare-fun m!73207 () Bool)

(assert (=> b!47478 m!73207))

(assert (=> b!47478 m!73109))

(assert (=> b!47030 d!14122))

(declare-fun d!14124 () Bool)

(assert (=> d!14124 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72888) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395)))) lt!72888))))

(declare-fun bs!3676 () Bool)

(assert (= bs!3676 d!14124))

(declare-fun m!73209 () Bool)

(assert (=> bs!3676 m!73209))

(assert (=> b!47030 d!14124))

(declare-fun d!14126 () Bool)

(assert (=> d!14126 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72896))))

(declare-fun lt!73668 () Unit!3313)

(assert (=> d!14126 (= lt!73668 (choose!30 (_2!2360 lt!72395) (_2!2360 lt!72928) (_2!2360 lt!72896)))))

(assert (=> d!14126 (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72928))))

(assert (=> d!14126 (= (lemmaIsPrefixTransitive!0 (_2!2360 lt!72395) (_2!2360 lt!72928) (_2!2360 lt!72896)) lt!73668)))

(declare-fun bs!3677 () Bool)

(assert (= bs!3677 d!14126))

(assert (=> bs!3677 m!72233))

(declare-fun m!73211 () Bool)

(assert (=> bs!3677 m!73211))

(assert (=> bs!3677 m!73165))

(assert (=> b!47030 d!14126))

(declare-fun d!14128 () Bool)

(declare-fun e!31469 () Bool)

(assert (=> d!14128 e!31469))

(declare-fun res!39979 () Bool)

(assert (=> d!14128 (=> (not res!39979) (not e!31469))))

(declare-fun lt!73670 () (_ BitVec 64))

(assert (=> d!14128 (= res!39979 (or (= (bvand lt!72920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72920 lt!73670) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14128 (= lt!73670 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73669 () Unit!3313)

(assert (=> d!14128 (= lt!73669 (choose!42 (_2!2360 lt!72896) (_2!2360 lt!72896) (_1!2359 lt!72926) (_1!2359 lt!72913) lt!72920 lt!72886))))

(assert (=> d!14128 (bvsgt lt!72920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14128 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2360 lt!72896) (_2!2360 lt!72896) (_1!2359 lt!72926) (_1!2359 lt!72913) lt!72920 lt!72886) lt!73669)))

(declare-fun b!47481 () Bool)

(assert (=> b!47481 (= e!31469 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72913) (bvsub lt!72920 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!231 lt!72886)))))

(assert (= (and d!14128 res!39979) b!47481))

(declare-fun m!73213 () Bool)

(assert (=> d!14128 m!73213))

(assert (=> b!47481 m!72227))

(assert (=> b!47481 m!72273))

(assert (=> b!47030 d!14128))

(declare-fun d!14130 () Bool)

(assert (=> d!14130 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72921)))

(declare-fun lt!73671 () Unit!3313)

(assert (=> d!14130 (= lt!73671 (choose!9 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72928)) lt!72921 (BitStream!1809 (buf!1387 (_2!2360 lt!72928)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!14130 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72928)) lt!72921) lt!73671)))

(declare-fun bs!3678 () Bool)

(assert (= bs!3678 d!14130))

(assert (=> bs!3678 m!72225))

(declare-fun m!73215 () Bool)

(assert (=> bs!3678 m!73215))

(assert (=> b!47030 d!14130))

(declare-fun d!14132 () Bool)

(assert (=> d!14132 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72896)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72395))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72395))) lt!72888)))

(declare-fun lt!73672 () Unit!3313)

(assert (=> d!14132 (= lt!73672 (choose!9 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72896)) lt!72888 (BitStream!1809 (buf!1387 (_2!2360 lt!72896)) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (=> d!14132 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72395) (buf!1387 (_2!2360 lt!72896)) lt!72888) lt!73672)))

(declare-fun bs!3679 () Bool)

(assert (= bs!3679 d!14132))

(assert (=> bs!3679 m!72261))

(declare-fun m!73217 () Bool)

(assert (=> bs!3679 m!73217))

(assert (=> b!47030 d!14132))

(declare-fun d!14134 () Bool)

(assert (=> d!14134 (= (bitAt!0 (buf!1387 (_2!2360 lt!72928)) lt!72908) (bitAt!0 (buf!1387 (_2!2360 lt!72896)) lt!72908))))

(declare-fun lt!73675 () Unit!3313)

(declare-fun choose!31 (array!2297 array!2297 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3313)

(assert (=> d!14134 (= lt!73675 (choose!31 (buf!1387 (_2!2360 lt!72928)) (buf!1387 (_2!2360 lt!72896)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72908 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928)))))))

(assert (=> d!14134 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928)))))))

(assert (=> d!14134 (= (arrayBitRangesEqImpliesEq!0 (buf!1387 (_2!2360 lt!72928)) (buf!1387 (_2!2360 lt!72896)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72908 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928)))) lt!73675)))

(declare-fun bs!3680 () Bool)

(assert (= bs!3680 d!14134))

(assert (=> bs!3680 m!72275))

(assert (=> bs!3680 m!72269))

(assert (=> bs!3680 m!72257))

(declare-fun m!73219 () Bool)

(assert (=> bs!3680 m!73219))

(assert (=> b!47030 d!14134))

(assert (=> b!47030 d!13844))

(declare-fun d!14136 () Bool)

(declare-fun e!31470 () Bool)

(assert (=> d!14136 e!31470))

(declare-fun res!39981 () Bool)

(assert (=> d!14136 (=> (not res!39981) (not e!31470))))

(declare-fun lt!73681 () (_ BitVec 64))

(declare-fun lt!73679 () (_ BitVec 64))

(declare-fun lt!73678 () (_ BitVec 64))

(assert (=> d!14136 (= res!39981 (= lt!73679 (bvsub lt!73678 lt!73681)))))

(assert (=> d!14136 (or (= (bvand lt!73678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73681 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73678 lt!73681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14136 (= lt!73681 (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928)))))))

(declare-fun lt!73680 () (_ BitVec 64))

(declare-fun lt!73676 () (_ BitVec 64))

(assert (=> d!14136 (= lt!73678 (bvmul lt!73680 lt!73676))))

(assert (=> d!14136 (or (= lt!73680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!73676 (bvsdiv (bvmul lt!73680 lt!73676) lt!73680)))))

(assert (=> d!14136 (= lt!73676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14136 (= lt!73680 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))))))

(assert (=> d!14136 (= lt!73679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928)))))))

(assert (=> d!14136 (invariant!0 (currentBit!2887 (_2!2360 lt!72928)) (currentByte!2892 (_2!2360 lt!72928)) (size!1038 (buf!1387 (_2!2360 lt!72928))))))

(assert (=> d!14136 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))) lt!73679)))

(declare-fun b!47482 () Bool)

(declare-fun res!39980 () Bool)

(assert (=> b!47482 (=> (not res!39980) (not e!31470))))

(assert (=> b!47482 (= res!39980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!73679))))

(declare-fun b!47483 () Bool)

(declare-fun lt!73677 () (_ BitVec 64))

(assert (=> b!47483 (= e!31470 (bvsle lt!73679 (bvmul lt!73677 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47483 (or (= lt!73677 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!73677 #b0000000000000000000000000000000000000000000000000000000000001000) lt!73677)))))

(assert (=> b!47483 (= lt!73677 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))))))

(assert (= (and d!14136 res!39981) b!47482))

(assert (= (and b!47482 res!39980) b!47483))

(declare-fun m!73221 () Bool)

(assert (=> d!14136 m!73221))

(declare-fun m!73223 () Bool)

(assert (=> d!14136 m!73223))

(assert (=> b!47030 d!14136))

(declare-fun d!14138 () Bool)

(declare-fun res!39984 () Bool)

(declare-fun e!31471 () Bool)

(assert (=> d!14138 (=> (not res!39984) (not e!31471))))

(assert (=> d!14138 (= res!39984 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) (size!1038 (buf!1387 (_2!2360 lt!72896)))))))

(assert (=> d!14138 (= (isPrefixOf!0 (_2!2360 lt!72395) (_2!2360 lt!72896)) e!31471)))

(declare-fun b!47484 () Bool)

(declare-fun res!39983 () Bool)

(assert (=> b!47484 (=> (not res!39983) (not e!31471))))

(assert (=> b!47484 (= res!39983 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72896))) (currentByte!2892 (_2!2360 lt!72896)) (currentBit!2887 (_2!2360 lt!72896)))))))

(declare-fun b!47485 () Bool)

(declare-fun e!31472 () Bool)

(assert (=> b!47485 (= e!31471 e!31472)))

(declare-fun res!39982 () Bool)

(assert (=> b!47485 (=> res!39982 e!31472)))

(assert (=> b!47485 (= res!39982 (= (size!1038 (buf!1387 (_2!2360 lt!72395))) #b00000000000000000000000000000000))))

(declare-fun b!47486 () Bool)

(assert (=> b!47486 (= e!31472 (arrayBitRangesEq!0 (buf!1387 (_2!2360 lt!72395)) (buf!1387 (_2!2360 lt!72896)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72395))) (currentByte!2892 (_2!2360 lt!72395)) (currentBit!2887 (_2!2360 lt!72395)))))))

(assert (= (and d!14138 res!39984) b!47484))

(assert (= (and b!47484 res!39983) b!47485))

(assert (= (and b!47485 (not res!39982)) b!47486))

(assert (=> b!47484 m!71893))

(assert (=> b!47484 m!72231))

(assert (=> b!47486 m!71893))

(assert (=> b!47486 m!71893))

(declare-fun m!73225 () Bool)

(assert (=> b!47486 m!73225))

(assert (=> b!47030 d!14138))

(declare-fun b!47488 () Bool)

(declare-fun res!39990 () Bool)

(declare-fun e!31475 () Bool)

(assert (=> b!47488 (=> (not res!39990) (not e!31475))))

(declare-fun lt!73721 () tuple2!4534)

(assert (=> b!47488 (= res!39990 (invariant!0 (currentBit!2887 (_2!2360 lt!73721)) (currentByte!2892 (_2!2360 lt!73721)) (size!1038 (buf!1387 (_2!2360 lt!73721)))))))

(declare-fun b!47489 () Bool)

(declare-fun e!31474 () tuple2!4534)

(declare-fun lt!73695 () tuple2!4534)

(declare-fun Unit!3349 () Unit!3313)

(assert (=> b!47489 (= e!31474 (tuple2!4535 Unit!3349 (_2!2360 lt!73695)))))

(declare-fun lt!73725 () tuple2!4534)

(assert (=> b!47489 (= lt!73725 (appendBitFromByte!0 (_2!2360 lt!72928) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!73690 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73690 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73699 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73699 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73709 () Unit!3313)

(assert (=> b!47489 (= lt!73709 (validateOffsetBitsIneqLemma!0 (_2!2360 lt!72928) (_2!2360 lt!73725) lt!73690 lt!73699))))

(assert (=> b!47489 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73725)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73725))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73725))) (bvsub lt!73690 lt!73699))))

(declare-fun lt!73692 () Unit!3313)

(assert (=> b!47489 (= lt!73692 lt!73709)))

(declare-fun lt!73704 () tuple2!4532)

(assert (=> b!47489 (= lt!73704 (reader!0 (_2!2360 lt!72928) (_2!2360 lt!73725)))))

(declare-fun lt!73720 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73720 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73716 () Unit!3313)

(assert (=> b!47489 (= lt!73716 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!73725)) lt!73720))))

(assert (=> b!47489 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73725)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!73720)))

(declare-fun lt!73684 () Unit!3313)

(assert (=> b!47489 (= lt!73684 lt!73716)))

(assert (=> b!47489 (= (head!364 (byteArrayBitContentToList!0 (_2!2360 lt!73725) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!364 (bitStreamReadBitsIntoList!0 (_2!2360 lt!73725) (_1!2359 lt!73704) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73713 () Unit!3313)

(declare-fun Unit!3350 () Unit!3313)

(assert (=> b!47489 (= lt!73713 Unit!3350)))

(assert (=> b!47489 (= lt!73695 (appendBitsMSBFirstLoop!0 (_2!2360 lt!73725) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!73700 () Unit!3313)

(assert (=> b!47489 (= lt!73700 (lemmaIsPrefixTransitive!0 (_2!2360 lt!72928) (_2!2360 lt!73725) (_2!2360 lt!73695)))))

(assert (=> b!47489 (isPrefixOf!0 (_2!2360 lt!72928) (_2!2360 lt!73695))))

(declare-fun lt!73683 () Unit!3313)

(assert (=> b!47489 (= lt!73683 lt!73700)))

(assert (=> b!47489 (= (size!1038 (buf!1387 (_2!2360 lt!73695))) (size!1038 (buf!1387 (_2!2360 lt!72928))))))

(declare-fun lt!73718 () Unit!3313)

(declare-fun Unit!3351 () Unit!3313)

(assert (=> b!47489 (= lt!73718 Unit!3351)))

(assert (=> b!47489 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73695))) (currentByte!2892 (_2!2360 lt!73695)) (currentBit!2887 (_2!2360 lt!73695))) (bvsub (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73698 () Unit!3313)

(declare-fun Unit!3352 () Unit!3313)

(assert (=> b!47489 (= lt!73698 Unit!3352)))

(assert (=> b!47489 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73695))) (currentByte!2892 (_2!2360 lt!73695)) (currentBit!2887 (_2!2360 lt!73695))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73725))) (currentByte!2892 (_2!2360 lt!73725)) (currentBit!2887 (_2!2360 lt!73725))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73717 () Unit!3313)

(declare-fun Unit!3353 () Unit!3313)

(assert (=> b!47489 (= lt!73717 Unit!3353)))

(declare-fun lt!73723 () tuple2!4532)

(assert (=> b!47489 (= lt!73723 (reader!0 (_2!2360 lt!72928) (_2!2360 lt!73695)))))

(declare-fun lt!73689 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73689 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73702 () Unit!3313)

(assert (=> b!47489 (= lt!73702 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!73695)) lt!73689))))

(assert (=> b!47489 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73695)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!73689)))

(declare-fun lt!73706 () Unit!3313)

(assert (=> b!47489 (= lt!73706 lt!73702)))

(declare-fun lt!73712 () tuple2!4532)

(declare-fun call!581 () tuple2!4532)

(assert (=> b!47489 (= lt!73712 call!581)))

(declare-fun lt!73715 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73715 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!73722 () Unit!3313)

(assert (=> b!47489 (= lt!73722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!73725) (buf!1387 (_2!2360 lt!73695)) lt!73715))))

(assert (=> b!47489 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73695)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!73725))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!73725))) lt!73715)))

(declare-fun lt!73703 () Unit!3313)

(assert (=> b!47489 (= lt!73703 lt!73722)))

(declare-fun lt!73714 () List!545)

(assert (=> b!47489 (= lt!73714 (byteArrayBitContentToList!0 (_2!2360 lt!73695) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!73697 () List!545)

(assert (=> b!47489 (= lt!73697 (byteArrayBitContentToList!0 (_2!2360 lt!73695) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73687 () List!545)

(assert (=> b!47489 (= lt!73687 (bitStreamReadBitsIntoList!0 (_2!2360 lt!73695) (_1!2359 lt!73723) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!73711 () List!545)

(assert (=> b!47489 (= lt!73711 (bitStreamReadBitsIntoList!0 (_2!2360 lt!73695) (_1!2359 lt!73712) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73719 () (_ BitVec 64))

(assert (=> b!47489 (= lt!73719 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!73701 () Unit!3313)

(assert (=> b!47489 (= lt!73701 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2360 lt!73695) (_2!2360 lt!73695) (_1!2359 lt!73723) (_1!2359 lt!73712) lt!73719 lt!73687))))

(assert (=> b!47489 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!73695) (_1!2359 lt!73712) (bvsub lt!73719 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!231 lt!73687))))

(declare-fun lt!73693 () Unit!3313)

(assert (=> b!47489 (= lt!73693 lt!73701)))

(declare-fun lt!73707 () (_ BitVec 64))

(declare-fun lt!73682 () Unit!3313)

(assert (=> b!47489 (= lt!73682 (arrayBitRangesEqImpliesEq!0 (buf!1387 (_2!2360 lt!73725)) (buf!1387 (_2!2360 lt!73695)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!73707 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73725))) (currentByte!2892 (_2!2360 lt!73725)) (currentBit!2887 (_2!2360 lt!73725)))))))

(assert (=> b!47489 (= (bitAt!0 (buf!1387 (_2!2360 lt!73725)) lt!73707) (bitAt!0 (buf!1387 (_2!2360 lt!73695)) lt!73707))))

(declare-fun lt!73691 () Unit!3313)

(assert (=> b!47489 (= lt!73691 lt!73682)))

(declare-fun b!47490 () Bool)

(declare-fun e!31473 () Bool)

(declare-fun lt!73708 () (_ BitVec 64))

(assert (=> b!47490 (= e!31473 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!73708))))

(declare-fun b!47491 () Bool)

(declare-fun Unit!3354 () Unit!3313)

(assert (=> b!47491 (= e!31474 (tuple2!4535 Unit!3354 (_2!2360 lt!72928)))))

(assert (=> b!47491 (= (size!1038 (buf!1387 (_2!2360 lt!72928))) (size!1038 (buf!1387 (_2!2360 lt!72928))))))

(declare-fun lt!73724 () Unit!3313)

(declare-fun Unit!3355 () Unit!3313)

(assert (=> b!47491 (= lt!73724 Unit!3355)))

(assert (=> b!47491 (checkByteArrayBitContent!0 (_2!2360 lt!72928) srcBuffer!2 (_1!2365 (readBits!0 (_1!2359 call!581) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun c!3272 () Bool)

(declare-fun bm!578 () Bool)

(assert (=> bm!578 (= call!581 (reader!0 (ite c!3272 (_2!2360 lt!73725) (_2!2360 lt!72928)) (ite c!3272 (_2!2360 lt!73695) (_2!2360 lt!72928))))))

(declare-fun b!47492 () Bool)

(declare-fun res!39986 () Bool)

(assert (=> b!47492 (=> (not res!39986) (not e!31475))))

(assert (=> b!47492 (= res!39986 (isPrefixOf!0 (_2!2360 lt!72928) (_2!2360 lt!73721)))))

(declare-fun b!47493 () Bool)

(declare-fun res!39988 () Bool)

(assert (=> b!47493 (=> (not res!39988) (not e!31475))))

(assert (=> b!47493 (= res!39988 (= (size!1038 (buf!1387 (_2!2360 lt!73721))) (size!1038 (buf!1387 (_2!2360 lt!72928)))))))

(declare-fun lt!73688 () tuple2!4532)

(declare-fun b!47494 () Bool)

(assert (=> b!47494 (= e!31475 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!73721) (_1!2359 lt!73688) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2360 lt!73721) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!47494 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47494 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73705 () Unit!3313)

(declare-fun lt!73696 () Unit!3313)

(assert (=> b!47494 (= lt!73705 lt!73696)))

(assert (=> b!47494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!73721)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) lt!73708)))

(assert (=> b!47494 (= lt!73696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2360 lt!72928) (buf!1387 (_2!2360 lt!73721)) lt!73708))))

(assert (=> b!47494 e!31473))

(declare-fun res!39985 () Bool)

(assert (=> b!47494 (=> (not res!39985) (not e!31473))))

(assert (=> b!47494 (= res!39985 (and (= (size!1038 (buf!1387 (_2!2360 lt!72928))) (size!1038 (buf!1387 (_2!2360 lt!73721)))) (bvsge lt!73708 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47494 (= lt!73708 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!47494 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47494 (= lt!73688 (reader!0 (_2!2360 lt!72928) (_2!2360 lt!73721)))))

(declare-fun b!47487 () Bool)

(declare-fun res!39987 () Bool)

(assert (=> b!47487 (=> (not res!39987) (not e!31475))))

(assert (=> b!47487 (= res!39987 (= (size!1038 (buf!1387 (_2!2360 lt!72928))) (size!1038 (buf!1387 (_2!2360 lt!73721)))))))

(declare-fun d!14140 () Bool)

(assert (=> d!14140 e!31475))

(declare-fun res!39989 () Bool)

(assert (=> d!14140 (=> (not res!39989) (not e!31475))))

(declare-fun lt!73710 () (_ BitVec 64))

(assert (=> d!14140 (= res!39989 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73721))) (currentByte!2892 (_2!2360 lt!73721)) (currentBit!2887 (_2!2360 lt!73721))) (bvsub lt!73710 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!14140 (or (= (bvand lt!73710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73710 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!73685 () (_ BitVec 64))

(assert (=> d!14140 (= lt!73710 (bvadd lt!73685 to!314))))

(assert (=> d!14140 (or (not (= (bvand lt!73685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73685 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14140 (= lt!73685 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))))))

(assert (=> d!14140 (= lt!73721 e!31474)))

(assert (=> d!14140 (= c!3272 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!73694 () Unit!3313)

(declare-fun lt!73686 () Unit!3313)

(assert (=> d!14140 (= lt!73694 lt!73686)))

(assert (=> d!14140 (isPrefixOf!0 (_2!2360 lt!72928) (_2!2360 lt!72928))))

(assert (=> d!14140 (= lt!73686 (lemmaIsPrefixRefl!0 (_2!2360 lt!72928)))))

(assert (=> d!14140 (= lt!73707 (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72928))) (currentByte!2892 (_2!2360 lt!72928)) (currentBit!2887 (_2!2360 lt!72928))))))

(assert (=> d!14140 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14140 (= (appendBitsMSBFirstLoop!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!73721)))

(assert (= (and d!14140 c!3272) b!47489))

(assert (= (and d!14140 (not c!3272)) b!47491))

(assert (= (or b!47489 b!47491) bm!578))

(assert (= (and d!14140 res!39989) b!47488))

(assert (= (and b!47488 res!39990) b!47487))

(assert (= (and b!47487 res!39987) b!47492))

(assert (= (and b!47492 res!39986) b!47493))

(assert (= (and b!47493 res!39988) b!47494))

(assert (= (and b!47494 res!39985) b!47490))

(declare-fun m!73227 () Bool)

(assert (=> b!47490 m!73227))

(declare-fun m!73229 () Bool)

(assert (=> bm!578 m!73229))

(declare-fun m!73231 () Bool)

(assert (=> b!47491 m!73231))

(declare-fun m!73233 () Bool)

(assert (=> b!47491 m!73233))

(declare-fun m!73235 () Bool)

(assert (=> d!14140 m!73235))

(assert (=> d!14140 m!72257))

(assert (=> d!14140 m!73161))

(assert (=> d!14140 m!73167))

(declare-fun m!73237 () Bool)

(assert (=> b!47492 m!73237))

(declare-fun m!73239 () Bool)

(assert (=> b!47489 m!73239))

(declare-fun m!73241 () Bool)

(assert (=> b!47489 m!73241))

(declare-fun m!73243 () Bool)

(assert (=> b!47489 m!73243))

(declare-fun m!73245 () Bool)

(assert (=> b!47489 m!73245))

(declare-fun m!73247 () Bool)

(assert (=> b!47489 m!73247))

(declare-fun m!73249 () Bool)

(assert (=> b!47489 m!73249))

(assert (=> b!47489 m!73093))

(declare-fun m!73251 () Bool)

(assert (=> b!47489 m!73251))

(declare-fun m!73253 () Bool)

(assert (=> b!47489 m!73253))

(declare-fun m!73255 () Bool)

(assert (=> b!47489 m!73255))

(declare-fun m!73257 () Bool)

(assert (=> b!47489 m!73257))

(declare-fun m!73259 () Bool)

(assert (=> b!47489 m!73259))

(declare-fun m!73261 () Bool)

(assert (=> b!47489 m!73261))

(declare-fun m!73263 () Bool)

(assert (=> b!47489 m!73263))

(assert (=> b!47489 m!73093))

(declare-fun m!73265 () Bool)

(assert (=> b!47489 m!73265))

(declare-fun m!73267 () Bool)

(assert (=> b!47489 m!73267))

(declare-fun m!73269 () Bool)

(assert (=> b!47489 m!73269))

(declare-fun m!73271 () Bool)

(assert (=> b!47489 m!73271))

(declare-fun m!73273 () Bool)

(assert (=> b!47489 m!73273))

(declare-fun m!73275 () Bool)

(assert (=> b!47489 m!73275))

(declare-fun m!73277 () Bool)

(assert (=> b!47489 m!73277))

(declare-fun m!73279 () Bool)

(assert (=> b!47489 m!73279))

(declare-fun m!73281 () Bool)

(assert (=> b!47489 m!73281))

(declare-fun m!73283 () Bool)

(assert (=> b!47489 m!73283))

(declare-fun m!73285 () Bool)

(assert (=> b!47489 m!73285))

(declare-fun m!73287 () Bool)

(assert (=> b!47489 m!73287))

(declare-fun m!73289 () Bool)

(assert (=> b!47489 m!73289))

(declare-fun m!73291 () Bool)

(assert (=> b!47489 m!73291))

(declare-fun m!73293 () Bool)

(assert (=> b!47489 m!73293))

(assert (=> b!47489 m!73269))

(declare-fun m!73295 () Bool)

(assert (=> b!47489 m!73295))

(assert (=> b!47489 m!73283))

(declare-fun m!73297 () Bool)

(assert (=> b!47489 m!73297))

(assert (=> b!47489 m!73275))

(assert (=> b!47489 m!72257))

(declare-fun m!73299 () Bool)

(assert (=> b!47488 m!73299))

(declare-fun m!73301 () Bool)

(assert (=> b!47494 m!73301))

(declare-fun m!73303 () Bool)

(assert (=> b!47494 m!73303))

(declare-fun m!73305 () Bool)

(assert (=> b!47494 m!73305))

(declare-fun m!73307 () Bool)

(assert (=> b!47494 m!73307))

(declare-fun m!73309 () Bool)

(assert (=> b!47494 m!73309))

(assert (=> b!47030 d!14140))

(declare-fun d!14142 () Bool)

(assert (=> d!14142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928))) (bvsub lt!72889 lt!72900)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1038 (buf!1387 (_2!2360 lt!72928)))) ((_ sign_extend 32) (currentByte!2892 (_2!2360 lt!72928))) ((_ sign_extend 32) (currentBit!2887 (_2!2360 lt!72928)))) (bvsub lt!72889 lt!72900)))))

(declare-fun bs!3681 () Bool)

(assert (= bs!3681 d!14142))

(assert (=> bs!3681 m!73221))

(assert (=> b!47030 d!14142))

(declare-fun d!14144 () Bool)

(declare-fun c!3273 () Bool)

(assert (=> d!14144 (= c!3273 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31476 () List!545)

(assert (=> d!14144 (= (byteArrayBitContentToList!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!31476)))

(declare-fun b!47495 () Bool)

(assert (=> b!47495 (= e!31476 Nil!542)))

(declare-fun b!47496 () Bool)

(assert (=> b!47496 (= e!31476 (Cons!541 (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2360 lt!72928) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14144 c!3273) b!47495))

(assert (= (and d!14144 (not c!3273)) b!47496))

(assert (=> b!47496 m!72237))

(assert (=> b!47496 m!73063))

(declare-fun m!73311 () Bool)

(assert (=> b!47496 m!73311))

(assert (=> b!47030 d!14144))

(declare-fun b!47497 () Bool)

(declare-fun e!31478 () tuple2!4546)

(assert (=> b!47497 (= e!31478 (tuple2!4547 Nil!542 (_1!2359 lt!72905)))))

(declare-fun b!47499 () Bool)

(declare-fun e!31477 () Bool)

(declare-fun lt!73726 () List!545)

(assert (=> b!47499 (= e!31477 (isEmpty!138 lt!73726))))

(declare-fun b!47500 () Bool)

(assert (=> b!47500 (= e!31477 (> (length!240 lt!73726) 0))))

(declare-fun lt!73727 () tuple2!4548)

(declare-fun b!47498 () Bool)

(declare-fun lt!73728 () (_ BitVec 64))

(assert (=> b!47498 (= e!31478 (tuple2!4547 (Cons!541 (_1!2367 lt!73727) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72928) (_2!2367 lt!73727) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!73728))) (_2!2367 lt!73727)))))

(assert (=> b!47498 (= lt!73727 (readBit!0 (_1!2359 lt!72905)))))

(assert (=> b!47498 (= lt!73728 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14146 () Bool)

(assert (=> d!14146 e!31477))

(declare-fun c!3275 () Bool)

(assert (=> d!14146 (= c!3275 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14146 (= lt!73726 (_1!2366 e!31478))))

(declare-fun c!3274 () Bool)

(assert (=> d!14146 (= c!3274 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14146 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14146 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72928) (_1!2359 lt!72905) #b0000000000000000000000000000000000000000000000000000000000000001) lt!73726)))

(assert (= (and d!14146 c!3274) b!47497))

(assert (= (and d!14146 (not c!3274)) b!47498))

(assert (= (and d!14146 c!3275) b!47499))

(assert (= (and d!14146 (not c!3275)) b!47500))

(declare-fun m!73313 () Bool)

(assert (=> b!47499 m!73313))

(declare-fun m!73315 () Bool)

(assert (=> b!47500 m!73315))

(declare-fun m!73317 () Bool)

(assert (=> b!47498 m!73317))

(declare-fun m!73319 () Bool)

(assert (=> b!47498 m!73319))

(assert (=> b!47030 d!14146))

(declare-fun b!47501 () Bool)

(declare-fun e!31480 () tuple2!4546)

(assert (=> b!47501 (= e!31480 (tuple2!4547 Nil!542 (_1!2359 lt!72926)))))

(declare-fun b!47503 () Bool)

(declare-fun e!31479 () Bool)

(declare-fun lt!73729 () List!545)

(assert (=> b!47503 (= e!31479 (isEmpty!138 lt!73729))))

(declare-fun b!47504 () Bool)

(assert (=> b!47504 (= e!31479 (> (length!240 lt!73729) 0))))

(declare-fun b!47502 () Bool)

(declare-fun lt!73731 () (_ BitVec 64))

(declare-fun lt!73730 () tuple2!4548)

(assert (=> b!47502 (= e!31480 (tuple2!4547 (Cons!541 (_1!2367 lt!73730) (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_2!2367 lt!73730) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!73731))) (_2!2367 lt!73730)))))

(assert (=> b!47502 (= lt!73730 (readBit!0 (_1!2359 lt!72926)))))

(assert (=> b!47502 (= lt!73731 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!14148 () Bool)

(assert (=> d!14148 e!31479))

(declare-fun c!3277 () Bool)

(assert (=> d!14148 (= c!3277 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14148 (= lt!73729 (_1!2366 e!31480))))

(declare-fun c!3276 () Bool)

(assert (=> d!14148 (= c!3276 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14148 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14148 (= (bitStreamReadBitsIntoList!0 (_2!2360 lt!72896) (_1!2359 lt!72926) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!73729)))

(assert (= (and d!14148 c!3276) b!47501))

(assert (= (and d!14148 (not c!3276)) b!47502))

(assert (= (and d!14148 c!3277) b!47503))

(assert (= (and d!14148 (not c!3277)) b!47504))

(declare-fun m!73321 () Bool)

(assert (=> b!47503 m!73321))

(declare-fun m!73323 () Bool)

(assert (=> b!47504 m!73323))

(declare-fun m!73325 () Bool)

(assert (=> b!47502 m!73325))

(declare-fun m!73327 () Bool)

(assert (=> b!47502 m!73327))

(assert (=> b!47030 d!14148))

(declare-fun d!14150 () Bool)

(assert (=> d!14150 (= (tail!231 lt!72886) (t!1295 lt!72886))))

(assert (=> b!47030 d!14150))

(declare-fun d!14152 () Bool)

(declare-fun e!31486 () Bool)

(assert (=> d!14152 e!31486))

(declare-fun res!40002 () Bool)

(assert (=> d!14152 (=> (not res!40002) (not e!31486))))

(declare-fun lt!73740 () tuple2!4534)

(assert (=> d!14152 (= res!40002 (= (size!1038 (buf!1387 thiss!1379)) (size!1038 (buf!1387 (_2!2360 lt!73740)))))))

(declare-fun choose!16 (BitStream!1808 Bool) tuple2!4534)

(assert (=> d!14152 (= lt!73740 (choose!16 thiss!1379 lt!73078))))

(assert (=> d!14152 (validate_offset_bit!0 ((_ sign_extend 32) (size!1038 (buf!1387 thiss!1379))) ((_ sign_extend 32) (currentByte!2892 thiss!1379)) ((_ sign_extend 32) (currentBit!2887 thiss!1379)))))

(assert (=> d!14152 (= (appendBit!0 thiss!1379 lt!73078) lt!73740)))

(declare-fun b!47516 () Bool)

(declare-fun e!31485 () Bool)

(assert (=> b!47516 (= e!31486 e!31485)))

(declare-fun res!40000 () Bool)

(assert (=> b!47516 (=> (not res!40000) (not e!31485))))

(declare-fun lt!73741 () tuple2!4550)

(assert (=> b!47516 (= res!40000 (and (= (_2!2368 lt!73741) lt!73078) (= (_1!2368 lt!73741) (_2!2360 lt!73740))))))

(assert (=> b!47516 (= lt!73741 (readBitPure!0 (readerFrom!0 (_2!2360 lt!73740) (currentBit!2887 thiss!1379) (currentByte!2892 thiss!1379))))))

(declare-fun b!47514 () Bool)

(declare-fun res!39999 () Bool)

(assert (=> b!47514 (=> (not res!39999) (not e!31486))))

(declare-fun lt!73743 () (_ BitVec 64))

(declare-fun lt!73742 () (_ BitVec 64))

(assert (=> b!47514 (= res!39999 (= (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73740))) (currentByte!2892 (_2!2360 lt!73740)) (currentBit!2887 (_2!2360 lt!73740))) (bvadd lt!73743 lt!73742)))))

(assert (=> b!47514 (or (not (= (bvand lt!73743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73742 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73743 lt!73742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47514 (= lt!73742 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47514 (= lt!73743 (bitIndex!0 (size!1038 (buf!1387 thiss!1379)) (currentByte!2892 thiss!1379) (currentBit!2887 thiss!1379)))))

(declare-fun b!47517 () Bool)

(assert (=> b!47517 (= e!31485 (= (bitIndex!0 (size!1038 (buf!1387 (_1!2368 lt!73741))) (currentByte!2892 (_1!2368 lt!73741)) (currentBit!2887 (_1!2368 lt!73741))) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!73740))) (currentByte!2892 (_2!2360 lt!73740)) (currentBit!2887 (_2!2360 lt!73740)))))))

(declare-fun b!47515 () Bool)

(declare-fun res!40001 () Bool)

(assert (=> b!47515 (=> (not res!40001) (not e!31486))))

(assert (=> b!47515 (= res!40001 (isPrefixOf!0 thiss!1379 (_2!2360 lt!73740)))))

(assert (= (and d!14152 res!40002) b!47514))

(assert (= (and b!47514 res!39999) b!47515))

(assert (= (and b!47515 res!40001) b!47516))

(assert (= (and b!47516 res!40000) b!47517))

(declare-fun m!73329 () Bool)

(assert (=> b!47517 m!73329))

(declare-fun m!73331 () Bool)

(assert (=> b!47517 m!73331))

(declare-fun m!73333 () Bool)

(assert (=> b!47515 m!73333))

(declare-fun m!73335 () Bool)

(assert (=> b!47516 m!73335))

(assert (=> b!47516 m!73335))

(declare-fun m!73337 () Bool)

(assert (=> b!47516 m!73337))

(assert (=> b!47514 m!73331))

(assert (=> b!47514 m!71901))

(declare-fun m!73339 () Bool)

(assert (=> d!14152 m!73339))

(declare-fun m!73341 () Bool)

(assert (=> d!14152 m!73341))

(assert (=> d!13830 d!14152))

(assert (=> d!13850 d!14024))

(assert (=> d!13850 d!14014))

(declare-fun d!14154 () Bool)

(declare-fun res!40007 () Bool)

(declare-fun e!31491 () Bool)

(assert (=> d!14154 (=> res!40007 e!31491)))

(assert (=> d!14154 (= res!40007 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14154 (= (checkByteArrayBitContent!0 (_2!2360 lt!72395) srcBuffer!2 (_1!2365 (readBits!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31491)))

(declare-fun b!47522 () Bool)

(declare-fun e!31492 () Bool)

(assert (=> b!47522 (= e!31491 e!31492)))

(declare-fun res!40008 () Bool)

(assert (=> b!47522 (=> (not res!40008) (not e!31492))))

(assert (=> b!47522 (= res!40008 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1558 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1558 (_1!2365 (readBits!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!47523 () Bool)

(assert (=> b!47523 (= e!31492 (checkByteArrayBitContent!0 (_2!2360 lt!72395) srcBuffer!2 (_1!2365 (readBits!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14154 (not res!40007)) b!47522))

(assert (= (and b!47522 res!40008) b!47523))

(assert (=> b!47522 m!72237))

(assert (=> b!47522 m!73063))

(declare-fun m!73343 () Bool)

(assert (=> b!47522 m!73343))

(declare-fun m!73345 () Bool)

(assert (=> b!47522 m!73345))

(declare-fun m!73347 () Bool)

(assert (=> b!47523 m!73347))

(assert (=> b!47032 d!14154))

(declare-fun b!47524 () Bool)

(declare-fun res!40010 () Bool)

(declare-fun e!31493 () Bool)

(assert (=> b!47524 (=> (not res!40010) (not e!31493))))

(declare-fun lt!73749 () tuple2!4544)

(assert (=> b!47524 (= res!40010 (bvsle (currentByte!2892 (_1!2359 call!568)) (currentByte!2892 (_2!2365 lt!73749))))))

(declare-fun d!14156 () Bool)

(assert (=> d!14156 e!31493))

(declare-fun res!40013 () Bool)

(assert (=> d!14156 (=> (not res!40013) (not e!31493))))

(assert (=> d!14156 (= res!40013 (= (buf!1387 (_2!2365 lt!73749)) (buf!1387 (_1!2359 call!568))))))

(declare-fun lt!73751 () tuple3!172)

(assert (=> d!14156 (= lt!73749 (tuple2!4545 (_3!94 lt!73751) (_2!2374 lt!73751)))))

(assert (=> d!14156 (= lt!73751 (readBitsLoop!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2298 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14156 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!14156 (= (readBits!0 (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!73749)))

(declare-fun b!47525 () Bool)

(declare-fun res!40011 () Bool)

(assert (=> b!47525 (=> (not res!40011) (not e!31493))))

(declare-fun lt!73744 () (_ BitVec 64))

(assert (=> b!47525 (= res!40011 (= (bvadd lt!73744 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1038 (buf!1387 (_2!2365 lt!73749))) (currentByte!2892 (_2!2365 lt!73749)) (currentBit!2887 (_2!2365 lt!73749)))))))

(assert (=> b!47525 (or (not (= (bvand lt!73744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!73744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!73744 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47525 (= lt!73744 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 call!568))) (currentByte!2892 (_1!2359 call!568)) (currentBit!2887 (_1!2359 call!568))))))

(declare-fun b!47526 () Bool)

(assert (=> b!47526 (= e!31493 (= (byteArrayBitContentToList!0 (_2!2365 lt!73749) (_1!2365 lt!73749) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2365 lt!73749) (_1!2359 call!568) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!47527 () Bool)

(declare-fun res!40012 () Bool)

(assert (=> b!47527 (=> (not res!40012) (not e!31493))))

(assert (=> b!47527 (= res!40012 (invariant!0 (currentBit!2887 (_2!2365 lt!73749)) (currentByte!2892 (_2!2365 lt!73749)) (size!1038 (buf!1387 (_2!2365 lt!73749)))))))

(declare-fun b!47528 () Bool)

(declare-fun res!40009 () Bool)

(assert (=> b!47528 (=> (not res!40009) (not e!31493))))

(declare-fun lt!73745 () (_ BitVec 64))

(assert (=> b!47528 (= res!40009 (= (size!1038 (_1!2365 lt!73749)) ((_ extract 31 0) lt!73745)))))

(assert (=> b!47528 (and (bvslt lt!73745 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!73745 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!73750 () (_ BitVec 64))

(declare-fun lt!73752 () (_ BitVec 64))

(assert (=> b!47528 (= lt!73745 (bvsdiv lt!73750 lt!73752))))

(assert (=> b!47528 (and (not (= lt!73752 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!73750 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!73752 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!47528 (= lt!73752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!73748 () (_ BitVec 64))

(declare-fun lt!73747 () (_ BitVec 64))

(assert (=> b!47528 (= lt!73750 (bvsub lt!73748 lt!73747))))

(assert (=> b!47528 (or (= (bvand lt!73748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!73748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!73748 lt!73747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47528 (= lt!73747 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!73746 () (_ BitVec 64))

(assert (=> b!47528 (= lt!73748 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!73746))))

(assert (=> b!47528 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!73746 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!73746) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47528 (= lt!73746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!14156 res!40013) b!47525))

(assert (= (and b!47525 res!40011) b!47527))

(assert (= (and b!47527 res!40012) b!47528))

(assert (= (and b!47528 res!40009) b!47524))

(assert (= (and b!47524 res!40010) b!47526))

(declare-fun m!73349 () Bool)

(assert (=> d!14156 m!73349))

(declare-fun m!73351 () Bool)

(assert (=> b!47525 m!73351))

(declare-fun m!73353 () Bool)

(assert (=> b!47525 m!73353))

(declare-fun m!73355 () Bool)

(assert (=> b!47526 m!73355))

(declare-fun m!73357 () Bool)

(assert (=> b!47526 m!73357))

(declare-fun m!73359 () Bool)

(assert (=> b!47527 m!73359))

(assert (=> b!47032 d!14156))

(declare-fun d!14158 () Bool)

(assert (=> d!14158 (isPrefixOf!0 lt!73164 (_2!2360 lt!72389))))

(declare-fun lt!73753 () Unit!3313)

(assert (=> d!14158 (= lt!73753 (choose!30 lt!73164 (_2!2360 lt!72389) (_2!2360 lt!72389)))))

(assert (=> d!14158 (isPrefixOf!0 lt!73164 (_2!2360 lt!72389))))

(assert (=> d!14158 (= (lemmaIsPrefixTransitive!0 lt!73164 (_2!2360 lt!72389) (_2!2360 lt!72389)) lt!73753)))

(declare-fun bs!3682 () Bool)

(assert (= bs!3682 d!14158))

(assert (=> bs!3682 m!72475))

(declare-fun m!73361 () Bool)

(assert (=> bs!3682 m!73361))

(assert (=> bs!3682 m!72475))

(assert (=> d!13872 d!14158))

(assert (=> d!13872 d!14056))

(declare-fun d!14160 () Bool)

(declare-fun res!40016 () Bool)

(declare-fun e!31494 () Bool)

(assert (=> d!14160 (=> (not res!40016) (not e!31494))))

(assert (=> d!14160 (= res!40016 (= (size!1038 (buf!1387 lt!73164)) (size!1038 (buf!1387 (_2!2360 lt!72389)))))))

(assert (=> d!14160 (= (isPrefixOf!0 lt!73164 (_2!2360 lt!72389)) e!31494)))

(declare-fun b!47529 () Bool)

(declare-fun res!40015 () Bool)

(assert (=> b!47529 (=> (not res!40015) (not e!31494))))

(assert (=> b!47529 (= res!40015 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!73164)) (currentByte!2892 lt!73164) (currentBit!2887 lt!73164)) (bitIndex!0 (size!1038 (buf!1387 (_2!2360 lt!72389))) (currentByte!2892 (_2!2360 lt!72389)) (currentBit!2887 (_2!2360 lt!72389)))))))

(declare-fun b!47530 () Bool)

(declare-fun e!31495 () Bool)

(assert (=> b!47530 (= e!31494 e!31495)))

(declare-fun res!40014 () Bool)

(assert (=> b!47530 (=> res!40014 e!31495)))

(assert (=> b!47530 (= res!40014 (= (size!1038 (buf!1387 lt!73164)) #b00000000000000000000000000000000))))

(declare-fun b!47531 () Bool)

(assert (=> b!47531 (= e!31495 (arrayBitRangesEq!0 (buf!1387 lt!73164) (buf!1387 (_2!2360 lt!72389)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!73164)) (currentByte!2892 lt!73164) (currentBit!2887 lt!73164))))))

(assert (= (and d!14160 res!40016) b!47529))

(assert (= (and b!47529 res!40015) b!47530))

(assert (= (and b!47530 (not res!40014)) b!47531))

(declare-fun m!73363 () Bool)

(assert (=> b!47529 m!73363))

(assert (=> b!47529 m!71895))

(assert (=> b!47531 m!73363))

(assert (=> b!47531 m!73363))

(declare-fun m!73365 () Bool)

(assert (=> b!47531 m!73365))

(assert (=> d!13872 d!14160))

(declare-fun d!14162 () Bool)

(assert (=> d!14162 (isPrefixOf!0 lt!73164 (_2!2360 lt!72389))))

(declare-fun lt!73754 () Unit!3313)

(assert (=> d!14162 (= lt!73754 (choose!30 lt!73164 (_2!2360 lt!72395) (_2!2360 lt!72389)))))

(assert (=> d!14162 (isPrefixOf!0 lt!73164 (_2!2360 lt!72395))))

(assert (=> d!14162 (= (lemmaIsPrefixTransitive!0 lt!73164 (_2!2360 lt!72395) (_2!2360 lt!72389)) lt!73754)))

(declare-fun bs!3683 () Bool)

(assert (= bs!3683 d!14162))

(assert (=> bs!3683 m!72475))

(declare-fun m!73367 () Bool)

(assert (=> bs!3683 m!73367))

(declare-fun m!73369 () Bool)

(assert (=> bs!3683 m!73369))

(assert (=> d!13872 d!14162))

(declare-fun d!14164 () Bool)

(declare-fun res!40019 () Bool)

(declare-fun e!31496 () Bool)

(assert (=> d!14164 (=> (not res!40019) (not e!31496))))

(assert (=> d!14164 (= res!40019 (= (size!1038 (buf!1387 lt!73164)) (size!1038 (buf!1387 lt!73164))))))

(assert (=> d!14164 (= (isPrefixOf!0 lt!73164 lt!73164) e!31496)))

(declare-fun b!47532 () Bool)

(declare-fun res!40018 () Bool)

(assert (=> b!47532 (=> (not res!40018) (not e!31496))))

(assert (=> b!47532 (= res!40018 (bvsle (bitIndex!0 (size!1038 (buf!1387 lt!73164)) (currentByte!2892 lt!73164) (currentBit!2887 lt!73164)) (bitIndex!0 (size!1038 (buf!1387 lt!73164)) (currentByte!2892 lt!73164) (currentBit!2887 lt!73164))))))

(declare-fun b!47533 () Bool)

(declare-fun e!31497 () Bool)

(assert (=> b!47533 (= e!31496 e!31497)))

(declare-fun res!40017 () Bool)

(assert (=> b!47533 (=> res!40017 e!31497)))

(assert (=> b!47533 (= res!40017 (= (size!1038 (buf!1387 lt!73164)) #b00000000000000000000000000000000))))

(declare-fun b!47534 () Bool)

(assert (=> b!47534 (= e!31497 (arrayBitRangesEq!0 (buf!1387 lt!73164) (buf!1387 lt!73164) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 lt!73164)) (currentByte!2892 lt!73164) (currentBit!2887 lt!73164))))))

(assert (= (and d!14164 res!40019) b!47532))

(assert (= (and b!47532 res!40018) b!47533))

(assert (= (and b!47533 (not res!40017)) b!47534))

(assert (=> b!47532 m!73363))

(assert (=> b!47532 m!73363))

(assert (=> b!47534 m!73363))

(assert (=> b!47534 m!73363))

(declare-fun m!73371 () Bool)

(assert (=> b!47534 m!73371))

(assert (=> d!13872 d!14164))

(assert (=> d!13872 d!13996))

(assert (=> d!13872 d!13998))

(declare-fun d!14166 () Bool)

(assert (=> d!14166 (isPrefixOf!0 lt!73164 lt!73164)))

(declare-fun lt!73755 () Unit!3313)

(assert (=> d!14166 (= lt!73755 (choose!11 lt!73164))))

(assert (=> d!14166 (= (lemmaIsPrefixRefl!0 lt!73164) lt!73755)))

(declare-fun bs!3684 () Bool)

(assert (= bs!3684 d!14166))

(assert (=> bs!3684 m!72479))

(declare-fun m!73373 () Bool)

(assert (=> bs!3684 m!73373))

(assert (=> d!13872 d!14166))

(assert (=> d!13872 d!14052))

(declare-fun d!14168 () Bool)

(declare-fun res!40022 () Bool)

(declare-fun e!31498 () Bool)

(assert (=> d!14168 (=> (not res!40022) (not e!31498))))

(assert (=> d!14168 (= res!40022 (= (size!1038 (buf!1387 (_1!2359 lt!73163))) (size!1038 (buf!1387 (_2!2359 lt!73163)))))))

(assert (=> d!14168 (= (isPrefixOf!0 (_1!2359 lt!73163) (_2!2359 lt!73163)) e!31498)))

(declare-fun b!47535 () Bool)

(declare-fun res!40021 () Bool)

(assert (=> b!47535 (=> (not res!40021) (not e!31498))))

(assert (=> b!47535 (= res!40021 (bvsle (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73163))) (currentByte!2892 (_1!2359 lt!73163)) (currentBit!2887 (_1!2359 lt!73163))) (bitIndex!0 (size!1038 (buf!1387 (_2!2359 lt!73163))) (currentByte!2892 (_2!2359 lt!73163)) (currentBit!2887 (_2!2359 lt!73163)))))))

(declare-fun b!47536 () Bool)

(declare-fun e!31499 () Bool)

(assert (=> b!47536 (= e!31498 e!31499)))

(declare-fun res!40020 () Bool)

(assert (=> b!47536 (=> res!40020 e!31499)))

(assert (=> b!47536 (= res!40020 (= (size!1038 (buf!1387 (_1!2359 lt!73163))) #b00000000000000000000000000000000))))

(declare-fun b!47537 () Bool)

(assert (=> b!47537 (= e!31499 (arrayBitRangesEq!0 (buf!1387 (_1!2359 lt!73163)) (buf!1387 (_2!2359 lt!73163)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1038 (buf!1387 (_1!2359 lt!73163))) (currentByte!2892 (_1!2359 lt!73163)) (currentBit!2887 (_1!2359 lt!73163)))))))

(assert (= (and d!14168 res!40022) b!47535))

(assert (= (and b!47535 res!40021) b!47536))

(assert (= (and b!47536 (not res!40020)) b!47537))

(assert (=> b!47535 m!72797))

(assert (=> b!47535 m!73021))

(assert (=> b!47537 m!72797))

(assert (=> b!47537 m!72797))

(declare-fun m!73375 () Bool)

(assert (=> b!47537 m!73375))

(assert (=> d!13872 d!14168))

(assert (=> d!13872 d!13788))

(assert (=> d!13844 d!13938))

(assert (=> d!13844 d!13880))

(push 1)

(assert (not b!47361))

(assert (not b!47486))

(assert (not b!47313))

(assert (not b!47465))

(assert (not b!47320))

(assert (not d!13982))

(assert (not b!47478))

(assert (not b!47437))

(assert (not b!47499))

(assert (not b!47296))

(assert (not d!14040))

(assert (not d!13996))

(assert (not b!47449))

(assert (not bm!578))

(assert (not b!47382))

(assert (not b!47374))

(assert (not b!47325))

(assert (not d!14038))

(assert (not b!47496))

(assert (not b!47435))

(assert (not d!14158))

(assert (not d!13984))

(assert (not d!14162))

(assert (not b!47516))

(assert (not b!47352))

(assert (not d!14074))

(assert (not b!47425))

(assert (not b!47424))

(assert (not d!13944))

(assert (not d!14102))

(assert (not b!47469))

(assert (not b!47479))

(assert (not b!47401))

(assert (not bm!573))

(assert (not b!47341))

(assert (not b!47428))

(assert (not b!47440))

(assert (not b!47404))

(assert (not d!13990))

(assert (not b!47464))

(assert (not b!47330))

(assert (not b!47285))

(assert (not b!47315))

(assert (not d!13920))

(assert (not d!13940))

(assert (not b!47474))

(assert (not d!14130))

(assert (not d!14092))

(assert (not d!13992))

(assert (not b!47416))

(assert (not d!13956))

(assert (not d!14008))

(assert (not d!13978))

(assert (not b!47370))

(assert (not b!47270))

(assert (not b!47364))

(assert (not b!47462))

(assert (not d!13946))

(assert (not b!47480))

(assert (not b!47456))

(assert (not b!47535))

(assert (not b!47531))

(assert (not b!47453))

(assert (not b!47537))

(assert (not d!14166))

(assert (not b!47472))

(assert (not d!14016))

(assert (not b!47400))

(assert (not b!47402))

(assert (not b!47481))

(assert (not d!14140))

(assert (not b!47365))

(assert (not b!47280))

(assert (not b!47383))

(assert (not b!47523))

(assert (not b!47334))

(assert (not d!14118))

(assert (not b!47355))

(assert (not b!47350))

(assert (not b!47455))

(assert (not b!47419))

(assert (not b!47398))

(assert (not b!47377))

(assert (not b!47429))

(assert (not b!47434))

(assert (not b!47371))

(assert (not b!47498))

(assert (not d!14126))

(assert (not b!47470))

(assert (not d!14068))

(assert (not b!47277))

(assert (not b!47347))

(assert (not d!14124))

(assert (not d!14110))

(assert (not b!47284))

(assert (not b!47451))

(assert (not d!14000))

(assert (not b!47408))

(assert (not b!47356))

(assert (not b!47282))

(assert (not d!14136))

(assert (not b!47359))

(assert (not b!47475))

(assert (not b!47489))

(assert (not d!13954))

(assert (not b!47532))

(assert (not b!47473))

(assert (not b!47332))

(assert (not b!47488))

(assert (not b!47297))

(assert (not b!47514))

(assert (not d!14142))

(assert (not b!47420))

(assert (not d!13980))

(assert (not b!47452))

(assert (not b!47492))

(assert (not d!14004))

(assert (not d!14070))

(assert (not b!47394))

(assert (not b!47442))

(assert (not b!47392))

(assert (not b!47358))

(assert (not d!13942))

(assert (not b!47525))

(assert (not b!47484))

(assert (not b!47490))

(assert (not d!14104))

(assert (not b!47476))

(assert (not d!14134))

(assert (not b!47379))

(assert (not bm!574))

(assert (not d!14002))

(assert (not d!14128))

(assert (not d!13968))

(assert (not d!14088))

(assert (not b!47471))

(assert (not b!47298))

(assert (not d!14152))

(assert (not d!14066))

(assert (not b!47515))

(assert (not b!47504))

(assert (not b!47527))

(assert (not b!47287))

(assert (not b!47322))

(assert (not d!14062))

(assert (not b!47346))

(assert (not bm!571))

(assert (not b!47385))

(assert (not d!14078))

(assert (not b!47353))

(assert (not b!47445))

(assert (not d!14132))

(assert (not b!47275))

(assert (not b!47526))

(assert (not b!47319))

(assert (not b!47344))

(assert (not b!47414))

(assert (not b!47494))

(assert (not d!13960))

(assert (not bm!577))

(assert (not b!47458))

(assert (not b!47362))

(assert (not d!14020))

(assert (not b!47426))

(assert (not d!14026))

(assert (not b!47447))

(assert (not d!14022))

(assert (not b!47418))

(assert (not d!14116))

(assert (not b!47369))

(assert (not b!47405))

(assert (not b!47460))

(assert (not b!47323))

(assert (not d!14114))

(assert (not b!47463))

(assert (not b!47433))

(assert (not b!47337))

(assert (not b!47529))

(assert (not b!47407))

(assert (not d!14010))

(assert (not bm!576))

(assert (not b!47380))

(assert (not d!13948))

(assert (not b!47503))

(assert (not b!47413))

(assert (not d!14156))

(assert (not d!13952))

(assert (not b!47314))

(assert (not b!47368))

(assert (not d!13958))

(assert (not b!47502))

(assert (not d!14056))

(assert (not b!47301))

(assert (not d!14112))

(assert (not bm!572))

(assert (not d!13926))

(assert (not b!47339))

(assert (not d!14064))

(assert (not b!47534))

(assert (not b!47459))

(assert (not b!47273))

(assert (not b!47431))

(assert (not d!13936))

(assert (not b!47399))

(assert (not b!47457))

(assert (not b!47410))

(assert (not bm!575))

(assert (not b!47500))

(assert (not b!47391))

(assert (not b!47491))

(assert (not b!47517))

(assert (not b!47363))

(assert (not d!14044))

(assert (not d!14046))

(assert (not b!47411))

(assert (not b!47421))

(assert (not b!47327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

