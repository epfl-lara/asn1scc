; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12014 () Bool)

(assert start!12014)

(declare-fun res!51042 () Bool)

(declare-fun e!40827 () Bool)

(assert (=> start!12014 (=> (not res!51042) (not e!40827))))

(declare-datatypes ((array!2772 0))(
  ( (array!2773 (arr!1827 (Array (_ BitVec 32) (_ BitVec 8))) (size!1263 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2772)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12014 (= res!51042 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1263 srcBuffer!2))))))))

(assert (=> start!12014 e!40827))

(assert (=> start!12014 true))

(declare-fun array_inv!1163 (array!2772) Bool)

(assert (=> start!12014 (array_inv!1163 srcBuffer!2)))

(declare-datatypes ((BitStream!2208 0))(
  ( (BitStream!2209 (buf!1644 array!2772) (currentByte!3268 (_ BitVec 32)) (currentBit!3263 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2208)

(declare-fun e!40819 () Bool)

(declare-fun inv!12 (BitStream!2208) Bool)

(assert (=> start!12014 (and (inv!12 thiss!1379) e!40819)))

(declare-fun b!61227 () Bool)

(declare-fun e!40821 () Bool)

(declare-fun e!40825 () Bool)

(assert (=> b!61227 (= e!40821 e!40825)))

(declare-fun res!51040 () Bool)

(assert (=> b!61227 (=> res!51040 e!40825)))

(assert (=> b!61227 (= res!51040 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!679 0))(
  ( (Nil!676) (Cons!675 (h!794 Bool) (t!1429 List!679)) )
))
(declare-fun lt!95701 () List!679)

(declare-datatypes ((tuple2!5562 0))(
  ( (tuple2!5563 (_1!2892 BitStream!2208) (_2!2892 BitStream!2208)) )
))
(declare-fun lt!95691 () tuple2!5562)

(declare-datatypes ((Unit!4173 0))(
  ( (Unit!4174) )
))
(declare-datatypes ((tuple2!5564 0))(
  ( (tuple2!5565 (_1!2893 Unit!4173) (_2!2893 BitStream!2208)) )
))
(declare-fun lt!95697 () tuple2!5564)

(declare-fun lt!95699 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2208 BitStream!2208 (_ BitVec 64)) List!679)

(assert (=> b!61227 (= lt!95701 (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_1!2892 lt!95691) lt!95699))))

(declare-fun lt!95689 () List!679)

(declare-fun lt!95700 () tuple2!5562)

(assert (=> b!61227 (= lt!95689 (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_1!2892 lt!95700) (bvsub to!314 i!635)))))

(declare-fun lt!95687 () tuple2!5564)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!95699)))

(declare-fun lt!95696 () Unit!4173)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2208 array!2772 (_ BitVec 64)) Unit!4173)

(assert (=> b!61227 (= lt!95696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!95697)) lt!95699))))

(declare-fun reader!0 (BitStream!2208 BitStream!2208) tuple2!5562)

(assert (=> b!61227 (= lt!95691 (reader!0 (_2!2893 lt!95687) (_2!2893 lt!95697)))))

(assert (=> b!61227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95688 () Unit!4173)

(assert (=> b!61227 (= lt!95688 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1644 (_2!2893 lt!95697)) (bvsub to!314 i!635)))))

(assert (=> b!61227 (= lt!95700 (reader!0 thiss!1379 (_2!2893 lt!95697)))))

(declare-fun b!61228 () Bool)

(declare-fun e!40826 () Bool)

(assert (=> b!61228 (= e!40826 e!40821)))

(declare-fun res!51039 () Bool)

(assert (=> b!61228 (=> res!51039 e!40821)))

(assert (=> b!61228 (= res!51039 (not (= (size!1263 (buf!1644 (_2!2893 lt!95687))) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))

(declare-fun e!40818 () Bool)

(assert (=> b!61228 e!40818))

(declare-fun res!51037 () Bool)

(assert (=> b!61228 (=> (not res!51037) (not e!40818))))

(assert (=> b!61228 (= res!51037 (= (size!1263 (buf!1644 (_2!2893 lt!95697))) (size!1263 (buf!1644 thiss!1379))))))

(declare-fun b!61229 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2208 BitStream!2208) Bool)

(assert (=> b!61229 (= e!40825 (isPrefixOf!0 (_1!2892 lt!95691) (_2!2893 lt!95697)))))

(declare-fun b!61230 () Bool)

(declare-fun e!40820 () Bool)

(declare-fun e!40829 () Bool)

(assert (=> b!61230 (= e!40820 e!40829)))

(declare-fun res!51043 () Bool)

(assert (=> b!61230 (=> res!51043 e!40829)))

(assert (=> b!61230 (= res!51043 (not (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95697))))))

(assert (=> b!61230 (isPrefixOf!0 thiss!1379 (_2!2893 lt!95697))))

(declare-fun lt!95686 () Unit!4173)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2208 BitStream!2208 BitStream!2208) Unit!4173)

(assert (=> b!61230 (= lt!95686 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2893 lt!95687) (_2!2893 lt!95697)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2208 array!2772 (_ BitVec 64) (_ BitVec 64)) tuple2!5564)

