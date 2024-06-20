; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52230 () Bool)

(assert start!52230)

(declare-fun b!240558 () Bool)

(declare-fun res!200819 () Bool)

(declare-fun e!166734 () Bool)

(assert (=> b!240558 (=> (not res!200819) (not e!166734))))

(declare-datatypes ((array!13161 0))(
  ( (array!13162 (arr!6752 (Array (_ BitVec 32) (_ BitVec 8))) (size!5765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10452 0))(
  ( (BitStream!10453 (buf!6225 array!13161) (currentByte!11579 (_ BitVec 32)) (currentBit!11574 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10452)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240558 (= res!200819 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288))))

(declare-fun b!240559 () Bool)

(declare-fun res!200823 () Bool)

(declare-fun e!166733 () Bool)

(assert (=> b!240559 (=> (not res!200823) (not e!166733))))

(declare-datatypes ((Unit!17631 0))(
  ( (Unit!17632) )
))
(declare-datatypes ((tuple2!20442 0))(
  ( (tuple2!20443 (_1!11143 Unit!17631) (_2!11143 BitStream!10452)) )
))
(declare-fun lt!375707 () tuple2!20442)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240559 (= res!200823 (= (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375707))) (currentByte!11579 (_2!11143 lt!375707)) (currentBit!11574 (_2!11143 lt!375707))) (bvadd (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)) nBits!288)))))

(declare-fun b!240560 () Bool)

(declare-datatypes ((tuple2!20444 0))(
  ( (tuple2!20445 (_1!11144 BitStream!10452) (_2!11144 BitStream!10452)) )
))
(declare-fun lt!375706 () tuple2!20444)

(assert (=> b!240560 (= e!166734 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_1!11144 lt!375706)))) ((_ sign_extend 32) (currentByte!11579 (_1!11144 lt!375706))) ((_ sign_extend 32) (currentBit!11574 (_1!11144 lt!375706))) nBits!288)))))

(assert (=> b!240560 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288)))

(declare-fun lt!375704 () Unit!17631)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10452 array!13161 (_ BitVec 64)) Unit!17631)

(assert (=> b!240560 (= lt!375704 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6225 (_2!11143 lt!375707)) nBits!288))))

(declare-fun reader!0 (BitStream!10452 BitStream!10452) tuple2!20444)

(assert (=> b!240560 (= lt!375706 (reader!0 thiss!982 (_2!11143 lt!375707)))))

(declare-fun lt!375710 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10452 BitStream!10452) Bool)

(assert (=> b!240560 (= lt!375710 (isPrefixOf!0 thiss!982 (_2!11143 lt!375707)))))

(declare-fun lt!375708 () (_ BitVec 64))

(assert (=> b!240560 (= lt!375708 (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375707))) (currentByte!11579 (_2!11143 lt!375707)) (currentBit!11574 (_2!11143 lt!375707))))))

(declare-fun lt!375709 () (_ BitVec 64))

(assert (=> b!240560 (= lt!375709 (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)))))

(assert (=> b!240560 e!166733))

(declare-fun res!200822 () Bool)

(assert (=> b!240560 (=> (not res!200822) (not e!166733))))

(assert (=> b!240560 (= res!200822 (= (size!5765 (buf!6225 thiss!982)) (size!5765 (buf!6225 (_2!11143 lt!375707)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10452 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20442)

(assert (=> b!240560 (= lt!375707 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240561 () Bool)

(declare-fun e!166735 () Bool)

(declare-fun array_inv!5506 (array!13161) Bool)

(assert (=> b!240561 (= e!166735 (array_inv!5506 (buf!6225 thiss!982)))))

(declare-fun b!240562 () Bool)

(declare-fun res!200820 () Bool)

(assert (=> b!240562 (=> (not res!200820) (not e!166733))))

(assert (=> b!240562 (= res!200820 (isPrefixOf!0 thiss!982 (_2!11143 lt!375707)))))

(declare-fun b!240563 () Bool)

(declare-datatypes ((tuple2!20446 0))(
  ( (tuple2!20447 (_1!11145 BitStream!10452) (_2!11145 Bool)) )
))
(declare-fun lt!375705 () tuple2!20446)

(declare-fun lt!375703 () tuple2!20444)

(assert (=> b!240563 (= e!166733 (not (or (not (_2!11145 lt!375705)) (not (= (_1!11145 lt!375705) (_2!11144 lt!375703))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10452 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20446)

(assert (=> b!240563 (= lt!375705 (checkBitsLoopPure!0 (_1!11144 lt!375703) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240563 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288)))

(declare-fun lt!375711 () Unit!17631)

(assert (=> b!240563 (= lt!375711 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6225 (_2!11143 lt!375707)) nBits!288))))

(assert (=> b!240563 (= lt!375703 (reader!0 thiss!982 (_2!11143 lt!375707)))))

(declare-fun res!200821 () Bool)

(assert (=> start!52230 (=> (not res!200821) (not e!166734))))

(assert (=> start!52230 (= res!200821 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52230 e!166734))

(assert (=> start!52230 true))

(declare-fun inv!12 (BitStream!10452) Bool)

(assert (=> start!52230 (and (inv!12 thiss!982) e!166735)))

(assert (= (and start!52230 res!200821) b!240558))

(assert (= (and b!240558 res!200819) b!240560))

(assert (= (and b!240560 res!200822) b!240559))

(assert (= (and b!240559 res!200823) b!240562))

(assert (= (and b!240562 res!200820) b!240563))

(assert (= start!52230 b!240561))

(declare-fun m!363081 () Bool)

(assert (=> b!240563 m!363081))

(declare-fun m!363083 () Bool)

(assert (=> b!240563 m!363083))

(declare-fun m!363085 () Bool)

(assert (=> b!240563 m!363085))

(declare-fun m!363087 () Bool)

(assert (=> b!240563 m!363087))

(declare-fun m!363089 () Bool)

(assert (=> b!240559 m!363089))

(declare-fun m!363091 () Bool)

(assert (=> b!240559 m!363091))

(declare-fun m!363093 () Bool)

(assert (=> b!240558 m!363093))

(assert (=> b!240560 m!363087))

(declare-fun m!363095 () Bool)

(assert (=> b!240560 m!363095))

(assert (=> b!240560 m!363089))

(declare-fun m!363097 () Bool)

(assert (=> b!240560 m!363097))

(assert (=> b!240560 m!363083))

(declare-fun m!363099 () Bool)

(assert (=> b!240560 m!363099))

(assert (=> b!240560 m!363091))

(assert (=> b!240560 m!363085))

(declare-fun m!363101 () Bool)

(assert (=> b!240561 m!363101))

(declare-fun m!363103 () Bool)

(assert (=> start!52230 m!363103))

(assert (=> b!240562 m!363099))

(check-sat (not start!52230) (not b!240561) (not b!240559) (not b!240560) (not b!240563) (not b!240558) (not b!240562))
(check-sat)
(get-model)

(declare-fun d!81316 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81316 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982))) nBits!288))))

(declare-fun bs!20513 () Bool)

(assert (= bs!20513 d!81316))

(declare-fun m!363129 () Bool)

(assert (=> bs!20513 m!363129))

(assert (=> b!240560 d!81316))

(declare-fun d!81318 () Bool)

(declare-fun res!200846 () Bool)

(declare-fun e!166754 () Bool)

(assert (=> d!81318 (=> (not res!200846) (not e!166754))))

(assert (=> d!81318 (= res!200846 (= (size!5765 (buf!6225 thiss!982)) (size!5765 (buf!6225 (_2!11143 lt!375707)))))))

(assert (=> d!81318 (= (isPrefixOf!0 thiss!982 (_2!11143 lt!375707)) e!166754)))

(declare-fun b!240588 () Bool)

(declare-fun res!200845 () Bool)

(assert (=> b!240588 (=> (not res!200845) (not e!166754))))

(assert (=> b!240588 (= res!200845 (bvsle (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)) (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375707))) (currentByte!11579 (_2!11143 lt!375707)) (currentBit!11574 (_2!11143 lt!375707)))))))

(declare-fun b!240589 () Bool)

(declare-fun e!166753 () Bool)

(assert (=> b!240589 (= e!166754 e!166753)))

(declare-fun res!200847 () Bool)

(assert (=> b!240589 (=> res!200847 e!166753)))

(assert (=> b!240589 (= res!200847 (= (size!5765 (buf!6225 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240590 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13161 array!13161 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240590 (= e!166753 (arrayBitRangesEq!0 (buf!6225 thiss!982) (buf!6225 (_2!11143 lt!375707)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982))))))

(assert (= (and d!81318 res!200846) b!240588))

(assert (= (and b!240588 res!200845) b!240589))

(assert (= (and b!240589 (not res!200847)) b!240590))

(assert (=> b!240588 m!363091))

(assert (=> b!240588 m!363089))

(assert (=> b!240590 m!363091))

(assert (=> b!240590 m!363091))

(declare-fun m!363131 () Bool)

(assert (=> b!240590 m!363131))

(assert (=> b!240560 d!81318))

(declare-fun d!81320 () Bool)

(declare-fun e!166757 () Bool)

(assert (=> d!81320 e!166757))

(declare-fun res!200852 () Bool)

(assert (=> d!81320 (=> (not res!200852) (not e!166757))))

(declare-fun lt!375756 () (_ BitVec 64))

(declare-fun lt!375752 () (_ BitVec 64))

(declare-fun lt!375751 () (_ BitVec 64))

(assert (=> d!81320 (= res!200852 (= lt!375751 (bvsub lt!375756 lt!375752)))))

(assert (=> d!81320 (or (= (bvand lt!375756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375752 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375756 lt!375752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81320 (= lt!375752 (remainingBits!0 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982))))))

(declare-fun lt!375753 () (_ BitVec 64))

(declare-fun lt!375755 () (_ BitVec 64))

(assert (=> d!81320 (= lt!375756 (bvmul lt!375753 lt!375755))))

(assert (=> d!81320 (or (= lt!375753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375755 (bvsdiv (bvmul lt!375753 lt!375755) lt!375753)))))

(assert (=> d!81320 (= lt!375755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81320 (= lt!375753 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))))))

(assert (=> d!81320 (= lt!375751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11579 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11574 thiss!982))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81320 (invariant!0 (currentBit!11574 thiss!982) (currentByte!11579 thiss!982) (size!5765 (buf!6225 thiss!982)))))

(assert (=> d!81320 (= (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)) lt!375751)))

(declare-fun b!240595 () Bool)

(declare-fun res!200853 () Bool)

(assert (=> b!240595 (=> (not res!200853) (not e!166757))))

(assert (=> b!240595 (= res!200853 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375751))))

(declare-fun b!240596 () Bool)

(declare-fun lt!375754 () (_ BitVec 64))

(assert (=> b!240596 (= e!166757 (bvsle lt!375751 (bvmul lt!375754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240596 (or (= lt!375754 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375754 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375754)))))

(assert (=> b!240596 (= lt!375754 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))))))