(assert (=> b!61230 (= lt!95697 (appendBitsMSBFirstLoop!0 (_2!2893 lt!95687) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40823 () Bool)

(assert (=> b!61230 e!40823))

(declare-fun res!51031 () Bool)

(assert (=> b!61230 (=> (not res!51031) (not e!40823))))

(assert (=> b!61230 (= res!51031 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95692 () Unit!4173)

(assert (=> b!61230 (= lt!95692 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1644 (_2!2893 lt!95687)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95693 () tuple2!5562)

(assert (=> b!61230 (= lt!95693 (reader!0 thiss!1379 (_2!2893 lt!95687)))))

(declare-fun b!61231 () Bool)

(declare-fun res!51045 () Bool)

(assert (=> b!61231 (=> res!51045 e!40825)))

(assert (=> b!61231 (= res!51045 (not (isPrefixOf!0 (_1!2892 lt!95700) (_2!2893 lt!95697))))))

(declare-fun b!61232 () Bool)

(declare-fun res!51038 () Bool)

(assert (=> b!61232 (=> (not res!51038) (not e!40827))))

(assert (=> b!61232 (= res!51038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61233 () Bool)

(declare-fun res!51034 () Bool)

(assert (=> b!61233 (=> res!51034 e!40826)))

(assert (=> b!61233 (= res!51034 (not (= (size!1263 (buf!1644 thiss!1379)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))

(declare-fun b!61234 () Bool)

(declare-fun e!40824 () Bool)

(assert (=> b!61234 (= e!40824 e!40820)))

(declare-fun res!51041 () Bool)

(assert (=> b!61234 (=> res!51041 e!40820)))

(assert (=> b!61234 (= res!51041 (not (isPrefixOf!0 thiss!1379 (_2!2893 lt!95687))))))

(assert (=> b!61234 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!95699)))

(assert (=> b!61234 (= lt!95699 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95698 () Unit!4173)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2208 BitStream!2208 (_ BitVec 64) (_ BitVec 64)) Unit!4173)

(assert (=> b!61234 (= lt!95698 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2893 lt!95687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2208 (_ BitVec 8) (_ BitVec 32)) tuple2!5564)

(assert (=> b!61234 (= lt!95687 (appendBitFromByte!0 thiss!1379 (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61235 () Bool)

(declare-fun res!51030 () Bool)

(assert (=> b!61235 (=> res!51030 e!40825)))

(declare-fun length!307 (List!679) Int)

(assert (=> b!61235 (= res!51030 (<= (length!307 lt!95689) 0))))

(declare-fun b!61236 () Bool)

(declare-fun res!51035 () Bool)

(assert (=> b!61236 (=> res!51035 e!40821)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61236 (= res!51035 (not (invariant!0 (currentBit!3263 (_2!2893 lt!95687)) (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95687))))))))

(declare-fun b!61237 () Bool)

(declare-fun res!51036 () Bool)

(assert (=> b!61237 (=> res!51036 e!40826)))

(assert (=> b!61237 (= res!51036 (not (invariant!0 (currentBit!3263 (_2!2893 lt!95697)) (currentByte!3268 (_2!2893 lt!95697)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))

(declare-fun b!61238 () Bool)

(assert (=> b!61238 (= e!40819 (array_inv!1163 (buf!1644 thiss!1379)))))

(declare-fun b!61239 () Bool)

(declare-fun res!51033 () Bool)

(assert (=> b!61239 (=> res!51033 e!40821)))

(assert (=> b!61239 (= res!51033 (not (invariant!0 (currentBit!3263 (_2!2893 lt!95687)) (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))

(declare-fun b!61240 () Bool)

(assert (=> b!61240 (= e!40827 (not e!40824))))

(declare-fun res!51032 () Bool)

(assert (=> b!61240 (=> res!51032 e!40824)))

(assert (=> b!61240 (= res!51032 (bvsge i!635 to!314))))

(assert (=> b!61240 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!95695 () Unit!4173)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2208) Unit!4173)

(assert (=> b!61240 (= lt!95695 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!95690 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61240 (= lt!95690 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(declare-fun b!61241 () Bool)

(declare-fun lt!95694 () (_ BitVec 64))

(assert (=> b!61241 (= e!40818 (= lt!95694 (bvsub (bvsub (bvadd (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61242 () Bool)

(assert (=> b!61242 (= e!40829 e!40826)))

(declare-fun res!51044 () Bool)

(assert (=> b!61242 (=> res!51044 e!40826)))

(assert (=> b!61242 (= res!51044 (not (= lt!95694 (bvsub (bvadd lt!95690 to!314) i!635))))))

(assert (=> b!61242 (= lt!95694 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697))))))

(declare-fun b!61243 () Bool)

(declare-fun head!498 (List!679) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2208 array!2772 (_ BitVec 64) (_ BitVec 64)) List!679)

(assert (=> b!61243 (= e!40823 (= (head!498 (byteArrayBitContentToList!0 (_2!2893 lt!95687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!498 (bitStreamReadBitsIntoList!0 (_2!2893 lt!95687) (_1!2892 lt!95693) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!12014 res!51042) b!61232))

(assert (= (and b!61232 res!51038) b!61240))

(assert (= (and b!61240 (not res!51032)) b!61234))

(assert (= (and b!61234 (not res!51041)) b!61230))

(assert (= (and b!61230 res!51031) b!61243))

(assert (= (and b!61230 (not res!51043)) b!61242))

(assert (= (and b!61242 (not res!51044)) b!61237))

(assert (= (and b!61237 (not res!51036)) b!61233))

(assert (= (and b!61233 (not res!51034)) b!61228))

(assert (= (and b!61228 res!51037) b!61241))

(assert (= (and b!61228 (not res!51039)) b!61236))

(assert (= (and b!61236 (not res!51035)) b!61239))

(assert (= (and b!61239 (not res!51033)) b!61227))

(assert (= (and b!61227 (not res!51040)) b!61235))

(assert (= (and b!61235 (not res!51030)) b!61231))

(assert (= (and b!61231 (not res!51045)) b!61229))

(assert (= start!12014 b!61238))

(declare-fun m!96613 () Bool)

(assert (=> b!61227 m!96613))

(declare-fun m!96615 () Bool)

(assert (=> b!61227 m!96615))

(declare-fun m!96617 () Bool)

(assert (=> b!61227 m!96617))

(declare-fun m!96619 () Bool)

(assert (=> b!61227 m!96619))

(declare-fun m!96621 () Bool)

(assert (=> b!61227 m!96621))

(declare-fun m!96623 () Bool)

(assert (=> b!61227 m!96623))

(declare-fun m!96625 () Bool)

(assert (=> b!61227 m!96625))

(declare-fun m!96627 () Bool)

(assert (=> b!61227 m!96627))

(declare-fun m!96629 () Bool)

(assert (=> b!61241 m!96629))

(declare-fun m!96631 () Bool)

(assert (=> b!61240 m!96631))

(declare-fun m!96633 () Bool)

(assert (=> b!61240 m!96633))

(declare-fun m!96635 () Bool)

(assert (=> b!61240 m!96635))

(declare-fun m!96637 () Bool)

(assert (=> b!61230 m!96637))

(declare-fun m!96639 () Bool)

(assert (=> b!61230 m!96639))

(declare-fun m!96641 () Bool)

(assert (=> b!61230 m!96641))

(declare-fun m!96643 () Bool)

(assert (=> b!61230 m!96643))

(declare-fun m!96645 () Bool)

(assert (=> b!61230 m!96645))

(declare-fun m!96647 () Bool)

(assert (=> b!61230 m!96647))

(declare-fun m!96649 () Bool)

(assert (=> b!61230 m!96649))

(declare-fun m!96651 () Bool)

(assert (=> b!61236 m!96651))

(declare-fun m!96653 () Bool)

(assert (=> b!61232 m!96653))

(declare-fun m!96655 () Bool)

(assert (=> b!61231 m!96655))

(declare-fun m!96657 () Bool)

(assert (=> b!61238 m!96657))

(declare-fun m!96659 () Bool)

(assert (=> b!61239 m!96659))

(declare-fun m!96661 () Bool)

(assert (=> b!61237 m!96661))

(declare-fun m!96663 () Bool)

(assert (=> start!12014 m!96663))

(declare-fun m!96665 () Bool)

(assert (=> start!12014 m!96665))

(declare-fun m!96667 () Bool)

(assert (=> b!61242 m!96667))

(declare-fun m!96669 () Bool)

(assert (=> b!61229 m!96669))

(declare-fun m!96671 () Bool)

(assert (=> b!61234 m!96671))

(declare-fun m!96673 () Bool)

(assert (=> b!61234 m!96673))

(declare-fun m!96675 () Bool)

(assert (=> b!61234 m!96675))

(declare-fun m!96677 () Bool)

(assert (=> b!61234 m!96677))

(declare-fun m!96679 () Bool)

(assert (=> b!61234 m!96679))

(assert (=> b!61234 m!96675))

(declare-fun m!96681 () Bool)

(assert (=> b!61243 m!96681))

(assert (=> b!61243 m!96681))

(declare-fun m!96683 () Bool)

(assert (=> b!61243 m!96683))

(declare-fun m!96685 () Bool)

(assert (=> b!61243 m!96685))

(assert (=> b!61243 m!96685))

(declare-fun m!96687 () Bool)

(assert (=> b!61243 m!96687))

(declare-fun m!96689 () Bool)

(assert (=> b!61235 m!96689))

(check-sat (not b!61242) (not b!61234) (not b!61237) (not b!61241) (not b!61230) (not b!61243) (not b!61236) (not start!12014) (not b!61238) (not b!61231) (not b!61229) (not b!61240) (not b!61235) (not b!61239) (not b!61232) (not b!61227))
(check-sat)
(get-model)

(declare-fun d!18816 () Bool)

(assert (=> d!18816 (= (array_inv!1163 (buf!1644 thiss!1379)) (bvsge (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61238 d!18816))

(declare-fun d!18818 () Bool)

(assert (=> d!18818 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!95699)))

(declare-fun lt!95752 () Unit!4173)

(declare-fun choose!9 (BitStream!2208 array!2772 (_ BitVec 64) BitStream!2208) Unit!4173)

(assert (=> d!18818 (= lt!95752 (choose!9 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!95697)) lt!95699 (BitStream!2209 (buf!1644 (_2!2893 lt!95697)) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687)))))))

(assert (=> d!18818 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!95697)) lt!95699) lt!95752)))

(declare-fun bs!4707 () Bool)

(assert (= bs!4707 d!18818))

(assert (=> bs!4707 m!96613))

(declare-fun m!96769 () Bool)

(assert (=> bs!4707 m!96769))

(assert (=> b!61227 d!18818))

(declare-fun d!18820 () Bool)

(assert (=> d!18820 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95753 () Unit!4173)

(assert (=> d!18820 (= lt!95753 (choose!9 thiss!1379 (buf!1644 (_2!2893 lt!95697)) (bvsub to!314 i!635) (BitStream!2209 (buf!1644 (_2!2893 lt!95697)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(assert (=> d!18820 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1644 (_2!2893 lt!95697)) (bvsub to!314 i!635)) lt!95753)))

(declare-fun bs!4708 () Bool)

(assert (= bs!4708 d!18820))

(assert (=> bs!4708 m!96623))

(declare-fun m!96771 () Bool)

(assert (=> bs!4708 m!96771))

(assert (=> b!61227 d!18820))

(declare-fun b!61304 () Bool)

(declare-fun lt!95761 () (_ BitVec 64))

(declare-datatypes ((tuple2!5570 0))(
  ( (tuple2!5571 (_1!2896 Bool) (_2!2896 BitStream!2208)) )
))
(declare-fun lt!95760 () tuple2!5570)

(declare-datatypes ((tuple2!5572 0))(
  ( (tuple2!5573 (_1!2897 List!679) (_2!2897 BitStream!2208)) )
))
(declare-fun e!40870 () tuple2!5572)

(assert (=> b!61304 (= e!40870 (tuple2!5573 (Cons!675 (_1!2896 lt!95760) (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_2!2896 lt!95760) (bvsub (bvsub to!314 i!635) lt!95761))) (_2!2896 lt!95760)))))

(declare-fun readBit!0 (BitStream!2208) tuple2!5570)

(assert (=> b!61304 (= lt!95760 (readBit!0 (_1!2892 lt!95700)))))

(assert (=> b!61304 (= lt!95761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61303 () Bool)

(assert (=> b!61303 (= e!40870 (tuple2!5573 Nil!676 (_1!2892 lt!95700)))))

(declare-fun d!18822 () Bool)

(declare-fun e!40871 () Bool)

(assert (=> d!18822 e!40871))

(declare-fun c!4295 () Bool)

(assert (=> d!18822 (= c!4295 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!95762 () List!679)

(assert (=> d!18822 (= lt!95762 (_1!2897 e!40870))))

(declare-fun c!4296 () Bool)

(assert (=> d!18822 (= c!4296 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18822 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18822 (= (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_1!2892 lt!95700) (bvsub to!314 i!635)) lt!95762)))

(declare-fun b!61305 () Bool)

(declare-fun isEmpty!183 (List!679) Bool)

(assert (=> b!61305 (= e!40871 (isEmpty!183 lt!95762))))

(declare-fun b!61306 () Bool)

(assert (=> b!61306 (= e!40871 (> (length!307 lt!95762) 0))))

(assert (= (and d!18822 c!4296) b!61303))

(assert (= (and d!18822 (not c!4296)) b!61304))

(assert (= (and d!18822 c!4295) b!61305))

(assert (= (and d!18822 (not c!4295)) b!61306))

(declare-fun m!96773 () Bool)

(assert (=> b!61304 m!96773))

(declare-fun m!96775 () Bool)

(assert (=> b!61304 m!96775))

(declare-fun m!96777 () Bool)

(assert (=> b!61305 m!96777))

(declare-fun m!96779 () Bool)

(assert (=> b!61306 m!96779))

(assert (=> b!61227 d!18822))

(declare-fun d!18824 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!95699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687)))) lt!95699))))

(declare-fun bs!4709 () Bool)

(assert (= bs!4709 d!18824))

(declare-fun m!96781 () Bool)

(assert (=> bs!4709 m!96781))

(assert (=> b!61227 d!18824))

(declare-fun lt!95764 () (_ BitVec 64))

(declare-fun b!61308 () Bool)

(declare-fun lt!95763 () tuple2!5570)

(declare-fun e!40872 () tuple2!5572)

(assert (=> b!61308 (= e!40872 (tuple2!5573 (Cons!675 (_1!2896 lt!95763) (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_2!2896 lt!95763) (bvsub lt!95699 lt!95764))) (_2!2896 lt!95763)))))

(assert (=> b!61308 (= lt!95763 (readBit!0 (_1!2892 lt!95691)))))

(assert (=> b!61308 (= lt!95764 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61307 () Bool)

(assert (=> b!61307 (= e!40872 (tuple2!5573 Nil!676 (_1!2892 lt!95691)))))

(declare-fun d!18826 () Bool)

(declare-fun e!40873 () Bool)

(assert (=> d!18826 e!40873))

(declare-fun c!4297 () Bool)

(assert (=> d!18826 (= c!4297 (= lt!95699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!95765 () List!679)

(assert (=> d!18826 (= lt!95765 (_1!2897 e!40872))))

(declare-fun c!4298 () Bool)

(assert (=> d!18826 (= c!4298 (= lt!95699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18826 (bvsge lt!95699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18826 (= (bitStreamReadBitsIntoList!0 (_2!2893 lt!95697) (_1!2892 lt!95691) lt!95699) lt!95765)))

(declare-fun b!61309 () Bool)

(assert (=> b!61309 (= e!40873 (isEmpty!183 lt!95765))))

(declare-fun b!61310 () Bool)

(assert (=> b!61310 (= e!40873 (> (length!307 lt!95765) 0))))

(assert (= (and d!18826 c!4298) b!61307))

(assert (= (and d!18826 (not c!4298)) b!61308))

(assert (= (and d!18826 c!4297) b!61309))

(assert (= (and d!18826 (not c!4297)) b!61310))

(declare-fun m!96783 () Bool)

(assert (=> b!61308 m!96783))

(declare-fun m!96785 () Bool)

(assert (=> b!61308 m!96785))

(declare-fun m!96787 () Bool)

(assert (=> b!61309 m!96787))

(declare-fun m!96789 () Bool)

(assert (=> b!61310 m!96789))

(assert (=> b!61227 d!18826))

(declare-fun d!18828 () Bool)

(declare-fun e!40878 () Bool)

(assert (=> d!18828 e!40878))

(declare-fun res!51101 () Bool)

(assert (=> d!18828 (=> (not res!51101) (not e!40878))))

(declare-fun lt!95813 () tuple2!5562)

(assert (=> d!18828 (= res!51101 (isPrefixOf!0 (_1!2892 lt!95813) (_2!2892 lt!95813)))))

(declare-fun lt!95809 () BitStream!2208)

(assert (=> d!18828 (= lt!95813 (tuple2!5563 lt!95809 (_2!2893 lt!95697)))))

(declare-fun lt!95808 () Unit!4173)

(declare-fun lt!95821 () Unit!4173)

(assert (=> d!18828 (= lt!95808 lt!95821)))

(assert (=> d!18828 (isPrefixOf!0 lt!95809 (_2!2893 lt!95697))))

(assert (=> d!18828 (= lt!95821 (lemmaIsPrefixTransitive!0 lt!95809 (_2!2893 lt!95697) (_2!2893 lt!95697)))))

(declare-fun lt!95820 () Unit!4173)

(declare-fun lt!95811 () Unit!4173)

(assert (=> d!18828 (= lt!95820 lt!95811)))

(assert (=> d!18828 (isPrefixOf!0 lt!95809 (_2!2893 lt!95697))))

(assert (=> d!18828 (= lt!95811 (lemmaIsPrefixTransitive!0 lt!95809 (_2!2893 lt!95687) (_2!2893 lt!95697)))))

(declare-fun lt!95824 () Unit!4173)

(declare-fun e!40879 () Unit!4173)

(assert (=> d!18828 (= lt!95824 e!40879)))

(declare-fun c!4301 () Bool)

(assert (=> d!18828 (= c!4301 (not (= (size!1263 (buf!1644 (_2!2893 lt!95687))) #b00000000000000000000000000000000)))))

(declare-fun lt!95823 () Unit!4173)

(declare-fun lt!95817 () Unit!4173)

(assert (=> d!18828 (= lt!95823 lt!95817)))

(assert (=> d!18828 (isPrefixOf!0 (_2!2893 lt!95697) (_2!2893 lt!95697))))

(assert (=> d!18828 (= lt!95817 (lemmaIsPrefixRefl!0 (_2!2893 lt!95697)))))

(declare-fun lt!95825 () Unit!4173)

(declare-fun lt!95819 () Unit!4173)

(assert (=> d!18828 (= lt!95825 lt!95819)))

(assert (=> d!18828 (= lt!95819 (lemmaIsPrefixRefl!0 (_2!2893 lt!95697)))))

(declare-fun lt!95812 () Unit!4173)

(declare-fun lt!95814 () Unit!4173)

(assert (=> d!18828 (= lt!95812 lt!95814)))

(assert (=> d!18828 (isPrefixOf!0 lt!95809 lt!95809)))

(assert (=> d!18828 (= lt!95814 (lemmaIsPrefixRefl!0 lt!95809))))

(declare-fun lt!95815 () Unit!4173)

(declare-fun lt!95810 () Unit!4173)

(assert (=> d!18828 (= lt!95815 lt!95810)))

(assert (=> d!18828 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95687))))

(assert (=> d!18828 (= lt!95810 (lemmaIsPrefixRefl!0 (_2!2893 lt!95687)))))

(assert (=> d!18828 (= lt!95809 (BitStream!2209 (buf!1644 (_2!2893 lt!95697)) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(assert (=> d!18828 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95697))))

(assert (=> d!18828 (= (reader!0 (_2!2893 lt!95687) (_2!2893 lt!95697)) lt!95813)))

(declare-fun b!61321 () Bool)

(declare-fun Unit!4177 () Unit!4173)

(assert (=> b!61321 (= e!40879 Unit!4177)))

(declare-fun b!61322 () Bool)

(declare-fun res!51100 () Bool)

(assert (=> b!61322 (=> (not res!51100) (not e!40878))))

(assert (=> b!61322 (= res!51100 (isPrefixOf!0 (_1!2892 lt!95813) (_2!2893 lt!95687)))))

(declare-fun lt!95822 () (_ BitVec 64))

(declare-fun lt!95806 () (_ BitVec 64))

(declare-fun b!61323 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2208 (_ BitVec 64)) BitStream!2208)

(assert (=> b!61323 (= e!40878 (= (_1!2892 lt!95813) (withMovedBitIndex!0 (_2!2892 lt!95813) (bvsub lt!95806 lt!95822))))))

(assert (=> b!61323 (or (= (bvand lt!95806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95806 lt!95822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61323 (= lt!95822 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697))))))

(assert (=> b!61323 (= lt!95806 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(declare-fun b!61324 () Bool)

(declare-fun res!51102 () Bool)

(assert (=> b!61324 (=> (not res!51102) (not e!40878))))

(assert (=> b!61324 (= res!51102 (isPrefixOf!0 (_2!2892 lt!95813) (_2!2893 lt!95697)))))

(declare-fun b!61325 () Bool)

(declare-fun lt!95816 () Unit!4173)

(assert (=> b!61325 (= e!40879 lt!95816)))

(declare-fun lt!95807 () (_ BitVec 64))

(assert (=> b!61325 (= lt!95807 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95818 () (_ BitVec 64))

(assert (=> b!61325 (= lt!95818 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2772 array!2772 (_ BitVec 64) (_ BitVec 64)) Unit!4173)

(assert (=> b!61325 (= lt!95816 (arrayBitRangesEqSymmetric!0 (buf!1644 (_2!2893 lt!95687)) (buf!1644 (_2!2893 lt!95697)) lt!95807 lt!95818))))

(declare-fun arrayBitRangesEq!0 (array!2772 array!2772 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61325 (arrayBitRangesEq!0 (buf!1644 (_2!2893 lt!95697)) (buf!1644 (_2!2893 lt!95687)) lt!95807 lt!95818)))

(assert (= (and d!18828 c!4301) b!61325))

(assert (= (and d!18828 (not c!4301)) b!61321))

(assert (= (and d!18828 res!51101) b!61322))

(assert (= (and b!61322 res!51100) b!61324))

(assert (= (and b!61324 res!51102) b!61323))

(declare-fun m!96791 () Bool)

(assert (=> d!18828 m!96791))

(declare-fun m!96793 () Bool)

(assert (=> d!18828 m!96793))

(assert (=> d!18828 m!96643))

(declare-fun m!96795 () Bool)

(assert (=> d!18828 m!96795))

(declare-fun m!96797 () Bool)

(assert (=> d!18828 m!96797))

(declare-fun m!96799 () Bool)

(assert (=> d!18828 m!96799))

(declare-fun m!96801 () Bool)

(assert (=> d!18828 m!96801))

(declare-fun m!96803 () Bool)

(assert (=> d!18828 m!96803))

(declare-fun m!96805 () Bool)

(assert (=> d!18828 m!96805))

(declare-fun m!96807 () Bool)

(assert (=> d!18828 m!96807))

(declare-fun m!96809 () Bool)

(assert (=> d!18828 m!96809))

(declare-fun m!96811 () Bool)

(assert (=> b!61322 m!96811))

(declare-fun m!96813 () Bool)

(assert (=> b!61324 m!96813))

(assert (=> b!61325 m!96629))

(declare-fun m!96815 () Bool)

(assert (=> b!61325 m!96815))

(declare-fun m!96817 () Bool)

(assert (=> b!61325 m!96817))

(declare-fun m!96819 () Bool)

(assert (=> b!61323 m!96819))

(assert (=> b!61323 m!96667))

(assert (=> b!61323 m!96629))

(assert (=> b!61227 d!18828))

(declare-fun d!18830 () Bool)

(declare-fun e!40880 () Bool)

(assert (=> d!18830 e!40880))

(declare-fun res!51104 () Bool)

(assert (=> d!18830 (=> (not res!51104) (not e!40880))))

(declare-fun lt!95833 () tuple2!5562)

(assert (=> d!18830 (= res!51104 (isPrefixOf!0 (_1!2892 lt!95833) (_2!2892 lt!95833)))))

(declare-fun lt!95829 () BitStream!2208)

(assert (=> d!18830 (= lt!95833 (tuple2!5563 lt!95829 (_2!2893 lt!95697)))))

(declare-fun lt!95828 () Unit!4173)

(declare-fun lt!95841 () Unit!4173)

(assert (=> d!18830 (= lt!95828 lt!95841)))

(assert (=> d!18830 (isPrefixOf!0 lt!95829 (_2!2893 lt!95697))))

(assert (=> d!18830 (= lt!95841 (lemmaIsPrefixTransitive!0 lt!95829 (_2!2893 lt!95697) (_2!2893 lt!95697)))))

(declare-fun lt!95840 () Unit!4173)

(declare-fun lt!95831 () Unit!4173)

(assert (=> d!18830 (= lt!95840 lt!95831)))

(assert (=> d!18830 (isPrefixOf!0 lt!95829 (_2!2893 lt!95697))))

(assert (=> d!18830 (= lt!95831 (lemmaIsPrefixTransitive!0 lt!95829 thiss!1379 (_2!2893 lt!95697)))))

(declare-fun lt!95844 () Unit!4173)

(declare-fun e!40881 () Unit!4173)

(assert (=> d!18830 (= lt!95844 e!40881)))

(declare-fun c!4302 () Bool)

(assert (=> d!18830 (= c!4302 (not (= (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!95843 () Unit!4173)

(declare-fun lt!95837 () Unit!4173)

(assert (=> d!18830 (= lt!95843 lt!95837)))

(assert (=> d!18830 (isPrefixOf!0 (_2!2893 lt!95697) (_2!2893 lt!95697))))

(assert (=> d!18830 (= lt!95837 (lemmaIsPrefixRefl!0 (_2!2893 lt!95697)))))

(declare-fun lt!95845 () Unit!4173)

(declare-fun lt!95839 () Unit!4173)

(assert (=> d!18830 (= lt!95845 lt!95839)))

(assert (=> d!18830 (= lt!95839 (lemmaIsPrefixRefl!0 (_2!2893 lt!95697)))))

(declare-fun lt!95832 () Unit!4173)

(declare-fun lt!95834 () Unit!4173)

(assert (=> d!18830 (= lt!95832 lt!95834)))

(assert (=> d!18830 (isPrefixOf!0 lt!95829 lt!95829)))

(assert (=> d!18830 (= lt!95834 (lemmaIsPrefixRefl!0 lt!95829))))

(declare-fun lt!95835 () Unit!4173)

(declare-fun lt!95830 () Unit!4173)

(assert (=> d!18830 (= lt!95835 lt!95830)))

(assert (=> d!18830 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18830 (= lt!95830 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18830 (= lt!95829 (BitStream!2209 (buf!1644 (_2!2893 lt!95697)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(assert (=> d!18830 (isPrefixOf!0 thiss!1379 (_2!2893 lt!95697))))

(assert (=> d!18830 (= (reader!0 thiss!1379 (_2!2893 lt!95697)) lt!95833)))

(declare-fun b!61326 () Bool)

(declare-fun Unit!4178 () Unit!4173)

(assert (=> b!61326 (= e!40881 Unit!4178)))

(declare-fun b!61327 () Bool)

(declare-fun res!51103 () Bool)

(assert (=> b!61327 (=> (not res!51103) (not e!40880))))

(assert (=> b!61327 (= res!51103 (isPrefixOf!0 (_1!2892 lt!95833) thiss!1379))))

(declare-fun b!61328 () Bool)

(declare-fun lt!95842 () (_ BitVec 64))

(declare-fun lt!95826 () (_ BitVec 64))

(assert (=> b!61328 (= e!40880 (= (_1!2892 lt!95833) (withMovedBitIndex!0 (_2!2892 lt!95833) (bvsub lt!95826 lt!95842))))))

(assert (=> b!61328 (or (= (bvand lt!95826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95842 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95826 lt!95842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61328 (= lt!95842 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697))))))

(assert (=> b!61328 (= lt!95826 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(declare-fun b!61329 () Bool)

(declare-fun res!51105 () Bool)

(assert (=> b!61329 (=> (not res!51105) (not e!40880))))

(assert (=> b!61329 (= res!51105 (isPrefixOf!0 (_2!2892 lt!95833) (_2!2893 lt!95697)))))

(declare-fun b!61330 () Bool)

(declare-fun lt!95836 () Unit!4173)

(assert (=> b!61330 (= e!40881 lt!95836)))

(declare-fun lt!95827 () (_ BitVec 64))

(assert (=> b!61330 (= lt!95827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95838 () (_ BitVec 64))

(assert (=> b!61330 (= lt!95838 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(assert (=> b!61330 (= lt!95836 (arrayBitRangesEqSymmetric!0 (buf!1644 thiss!1379) (buf!1644 (_2!2893 lt!95697)) lt!95827 lt!95838))))

(assert (=> b!61330 (arrayBitRangesEq!0 (buf!1644 (_2!2893 lt!95697)) (buf!1644 thiss!1379) lt!95827 lt!95838)))

(assert (= (and d!18830 c!4302) b!61330))

(assert (= (and d!18830 (not c!4302)) b!61326))

(assert (= (and d!18830 res!51104) b!61327))

(assert (= (and b!61327 res!51103) b!61329))

(assert (= (and b!61329 res!51105) b!61328))

(declare-fun m!96821 () Bool)

(assert (=> d!18830 m!96821))

(assert (=> d!18830 m!96793))

(assert (=> d!18830 m!96649))

(declare-fun m!96823 () Bool)

(assert (=> d!18830 m!96823))

(assert (=> d!18830 m!96631))

(declare-fun m!96825 () Bool)

(assert (=> d!18830 m!96825))

(declare-fun m!96827 () Bool)

(assert (=> d!18830 m!96827))

(declare-fun m!96829 () Bool)

(assert (=> d!18830 m!96829))

(declare-fun m!96831 () Bool)

(assert (=> d!18830 m!96831))

(assert (=> d!18830 m!96807))

(assert (=> d!18830 m!96633))

(declare-fun m!96833 () Bool)

(assert (=> b!61327 m!96833))

(declare-fun m!96835 () Bool)

(assert (=> b!61329 m!96835))

(assert (=> b!61330 m!96635))

(declare-fun m!96837 () Bool)

(assert (=> b!61330 m!96837))

(declare-fun m!96839 () Bool)

(assert (=> b!61330 m!96839))

(declare-fun m!96841 () Bool)

(assert (=> b!61328 m!96841))

(assert (=> b!61328 m!96667))

(assert (=> b!61328 m!96635))

(assert (=> b!61227 d!18830))

(declare-fun d!18832 () Bool)

(assert (=> d!18832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4710 () Bool)

(assert (= bs!4710 d!18832))

(declare-fun m!96843 () Bool)

(assert (=> bs!4710 m!96843))

(assert (=> b!61227 d!18832))

(declare-fun d!18834 () Bool)

(declare-fun res!51113 () Bool)

(declare-fun e!40887 () Bool)

(assert (=> d!18834 (=> (not res!51113) (not e!40887))))

(assert (=> d!18834 (= res!51113 (= (size!1263 (buf!1644 (_1!2892 lt!95691))) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (=> d!18834 (= (isPrefixOf!0 (_1!2892 lt!95691) (_2!2893 lt!95697)) e!40887)))

(declare-fun b!61337 () Bool)

(declare-fun res!51114 () Bool)

(assert (=> b!61337 (=> (not res!51114) (not e!40887))))

(assert (=> b!61337 (= res!51114 (bvsle (bitIndex!0 (size!1263 (buf!1644 (_1!2892 lt!95691))) (currentByte!3268 (_1!2892 lt!95691)) (currentBit!3263 (_1!2892 lt!95691))) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697)))))))

(declare-fun b!61338 () Bool)

(declare-fun e!40886 () Bool)

(assert (=> b!61338 (= e!40887 e!40886)))

(declare-fun res!51112 () Bool)

(assert (=> b!61338 (=> res!51112 e!40886)))

(assert (=> b!61338 (= res!51112 (= (size!1263 (buf!1644 (_1!2892 lt!95691))) #b00000000000000000000000000000000))))

(declare-fun b!61339 () Bool)

(assert (=> b!61339 (= e!40886 (arrayBitRangesEq!0 (buf!1644 (_1!2892 lt!95691)) (buf!1644 (_2!2893 lt!95697)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 (_1!2892 lt!95691))) (currentByte!3268 (_1!2892 lt!95691)) (currentBit!3263 (_1!2892 lt!95691)))))))

(assert (= (and d!18834 res!51113) b!61337))

(assert (= (and b!61337 res!51114) b!61338))

(assert (= (and b!61338 (not res!51112)) b!61339))

(declare-fun m!96845 () Bool)

(assert (=> b!61337 m!96845))

(assert (=> b!61337 m!96667))

(assert (=> b!61339 m!96845))

(assert (=> b!61339 m!96845))

(declare-fun m!96847 () Bool)

(assert (=> b!61339 m!96847))

(assert (=> b!61229 d!18834))

(declare-fun d!18836 () Bool)

(assert (=> d!18836 (= (invariant!0 (currentBit!3263 (_2!2893 lt!95687)) (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95697)))) (and (bvsge (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (bvslt (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000001000) (bvsge (currentByte!3268 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95697)))) (and (= (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (= (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))))

(assert (=> b!61239 d!18836))

(declare-fun d!18838 () Bool)

(declare-fun e!40890 () Bool)

(assert (=> d!18838 e!40890))

(declare-fun res!51119 () Bool)

(assert (=> d!18838 (=> (not res!51119) (not e!40890))))

(declare-fun lt!95860 () (_ BitVec 64))

(declare-fun lt!95862 () (_ BitVec 64))

(declare-fun lt!95859 () (_ BitVec 64))

(assert (=> d!18838 (= res!51119 (= lt!95860 (bvsub lt!95862 lt!95859)))))

(assert (=> d!18838 (or (= (bvand lt!95862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95862 lt!95859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18838 (= lt!95859 (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687)))))))

(declare-fun lt!95858 () (_ BitVec 64))

(declare-fun lt!95863 () (_ BitVec 64))

(assert (=> d!18838 (= lt!95862 (bvmul lt!95858 lt!95863))))

(assert (=> d!18838 (or (= lt!95858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95863 (bvsdiv (bvmul lt!95858 lt!95863) lt!95858)))))

(assert (=> d!18838 (= lt!95863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18838 (= lt!95858 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))))))

(assert (=> d!18838 (= lt!95860 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687)))))))

(assert (=> d!18838 (invariant!0 (currentBit!3263 (_2!2893 lt!95687)) (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95687))))))

(assert (=> d!18838 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))) lt!95860)))

(declare-fun b!61344 () Bool)

(declare-fun res!51120 () Bool)

(assert (=> b!61344 (=> (not res!51120) (not e!40890))))

(assert (=> b!61344 (= res!51120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95860))))

(declare-fun b!61345 () Bool)

(declare-fun lt!95861 () (_ BitVec 64))

(assert (=> b!61345 (= e!40890 (bvsle lt!95860 (bvmul lt!95861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61345 (or (= lt!95861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95861)))))

(assert (=> b!61345 (= lt!95861 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))))))

(assert (= (and d!18838 res!51119) b!61344))

(assert (= (and b!61344 res!51120) b!61345))

(declare-fun m!96849 () Bool)

(assert (=> d!18838 m!96849))

(assert (=> d!18838 m!96651))

(assert (=> b!61241 d!18838))

(declare-fun d!18840 () Bool)

(assert (=> d!18840 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95864 () Unit!4173)

(assert (=> d!18840 (= lt!95864 (choose!9 thiss!1379 (buf!1644 (_2!2893 lt!95687)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2209 (buf!1644 (_2!2893 lt!95687)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(assert (=> d!18840 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1644 (_2!2893 lt!95687)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95864)))

(declare-fun bs!4711 () Bool)

(assert (= bs!4711 d!18840))

(assert (=> bs!4711 m!96637))

(declare-fun m!96851 () Bool)

(assert (=> bs!4711 m!96851))

(assert (=> b!61230 d!18840))

(declare-fun b!61526 () Bool)

(declare-fun res!51241 () Bool)

(declare-fun e!40983 () Bool)

(assert (=> b!61526 (=> (not res!51241) (not e!40983))))

(declare-fun lt!96244 () tuple2!5564)

(assert (=> b!61526 (= res!51241 (= (size!1263 (buf!1644 (_2!2893 lt!95687))) (size!1263 (buf!1644 (_2!2893 lt!96244)))))))

(declare-fun d!18842 () Bool)

(assert (=> d!18842 e!40983))

(declare-fun res!51239 () Bool)

(assert (=> d!18842 (=> (not res!51239) (not e!40983))))

(declare-fun lt!96280 () (_ BitVec 64))

(assert (=> d!18842 (= res!51239 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96244))) (currentByte!3268 (_2!2893 lt!96244)) (currentBit!3263 (_2!2893 lt!96244))) (bvsub lt!96280 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18842 (or (= (bvand lt!96280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96280 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96253 () (_ BitVec 64))

(assert (=> d!18842 (= lt!96280 (bvadd lt!96253 to!314))))

(assert (=> d!18842 (or (not (= (bvand lt!96253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96253 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18842 (= lt!96253 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(declare-fun e!40982 () tuple2!5564)

(assert (=> d!18842 (= lt!96244 e!40982)))

(declare-fun c!4335 () Bool)

(assert (=> d!18842 (= c!4335 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!96252 () Unit!4173)

(declare-fun lt!96271 () Unit!4173)

(assert (=> d!18842 (= lt!96252 lt!96271)))

(assert (=> d!18842 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95687))))

(assert (=> d!18842 (= lt!96271 (lemmaIsPrefixRefl!0 (_2!2893 lt!95687)))))

(declare-fun lt!96248 () (_ BitVec 64))

(assert (=> d!18842 (= lt!96248 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(assert (=> d!18842 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18842 (= (appendBitsMSBFirstLoop!0 (_2!2893 lt!95687) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!96244)))

(declare-fun lt!96243 () tuple2!5562)

(declare-fun b!61527 () Bool)

(assert (=> b!61527 (= e!40983 (= (bitStreamReadBitsIntoList!0 (_2!2893 lt!96244) (_1!2892 lt!96243) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2893 lt!96244) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61527 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61527 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!96250 () Unit!4173)

(declare-fun lt!96262 () Unit!4173)

(assert (=> b!61527 (= lt!96250 lt!96262)))

(declare-fun lt!96282 () (_ BitVec 64))

(assert (=> b!61527 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!96244)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!96282)))

(assert (=> b!61527 (= lt!96262 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!96244)) lt!96282))))

(declare-fun e!40984 () Bool)

(assert (=> b!61527 e!40984))

(declare-fun res!51236 () Bool)

(assert (=> b!61527 (=> (not res!51236) (not e!40984))))

(assert (=> b!61527 (= res!51236 (and (= (size!1263 (buf!1644 (_2!2893 lt!95687))) (size!1263 (buf!1644 (_2!2893 lt!96244)))) (bvsge lt!96282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61527 (= lt!96282 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61527 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61527 (= lt!96243 (reader!0 (_2!2893 lt!95687) (_2!2893 lt!96244)))))

(declare-fun call!775 () tuple2!5562)

(declare-fun lt!96283 () tuple2!5564)

(declare-fun bm!772 () Bool)

(assert (=> bm!772 (= call!775 (reader!0 (_2!2893 lt!95687) (ite c!4335 (_2!2893 lt!96283) (_2!2893 lt!95687))))))

(declare-fun b!61528 () Bool)

(declare-fun res!51237 () Bool)

(assert (=> b!61528 (=> (not res!51237) (not e!40983))))

(assert (=> b!61528 (= res!51237 (= (size!1263 (buf!1644 (_2!2893 lt!96244))) (size!1263 (buf!1644 (_2!2893 lt!95687)))))))

(declare-fun b!61529 () Bool)

(declare-fun res!51240 () Bool)

(assert (=> b!61529 (=> (not res!51240) (not e!40983))))

(assert (=> b!61529 (= res!51240 (invariant!0 (currentBit!3263 (_2!2893 lt!96244)) (currentByte!3268 (_2!2893 lt!96244)) (size!1263 (buf!1644 (_2!2893 lt!96244)))))))

(declare-fun b!61530 () Bool)

(declare-fun res!51238 () Bool)

(assert (=> b!61530 (=> (not res!51238) (not e!40983))))

(assert (=> b!61530 (= res!51238 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!96244)))))

(declare-fun b!61531 () Bool)

(declare-fun lt!96263 () tuple2!5564)

(declare-fun Unit!4179 () Unit!4173)

(assert (=> b!61531 (= e!40982 (tuple2!5565 Unit!4179 (_2!2893 lt!96263)))))

(assert (=> b!61531 (= lt!96283 (appendBitFromByte!0 (_2!2893 lt!95687) (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!96275 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96275 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96261 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96261 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96257 () Unit!4173)

(assert (=> b!61531 (= lt!96257 (validateOffsetBitsIneqLemma!0 (_2!2893 lt!95687) (_2!2893 lt!96283) lt!96275 lt!96261))))

(assert (=> b!61531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!96283)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!96283))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!96283))) (bvsub lt!96275 lt!96261))))

(declare-fun lt!96247 () Unit!4173)

(assert (=> b!61531 (= lt!96247 lt!96257)))

(declare-fun lt!96268 () tuple2!5562)

(assert (=> b!61531 (= lt!96268 call!775)))

(declare-fun lt!96276 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96276 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!96272 () Unit!4173)

(assert (=> b!61531 (= lt!96272 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!96283)) lt!96276))))

(assert (=> b!61531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!96283)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!96276)))

(declare-fun lt!96278 () Unit!4173)

(assert (=> b!61531 (= lt!96278 lt!96272)))

(assert (=> b!61531 (= (head!498 (byteArrayBitContentToList!0 (_2!2893 lt!96283) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!498 (bitStreamReadBitsIntoList!0 (_2!2893 lt!96283) (_1!2892 lt!96268) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96256 () Unit!4173)

(declare-fun Unit!4180 () Unit!4173)

(assert (=> b!61531 (= lt!96256 Unit!4180)))

(assert (=> b!61531 (= lt!96263 (appendBitsMSBFirstLoop!0 (_2!2893 lt!96283) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!96279 () Unit!4173)

(assert (=> b!61531 (= lt!96279 (lemmaIsPrefixTransitive!0 (_2!2893 lt!95687) (_2!2893 lt!96283) (_2!2893 lt!96263)))))

(assert (=> b!61531 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!96263))))

(declare-fun lt!96277 () Unit!4173)

(assert (=> b!61531 (= lt!96277 lt!96279)))

(assert (=> b!61531 (= (size!1263 (buf!1644 (_2!2893 lt!96263))) (size!1263 (buf!1644 (_2!2893 lt!95687))))))

(declare-fun lt!96259 () Unit!4173)

(declare-fun Unit!4181 () Unit!4173)

(assert (=> b!61531 (= lt!96259 Unit!4181)))

(assert (=> b!61531 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96263))) (currentByte!3268 (_2!2893 lt!96263)) (currentBit!3263 (_2!2893 lt!96263))) (bvsub (bvadd (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96258 () Unit!4173)

(declare-fun Unit!4182 () Unit!4173)

(assert (=> b!61531 (= lt!96258 Unit!4182)))

(assert (=> b!61531 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96263))) (currentByte!3268 (_2!2893 lt!96263)) (currentBit!3263 (_2!2893 lt!96263))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96283))) (currentByte!3268 (_2!2893 lt!96283)) (currentBit!3263 (_2!2893 lt!96283))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96273 () Unit!4173)

(declare-fun Unit!4183 () Unit!4173)

(assert (=> b!61531 (= lt!96273 Unit!4183)))

(declare-fun lt!96241 () tuple2!5562)

(assert (=> b!61531 (= lt!96241 (reader!0 (_2!2893 lt!95687) (_2!2893 lt!96263)))))

(declare-fun lt!96266 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96266 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96264 () Unit!4173)

(assert (=> b!61531 (= lt!96264 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!95687) (buf!1644 (_2!2893 lt!96263)) lt!96266))))

(assert (=> b!61531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!96263)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!96266)))

(declare-fun lt!96255 () Unit!4173)

(assert (=> b!61531 (= lt!96255 lt!96264)))

(declare-fun lt!96251 () tuple2!5562)

(assert (=> b!61531 (= lt!96251 (reader!0 (_2!2893 lt!96283) (_2!2893 lt!96263)))))

(declare-fun lt!96274 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96274 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96246 () Unit!4173)

(assert (=> b!61531 (= lt!96246 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2893 lt!96283) (buf!1644 (_2!2893 lt!96263)) lt!96274))))

(assert (=> b!61531 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!96263)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!96283))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!96283))) lt!96274)))

(declare-fun lt!96249 () Unit!4173)

(assert (=> b!61531 (= lt!96249 lt!96246)))

(declare-fun lt!96265 () List!679)

(assert (=> b!61531 (= lt!96265 (byteArrayBitContentToList!0 (_2!2893 lt!96263) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96245 () List!679)

(assert (=> b!61531 (= lt!96245 (byteArrayBitContentToList!0 (_2!2893 lt!96263) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96242 () List!679)

(assert (=> b!61531 (= lt!96242 (bitStreamReadBitsIntoList!0 (_2!2893 lt!96263) (_1!2892 lt!96241) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!96260 () List!679)

(assert (=> b!61531 (= lt!96260 (bitStreamReadBitsIntoList!0 (_2!2893 lt!96263) (_1!2892 lt!96251) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!96269 () (_ BitVec 64))

(assert (=> b!61531 (= lt!96269 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!96270 () Unit!4173)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2208 BitStream!2208 BitStream!2208 BitStream!2208 (_ BitVec 64) List!679) Unit!4173)

(assert (=> b!61531 (= lt!96270 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2893 lt!96263) (_2!2893 lt!96263) (_1!2892 lt!96241) (_1!2892 lt!96251) lt!96269 lt!96242))))

(declare-fun tail!285 (List!679) List!679)

(assert (=> b!61531 (= (bitStreamReadBitsIntoList!0 (_2!2893 lt!96263) (_1!2892 lt!96251) (bvsub lt!96269 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!285 lt!96242))))

(declare-fun lt!96267 () Unit!4173)

(assert (=> b!61531 (= lt!96267 lt!96270)))

(declare-fun lt!96284 () Unit!4173)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2772 array!2772 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4173)

(assert (=> b!61531 (= lt!96284 (arrayBitRangesEqImpliesEq!0 (buf!1644 (_2!2893 lt!96283)) (buf!1644 (_2!2893 lt!96263)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!96248 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96283))) (currentByte!3268 (_2!2893 lt!96283)) (currentBit!3263 (_2!2893 lt!96283)))))))

(declare-fun bitAt!0 (array!2772 (_ BitVec 64)) Bool)

(assert (=> b!61531 (= (bitAt!0 (buf!1644 (_2!2893 lt!96283)) lt!96248) (bitAt!0 (buf!1644 (_2!2893 lt!96263)) lt!96248))))

(declare-fun lt!96281 () Unit!4173)

(assert (=> b!61531 (= lt!96281 lt!96284)))

(declare-fun b!61532 () Bool)

(declare-fun Unit!4184 () Unit!4173)

(assert (=> b!61532 (= e!40982 (tuple2!5565 Unit!4184 (_2!2893 lt!95687)))))

(assert (=> b!61532 (= (size!1263 (buf!1644 (_2!2893 lt!95687))) (size!1263 (buf!1644 (_2!2893 lt!95687))))))

(declare-fun lt!96254 () Unit!4173)

(declare-fun Unit!4185 () Unit!4173)

(assert (=> b!61532 (= lt!96254 Unit!4185)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2208 array!2772 array!2772 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5574 0))(
  ( (tuple2!5575 (_1!2898 array!2772) (_2!2898 BitStream!2208)) )
))
(declare-fun readBits!0 (BitStream!2208 (_ BitVec 64)) tuple2!5574)

(assert (=> b!61532 (checkByteArrayBitContent!0 (_2!2893 lt!95687) srcBuffer!2 (_1!2898 (readBits!0 (_1!2892 call!775) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!61533 () Bool)

(assert (=> b!61533 (= e!40984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!96282))))

(assert (= (and d!18842 c!4335) b!61531))

(assert (= (and d!18842 (not c!4335)) b!61532))

(assert (= (or b!61531 b!61532) bm!772))

(assert (= (and d!18842 res!51239) b!61529))

(assert (= (and b!61529 res!51240) b!61526))

(assert (= (and b!61526 res!51241) b!61530))

(assert (= (and b!61530 res!51238) b!61528))

(assert (= (and b!61528 res!51237) b!61527))

(assert (= (and b!61527 res!51236) b!61533))

(declare-fun m!97081 () Bool)

(assert (=> d!18842 m!97081))

(assert (=> d!18842 m!96629))

(assert (=> d!18842 m!96797))

(assert (=> d!18842 m!96809))

(declare-fun m!97083 () Bool)

(assert (=> b!61530 m!97083))

(declare-fun m!97085 () Bool)

(assert (=> b!61527 m!97085))

(declare-fun m!97087 () Bool)

(assert (=> b!61527 m!97087))

(declare-fun m!97089 () Bool)

(assert (=> b!61527 m!97089))

(declare-fun m!97091 () Bool)

(assert (=> b!61527 m!97091))

(declare-fun m!97093 () Bool)

(assert (=> b!61527 m!97093))

(declare-fun m!97095 () Bool)

(assert (=> bm!772 m!97095))

(declare-fun m!97097 () Bool)

(assert (=> b!61532 m!97097))

(declare-fun m!97099 () Bool)

(assert (=> b!61532 m!97099))

(declare-fun m!97101 () Bool)

(assert (=> b!61533 m!97101))

(declare-fun m!97103 () Bool)

(assert (=> b!61529 m!97103))

(declare-fun m!97105 () Bool)

(assert (=> b!61531 m!97105))

(declare-fun m!97107 () Bool)

(assert (=> b!61531 m!97107))

(declare-fun m!97109 () Bool)

(assert (=> b!61531 m!97109))

(declare-fun m!97111 () Bool)

(assert (=> b!61531 m!97111))

(declare-fun m!97113 () Bool)

(assert (=> b!61531 m!97113))

(declare-fun m!97115 () Bool)

(assert (=> b!61531 m!97115))

(declare-fun m!97117 () Bool)

(assert (=> b!61531 m!97117))

(declare-fun m!97119 () Bool)

(assert (=> b!61531 m!97119))

(assert (=> b!61531 m!97105))

(declare-fun m!97121 () Bool)

(assert (=> b!61531 m!97121))

(declare-fun m!97123 () Bool)

(assert (=> b!61531 m!97123))

(declare-fun m!97125 () Bool)

(assert (=> b!61531 m!97125))

(declare-fun m!97127 () Bool)

(assert (=> b!61531 m!97127))

(declare-fun m!97129 () Bool)

(assert (=> b!61531 m!97129))

(declare-fun m!97131 () Bool)

(assert (=> b!61531 m!97131))

(declare-fun m!97133 () Bool)

(assert (=> b!61531 m!97133))

(declare-fun m!97135 () Bool)

(assert (=> b!61531 m!97135))

(assert (=> b!61531 m!96629))

(declare-fun m!97137 () Bool)

(assert (=> b!61531 m!97137))

(declare-fun m!97139 () Bool)

(assert (=> b!61531 m!97139))

(declare-fun m!97141 () Bool)

(assert (=> b!61531 m!97141))

(declare-fun m!97143 () Bool)

(assert (=> b!61531 m!97143))

(assert (=> b!61531 m!97123))

(declare-fun m!97145 () Bool)

(assert (=> b!61531 m!97145))

(declare-fun m!97147 () Bool)

(assert (=> b!61531 m!97147))

(assert (=> b!61531 m!97129))

(declare-fun m!97149 () Bool)

(assert (=> b!61531 m!97149))

(declare-fun m!97151 () Bool)

(assert (=> b!61531 m!97151))

(declare-fun m!97153 () Bool)

(assert (=> b!61531 m!97153))

(assert (=> b!61531 m!97121))

(declare-fun m!97155 () Bool)

(assert (=> b!61531 m!97155))

(declare-fun m!97157 () Bool)

(assert (=> b!61531 m!97157))

(declare-fun m!97159 () Bool)

(assert (=> b!61531 m!97159))

(declare-fun m!97161 () Bool)

(assert (=> b!61531 m!97161))

(declare-fun m!97163 () Bool)

(assert (=> b!61531 m!97163))

(declare-fun m!97165 () Bool)

(assert (=> b!61531 m!97165))

(assert (=> b!61230 d!18842))

(declare-fun d!18950 () Bool)

(declare-fun res!51243 () Bool)

(declare-fun e!40986 () Bool)

(assert (=> d!18950 (=> (not res!51243) (not e!40986))))

(assert (=> d!18950 (= res!51243 (= (size!1263 (buf!1644 (_2!2893 lt!95687))) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (=> d!18950 (= (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95697)) e!40986)))

(declare-fun b!61534 () Bool)

(declare-fun res!51244 () Bool)

(assert (=> b!61534 (=> (not res!51244) (not e!40986))))

(assert (=> b!61534 (= res!51244 (bvsle (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697)))))))

(declare-fun b!61535 () Bool)

(declare-fun e!40985 () Bool)

(assert (=> b!61535 (= e!40986 e!40985)))

(declare-fun res!51242 () Bool)

(assert (=> b!61535 (=> res!51242 e!40985)))

(assert (=> b!61535 (= res!51242 (= (size!1263 (buf!1644 (_2!2893 lt!95687))) #b00000000000000000000000000000000))))

(declare-fun b!61536 () Bool)

(assert (=> b!61536 (= e!40985 (arrayBitRangesEq!0 (buf!1644 (_2!2893 lt!95687)) (buf!1644 (_2!2893 lt!95697)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687)))))))

(assert (= (and d!18950 res!51243) b!61534))

(assert (= (and b!61534 res!51244) b!61535))

(assert (= (and b!61535 (not res!51242)) b!61536))

(assert (=> b!61534 m!96629))

(assert (=> b!61534 m!96667))

(assert (=> b!61536 m!96629))

(assert (=> b!61536 m!96629))

(declare-fun m!97167 () Bool)

(assert (=> b!61536 m!97167))

(assert (=> b!61230 d!18950))

(declare-fun d!18952 () Bool)

(assert (=> d!18952 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4729 () Bool)

(assert (= bs!4729 d!18952))

(declare-fun m!97169 () Bool)

(assert (=> bs!4729 m!97169))

(assert (=> b!61230 d!18952))

(declare-fun d!18954 () Bool)

(declare-fun res!51246 () Bool)

(declare-fun e!40988 () Bool)

(assert (=> d!18954 (=> (not res!51246) (not e!40988))))

(assert (=> d!18954 (= res!51246 (= (size!1263 (buf!1644 thiss!1379)) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (=> d!18954 (= (isPrefixOf!0 thiss!1379 (_2!2893 lt!95697)) e!40988)))

(declare-fun b!61537 () Bool)

(declare-fun res!51247 () Bool)

(assert (=> b!61537 (=> (not res!51247) (not e!40988))))

(assert (=> b!61537 (= res!51247 (bvsle (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697)))))))

(declare-fun b!61538 () Bool)

(declare-fun e!40987 () Bool)

(assert (=> b!61538 (= e!40988 e!40987)))

(declare-fun res!51245 () Bool)

(assert (=> b!61538 (=> res!51245 e!40987)))

(assert (=> b!61538 (= res!51245 (= (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61539 () Bool)

(assert (=> b!61539 (= e!40987 (arrayBitRangesEq!0 (buf!1644 thiss!1379) (buf!1644 (_2!2893 lt!95697)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(assert (= (and d!18954 res!51246) b!61537))

(assert (= (and b!61537 res!51247) b!61538))

(assert (= (and b!61538 (not res!51245)) b!61539))

(assert (=> b!61537 m!96635))

(assert (=> b!61537 m!96667))

(assert (=> b!61539 m!96635))

(assert (=> b!61539 m!96635))

(declare-fun m!97171 () Bool)

(assert (=> b!61539 m!97171))

(assert (=> b!61230 d!18954))

(declare-fun d!18956 () Bool)

(declare-fun e!40989 () Bool)

(assert (=> d!18956 e!40989))

(declare-fun res!51249 () Bool)

(assert (=> d!18956 (=> (not res!51249) (not e!40989))))

(declare-fun lt!96292 () tuple2!5562)

(assert (=> d!18956 (= res!51249 (isPrefixOf!0 (_1!2892 lt!96292) (_2!2892 lt!96292)))))

(declare-fun lt!96288 () BitStream!2208)

(assert (=> d!18956 (= lt!96292 (tuple2!5563 lt!96288 (_2!2893 lt!95687)))))

(declare-fun lt!96287 () Unit!4173)

(declare-fun lt!96300 () Unit!4173)

(assert (=> d!18956 (= lt!96287 lt!96300)))

(assert (=> d!18956 (isPrefixOf!0 lt!96288 (_2!2893 lt!95687))))

(assert (=> d!18956 (= lt!96300 (lemmaIsPrefixTransitive!0 lt!96288 (_2!2893 lt!95687) (_2!2893 lt!95687)))))

(declare-fun lt!96299 () Unit!4173)

(declare-fun lt!96290 () Unit!4173)

(assert (=> d!18956 (= lt!96299 lt!96290)))

(assert (=> d!18956 (isPrefixOf!0 lt!96288 (_2!2893 lt!95687))))

(assert (=> d!18956 (= lt!96290 (lemmaIsPrefixTransitive!0 lt!96288 thiss!1379 (_2!2893 lt!95687)))))

(declare-fun lt!96303 () Unit!4173)

(declare-fun e!40990 () Unit!4173)

(assert (=> d!18956 (= lt!96303 e!40990)))

(declare-fun c!4336 () Bool)

(assert (=> d!18956 (= c!4336 (not (= (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!96302 () Unit!4173)

(declare-fun lt!96296 () Unit!4173)

(assert (=> d!18956 (= lt!96302 lt!96296)))

(assert (=> d!18956 (isPrefixOf!0 (_2!2893 lt!95687) (_2!2893 lt!95687))))

(assert (=> d!18956 (= lt!96296 (lemmaIsPrefixRefl!0 (_2!2893 lt!95687)))))

(declare-fun lt!96304 () Unit!4173)

(declare-fun lt!96298 () Unit!4173)

(assert (=> d!18956 (= lt!96304 lt!96298)))

(assert (=> d!18956 (= lt!96298 (lemmaIsPrefixRefl!0 (_2!2893 lt!95687)))))

(declare-fun lt!96291 () Unit!4173)

(declare-fun lt!96293 () Unit!4173)

(assert (=> d!18956 (= lt!96291 lt!96293)))

(assert (=> d!18956 (isPrefixOf!0 lt!96288 lt!96288)))

(assert (=> d!18956 (= lt!96293 (lemmaIsPrefixRefl!0 lt!96288))))

(declare-fun lt!96294 () Unit!4173)

(declare-fun lt!96289 () Unit!4173)

(assert (=> d!18956 (= lt!96294 lt!96289)))

(assert (=> d!18956 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18956 (= lt!96289 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18956 (= lt!96288 (BitStream!2209 (buf!1644 (_2!2893 lt!95687)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(assert (=> d!18956 (isPrefixOf!0 thiss!1379 (_2!2893 lt!95687))))

(assert (=> d!18956 (= (reader!0 thiss!1379 (_2!2893 lt!95687)) lt!96292)))

(declare-fun b!61540 () Bool)

(declare-fun Unit!4186 () Unit!4173)

(assert (=> b!61540 (= e!40990 Unit!4186)))

(declare-fun b!61541 () Bool)

(declare-fun res!51248 () Bool)

(assert (=> b!61541 (=> (not res!51248) (not e!40989))))

(assert (=> b!61541 (= res!51248 (isPrefixOf!0 (_1!2892 lt!96292) thiss!1379))))

(declare-fun lt!96285 () (_ BitVec 64))

(declare-fun lt!96301 () (_ BitVec 64))

(declare-fun b!61542 () Bool)

(assert (=> b!61542 (= e!40989 (= (_1!2892 lt!96292) (withMovedBitIndex!0 (_2!2892 lt!96292) (bvsub lt!96285 lt!96301))))))

(assert (=> b!61542 (or (= (bvand lt!96285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96285 lt!96301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61542 (= lt!96301 (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687))))))

(assert (=> b!61542 (= lt!96285 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(declare-fun b!61543 () Bool)

(declare-fun res!51250 () Bool)

(assert (=> b!61543 (=> (not res!51250) (not e!40989))))

(assert (=> b!61543 (= res!51250 (isPrefixOf!0 (_2!2892 lt!96292) (_2!2893 lt!95687)))))

(declare-fun b!61544 () Bool)

(declare-fun lt!96295 () Unit!4173)

(assert (=> b!61544 (= e!40990 lt!96295)))

(declare-fun lt!96286 () (_ BitVec 64))

(assert (=> b!61544 (= lt!96286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96297 () (_ BitVec 64))

(assert (=> b!61544 (= lt!96297 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(assert (=> b!61544 (= lt!96295 (arrayBitRangesEqSymmetric!0 (buf!1644 thiss!1379) (buf!1644 (_2!2893 lt!95687)) lt!96286 lt!96297))))

(assert (=> b!61544 (arrayBitRangesEq!0 (buf!1644 (_2!2893 lt!95687)) (buf!1644 thiss!1379) lt!96286 lt!96297)))

(assert (= (and d!18956 c!4336) b!61544))

(assert (= (and d!18956 (not c!4336)) b!61540))

(assert (= (and d!18956 res!51249) b!61541))

(assert (= (and b!61541 res!51248) b!61543))

(assert (= (and b!61543 res!51250) b!61542))

(declare-fun m!97173 () Bool)

(assert (=> d!18956 m!97173))

(assert (=> d!18956 m!96809))

(assert (=> d!18956 m!96673))

(declare-fun m!97175 () Bool)

(assert (=> d!18956 m!97175))

(assert (=> d!18956 m!96631))

(declare-fun m!97177 () Bool)

(assert (=> d!18956 m!97177))

(declare-fun m!97179 () Bool)

(assert (=> d!18956 m!97179))

(declare-fun m!97181 () Bool)

(assert (=> d!18956 m!97181))

(declare-fun m!97183 () Bool)

(assert (=> d!18956 m!97183))

(assert (=> d!18956 m!96797))

(assert (=> d!18956 m!96633))

(declare-fun m!97185 () Bool)

(assert (=> b!61541 m!97185))

(declare-fun m!97187 () Bool)

(assert (=> b!61543 m!97187))

(assert (=> b!61544 m!96635))

(declare-fun m!97189 () Bool)

(assert (=> b!61544 m!97189))

(declare-fun m!97191 () Bool)

(assert (=> b!61544 m!97191))

(declare-fun m!97193 () Bool)

(assert (=> b!61542 m!97193))

(assert (=> b!61542 m!96629))

(assert (=> b!61542 m!96635))

(assert (=> b!61230 d!18956))

(declare-fun d!18958 () Bool)

(assert (=> d!18958 (isPrefixOf!0 thiss!1379 (_2!2893 lt!95697))))

(declare-fun lt!96307 () Unit!4173)

(declare-fun choose!30 (BitStream!2208 BitStream!2208 BitStream!2208) Unit!4173)

(assert (=> d!18958 (= lt!96307 (choose!30 thiss!1379 (_2!2893 lt!95687) (_2!2893 lt!95697)))))

(assert (=> d!18958 (isPrefixOf!0 thiss!1379 (_2!2893 lt!95687))))

(assert (=> d!18958 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2893 lt!95687) (_2!2893 lt!95697)) lt!96307)))

(declare-fun bs!4730 () Bool)

(assert (= bs!4730 d!18958))

(assert (=> bs!4730 m!96649))

(declare-fun m!97195 () Bool)

(assert (=> bs!4730 m!97195))

(assert (=> bs!4730 m!96673))

(assert (=> b!61230 d!18958))

(declare-fun d!18960 () Bool)

(declare-fun res!51252 () Bool)

(declare-fun e!40992 () Bool)

(assert (=> d!18960 (=> (not res!51252) (not e!40992))))

(assert (=> d!18960 (= res!51252 (= (size!1263 (buf!1644 thiss!1379)) (size!1263 (buf!1644 thiss!1379))))))

(assert (=> d!18960 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!40992)))

(declare-fun b!61545 () Bool)

(declare-fun res!51253 () Bool)

(assert (=> b!61545 (=> (not res!51253) (not e!40992))))

(assert (=> b!61545 (= res!51253 (bvsle (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)) (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(declare-fun b!61546 () Bool)

(declare-fun e!40991 () Bool)

(assert (=> b!61546 (= e!40992 e!40991)))

(declare-fun res!51251 () Bool)

(assert (=> b!61546 (=> res!51251 e!40991)))

(assert (=> b!61546 (= res!51251 (= (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61547 () Bool)

(assert (=> b!61547 (= e!40991 (arrayBitRangesEq!0 (buf!1644 thiss!1379) (buf!1644 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(assert (= (and d!18960 res!51252) b!61545))

(assert (= (and b!61545 res!51253) b!61546))

(assert (= (and b!61546 (not res!51251)) b!61547))

(assert (=> b!61545 m!96635))

(assert (=> b!61545 m!96635))

(assert (=> b!61547 m!96635))

(assert (=> b!61547 m!96635))

(declare-fun m!97197 () Bool)

(assert (=> b!61547 m!97197))

(assert (=> b!61240 d!18960))

(declare-fun d!18962 () Bool)

(assert (=> d!18962 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!96310 () Unit!4173)

(declare-fun choose!11 (BitStream!2208) Unit!4173)

(assert (=> d!18962 (= lt!96310 (choose!11 thiss!1379))))

(assert (=> d!18962 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!96310)))

(declare-fun bs!4732 () Bool)

(assert (= bs!4732 d!18962))

(assert (=> bs!4732 m!96631))

(declare-fun m!97199 () Bool)

(assert (=> bs!4732 m!97199))

(assert (=> b!61240 d!18962))

(declare-fun d!18964 () Bool)

(declare-fun e!40993 () Bool)

(assert (=> d!18964 e!40993))

(declare-fun res!51254 () Bool)

(assert (=> d!18964 (=> (not res!51254) (not e!40993))))

(declare-fun lt!96315 () (_ BitVec 64))

(declare-fun lt!96312 () (_ BitVec 64))

(declare-fun lt!96313 () (_ BitVec 64))

(assert (=> d!18964 (= res!51254 (= lt!96313 (bvsub lt!96315 lt!96312)))))

(assert (=> d!18964 (or (= (bvand lt!96315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96312 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96315 lt!96312) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18964 (= lt!96312 (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379))))))

(declare-fun lt!96311 () (_ BitVec 64))

(declare-fun lt!96316 () (_ BitVec 64))

(assert (=> d!18964 (= lt!96315 (bvmul lt!96311 lt!96316))))

(assert (=> d!18964 (or (= lt!96311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96316 (bvsdiv (bvmul lt!96311 lt!96316) lt!96311)))))

(assert (=> d!18964 (= lt!96316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18964 (= lt!96311 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))))))

(assert (=> d!18964 (= lt!96313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3268 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3263 thiss!1379))))))

(assert (=> d!18964 (invariant!0 (currentBit!3263 thiss!1379) (currentByte!3268 thiss!1379) (size!1263 (buf!1644 thiss!1379)))))

(assert (=> d!18964 (= (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)) lt!96313)))

(declare-fun b!61548 () Bool)

(declare-fun res!51255 () Bool)

(assert (=> b!61548 (=> (not res!51255) (not e!40993))))

(assert (=> b!61548 (= res!51255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96313))))

(declare-fun b!61549 () Bool)

(declare-fun lt!96314 () (_ BitVec 64))

(assert (=> b!61549 (= e!40993 (bvsle lt!96313 (bvmul lt!96314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61549 (or (= lt!96314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96314)))))

(assert (=> b!61549 (= lt!96314 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))))))

(assert (= (and d!18964 res!51254) b!61548))

(assert (= (and b!61548 res!51255) b!61549))

(declare-fun m!97201 () Bool)

(assert (=> d!18964 m!97201))

(declare-fun m!97203 () Bool)

(assert (=> d!18964 m!97203))

(assert (=> b!61240 d!18964))

(declare-fun d!18966 () Bool)

(declare-fun e!40994 () Bool)

(assert (=> d!18966 e!40994))

(declare-fun res!51256 () Bool)

(assert (=> d!18966 (=> (not res!51256) (not e!40994))))

(declare-fun lt!96318 () (_ BitVec 64))

(declare-fun lt!96321 () (_ BitVec 64))

(declare-fun lt!96319 () (_ BitVec 64))

(assert (=> d!18966 (= res!51256 (= lt!96319 (bvsub lt!96321 lt!96318)))))

(assert (=> d!18966 (or (= (bvand lt!96321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96318 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96321 lt!96318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18966 (= lt!96318 (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95697))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95697)))))))

(declare-fun lt!96317 () (_ BitVec 64))

(declare-fun lt!96322 () (_ BitVec 64))

(assert (=> d!18966 (= lt!96321 (bvmul lt!96317 lt!96322))))

(assert (=> d!18966 (or (= lt!96317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96322 (bvsdiv (bvmul lt!96317 lt!96322) lt!96317)))))

(assert (=> d!18966 (= lt!96322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18966 (= lt!96317 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (=> d!18966 (= lt!96319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95697)))))))

(assert (=> d!18966 (invariant!0 (currentBit!3263 (_2!2893 lt!95697)) (currentByte!3268 (_2!2893 lt!95697)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))

(assert (=> d!18966 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697))) lt!96319)))

(declare-fun b!61550 () Bool)

(declare-fun res!51257 () Bool)

(assert (=> b!61550 (=> (not res!51257) (not e!40994))))

(assert (=> b!61550 (= res!51257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96319))))

(declare-fun b!61551 () Bool)

(declare-fun lt!96320 () (_ BitVec 64))

(assert (=> b!61551 (= e!40994 (bvsle lt!96319 (bvmul lt!96320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61551 (or (= lt!96320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96320)))))

(assert (=> b!61551 (= lt!96320 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (= (and d!18966 res!51256) b!61550))

(assert (= (and b!61550 res!51257) b!61551))

(declare-fun m!97205 () Bool)

(assert (=> d!18966 m!97205))

(assert (=> d!18966 m!96661))

(assert (=> b!61242 d!18966))

(declare-fun d!18968 () Bool)

(declare-fun res!51259 () Bool)

(declare-fun e!40996 () Bool)

(assert (=> d!18968 (=> (not res!51259) (not e!40996))))

(assert (=> d!18968 (= res!51259 (= (size!1263 (buf!1644 (_1!2892 lt!95700))) (size!1263 (buf!1644 (_2!2893 lt!95697)))))))

(assert (=> d!18968 (= (isPrefixOf!0 (_1!2892 lt!95700) (_2!2893 lt!95697)) e!40996)))

(declare-fun b!61552 () Bool)

(declare-fun res!51260 () Bool)

(assert (=> b!61552 (=> (not res!51260) (not e!40996))))

(assert (=> b!61552 (= res!51260 (bvsle (bitIndex!0 (size!1263 (buf!1644 (_1!2892 lt!95700))) (currentByte!3268 (_1!2892 lt!95700)) (currentBit!3263 (_1!2892 lt!95700))) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95697))) (currentByte!3268 (_2!2893 lt!95697)) (currentBit!3263 (_2!2893 lt!95697)))))))

(declare-fun b!61553 () Bool)

(declare-fun e!40995 () Bool)

(assert (=> b!61553 (= e!40996 e!40995)))

(declare-fun res!51258 () Bool)

(assert (=> b!61553 (=> res!51258 e!40995)))

(assert (=> b!61553 (= res!51258 (= (size!1263 (buf!1644 (_1!2892 lt!95700))) #b00000000000000000000000000000000))))

(declare-fun b!61554 () Bool)

(assert (=> b!61554 (= e!40995 (arrayBitRangesEq!0 (buf!1644 (_1!2892 lt!95700)) (buf!1644 (_2!2893 lt!95697)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 (_1!2892 lt!95700))) (currentByte!3268 (_1!2892 lt!95700)) (currentBit!3263 (_1!2892 lt!95700)))))))

(assert (= (and d!18968 res!51259) b!61552))

(assert (= (and b!61552 res!51260) b!61553))

(assert (= (and b!61553 (not res!51258)) b!61554))

(declare-fun m!97207 () Bool)

(assert (=> b!61552 m!97207))

(assert (=> b!61552 m!96667))

(assert (=> b!61554 m!97207))

(assert (=> b!61554 m!97207))

(declare-fun m!97209 () Bool)

(assert (=> b!61554 m!97209))

(assert (=> b!61231 d!18968))

(declare-fun d!18970 () Bool)

(assert (=> d!18970 (= (array_inv!1163 srcBuffer!2) (bvsge (size!1263 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12014 d!18970))

(declare-fun d!18972 () Bool)

(assert (=> d!18972 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3263 thiss!1379) (currentByte!3268 thiss!1379) (size!1263 (buf!1644 thiss!1379))))))

(declare-fun bs!4733 () Bool)

(assert (= bs!4733 d!18972))

(assert (=> bs!4733 m!97203))

(assert (=> start!12014 d!18972))

(declare-fun d!18974 () Bool)

(assert (=> d!18974 (= (head!498 (byteArrayBitContentToList!0 (_2!2893 lt!95687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!794 (byteArrayBitContentToList!0 (_2!2893 lt!95687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61243 d!18974))

(declare-fun d!18976 () Bool)

(declare-fun c!4339 () Bool)

(assert (=> d!18976 (= c!4339 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40999 () List!679)

(assert (=> d!18976 (= (byteArrayBitContentToList!0 (_2!2893 lt!95687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40999)))

(declare-fun b!61559 () Bool)

(assert (=> b!61559 (= e!40999 Nil!676)))

(declare-fun b!61560 () Bool)

(assert (=> b!61560 (= e!40999 (Cons!675 (not (= (bvand ((_ sign_extend 24) (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2893 lt!95687) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18976 c!4339) b!61559))

(assert (= (and d!18976 (not c!4339)) b!61560))

(assert (=> b!61560 m!96675))

(declare-fun m!97211 () Bool)

(assert (=> b!61560 m!97211))

(declare-fun m!97213 () Bool)

(assert (=> b!61560 m!97213))

(assert (=> b!61243 d!18976))

(declare-fun d!18978 () Bool)

(assert (=> d!18978 (= (head!498 (bitStreamReadBitsIntoList!0 (_2!2893 lt!95687) (_1!2892 lt!95693) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!794 (bitStreamReadBitsIntoList!0 (_2!2893 lt!95687) (_1!2892 lt!95693) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61243 d!18978))

(declare-fun e!41000 () tuple2!5572)

(declare-fun lt!96324 () (_ BitVec 64))

(declare-fun lt!96323 () tuple2!5570)

(declare-fun b!61562 () Bool)

(assert (=> b!61562 (= e!41000 (tuple2!5573 (Cons!675 (_1!2896 lt!96323) (bitStreamReadBitsIntoList!0 (_2!2893 lt!95687) (_2!2896 lt!96323) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!96324))) (_2!2896 lt!96323)))))

(assert (=> b!61562 (= lt!96323 (readBit!0 (_1!2892 lt!95693)))))

(assert (=> b!61562 (= lt!96324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61561 () Bool)

(assert (=> b!61561 (= e!41000 (tuple2!5573 Nil!676 (_1!2892 lt!95693)))))

(declare-fun d!18980 () Bool)

(declare-fun e!41001 () Bool)

(assert (=> d!18980 e!41001))

(declare-fun c!4340 () Bool)

(assert (=> d!18980 (= c!4340 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!96325 () List!679)

(assert (=> d!18980 (= lt!96325 (_1!2897 e!41000))))

(declare-fun c!4341 () Bool)

(assert (=> d!18980 (= c!4341 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18980 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18980 (= (bitStreamReadBitsIntoList!0 (_2!2893 lt!95687) (_1!2892 lt!95693) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96325)))

(declare-fun b!61563 () Bool)

(assert (=> b!61563 (= e!41001 (isEmpty!183 lt!96325))))

(declare-fun b!61564 () Bool)

(assert (=> b!61564 (= e!41001 (> (length!307 lt!96325) 0))))

(assert (= (and d!18980 c!4341) b!61561))

(assert (= (and d!18980 (not c!4341)) b!61562))

(assert (= (and d!18980 c!4340) b!61563))

(assert (= (and d!18980 (not c!4340)) b!61564))

(declare-fun m!97215 () Bool)

(assert (=> b!61562 m!97215))

(declare-fun m!97217 () Bool)

(assert (=> b!61562 m!97217))

(declare-fun m!97219 () Bool)

(assert (=> b!61563 m!97219))

(declare-fun m!97221 () Bool)

(assert (=> b!61564 m!97221))

(assert (=> b!61243 d!18980))

(declare-fun d!18982 () Bool)

(assert (=> d!18982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 thiss!1379))) ((_ sign_extend 32) (currentByte!3268 thiss!1379)) ((_ sign_extend 32) (currentBit!3263 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4734 () Bool)

(assert (= bs!4734 d!18982))

(assert (=> bs!4734 m!97201))

(assert (=> b!61232 d!18982))

(declare-fun d!18984 () Bool)

(declare-fun res!51262 () Bool)

(declare-fun e!41003 () Bool)

(assert (=> d!18984 (=> (not res!51262) (not e!41003))))

(assert (=> d!18984 (= res!51262 (= (size!1263 (buf!1644 thiss!1379)) (size!1263 (buf!1644 (_2!2893 lt!95687)))))))

(assert (=> d!18984 (= (isPrefixOf!0 thiss!1379 (_2!2893 lt!95687)) e!41003)))

(declare-fun b!61565 () Bool)

(declare-fun res!51263 () Bool)

(assert (=> b!61565 (=> (not res!51263) (not e!41003))))

(assert (=> b!61565 (= res!51263 (bvsle (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!95687))) (currentByte!3268 (_2!2893 lt!95687)) (currentBit!3263 (_2!2893 lt!95687)))))))

(declare-fun b!61566 () Bool)

(declare-fun e!41002 () Bool)

(assert (=> b!61566 (= e!41003 e!41002)))

(declare-fun res!51261 () Bool)

(assert (=> b!61566 (=> res!51261 e!41002)))

(assert (=> b!61566 (= res!51261 (= (size!1263 (buf!1644 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61567 () Bool)

(assert (=> b!61567 (= e!41002 (arrayBitRangesEq!0 (buf!1644 thiss!1379) (buf!1644 (_2!2893 lt!95687)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379))))))

(assert (= (and d!18984 res!51262) b!61565))

(assert (= (and b!61565 res!51263) b!61566))

(assert (= (and b!61566 (not res!51261)) b!61567))

(assert (=> b!61565 m!96635))

(assert (=> b!61565 m!96629))

(assert (=> b!61567 m!96635))

(assert (=> b!61567 m!96635))

(declare-fun m!97223 () Bool)

(assert (=> b!61567 m!97223))

(assert (=> b!61234 d!18984))

(declare-fun d!18986 () Bool)

(assert (=> d!18986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) lt!95699) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687)))) lt!95699))))

(declare-fun bs!4735 () Bool)

(assert (= bs!4735 d!18986))

(assert (=> bs!4735 m!96849))

(assert (=> b!61234 d!18986))

(declare-fun d!18988 () Bool)

(declare-fun e!41006 () Bool)

(assert (=> d!18988 e!41006))

(declare-fun res!51266 () Bool)

(assert (=> d!18988 (=> (not res!51266) (not e!41006))))

(assert (=> d!18988 (= res!51266 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!96328 () Unit!4173)

(declare-fun choose!27 (BitStream!2208 BitStream!2208 (_ BitVec 64) (_ BitVec 64)) Unit!4173)

(assert (=> d!18988 (= lt!96328 (choose!27 thiss!1379 (_2!2893 lt!95687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18988 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18988 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2893 lt!95687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96328)))

(declare-fun b!61570 () Bool)

(assert (=> b!61570 (= e!41006 (validate_offset_bits!1 ((_ sign_extend 32) (size!1263 (buf!1644 (_2!2893 lt!95687)))) ((_ sign_extend 32) (currentByte!3268 (_2!2893 lt!95687))) ((_ sign_extend 32) (currentBit!3263 (_2!2893 lt!95687))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18988 res!51266) b!61570))

(declare-fun m!97225 () Bool)

(assert (=> d!18988 m!97225))

(declare-fun m!97227 () Bool)

(assert (=> b!61570 m!97227))

(assert (=> b!61234 d!18988))

(declare-fun b!61588 () Bool)

(declare-fun e!41017 () Bool)

(declare-fun e!41016 () Bool)

(assert (=> b!61588 (= e!41017 e!41016)))

(declare-fun res!51288 () Bool)

(assert (=> b!61588 (=> (not res!51288) (not e!41016))))

(declare-fun lt!96363 () tuple2!5564)

(declare-datatypes ((tuple2!5576 0))(
  ( (tuple2!5577 (_1!2899 BitStream!2208) (_2!2899 Bool)) )
))
(declare-fun lt!96361 () tuple2!5576)

(declare-fun lt!96356 () (_ BitVec 8))

(assert (=> b!61588 (= res!51288 (and (= (_2!2899 lt!96361) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!96356)) #b00000000000000000000000000000000))) (= (_1!2899 lt!96361) (_2!2893 lt!96363))))))

(declare-fun lt!96358 () tuple2!5574)

(declare-fun lt!96355 () BitStream!2208)

(assert (=> b!61588 (= lt!96358 (readBits!0 lt!96355 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2208) tuple2!5576)

(assert (=> b!61588 (= lt!96361 (readBitPure!0 lt!96355))))

(declare-fun readerFrom!0 (BitStream!2208 (_ BitVec 32) (_ BitVec 32)) BitStream!2208)

(assert (=> b!61588 (= lt!96355 (readerFrom!0 (_2!2893 lt!96363) (currentBit!3263 thiss!1379) (currentByte!3268 thiss!1379)))))

(declare-fun b!61589 () Bool)

(declare-fun res!51286 () Bool)

(assert (=> b!61589 (=> (not res!51286) (not e!41017))))

(assert (=> b!61589 (= res!51286 (isPrefixOf!0 thiss!1379 (_2!2893 lt!96363)))))

(declare-fun b!61590 () Bool)

(declare-fun res!51289 () Bool)

(declare-fun e!41018 () Bool)

(assert (=> b!61590 (=> (not res!51289) (not e!41018))))

(declare-fun lt!96353 () tuple2!5564)

(assert (=> b!61590 (= res!51289 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96353))) (currentByte!3268 (_2!2893 lt!96353)) (currentBit!3263 (_2!2893 lt!96353))) (bvadd (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61591 () Bool)

(declare-fun res!51285 () Bool)

(assert (=> b!61591 (=> (not res!51285) (not e!41018))))

(assert (=> b!61591 (= res!51285 (isPrefixOf!0 thiss!1379 (_2!2893 lt!96353)))))

(declare-fun b!61592 () Bool)

(assert (=> b!61592 (= e!41016 (= (bitIndex!0 (size!1263 (buf!1644 (_1!2899 lt!96361))) (currentByte!3268 (_1!2899 lt!96361)) (currentBit!3263 (_1!2899 lt!96361))) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96363))) (currentByte!3268 (_2!2893 lt!96363)) (currentBit!3263 (_2!2893 lt!96363)))))))

(declare-fun b!61593 () Bool)

(declare-fun res!51283 () Bool)

(assert (=> b!61593 (=> (not res!51283) (not e!41017))))

(declare-fun lt!96360 () (_ BitVec 64))

(declare-fun lt!96364 () (_ BitVec 64))

(assert (=> b!61593 (= res!51283 (= (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96363))) (currentByte!3268 (_2!2893 lt!96363)) (currentBit!3263 (_2!2893 lt!96363))) (bvadd lt!96364 lt!96360)))))

(assert (=> b!61593 (or (not (= (bvand lt!96364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96360 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96364 lt!96360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61593 (= lt!96360 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!61593 (= lt!96364 (bitIndex!0 (size!1263 (buf!1644 thiss!1379)) (currentByte!3268 thiss!1379) (currentBit!3263 thiss!1379)))))

(declare-fun b!61594 () Bool)

(declare-fun e!41015 () Bool)

(assert (=> b!61594 (= e!41018 e!41015)))

(declare-fun res!51290 () Bool)

(assert (=> b!61594 (=> (not res!51290) (not e!41015))))

(declare-fun lt!96362 () Bool)

(declare-fun lt!96354 () tuple2!5576)

(assert (=> b!61594 (= res!51290 (and (= (_2!2899 lt!96354) lt!96362) (= (_1!2899 lt!96354) (_2!2893 lt!96353))))))

(assert (=> b!61594 (= lt!96354 (readBitPure!0 (readerFrom!0 (_2!2893 lt!96353) (currentBit!3263 thiss!1379) (currentByte!3268 thiss!1379))))))

(declare-fun b!61595 () Bool)

(assert (=> b!61595 (= e!41015 (= (bitIndex!0 (size!1263 (buf!1644 (_1!2899 lt!96354))) (currentByte!3268 (_1!2899 lt!96354)) (currentBit!3263 (_1!2899 lt!96354))) (bitIndex!0 (size!1263 (buf!1644 (_2!2893 lt!96353))) (currentByte!3268 (_2!2893 lt!96353)) (currentBit!3263 (_2!2893 lt!96353)))))))

(declare-fun d!18990 () Bool)

(assert (=> d!18990 e!41017))

(declare-fun res!51284 () Bool)

(assert (=> d!18990 (=> (not res!51284) (not e!41017))))

(assert (=> d!18990 (= res!51284 (= (size!1263 (buf!1644 (_2!2893 lt!96363))) (size!1263 (buf!1644 thiss!1379))))))

(declare-fun lt!96359 () array!2772)

(assert (=> d!18990 (= lt!96356 (select (arr!1827 lt!96359) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18990 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1263 lt!96359)))))

(assert (=> d!18990 (= lt!96359 (array!2773 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!96357 () tuple2!5564)

(assert (=> d!18990 (= lt!96363 (tuple2!5565 (_1!2893 lt!96357) (_2!2893 lt!96357)))))

(assert (=> d!18990 (= lt!96357 lt!96353)))

(assert (=> d!18990 e!41018))

(declare-fun res!51287 () Bool)

(assert (=> d!18990 (=> (not res!51287) (not e!41018))))

(assert (=> d!18990 (= res!51287 (= (size!1263 (buf!1644 thiss!1379)) (size!1263 (buf!1644 (_2!2893 lt!96353)))))))

(declare-fun appendBit!0 (BitStream!2208 Bool) tuple2!5564)

(assert (=> d!18990 (= lt!96353 (appendBit!0 thiss!1379 lt!96362))))

(assert (=> d!18990 (= lt!96362 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18990 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18990 (= (appendBitFromByte!0 thiss!1379 (select (arr!1827 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!96363)))

(assert (= (and d!18990 res!51287) b!61590))

(assert (= (and b!61590 res!51289) b!61591))

(assert (= (and b!61591 res!51285) b!61594))

(assert (= (and b!61594 res!51290) b!61595))

(assert (= (and d!18990 res!51284) b!61593))

(assert (= (and b!61593 res!51283) b!61589))

(assert (= (and b!61589 res!51286) b!61588))

(assert (= (and b!61588 res!51288) b!61592))

(declare-fun m!97229 () Bool)

(assert (=> b!61595 m!97229))

(declare-fun m!97231 () Bool)

(assert (=> b!61595 m!97231))

(declare-fun m!97233 () Bool)

(assert (=> b!61591 m!97233))

(declare-fun m!97235 () Bool)

(assert (=> b!61589 m!97235))

(declare-fun m!97237 () Bool)

(assert (=> b!61594 m!97237))

(assert (=> b!61594 m!97237))

(declare-fun m!97239 () Bool)

(assert (=> b!61594 m!97239))

(declare-fun m!97241 () Bool)

(assert (=> d!18990 m!97241))

(declare-fun m!97243 () Bool)

(assert (=> d!18990 m!97243))

(assert (=> d!18990 m!97211))

(declare-fun m!97245 () Bool)

(assert (=> b!61588 m!97245))

(declare-fun m!97247 () Bool)

(assert (=> b!61588 m!97247))

(declare-fun m!97249 () Bool)

(assert (=> b!61588 m!97249))

(declare-fun m!97251 () Bool)

(assert (=> b!61593 m!97251))

(assert (=> b!61593 m!96635))

(declare-fun m!97253 () Bool)

(assert (=> b!61592 m!97253))

(assert (=> b!61592 m!97251))

(assert (=> b!61590 m!97231))

(assert (=> b!61590 m!96635))

(assert (=> b!61234 d!18990))

(declare-fun d!18992 () Bool)

(declare-fun size!1265 (List!679) Int)

(assert (=> d!18992 (= (length!307 lt!95689) (size!1265 lt!95689))))

(declare-fun bs!4736 () Bool)

(assert (= bs!4736 d!18992))

(declare-fun m!97255 () Bool)

(assert (=> bs!4736 m!97255))

(assert (=> b!61235 d!18992))

(declare-fun d!18994 () Bool)

(assert (=> d!18994 (= (invariant!0 (currentBit!3263 (_2!2893 lt!95697)) (currentByte!3268 (_2!2893 lt!95697)) (size!1263 (buf!1644 (_2!2893 lt!95697)))) (and (bvsge (currentBit!3263 (_2!2893 lt!95697)) #b00000000000000000000000000000000) (bvslt (currentBit!3263 (_2!2893 lt!95697)) #b00000000000000000000000000001000) (bvsge (currentByte!3268 (_2!2893 lt!95697)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3268 (_2!2893 lt!95697)) (size!1263 (buf!1644 (_2!2893 lt!95697)))) (and (= (currentBit!3263 (_2!2893 lt!95697)) #b00000000000000000000000000000000) (= (currentByte!3268 (_2!2893 lt!95697)) (size!1263 (buf!1644 (_2!2893 lt!95697))))))))))

(assert (=> b!61237 d!18994))

(declare-fun d!18996 () Bool)

(assert (=> d!18996 (= (invariant!0 (currentBit!3263 (_2!2893 lt!95687)) (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95687)))) (and (bvsge (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (bvslt (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000001000) (bvsge (currentByte!3268 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95687)))) (and (= (currentBit!3263 (_2!2893 lt!95687)) #b00000000000000000000000000000000) (= (currentByte!3268 (_2!2893 lt!95687)) (size!1263 (buf!1644 (_2!2893 lt!95687))))))))))

(assert (=> b!61236 d!18996))

(check-sat (not b!61590) (not b!61536) (not d!18972) (not b!61330) (not b!61542) (not b!61544) (not b!61547) (not b!61588) (not d!18824) (not d!18990) (not d!18820) (not d!18840) (not b!61339) (not b!61534) (not b!61565) (not d!18982) (not b!61310) (not b!61564) (not b!61562) (not b!61563) (not b!61552) (not d!18838) (not b!61593) (not d!18842) (not b!61306) (not d!18828) (not d!18952) (not b!61567) (not b!61533) (not b!61322) (not d!18832) (not b!61560) (not bm!772) (not b!61543) (not b!61545) (not b!61323) (not b!61325) (not b!61337) (not b!61527) (not b!61531) (not b!61595) (not b!61589) (not d!18992) (not b!61541) (not d!18962) (not b!61592) (not d!18966) (not b!61328) (not b!61305) (not b!61537) (not b!61309) (not b!61329) (not b!61554) (not d!18956) (not b!61327) (not b!61539) (not b!61304) (not b!61570) (not b!61594) (not d!18986) (not b!61530) (not b!61529) (not d!18988) (not b!61532) (not d!18830) (not d!18964) (not b!61324) (not b!61591) (not d!18958) (not d!18818) (not b!61308))