(assert (= (and d!81320 res!200852) b!240595))

(assert (= (and b!240595 res!200853) b!240596))

(declare-fun m!363133 () Bool)

(assert (=> d!81320 m!363133))

(declare-fun m!363135 () Bool)

(assert (=> d!81320 m!363135))

(assert (=> b!240560 d!81320))

(declare-fun d!81322 () Bool)

(declare-fun e!166784 () Bool)

(assert (=> d!81322 e!166784))

(declare-fun res!200895 () Bool)

(assert (=> d!81322 (=> (not res!200895) (not e!166784))))

(declare-fun lt!375918 () tuple2!20442)

(assert (=> d!81322 (= res!200895 (= (size!5765 (buf!6225 thiss!982)) (size!5765 (buf!6225 (_2!11143 lt!375918)))))))

(declare-fun choose!51 (BitStream!10452 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20442)

(assert (=> d!81322 (= lt!375918 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81322 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81322 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!375918)))

(declare-fun b!240653 () Bool)

(declare-fun e!166783 () Bool)

(declare-fun lt!375917 () (_ BitVec 64))

(assert (=> b!240653 (= e!166783 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) lt!375917))))

(declare-fun b!240650 () Bool)

(declare-fun res!200897 () Bool)

(assert (=> b!240650 (=> (not res!200897) (not e!166784))))

(declare-fun lt!375919 () (_ BitVec 64))

(declare-fun lt!375922 () (_ BitVec 64))

(assert (=> b!240650 (= res!200897 (= (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375918))) (currentByte!11579 (_2!11143 lt!375918)) (currentBit!11574 (_2!11143 lt!375918))) (bvadd lt!375919 lt!375922)))))

(assert (=> b!240650 (or (not (= (bvand lt!375919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375922 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!375919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!375919 lt!375922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240650 (= lt!375922 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240650 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240650 (= lt!375919 (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)))))

(declare-fun b!240652 () Bool)

(declare-fun lt!375924 () tuple2!20446)

(declare-fun lt!375920 () tuple2!20444)

(assert (=> b!240652 (= e!166784 (and (_2!11145 lt!375924) (= (_1!11145 lt!375924) (_2!11144 lt!375920))))))

(assert (=> b!240652 (= lt!375924 (checkBitsLoopPure!0 (_1!11144 lt!375920) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!375923 () Unit!17631)

(declare-fun lt!375921 () Unit!17631)

(assert (=> b!240652 (= lt!375923 lt!375921)))

(assert (=> b!240652 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375918)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) lt!375917)))

(assert (=> b!240652 (= lt!375921 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6225 (_2!11143 lt!375918)) lt!375917))))

(assert (=> b!240652 e!166783))

(declare-fun res!200898 () Bool)

(assert (=> b!240652 (=> (not res!200898) (not e!166783))))

(assert (=> b!240652 (= res!200898 (and (= (size!5765 (buf!6225 thiss!982)) (size!5765 (buf!6225 (_2!11143 lt!375918)))) (bvsge lt!375917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240652 (= lt!375917 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240652 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240652 (= lt!375920 (reader!0 thiss!982 (_2!11143 lt!375918)))))

(declare-fun b!240651 () Bool)

(declare-fun res!200896 () Bool)

(assert (=> b!240651 (=> (not res!200896) (not e!166784))))

(assert (=> b!240651 (= res!200896 (isPrefixOf!0 thiss!982 (_2!11143 lt!375918)))))

(assert (= (and d!81322 res!200895) b!240650))

(assert (= (and b!240650 res!200897) b!240651))

(assert (= (and b!240651 res!200896) b!240652))

(assert (= (and b!240652 res!200898) b!240653))

(declare-fun m!363211 () Bool)

(assert (=> b!240650 m!363211))

(assert (=> b!240650 m!363091))

(declare-fun m!363215 () Bool)

(assert (=> b!240651 m!363215))

(declare-fun m!363217 () Bool)

(assert (=> b!240652 m!363217))

(declare-fun m!363219 () Bool)

(assert (=> b!240652 m!363219))

(declare-fun m!363221 () Bool)

(assert (=> b!240652 m!363221))

(declare-fun m!363223 () Bool)

(assert (=> b!240652 m!363223))

(declare-fun m!363225 () Bool)

(assert (=> b!240653 m!363225))

(declare-fun m!363227 () Bool)

(assert (=> d!81322 m!363227))

(assert (=> b!240560 d!81322))

(declare-fun d!81344 () Bool)

(declare-fun e!166785 () Bool)

(assert (=> d!81344 e!166785))

(declare-fun res!200899 () Bool)

(assert (=> d!81344 (=> (not res!200899) (not e!166785))))

(declare-fun lt!375930 () (_ BitVec 64))

(declare-fun lt!375926 () (_ BitVec 64))

(declare-fun lt!375925 () (_ BitVec 64))

(assert (=> d!81344 (= res!200899 (= lt!375925 (bvsub lt!375930 lt!375926)))))

(assert (=> d!81344 (or (= (bvand lt!375930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375930 lt!375926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81344 (= lt!375926 (remainingBits!0 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 (_2!11143 lt!375707))) ((_ sign_extend 32) (currentBit!11574 (_2!11143 lt!375707)))))))

(declare-fun lt!375927 () (_ BitVec 64))

(declare-fun lt!375929 () (_ BitVec 64))

(assert (=> d!81344 (= lt!375930 (bvmul lt!375927 lt!375929))))

(assert (=> d!81344 (or (= lt!375927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375929 (bvsdiv (bvmul lt!375927 lt!375929) lt!375927)))))

(assert (=> d!81344 (= lt!375929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81344 (= lt!375927 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))))))

(assert (=> d!81344 (= lt!375925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11579 (_2!11143 lt!375707))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11574 (_2!11143 lt!375707)))))))

(assert (=> d!81344 (invariant!0 (currentBit!11574 (_2!11143 lt!375707)) (currentByte!11579 (_2!11143 lt!375707)) (size!5765 (buf!6225 (_2!11143 lt!375707))))))

(assert (=> d!81344 (= (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375707))) (currentByte!11579 (_2!11143 lt!375707)) (currentBit!11574 (_2!11143 lt!375707))) lt!375925)))

(declare-fun b!240654 () Bool)

(declare-fun res!200900 () Bool)

(assert (=> b!240654 (=> (not res!200900) (not e!166785))))

(assert (=> b!240654 (= res!200900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375925))))

(declare-fun b!240655 () Bool)

(declare-fun lt!375928 () (_ BitVec 64))

(assert (=> b!240655 (= e!166785 (bvsle lt!375925 (bvmul lt!375928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240655 (or (= lt!375928 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375928 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375928)))))

(assert (=> b!240655 (= lt!375928 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))))))

(assert (= (and d!81344 res!200899) b!240654))

(assert (= (and b!240654 res!200900) b!240655))

(declare-fun m!363229 () Bool)

(assert (=> d!81344 m!363229))

(declare-fun m!363231 () Bool)

(assert (=> d!81344 m!363231))

(assert (=> b!240560 d!81344))

(declare-fun d!81346 () Bool)

(assert (=> d!81346 (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_2!11143 lt!375707)))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288)))

(declare-fun lt!375933 () Unit!17631)

(declare-fun choose!9 (BitStream!10452 array!13161 (_ BitVec 64) BitStream!10452) Unit!17631)

(assert (=> d!81346 (= lt!375933 (choose!9 thiss!982 (buf!6225 (_2!11143 lt!375707)) nBits!288 (BitStream!10453 (buf!6225 (_2!11143 lt!375707)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982))))))

(assert (=> d!81346 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6225 (_2!11143 lt!375707)) nBits!288) lt!375933)))

(declare-fun bs!20519 () Bool)

(assert (= bs!20519 d!81346))

(assert (=> bs!20519 m!363083))

(declare-fun m!363233 () Bool)

(assert (=> bs!20519 m!363233))

(assert (=> b!240560 d!81346))

(declare-fun d!81348 () Bool)

(assert (=> d!81348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 (_1!11144 lt!375706)))) ((_ sign_extend 32) (currentByte!11579 (_1!11144 lt!375706))) ((_ sign_extend 32) (currentBit!11574 (_1!11144 lt!375706))) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5765 (buf!6225 (_1!11144 lt!375706)))) ((_ sign_extend 32) (currentByte!11579 (_1!11144 lt!375706))) ((_ sign_extend 32) (currentBit!11574 (_1!11144 lt!375706)))) nBits!288))))

(declare-fun bs!20520 () Bool)

(assert (= bs!20520 d!81348))

(declare-fun m!363235 () Bool)

(assert (=> bs!20520 m!363235))

(assert (=> b!240560 d!81348))

(declare-fun b!240697 () Bool)

(declare-fun res!200938 () Bool)

(declare-fun e!166807 () Bool)

(assert (=> b!240697 (=> (not res!200938) (not e!166807))))

(declare-fun lt!376045 () tuple2!20444)

(assert (=> b!240697 (= res!200938 (isPrefixOf!0 (_2!11144 lt!376045) (_2!11143 lt!375707)))))

(declare-fun b!240698 () Bool)

(declare-fun e!166808 () Unit!17631)

(declare-fun lt!376048 () Unit!17631)

(assert (=> b!240698 (= e!166808 lt!376048)))

(declare-fun lt!376038 () (_ BitVec 64))

(assert (=> b!240698 (= lt!376038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376049 () (_ BitVec 64))

(assert (=> b!240698 (= lt!376049 (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13161 array!13161 (_ BitVec 64) (_ BitVec 64)) Unit!17631)

(assert (=> b!240698 (= lt!376048 (arrayBitRangesEqSymmetric!0 (buf!6225 thiss!982) (buf!6225 (_2!11143 lt!375707)) lt!376038 lt!376049))))

(assert (=> b!240698 (arrayBitRangesEq!0 (buf!6225 (_2!11143 lt!375707)) (buf!6225 thiss!982) lt!376038 lt!376049)))

(declare-fun b!240699 () Bool)

(declare-fun res!200939 () Bool)

(assert (=> b!240699 (=> (not res!200939) (not e!166807))))

(assert (=> b!240699 (= res!200939 (isPrefixOf!0 (_1!11144 lt!376045) thiss!982))))

(declare-fun b!240700 () Bool)

(declare-fun Unit!17636 () Unit!17631)

(assert (=> b!240700 (= e!166808 Unit!17636)))

(declare-fun lt!376042 () (_ BitVec 64))

(declare-fun b!240701 () Bool)

(declare-fun lt!376032 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10452 (_ BitVec 64)) BitStream!10452)

(assert (=> b!240701 (= e!166807 (= (_1!11144 lt!376045) (withMovedBitIndex!0 (_2!11144 lt!376045) (bvsub lt!376042 lt!376032))))))

(assert (=> b!240701 (or (= (bvand lt!376042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!376042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!376042 lt!376032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240701 (= lt!376032 (bitIndex!0 (size!5765 (buf!6225 (_2!11143 lt!375707))) (currentByte!11579 (_2!11143 lt!375707)) (currentBit!11574 (_2!11143 lt!375707))))))

(assert (=> b!240701 (= lt!376042 (bitIndex!0 (size!5765 (buf!6225 thiss!982)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)))))

(declare-fun d!81350 () Bool)

(assert (=> d!81350 e!166807))

(declare-fun res!200940 () Bool)

(assert (=> d!81350 (=> (not res!200940) (not e!166807))))

(assert (=> d!81350 (= res!200940 (isPrefixOf!0 (_1!11144 lt!376045) (_2!11144 lt!376045)))))

(declare-fun lt!376039 () BitStream!10452)

(assert (=> d!81350 (= lt!376045 (tuple2!20445 lt!376039 (_2!11143 lt!375707)))))

(declare-fun lt!376040 () Unit!17631)

(declare-fun lt!376043 () Unit!17631)

(assert (=> d!81350 (= lt!376040 lt!376043)))

(assert (=> d!81350 (isPrefixOf!0 lt!376039 (_2!11143 lt!375707))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10452 BitStream!10452 BitStream!10452) Unit!17631)

(assert (=> d!81350 (= lt!376043 (lemmaIsPrefixTransitive!0 lt!376039 (_2!11143 lt!375707) (_2!11143 lt!375707)))))

(declare-fun lt!376044 () Unit!17631)

(declare-fun lt!376037 () Unit!17631)

(assert (=> d!81350 (= lt!376044 lt!376037)))

(assert (=> d!81350 (isPrefixOf!0 lt!376039 (_2!11143 lt!375707))))

(assert (=> d!81350 (= lt!376037 (lemmaIsPrefixTransitive!0 lt!376039 thiss!982 (_2!11143 lt!375707)))))

(declare-fun lt!376041 () Unit!17631)

(assert (=> d!81350 (= lt!376041 e!166808)))

(declare-fun c!11431 () Bool)

(assert (=> d!81350 (= c!11431 (not (= (size!5765 (buf!6225 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!376047 () Unit!17631)

(declare-fun lt!376046 () Unit!17631)

(assert (=> d!81350 (= lt!376047 lt!376046)))

(assert (=> d!81350 (isPrefixOf!0 (_2!11143 lt!375707) (_2!11143 lt!375707))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10452) Unit!17631)

(assert (=> d!81350 (= lt!376046 (lemmaIsPrefixRefl!0 (_2!11143 lt!375707)))))

(declare-fun lt!376050 () Unit!17631)

(declare-fun lt!376031 () Unit!17631)

(assert (=> d!81350 (= lt!376050 lt!376031)))

(assert (=> d!81350 (= lt!376031 (lemmaIsPrefixRefl!0 (_2!11143 lt!375707)))))

(declare-fun lt!376033 () Unit!17631)

(declare-fun lt!376035 () Unit!17631)

(assert (=> d!81350 (= lt!376033 lt!376035)))

(assert (=> d!81350 (isPrefixOf!0 lt!376039 lt!376039)))

(assert (=> d!81350 (= lt!376035 (lemmaIsPrefixRefl!0 lt!376039))))

(declare-fun lt!376036 () Unit!17631)

(declare-fun lt!376034 () Unit!17631)

(assert (=> d!81350 (= lt!376036 lt!376034)))

(assert (=> d!81350 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81350 (= lt!376034 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81350 (= lt!376039 (BitStream!10453 (buf!6225 (_2!11143 lt!375707)) (currentByte!11579 thiss!982) (currentBit!11574 thiss!982)))))

(assert (=> d!81350 (isPrefixOf!0 thiss!982 (_2!11143 lt!375707))))

(assert (=> d!81350 (= (reader!0 thiss!982 (_2!11143 lt!375707)) lt!376045)))

(assert (= (and d!81350 c!11431) b!240698))

(assert (= (and d!81350 (not c!11431)) b!240700))

(assert (= (and d!81350 res!200940) b!240699))

(assert (= (and b!240699 res!200939) b!240697))

(assert (= (and b!240697 res!200938) b!240701))

(assert (=> b!240698 m!363091))

(declare-fun m!363269 () Bool)

(assert (=> b!240698 m!363269))

(declare-fun m!363271 () Bool)

(assert (=> b!240698 m!363271))

(declare-fun m!363273 () Bool)

(assert (=> b!240701 m!363273))

(assert (=> b!240701 m!363089))

(assert (=> b!240701 m!363091))

(declare-fun m!363275 () Bool)

(assert (=> b!240697 m!363275))

(declare-fun m!363277 () Bool)

(assert (=> d!81350 m!363277))

(declare-fun m!363279 () Bool)

(assert (=> d!81350 m!363279))

(declare-fun m!363281 () Bool)

(assert (=> d!81350 m!363281))

(declare-fun m!363283 () Bool)

(assert (=> d!81350 m!363283))

(declare-fun m!363285 () Bool)

(assert (=> d!81350 m!363285))

(declare-fun m!363287 () Bool)

(assert (=> d!81350 m!363287))

(declare-fun m!363289 () Bool)

(assert (=> d!81350 m!363289))

(declare-fun m!363291 () Bool)

(assert (=> d!81350 m!363291))

(declare-fun m!363293 () Bool)

(assert (=> d!81350 m!363293))

(assert (=> d!81350 m!363099))

(declare-fun m!363295 () Bool)

(assert (=> d!81350 m!363295))

(declare-fun m!363297 () Bool)

(assert (=> b!240699 m!363297))

(assert (=> b!240560 d!81350))

(declare-fun d!81370 () Bool)

(assert (=> d!81370 (= (inv!12 thiss!982) (invariant!0 (currentBit!11574 thiss!982) (currentByte!11579 thiss!982) (size!5765 (buf!6225 thiss!982))))))

(declare-fun bs!20525 () Bool)

(assert (= bs!20525 d!81370))

(assert (=> bs!20525 m!363135))

(assert (=> start!52230 d!81370))

(assert (=> b!240559 d!81344))

(assert (=> b!240559 d!81320))

(declare-fun d!81374 () Bool)

(declare-datatypes ((tuple2!20458 0))(
  ( (tuple2!20459 (_1!11151 Bool) (_2!11151 BitStream!10452)) )
))
(declare-fun lt!376056 () tuple2!20458)

(declare-fun checkBitsLoop!0 (BitStream!10452 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20458)

(assert (=> d!81374 (= lt!376056 (checkBitsLoop!0 (_1!11144 lt!375703) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81374 (= (checkBitsLoopPure!0 (_1!11144 lt!375703) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20447 (_2!11151 lt!376056) (_1!11151 lt!376056)))))

(declare-fun bs!20527 () Bool)

(assert (= bs!20527 d!81374))

(declare-fun m!363301 () Bool)

(assert (=> bs!20527 m!363301))

(assert (=> b!240563 d!81374))

(assert (=> b!240563 d!81316))

(assert (=> b!240563 d!81346))

(assert (=> b!240563 d!81350))

(declare-fun d!81376 () Bool)

(assert (=> d!81376 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5765 (buf!6225 thiss!982))) ((_ sign_extend 32) (currentByte!11579 thiss!982)) ((_ sign_extend 32) (currentBit!11574 thiss!982))) nBits!288))))

(declare-fun bs!20528 () Bool)

(assert (= bs!20528 d!81376))

(assert (=> bs!20528 m!363133))

(assert (=> b!240558 d!81376))

(declare-fun d!81378 () Bool)

(assert (=> d!81378 (= (array_inv!5506 (buf!6225 thiss!982)) (bvsge (size!5765 (buf!6225 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240561 d!81378))

(assert (=> b!240562 d!81318))

(check-sat (not b!240650) (not b!240588) (not b!240699) (not d!81322) (not b!240698) (not d!81376) (not d!81316) (not b!240697) (not b!240653) (not d!81344) (not d!81374) (not b!240652) (not d!81320) (not d!81346) (not b!240590) (not b!240701) (not d!81370) (not b!240651) (not d!81348) (not d!81350))
(check-sat)
