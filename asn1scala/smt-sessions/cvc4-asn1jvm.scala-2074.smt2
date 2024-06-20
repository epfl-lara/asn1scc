; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52506 () Bool)

(assert start!52506)

(declare-fun b!242641 () Bool)

(declare-fun res!202648 () Bool)

(declare-fun e!168221 () Bool)

(assert (=> b!242641 (=> (not res!202648) (not e!168221))))

(declare-datatypes ((array!13317 0))(
  ( (array!13318 (arr!6825 (Array (_ BitVec 32) (_ BitVec 8))) (size!5838 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10598 0))(
  ( (BitStream!10599 (buf!6304 array!13317) (currentByte!11667 (_ BitVec 32)) (currentBit!11662 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17759 0))(
  ( (Unit!17760) )
))
(declare-datatypes ((tuple2!20778 0))(
  ( (tuple2!20779 (_1!11311 Unit!17759) (_2!11311 BitStream!10598)) )
))
(declare-fun lt!378108 () tuple2!20778)

(declare-fun lt!378100 () tuple2!20778)

(declare-fun isPrefixOf!0 (BitStream!10598 BitStream!10598) Bool)

(assert (=> b!242641 (= res!202648 (isPrefixOf!0 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(declare-fun b!242642 () Bool)

(declare-fun res!202647 () Bool)

(declare-fun e!168228 () Bool)

(assert (=> b!242642 (=> (not res!202647) (not e!168228))))

(declare-fun thiss!1005 () BitStream!10598)

(assert (=> b!242642 (= res!202647 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378108)))))

(declare-fun b!242643 () Bool)

(declare-fun e!168226 () Bool)

(assert (=> b!242643 (= e!168228 e!168226)))

(declare-fun res!202653 () Bool)

(assert (=> b!242643 (=> (not res!202653) (not e!168226))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20780 0))(
  ( (tuple2!20781 (_1!11312 BitStream!10598) (_2!11312 Bool)) )
))
(declare-fun lt!378101 () tuple2!20780)

(assert (=> b!242643 (= res!202653 (and (= (_2!11312 lt!378101) bit!26) (= (_1!11312 lt!378101) (_2!11311 lt!378108))))))

(declare-fun readBitPure!0 (BitStream!10598) tuple2!20780)

(declare-fun readerFrom!0 (BitStream!10598 (_ BitVec 32) (_ BitVec 32)) BitStream!10598)

(assert (=> b!242643 (= lt!378101 (readBitPure!0 (readerFrom!0 (_2!11311 lt!378108) (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005))))))

(declare-fun b!242644 () Bool)

(declare-fun e!168230 () Bool)

(declare-fun array_inv!5579 (array!13317) Bool)

(assert (=> b!242644 (= e!168230 (array_inv!5579 (buf!6304 thiss!1005)))))

(declare-fun b!242645 () Bool)

(declare-fun e!168225 () Bool)

(assert (=> b!242645 (= e!168225 e!168221)))

(declare-fun res!202649 () Bool)

(assert (=> b!242645 (=> (not res!202649) (not e!168221))))

(declare-fun lt!378103 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242645 (= res!202649 (= (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100))) (bvadd (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))) lt!378103)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!242645 (= lt!378103 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242646 () Bool)

(declare-fun e!168227 () Bool)

(assert (=> b!242646 (= e!168227 e!168228)))

(declare-fun res!202651 () Bool)

(assert (=> b!242646 (=> (not res!202651) (not e!168228))))

(declare-fun lt!378098 () (_ BitVec 64))

(declare-fun lt!378102 () (_ BitVec 64))

(assert (=> b!242646 (= res!202651 (= lt!378098 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378102)))))

(assert (=> b!242646 (= lt!378098 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))))))

(assert (=> b!242646 (= lt!378102 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(declare-fun b!242647 () Bool)

(declare-fun res!202659 () Bool)

(declare-fun e!168229 () Bool)

(assert (=> b!242647 (=> (not res!202659) (not e!168229))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242647 (= res!202659 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))) ((_ sign_extend 32) (currentByte!11667 thiss!1005)) ((_ sign_extend 32) (currentBit!11662 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242648 () Bool)

(declare-fun res!202658 () Bool)

(assert (=> b!242648 (=> (not res!202658) (not e!168229))))

(assert (=> b!242648 (= res!202658 (bvslt from!289 nBits!297))))

(declare-fun b!242649 () Bool)

(declare-fun e!168223 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242649 (= e!168223 (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(declare-fun res!202650 () Bool)

(assert (=> start!52506 (=> (not res!202650) (not e!168229))))

(assert (=> start!52506 (= res!202650 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52506 e!168229))

(assert (=> start!52506 true))

(declare-fun inv!12 (BitStream!10598) Bool)

(assert (=> start!52506 (and (inv!12 thiss!1005) e!168230)))

(declare-fun b!242650 () Bool)

(declare-datatypes ((tuple2!20782 0))(
  ( (tuple2!20783 (_1!11313 BitStream!10598) (_2!11313 BitStream!10598)) )
))
(declare-fun lt!378105 () tuple2!20782)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242650 (= e!168229 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11313 lt!378105)))) ((_ sign_extend 32) (currentByte!11667 (_1!11313 lt!378105))) ((_ sign_extend 32) (currentBit!11662 (_1!11313 lt!378105))))))))

(declare-fun lt!378107 () tuple2!20782)

(declare-fun reader!0 (BitStream!10598 BitStream!10598) tuple2!20782)

(assert (=> b!242650 (= lt!378107 (reader!0 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(assert (=> b!242650 (= lt!378105 (reader!0 thiss!1005 (_2!11311 lt!378100)))))

(declare-fun e!168222 () Bool)

(assert (=> b!242650 e!168222))

(declare-fun res!202656 () Bool)

(assert (=> b!242650 (=> (not res!202656) (not e!168222))))

(declare-fun lt!378106 () tuple2!20780)

(declare-fun lt!378110 () tuple2!20780)

(assert (=> b!242650 (= res!202656 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378106))) (currentByte!11667 (_1!11312 lt!378106)) (currentBit!11662 (_1!11312 lt!378106))) (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378110))) (currentByte!11667 (_1!11312 lt!378110)) (currentBit!11662 (_1!11312 lt!378110)))))))

(declare-fun lt!378111 () Unit!17759)

(declare-fun lt!378113 () BitStream!10598)

(declare-fun readBitPrefixLemma!0 (BitStream!10598 BitStream!10598) Unit!17759)

(assert (=> b!242650 (= lt!378111 (readBitPrefixLemma!0 lt!378113 (_2!11311 lt!378100)))))

(assert (=> b!242650 (= lt!378110 (readBitPure!0 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005))))))

(assert (=> b!242650 (= lt!378106 (readBitPure!0 lt!378113))))

(assert (=> b!242650 (= lt!378113 (BitStream!10599 (buf!6304 (_2!11311 lt!378108)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(assert (=> b!242650 e!168223))

(declare-fun res!202655 () Bool)

(assert (=> b!242650 (=> (not res!202655) (not e!168223))))

(assert (=> b!242650 (= res!202655 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378100)))))

(declare-fun lt!378104 () Unit!17759)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10598 BitStream!10598 BitStream!10598) Unit!17759)

(assert (=> b!242650 (= lt!378104 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(assert (=> b!242650 e!168225))

(declare-fun res!202652 () Bool)

(assert (=> b!242650 (=> (not res!202652) (not e!168225))))

(assert (=> b!242650 (= res!202652 (= (size!5838 (buf!6304 (_2!11311 lt!378108))) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10598 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20778)

(assert (=> b!242650 (= lt!378100 (appendNBitsLoop!0 (_2!11311 lt!378108) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242650 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378112 () Unit!17759)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10598 BitStream!10598 (_ BitVec 64) (_ BitVec 64)) Unit!17759)

(assert (=> b!242650 (= lt!378112 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11311 lt!378108) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242650 e!168227))

(declare-fun res!202654 () Bool)

(assert (=> b!242650 (=> (not res!202654) (not e!168227))))

(assert (=> b!242650 (= res!202654 (= (size!5838 (buf!6304 thiss!1005)) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(declare-fun appendBit!0 (BitStream!10598 Bool) tuple2!20778)

(assert (=> b!242650 (= lt!378108 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242651 () Bool)

(assert (=> b!242651 (= e!168226 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378101))) (currentByte!11667 (_1!11312 lt!378101)) (currentBit!11662 (_1!11312 lt!378101))) lt!378098))))

(declare-fun b!242652 () Bool)

(declare-fun res!202657 () Bool)

(assert (=> b!242652 (=> (not res!202657) (not e!168223))))

(assert (=> b!242652 (= res!202657 (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(declare-fun b!242653 () Bool)

(declare-fun lt!378114 () tuple2!20780)

(declare-fun lt!378109 () tuple2!20782)

(assert (=> b!242653 (= e!168221 (not (or (not (_2!11312 lt!378114)) (not (= (_1!11312 lt!378114) (_2!11313 lt!378109))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10598 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20780)

(assert (=> b!242653 (= lt!378114 (checkBitsLoopPure!0 (_1!11313 lt!378109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242653 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) lt!378103)))

(declare-fun lt!378099 () Unit!17759)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10598 array!13317 (_ BitVec 64)) Unit!17759)

(assert (=> b!242653 (= lt!378099 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11311 lt!378108) (buf!6304 (_2!11311 lt!378100)) lt!378103))))

(assert (=> b!242653 (= lt!378109 (reader!0 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(declare-fun b!242654 () Bool)

(assert (=> b!242654 (= e!168222 (= (_2!11312 lt!378106) (_2!11312 lt!378110)))))

(assert (= (and start!52506 res!202650) b!242647))

(assert (= (and b!242647 res!202659) b!242648))

(assert (= (and b!242648 res!202658) b!242650))

(assert (= (and b!242650 res!202654) b!242646))

(assert (= (and b!242646 res!202651) b!242642))

(assert (= (and b!242642 res!202647) b!242643))

(assert (= (and b!242643 res!202653) b!242651))

(assert (= (and b!242650 res!202652) b!242645))

(assert (= (and b!242645 res!202649) b!242641))

(assert (= (and b!242641 res!202648) b!242653))

(assert (= (and b!242650 res!202655) b!242652))

(assert (= (and b!242652 res!202657) b!242649))

(assert (= (and b!242650 res!202656) b!242654))

(assert (= start!52506 b!242644))

(declare-fun m!365561 () Bool)

(assert (=> b!242644 m!365561))

(declare-fun m!365563 () Bool)

(assert (=> b!242646 m!365563))

(declare-fun m!365565 () Bool)

(assert (=> b!242646 m!365565))

(declare-fun m!365567 () Bool)

(assert (=> b!242645 m!365567))

(assert (=> b!242645 m!365563))

(declare-fun m!365569 () Bool)

(assert (=> b!242650 m!365569))

(declare-fun m!365571 () Bool)

(assert (=> b!242650 m!365571))

(declare-fun m!365573 () Bool)

(assert (=> b!242650 m!365573))

(declare-fun m!365575 () Bool)

(assert (=> b!242650 m!365575))

(declare-fun m!365577 () Bool)

(assert (=> b!242650 m!365577))

(declare-fun m!365579 () Bool)

(assert (=> b!242650 m!365579))

(declare-fun m!365581 () Bool)

(assert (=> b!242650 m!365581))

(declare-fun m!365583 () Bool)

(assert (=> b!242650 m!365583))

(declare-fun m!365585 () Bool)

(assert (=> b!242650 m!365585))

(declare-fun m!365587 () Bool)

(assert (=> b!242650 m!365587))

(declare-fun m!365589 () Bool)

(assert (=> b!242650 m!365589))

(declare-fun m!365591 () Bool)

(assert (=> b!242650 m!365591))

(declare-fun m!365593 () Bool)

(assert (=> b!242650 m!365593))

(declare-fun m!365595 () Bool)

(assert (=> b!242650 m!365595))

(declare-fun m!365597 () Bool)

(assert (=> b!242652 m!365597))

(declare-fun m!365599 () Bool)

(assert (=> b!242653 m!365599))

(declare-fun m!365601 () Bool)

(assert (=> b!242653 m!365601))

(declare-fun m!365603 () Bool)

(assert (=> b!242653 m!365603))

(assert (=> b!242653 m!365585))

(declare-fun m!365605 () Bool)

(assert (=> start!52506 m!365605))

(declare-fun m!365607 () Bool)

(assert (=> b!242647 m!365607))

(declare-fun m!365609 () Bool)

(assert (=> b!242641 m!365609))

(declare-fun m!365611 () Bool)

(assert (=> b!242649 m!365611))

(declare-fun m!365613 () Bool)

(assert (=> b!242642 m!365613))

(declare-fun m!365615 () Bool)

(assert (=> b!242643 m!365615))

(assert (=> b!242643 m!365615))

(declare-fun m!365617 () Bool)

(assert (=> b!242643 m!365617))

(declare-fun m!365619 () Bool)

(assert (=> b!242651 m!365619))

(push 1)

(assert (not b!242653))

(assert (not b!242647))

(assert (not b!242646))

(assert (not b!242650))

(assert (not b!242651))

(assert (not b!242643))

(assert (not b!242642))

(assert (not start!52506))

(assert (not b!242652))

(assert (not b!242641))

(assert (not b!242644))

(assert (not b!242645))

(assert (not b!242649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81614 () Bool)

(declare-fun e!168305 () Bool)

(assert (=> d!81614 e!168305))

(declare-fun res!202782 () Bool)

(assert (=> d!81614 (=> (not res!202782) (not e!168305))))

(declare-fun lt!378433 () (_ BitVec 64))

(declare-fun lt!378431 () (_ BitVec 64))

(declare-fun lt!378432 () (_ BitVec 64))

(assert (=> d!81614 (= res!202782 (= lt!378431 (bvsub lt!378433 lt!378432)))))

(assert (=> d!81614 (or (= (bvand lt!378433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378433 lt!378432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81614 (= lt!378432 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378100))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378100)))))))

(declare-fun lt!378429 () (_ BitVec 64))

(declare-fun lt!378434 () (_ BitVec 64))

(assert (=> d!81614 (= lt!378433 (bvmul lt!378429 lt!378434))))

(assert (=> d!81614 (or (= lt!378429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378434 (bvsdiv (bvmul lt!378429 lt!378434) lt!378429)))))

(assert (=> d!81614 (= lt!378434 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81614 (= lt!378429 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(assert (=> d!81614 (= lt!378431 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378100)))))))

(assert (=> d!81614 (invariant!0 (currentBit!11662 (_2!11311 lt!378100)) (currentByte!11667 (_2!11311 lt!378100)) (size!5838 (buf!6304 (_2!11311 lt!378100))))))

(assert (=> d!81614 (= (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100))) lt!378431)))

(declare-fun b!242789 () Bool)

(declare-fun res!202783 () Bool)

(assert (=> b!242789 (=> (not res!202783) (not e!168305))))

(assert (=> b!242789 (= res!202783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378431))))

(declare-fun b!242790 () Bool)

(declare-fun lt!378430 () (_ BitVec 64))

(assert (=> b!242790 (= e!168305 (bvsle lt!378431 (bvmul lt!378430 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242790 (or (= lt!378430 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378430 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378430)))))

(assert (=> b!242790 (= lt!378430 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(assert (= (and d!81614 res!202782) b!242789))

(assert (= (and b!242789 res!202783) b!242790))

(declare-fun m!365823 () Bool)

(assert (=> d!81614 m!365823))

(declare-fun m!365825 () Bool)

(assert (=> d!81614 m!365825))

(assert (=> b!242645 d!81614))

(declare-fun d!81616 () Bool)

(declare-fun e!168308 () Bool)

(assert (=> d!81616 e!168308))

(declare-fun res!202788 () Bool)

(assert (=> d!81616 (=> (not res!202788) (not e!168308))))

(declare-fun lt!378443 () (_ BitVec 64))

(declare-fun lt!378442 () (_ BitVec 64))

(declare-fun lt!378441 () (_ BitVec 64))

(assert (=> d!81616 (= res!202788 (= lt!378441 (bvsub lt!378443 lt!378442)))))

(assert (=> d!81616 (or (= (bvand lt!378443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378443 lt!378442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81616 (= lt!378442 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108)))))))

(declare-fun lt!378439 () (_ BitVec 64))

(declare-fun lt!378444 () (_ BitVec 64))

(assert (=> d!81616 (= lt!378443 (bvmul lt!378439 lt!378444))))

(assert (=> d!81616 (or (= lt!378439 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378444 (bvsdiv (bvmul lt!378439 lt!378444) lt!378439)))))

(assert (=> d!81616 (= lt!378444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81616 (= lt!378439 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(assert (=> d!81616 (= lt!378441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108)))))))

(assert (=> d!81616 (invariant!0 (currentBit!11662 (_2!11311 lt!378108)) (currentByte!11667 (_2!11311 lt!378108)) (size!5838 (buf!6304 (_2!11311 lt!378108))))))

(assert (=> d!81616 (= (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))) lt!378441)))

(declare-fun b!242797 () Bool)

(declare-fun res!202789 () Bool)

(assert (=> b!242797 (=> (not res!202789) (not e!168308))))

(assert (=> b!242797 (= res!202789 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378441))))

(declare-fun b!242798 () Bool)

(declare-fun lt!378440 () (_ BitVec 64))

(assert (=> b!242798 (= e!168308 (bvsle lt!378441 (bvmul lt!378440 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242798 (or (= lt!378440 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378440 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378440)))))

(assert (=> b!242798 (= lt!378440 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(assert (= (and d!81616 res!202788) b!242797))

(assert (= (and b!242797 res!202789) b!242798))

(declare-fun m!365827 () Bool)

(assert (=> d!81616 m!365827))

(declare-fun m!365829 () Bool)

(assert (=> d!81616 m!365829))

(assert (=> b!242645 d!81616))

(assert (=> b!242646 d!81616))

(declare-fun d!81618 () Bool)

(declare-fun e!168309 () Bool)

(assert (=> d!81618 e!168309))

(declare-fun res!202790 () Bool)

(assert (=> d!81618 (=> (not res!202790) (not e!168309))))

(declare-fun lt!378448 () (_ BitVec 64))

(declare-fun lt!378447 () (_ BitVec 64))

(declare-fun lt!378449 () (_ BitVec 64))

(assert (=> d!81618 (= res!202790 (= lt!378447 (bvsub lt!378449 lt!378448)))))

(assert (=> d!81618 (or (= (bvand lt!378449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378448 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378449 lt!378448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81618 (= lt!378448 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))) ((_ sign_extend 32) (currentByte!11667 thiss!1005)) ((_ sign_extend 32) (currentBit!11662 thiss!1005))))))

(declare-fun lt!378445 () (_ BitVec 64))

(declare-fun lt!378450 () (_ BitVec 64))

(assert (=> d!81618 (= lt!378449 (bvmul lt!378445 lt!378450))))

(assert (=> d!81618 (or (= lt!378445 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378450 (bvsdiv (bvmul lt!378445 lt!378450) lt!378445)))))

(assert (=> d!81618 (= lt!378450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81618 (= lt!378445 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))))))

(assert (=> d!81618 (= lt!378447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 thiss!1005))))))

(assert (=> d!81618 (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 thiss!1005)))))

(assert (=> d!81618 (= (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)) lt!378447)))

(declare-fun b!242799 () Bool)

(declare-fun res!202791 () Bool)

(assert (=> b!242799 (=> (not res!202791) (not e!168309))))

(assert (=> b!242799 (= res!202791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378447))))

(declare-fun b!242800 () Bool)

(declare-fun lt!378446 () (_ BitVec 64))

(assert (=> b!242800 (= e!168309 (bvsle lt!378447 (bvmul lt!378446 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242800 (or (= lt!378446 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378446 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378446)))))

(assert (=> b!242800 (= lt!378446 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))))))

(assert (= (and d!81618 res!202790) b!242799))

(assert (= (and b!242799 res!202791) b!242800))

(declare-fun m!365831 () Bool)

(assert (=> d!81618 m!365831))

(declare-fun m!365833 () Bool)

(assert (=> d!81618 m!365833))

(assert (=> b!242646 d!81618))

(declare-fun d!81620 () Bool)

(assert (=> d!81620 (= (array_inv!5579 (buf!6304 thiss!1005)) (bvsge (size!5838 (buf!6304 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!242644 d!81620))

(declare-datatypes ((tuple2!20788 0))(
  ( (tuple2!20789 (_1!11316 Bool) (_2!11316 BitStream!10598)) )
))
(declare-fun lt!378457 () tuple2!20788)

(declare-fun d!81622 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10598 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20788)

(assert (=> d!81622 (= lt!378457 (checkBitsLoop!0 (_1!11313 lt!378109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81622 (= (checkBitsLoopPure!0 (_1!11313 lt!378109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20781 (_2!11316 lt!378457) (_1!11316 lt!378457)))))

(declare-fun bs!20639 () Bool)

(assert (= bs!20639 d!81622))

(declare-fun m!365839 () Bool)

(assert (=> bs!20639 m!365839))

(assert (=> b!242653 d!81622))

(declare-fun d!81624 () Bool)

(assert (=> d!81624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) lt!378103) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108)))) lt!378103))))

(declare-fun bs!20641 () Bool)

(assert (= bs!20641 d!81624))

(declare-fun m!365853 () Bool)

(assert (=> bs!20641 m!365853))

(assert (=> b!242653 d!81624))

(declare-fun d!81630 () Bool)

(assert (=> d!81630 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378100)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) lt!378103)))

(declare-fun lt!378461 () Unit!17759)

(declare-fun choose!9 (BitStream!10598 array!13317 (_ BitVec 64) BitStream!10598) Unit!17759)

(assert (=> d!81630 (= lt!378461 (choose!9 (_2!11311 lt!378108) (buf!6304 (_2!11311 lt!378100)) lt!378103 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108)))))))

(assert (=> d!81630 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11311 lt!378108) (buf!6304 (_2!11311 lt!378100)) lt!378103) lt!378461)))

(declare-fun bs!20643 () Bool)

(assert (= bs!20643 d!81630))

(assert (=> bs!20643 m!365601))

(declare-fun m!365857 () Bool)

(assert (=> bs!20643 m!365857))

(assert (=> b!242653 d!81630))

(declare-fun b!242815 () Bool)

(declare-fun res!202804 () Bool)

(declare-fun e!168316 () Bool)

(assert (=> b!242815 (=> (not res!202804) (not e!168316))))

(declare-fun lt!378504 () tuple2!20782)

(assert (=> b!242815 (= res!202804 (isPrefixOf!0 (_1!11313 lt!378504) (_2!11311 lt!378108)))))

(declare-fun b!242816 () Bool)

(declare-fun e!168317 () Unit!17759)

(declare-fun lt!378503 () Unit!17759)

(assert (=> b!242816 (= e!168317 lt!378503)))

(declare-fun lt!378510 () (_ BitVec 64))

(assert (=> b!242816 (= lt!378510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378515 () (_ BitVec 64))

(assert (=> b!242816 (= lt!378515 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13317 array!13317 (_ BitVec 64) (_ BitVec 64)) Unit!17759)

(assert (=> b!242816 (= lt!378503 (arrayBitRangesEqSymmetric!0 (buf!6304 (_2!11311 lt!378108)) (buf!6304 (_2!11311 lt!378100)) lt!378510 lt!378515))))

(declare-fun arrayBitRangesEq!0 (array!13317 array!13317 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242816 (arrayBitRangesEq!0 (buf!6304 (_2!11311 lt!378100)) (buf!6304 (_2!11311 lt!378108)) lt!378510 lt!378515)))

(declare-fun lt!378511 () (_ BitVec 64))

(declare-fun b!242817 () Bool)

(declare-fun lt!378521 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10598 (_ BitVec 64)) BitStream!10598)

(assert (=> b!242817 (= e!168316 (= (_1!11313 lt!378504) (withMovedBitIndex!0 (_2!11313 lt!378504) (bvsub lt!378511 lt!378521))))))

(assert (=> b!242817 (or (= (bvand lt!378511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378511 lt!378521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242817 (= lt!378521 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100))))))

(assert (=> b!242817 (= lt!378511 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))))))

(declare-fun b!242818 () Bool)

(declare-fun Unit!17765 () Unit!17759)

(assert (=> b!242818 (= e!168317 Unit!17765)))

(declare-fun b!242819 () Bool)

(declare-fun res!202802 () Bool)

(assert (=> b!242819 (=> (not res!202802) (not e!168316))))

(assert (=> b!242819 (= res!202802 (isPrefixOf!0 (_2!11313 lt!378504) (_2!11311 lt!378100)))))

(declare-fun d!81634 () Bool)

(assert (=> d!81634 e!168316))

(declare-fun res!202803 () Bool)

(assert (=> d!81634 (=> (not res!202803) (not e!168316))))

(assert (=> d!81634 (= res!202803 (isPrefixOf!0 (_1!11313 lt!378504) (_2!11313 lt!378504)))))

(declare-fun lt!378505 () BitStream!10598)

(assert (=> d!81634 (= lt!378504 (tuple2!20783 lt!378505 (_2!11311 lt!378100)))))

(declare-fun lt!378507 () Unit!17759)

(declare-fun lt!378518 () Unit!17759)

(assert (=> d!81634 (= lt!378507 lt!378518)))

(assert (=> d!81634 (isPrefixOf!0 lt!378505 (_2!11311 lt!378100))))

(assert (=> d!81634 (= lt!378518 (lemmaIsPrefixTransitive!0 lt!378505 (_2!11311 lt!378100) (_2!11311 lt!378100)))))

(declare-fun lt!378512 () Unit!17759)

(declare-fun lt!378514 () Unit!17759)

(assert (=> d!81634 (= lt!378512 lt!378514)))

(assert (=> d!81634 (isPrefixOf!0 lt!378505 (_2!11311 lt!378100))))

(assert (=> d!81634 (= lt!378514 (lemmaIsPrefixTransitive!0 lt!378505 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(declare-fun lt!378506 () Unit!17759)

(assert (=> d!81634 (= lt!378506 e!168317)))

(declare-fun c!11450 () Bool)

(assert (=> d!81634 (= c!11450 (not (= (size!5838 (buf!6304 (_2!11311 lt!378108))) #b00000000000000000000000000000000)))))

(declare-fun lt!378509 () Unit!17759)

(declare-fun lt!378508 () Unit!17759)

(assert (=> d!81634 (= lt!378509 lt!378508)))

(assert (=> d!81634 (isPrefixOf!0 (_2!11311 lt!378100) (_2!11311 lt!378100))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10598) Unit!17759)

(assert (=> d!81634 (= lt!378508 (lemmaIsPrefixRefl!0 (_2!11311 lt!378100)))))

(declare-fun lt!378516 () Unit!17759)

(declare-fun lt!378520 () Unit!17759)

(assert (=> d!81634 (= lt!378516 lt!378520)))

(assert (=> d!81634 (= lt!378520 (lemmaIsPrefixRefl!0 (_2!11311 lt!378100)))))

(declare-fun lt!378513 () Unit!17759)

(declare-fun lt!378517 () Unit!17759)

(assert (=> d!81634 (= lt!378513 lt!378517)))

(assert (=> d!81634 (isPrefixOf!0 lt!378505 lt!378505)))

(assert (=> d!81634 (= lt!378517 (lemmaIsPrefixRefl!0 lt!378505))))

(declare-fun lt!378519 () Unit!17759)

(declare-fun lt!378502 () Unit!17759)

(assert (=> d!81634 (= lt!378519 lt!378502)))

(assert (=> d!81634 (isPrefixOf!0 (_2!11311 lt!378108) (_2!11311 lt!378108))))

(assert (=> d!81634 (= lt!378502 (lemmaIsPrefixRefl!0 (_2!11311 lt!378108)))))

(assert (=> d!81634 (= lt!378505 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))))))

(assert (=> d!81634 (isPrefixOf!0 (_2!11311 lt!378108) (_2!11311 lt!378100))))

(assert (=> d!81634 (= (reader!0 (_2!11311 lt!378108) (_2!11311 lt!378100)) lt!378504)))

(assert (= (and d!81634 c!11450) b!242816))

(assert (= (and d!81634 (not c!11450)) b!242818))

(assert (= (and d!81634 res!202803) b!242815))

(assert (= (and b!242815 res!202804) b!242819))

(assert (= (and b!242819 res!202802) b!242817))

(declare-fun m!365859 () Bool)

(assert (=> b!242817 m!365859))

(assert (=> b!242817 m!365567))

(assert (=> b!242817 m!365563))

(assert (=> b!242816 m!365563))

(declare-fun m!365861 () Bool)

(assert (=> b!242816 m!365861))

(declare-fun m!365863 () Bool)

(assert (=> b!242816 m!365863))

(declare-fun m!365865 () Bool)

(assert (=> b!242819 m!365865))

(declare-fun m!365867 () Bool)

(assert (=> b!242815 m!365867))

(declare-fun m!365869 () Bool)

(assert (=> d!81634 m!365869))

(declare-fun m!365871 () Bool)

(assert (=> d!81634 m!365871))

(declare-fun m!365873 () Bool)

(assert (=> d!81634 m!365873))

(declare-fun m!365875 () Bool)

(assert (=> d!81634 m!365875))

(declare-fun m!365877 () Bool)

(assert (=> d!81634 m!365877))

(declare-fun m!365879 () Bool)

(assert (=> d!81634 m!365879))

(declare-fun m!365881 () Bool)

(assert (=> d!81634 m!365881))

(assert (=> d!81634 m!365609))

(declare-fun m!365883 () Bool)

(assert (=> d!81634 m!365883))

(declare-fun m!365885 () Bool)

(assert (=> d!81634 m!365885))

(declare-fun m!365887 () Bool)

(assert (=> d!81634 m!365887))

(assert (=> b!242653 d!81634))

(declare-fun d!81636 () Bool)

(declare-fun lt!378524 () tuple2!20788)

(declare-fun readBit!0 (BitStream!10598) tuple2!20788)

(assert (=> d!81636 (= lt!378524 (readBit!0 (readerFrom!0 (_2!11311 lt!378108) (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005))))))

(assert (=> d!81636 (= (readBitPure!0 (readerFrom!0 (_2!11311 lt!378108) (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005))) (tuple2!20781 (_2!11316 lt!378524) (_1!11316 lt!378524)))))

(declare-fun bs!20644 () Bool)

(assert (= bs!20644 d!81636))

(assert (=> bs!20644 m!365615))

(declare-fun m!365889 () Bool)

(assert (=> bs!20644 m!365889))

(assert (=> b!242643 d!81636))

(declare-fun d!81638 () Bool)

(declare-fun e!168320 () Bool)

(assert (=> d!81638 e!168320))

(declare-fun res!202808 () Bool)

(assert (=> d!81638 (=> (not res!202808) (not e!168320))))

(assert (=> d!81638 (= res!202808 (invariant!0 (currentBit!11662 (_2!11311 lt!378108)) (currentByte!11667 (_2!11311 lt!378108)) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(assert (=> d!81638 (= (readerFrom!0 (_2!11311 lt!378108) (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005)) (BitStream!10599 (buf!6304 (_2!11311 lt!378108)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(declare-fun b!242822 () Bool)

(assert (=> b!242822 (= e!168320 (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(assert (= (and d!81638 res!202808) b!242822))

(assert (=> d!81638 m!365829))

(assert (=> b!242822 m!365597))

(assert (=> b!242643 d!81638))

(declare-fun d!81640 () Bool)

(assert (=> d!81640 (= (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378108)))) (and (bvsge (currentBit!11662 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11662 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11667 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378108)))) (and (= (currentBit!11662 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378108))))))))))

(assert (=> b!242652 d!81640))

(declare-fun d!81642 () Bool)

(declare-fun res!202824 () Bool)

(declare-fun e!168330 () Bool)

(assert (=> d!81642 (=> (not res!202824) (not e!168330))))

(assert (=> d!81642 (= res!202824 (= (size!5838 (buf!6304 (_2!11311 lt!378108))) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(assert (=> d!81642 (= (isPrefixOf!0 (_2!11311 lt!378108) (_2!11311 lt!378100)) e!168330)))

(declare-fun b!242837 () Bool)

(declare-fun res!202825 () Bool)

(assert (=> b!242837 (=> (not res!202825) (not e!168330))))

(assert (=> b!242837 (= res!202825 (bvsle (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))) (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100)))))))

(declare-fun b!242838 () Bool)

(declare-fun e!168329 () Bool)

(assert (=> b!242838 (= e!168330 e!168329)))

(declare-fun res!202823 () Bool)

(assert (=> b!242838 (=> res!202823 e!168329)))

(assert (=> b!242838 (= res!202823 (= (size!5838 (buf!6304 (_2!11311 lt!378108))) #b00000000000000000000000000000000))))

(declare-fun b!242839 () Bool)

(assert (=> b!242839 (= e!168329 (arrayBitRangesEq!0 (buf!6304 (_2!11311 lt!378108)) (buf!6304 (_2!11311 lt!378100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108)))))))

(assert (= (and d!81642 res!202824) b!242837))

(assert (= (and b!242837 res!202825) b!242838))

(assert (= (and b!242838 (not res!202823)) b!242839))

(assert (=> b!242837 m!365563))

(assert (=> b!242837 m!365567))

(assert (=> b!242839 m!365563))

(assert (=> b!242839 m!365563))

(declare-fun m!365891 () Bool)

(assert (=> b!242839 m!365891))

(assert (=> b!242641 d!81642))

(declare-fun d!81644 () Bool)

(declare-fun res!202827 () Bool)

(declare-fun e!168332 () Bool)

(assert (=> d!81644 (=> (not res!202827) (not e!168332))))

(assert (=> d!81644 (= res!202827 (= (size!5838 (buf!6304 thiss!1005)) (size!5838 (buf!6304 (_2!11311 lt!378108)))))))

(assert (=> d!81644 (= (isPrefixOf!0 thiss!1005 (_2!11311 lt!378108)) e!168332)))

(declare-fun b!242840 () Bool)

(declare-fun res!202828 () Bool)

(assert (=> b!242840 (=> (not res!202828) (not e!168332))))

(assert (=> b!242840 (= res!202828 (bvsle (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)) (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108)))))))

(declare-fun b!242841 () Bool)

(declare-fun e!168331 () Bool)

(assert (=> b!242841 (= e!168332 e!168331)))

(declare-fun res!202826 () Bool)

(assert (=> b!242841 (=> res!202826 e!168331)))

(assert (=> b!242841 (= res!202826 (= (size!5838 (buf!6304 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242842 () Bool)

(assert (=> b!242842 (= e!168331 (arrayBitRangesEq!0 (buf!6304 thiss!1005) (buf!6304 (_2!11311 lt!378108)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005))))))

(assert (= (and d!81644 res!202827) b!242840))

(assert (= (and b!242840 res!202828) b!242841))

(assert (= (and b!242841 (not res!202826)) b!242842))

(assert (=> b!242840 m!365565))

(assert (=> b!242840 m!365563))

(assert (=> b!242842 m!365565))

(assert (=> b!242842 m!365565))

(declare-fun m!365893 () Bool)

(assert (=> b!242842 m!365893))

(assert (=> b!242642 d!81644))

(declare-fun d!81646 () Bool)

(assert (=> d!81646 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 thiss!1005))))))

(declare-fun bs!20645 () Bool)

(assert (= bs!20645 d!81646))

(assert (=> bs!20645 m!365833))

(assert (=> start!52506 d!81646))

(declare-fun d!81648 () Bool)

(declare-fun e!168333 () Bool)

(assert (=> d!81648 e!168333))

(declare-fun res!202829 () Bool)

(assert (=> d!81648 (=> (not res!202829) (not e!168333))))

(declare-fun lt!378543 () (_ BitVec 64))

(declare-fun lt!378544 () (_ BitVec 64))

(declare-fun lt!378545 () (_ BitVec 64))

(assert (=> d!81648 (= res!202829 (= lt!378543 (bvsub lt!378545 lt!378544)))))

(assert (=> d!81648 (or (= (bvand lt!378545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378545 lt!378544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81648 (= lt!378544 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378101)))) ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378101))) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378101)))))))

(declare-fun lt!378541 () (_ BitVec 64))

(declare-fun lt!378546 () (_ BitVec 64))

(assert (=> d!81648 (= lt!378545 (bvmul lt!378541 lt!378546))))

(assert (=> d!81648 (or (= lt!378541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378546 (bvsdiv (bvmul lt!378541 lt!378546) lt!378541)))))

(assert (=> d!81648 (= lt!378546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81648 (= lt!378541 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378101)))))))

(assert (=> d!81648 (= lt!378543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378101))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378101)))))))

(assert (=> d!81648 (invariant!0 (currentBit!11662 (_1!11312 lt!378101)) (currentByte!11667 (_1!11312 lt!378101)) (size!5838 (buf!6304 (_1!11312 lt!378101))))))

(assert (=> d!81648 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378101))) (currentByte!11667 (_1!11312 lt!378101)) (currentBit!11662 (_1!11312 lt!378101))) lt!378543)))

(declare-fun b!242843 () Bool)

(declare-fun res!202830 () Bool)

(assert (=> b!242843 (=> (not res!202830) (not e!168333))))

(assert (=> b!242843 (= res!202830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378543))))

(declare-fun b!242844 () Bool)

(declare-fun lt!378542 () (_ BitVec 64))

(assert (=> b!242844 (= e!168333 (bvsle lt!378543 (bvmul lt!378542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242844 (or (= lt!378542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378542)))))

(assert (=> b!242844 (= lt!378542 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378101)))))))

(assert (= (and d!81648 res!202829) b!242843))

(assert (= (and b!242843 res!202830) b!242844))

(declare-fun m!365895 () Bool)

(assert (=> d!81648 m!365895))

(declare-fun m!365897 () Bool)

(assert (=> d!81648 m!365897))

(assert (=> b!242651 d!81648))

(declare-fun d!81650 () Bool)

(assert (=> d!81650 (= (invariant!0 (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378100)))) (and (bvsge (currentBit!11662 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11662 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11667 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378100)))) (and (= (currentBit!11662 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11667 thiss!1005) (size!5838 (buf!6304 (_2!11311 lt!378100))))))))))

(assert (=> b!242649 d!81650))

(declare-fun d!81652 () Bool)

(declare-fun e!168334 () Bool)

(assert (=> d!81652 e!168334))

(declare-fun res!202831 () Bool)

(assert (=> d!81652 (=> (not res!202831) (not e!168334))))

(declare-fun lt!378549 () (_ BitVec 64))

(declare-fun lt!378551 () (_ BitVec 64))

(declare-fun lt!378550 () (_ BitVec 64))

(assert (=> d!81652 (= res!202831 (= lt!378549 (bvsub lt!378551 lt!378550)))))

(assert (=> d!81652 (or (= (bvand lt!378551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378551 lt!378550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81652 (= lt!378550 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378106)))) ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378106))) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378106)))))))

(declare-fun lt!378547 () (_ BitVec 64))

(declare-fun lt!378552 () (_ BitVec 64))

(assert (=> d!81652 (= lt!378551 (bvmul lt!378547 lt!378552))))

(assert (=> d!81652 (or (= lt!378547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378552 (bvsdiv (bvmul lt!378547 lt!378552) lt!378547)))))

(assert (=> d!81652 (= lt!378552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81652 (= lt!378547 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378106)))))))

(assert (=> d!81652 (= lt!378549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378106)))))))

(assert (=> d!81652 (invariant!0 (currentBit!11662 (_1!11312 lt!378106)) (currentByte!11667 (_1!11312 lt!378106)) (size!5838 (buf!6304 (_1!11312 lt!378106))))))

(assert (=> d!81652 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378106))) (currentByte!11667 (_1!11312 lt!378106)) (currentBit!11662 (_1!11312 lt!378106))) lt!378549)))

(declare-fun b!242845 () Bool)

(declare-fun res!202832 () Bool)

(assert (=> b!242845 (=> (not res!202832) (not e!168334))))

(assert (=> b!242845 (= res!202832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378549))))

(declare-fun b!242846 () Bool)

(declare-fun lt!378548 () (_ BitVec 64))

(assert (=> b!242846 (= e!168334 (bvsle lt!378549 (bvmul lt!378548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242846 (or (= lt!378548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378548)))))

(assert (=> b!242846 (= lt!378548 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378106)))))))

(assert (= (and d!81652 res!202831) b!242845))

(assert (= (and b!242845 res!202832) b!242846))

(declare-fun m!365899 () Bool)

(assert (=> d!81652 m!365899))

(declare-fun m!365901 () Bool)

(assert (=> d!81652 m!365901))

(assert (=> b!242650 d!81652))

(declare-fun d!81654 () Bool)

(declare-fun e!168344 () Bool)

(assert (=> d!81654 e!168344))

(declare-fun res!202847 () Bool)

(assert (=> d!81654 (=> (not res!202847) (not e!168344))))

(declare-fun lt!378600 () tuple2!20780)

(declare-fun lt!378599 () tuple2!20780)

(assert (=> d!81654 (= res!202847 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378600))) (currentByte!11667 (_1!11312 lt!378600)) (currentBit!11662 (_1!11312 lt!378600))) (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378599))) (currentByte!11667 (_1!11312 lt!378599)) (currentBit!11662 (_1!11312 lt!378599)))))))

(declare-fun lt!378598 () Unit!17759)

(declare-fun lt!378601 () BitStream!10598)

(declare-fun choose!50 (BitStream!10598 BitStream!10598 BitStream!10598 tuple2!20780 tuple2!20780 BitStream!10598 Bool tuple2!20780 tuple2!20780 BitStream!10598 Bool) Unit!17759)

(assert (=> d!81654 (= lt!378598 (choose!50 lt!378113 (_2!11311 lt!378100) lt!378601 lt!378600 (tuple2!20781 (_1!11312 lt!378600) (_2!11312 lt!378600)) (_1!11312 lt!378600) (_2!11312 lt!378600) lt!378599 (tuple2!20781 (_1!11312 lt!378599) (_2!11312 lt!378599)) (_1!11312 lt!378599) (_2!11312 lt!378599)))))

(assert (=> d!81654 (= lt!378599 (readBitPure!0 lt!378601))))

(assert (=> d!81654 (= lt!378600 (readBitPure!0 lt!378113))))

(assert (=> d!81654 (= lt!378601 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 lt!378113) (currentBit!11662 lt!378113)))))

(assert (=> d!81654 (invariant!0 (currentBit!11662 lt!378113) (currentByte!11667 lt!378113) (size!5838 (buf!6304 (_2!11311 lt!378100))))))

(assert (=> d!81654 (= (readBitPrefixLemma!0 lt!378113 (_2!11311 lt!378100)) lt!378598)))

(declare-fun b!242863 () Bool)

(assert (=> b!242863 (= e!168344 (= (_2!11312 lt!378600) (_2!11312 lt!378599)))))

(assert (= (and d!81654 res!202847) b!242863))

(declare-fun m!365953 () Bool)

(assert (=> d!81654 m!365953))

(declare-fun m!365955 () Bool)

(assert (=> d!81654 m!365955))

(assert (=> d!81654 m!365589))

(declare-fun m!365957 () Bool)

(assert (=> d!81654 m!365957))

(declare-fun m!365959 () Bool)

(assert (=> d!81654 m!365959))

(declare-fun m!365961 () Bool)

(assert (=> d!81654 m!365961))

(assert (=> b!242650 d!81654))

(declare-fun b!242884 () Bool)

(declare-fun e!168357 () Bool)

(declare-fun lt!378635 () tuple2!20780)

(declare-fun lt!378633 () tuple2!20778)

(assert (=> b!242884 (= e!168357 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378635))) (currentByte!11667 (_1!11312 lt!378635)) (currentBit!11662 (_1!11312 lt!378635))) (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378633))) (currentByte!11667 (_2!11311 lt!378633)) (currentBit!11662 (_2!11311 lt!378633)))))))

(declare-fun b!242882 () Bool)

(declare-fun res!202864 () Bool)

(declare-fun e!168356 () Bool)

(assert (=> b!242882 (=> (not res!202864) (not e!168356))))

(assert (=> b!242882 (= res!202864 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378633)))))

(declare-fun d!81666 () Bool)

(assert (=> d!81666 e!168356))

(declare-fun res!202867 () Bool)

(assert (=> d!81666 (=> (not res!202867) (not e!168356))))

(assert (=> d!81666 (= res!202867 (= (size!5838 (buf!6304 thiss!1005)) (size!5838 (buf!6304 (_2!11311 lt!378633)))))))

(declare-fun choose!16 (BitStream!10598 Bool) tuple2!20778)

(assert (=> d!81666 (= lt!378633 (choose!16 thiss!1005 bit!26))))

(assert (=> d!81666 (validate_offset_bit!0 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))) ((_ sign_extend 32) (currentByte!11667 thiss!1005)) ((_ sign_extend 32) (currentBit!11662 thiss!1005)))))

(assert (=> d!81666 (= (appendBit!0 thiss!1005 bit!26) lt!378633)))

(declare-fun b!242883 () Bool)

(assert (=> b!242883 (= e!168356 e!168357)))

(declare-fun res!202865 () Bool)

(assert (=> b!242883 (=> (not res!202865) (not e!168357))))

(assert (=> b!242883 (= res!202865 (and (= (_2!11312 lt!378635) bit!26) (= (_1!11312 lt!378635) (_2!11311 lt!378633))))))

(assert (=> b!242883 (= lt!378635 (readBitPure!0 (readerFrom!0 (_2!11311 lt!378633) (currentBit!11662 thiss!1005) (currentByte!11667 thiss!1005))))))

(declare-fun b!242881 () Bool)

(declare-fun res!202866 () Bool)

(assert (=> b!242881 (=> (not res!202866) (not e!168356))))

(declare-fun lt!378632 () (_ BitVec 64))

(declare-fun lt!378634 () (_ BitVec 64))

(assert (=> b!242881 (= res!202866 (= (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378633))) (currentByte!11667 (_2!11311 lt!378633)) (currentBit!11662 (_2!11311 lt!378633))) (bvadd lt!378632 lt!378634)))))

(assert (=> b!242881 (or (not (= (bvand lt!378632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378634 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378632 lt!378634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242881 (= lt!378634 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!242881 (= lt!378632 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(assert (= (and d!81666 res!202867) b!242881))

(assert (= (and b!242881 res!202866) b!242882))

(assert (= (and b!242882 res!202864) b!242883))

(assert (= (and b!242883 res!202865) b!242884))

(declare-fun m!365981 () Bool)

(assert (=> b!242882 m!365981))

(declare-fun m!365983 () Bool)

(assert (=> d!81666 m!365983))

(declare-fun m!365985 () Bool)

(assert (=> d!81666 m!365985))

(declare-fun m!365987 () Bool)

(assert (=> b!242884 m!365987))

(declare-fun m!365989 () Bool)

(assert (=> b!242884 m!365989))

(declare-fun m!365991 () Bool)

(assert (=> b!242883 m!365991))

(assert (=> b!242883 m!365991))

(declare-fun m!365993 () Bool)

(assert (=> b!242883 m!365993))

(assert (=> b!242881 m!365989))

(assert (=> b!242881 m!365565))

(assert (=> b!242650 d!81666))

(declare-fun d!81680 () Bool)

(declare-fun res!202869 () Bool)

(declare-fun e!168359 () Bool)

(assert (=> d!81680 (=> (not res!202869) (not e!168359))))

(assert (=> d!81680 (= res!202869 (= (size!5838 (buf!6304 thiss!1005)) (size!5838 (buf!6304 (_2!11311 lt!378100)))))))

(assert (=> d!81680 (= (isPrefixOf!0 thiss!1005 (_2!11311 lt!378100)) e!168359)))

(declare-fun b!242885 () Bool)

(declare-fun res!202870 () Bool)

(assert (=> b!242885 (=> (not res!202870) (not e!168359))))

(assert (=> b!242885 (= res!202870 (bvsle (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)) (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100)))))))

(declare-fun b!242886 () Bool)

(declare-fun e!168358 () Bool)

(assert (=> b!242886 (= e!168359 e!168358)))

(declare-fun res!202868 () Bool)

(assert (=> b!242886 (=> res!202868 e!168358)))

(assert (=> b!242886 (= res!202868 (= (size!5838 (buf!6304 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242887 () Bool)

(assert (=> b!242887 (= e!168358 (arrayBitRangesEq!0 (buf!6304 thiss!1005) (buf!6304 (_2!11311 lt!378100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005))))))

(assert (= (and d!81680 res!202869) b!242885))

(assert (= (and b!242885 res!202870) b!242886))

(assert (= (and b!242886 (not res!202868)) b!242887))

(assert (=> b!242885 m!365565))

(assert (=> b!242885 m!365567))

(assert (=> b!242887 m!365565))

(assert (=> b!242887 m!365565))

(declare-fun m!365995 () Bool)

(assert (=> b!242887 m!365995))

(assert (=> b!242650 d!81680))

(assert (=> b!242650 d!81634))

(declare-fun d!81682 () Bool)

(assert (=> d!81682 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378100))))

(declare-fun lt!378638 () Unit!17759)

(declare-fun choose!30 (BitStream!10598 BitStream!10598 BitStream!10598) Unit!17759)

(assert (=> d!81682 (= lt!378638 (choose!30 thiss!1005 (_2!11311 lt!378108) (_2!11311 lt!378100)))))

(assert (=> d!81682 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378108))))

(assert (=> d!81682 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11311 lt!378108) (_2!11311 lt!378100)) lt!378638)))

(declare-fun bs!20649 () Bool)

(assert (= bs!20649 d!81682))

(assert (=> bs!20649 m!365587))

(declare-fun m!365997 () Bool)

(assert (=> bs!20649 m!365997))

(assert (=> bs!20649 m!365613))

(assert (=> b!242650 d!81682))

(declare-fun b!242888 () Bool)

(declare-fun res!202873 () Bool)

(declare-fun e!168360 () Bool)

(assert (=> b!242888 (=> (not res!202873) (not e!168360))))

(declare-fun lt!378641 () tuple2!20782)

(assert (=> b!242888 (= res!202873 (isPrefixOf!0 (_1!11313 lt!378641) thiss!1005))))

(declare-fun b!242889 () Bool)

(declare-fun e!168361 () Unit!17759)

(declare-fun lt!378640 () Unit!17759)

(assert (=> b!242889 (= e!168361 lt!378640)))

(declare-fun lt!378647 () (_ BitVec 64))

(assert (=> b!242889 (= lt!378647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378652 () (_ BitVec 64))

(assert (=> b!242889 (= lt!378652 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(assert (=> b!242889 (= lt!378640 (arrayBitRangesEqSymmetric!0 (buf!6304 thiss!1005) (buf!6304 (_2!11311 lt!378100)) lt!378647 lt!378652))))

(assert (=> b!242889 (arrayBitRangesEq!0 (buf!6304 (_2!11311 lt!378100)) (buf!6304 thiss!1005) lt!378647 lt!378652)))

(declare-fun b!242890 () Bool)

(declare-fun lt!378658 () (_ BitVec 64))

(declare-fun lt!378648 () (_ BitVec 64))

(assert (=> b!242890 (= e!168360 (= (_1!11313 lt!378641) (withMovedBitIndex!0 (_2!11313 lt!378641) (bvsub lt!378648 lt!378658))))))

(assert (=> b!242890 (or (= (bvand lt!378648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378658 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378648 lt!378658) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242890 (= lt!378658 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378100))) (currentByte!11667 (_2!11311 lt!378100)) (currentBit!11662 (_2!11311 lt!378100))))))

(assert (=> b!242890 (= lt!378648 (bitIndex!0 (size!5838 (buf!6304 thiss!1005)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(declare-fun b!242891 () Bool)

(declare-fun Unit!17766 () Unit!17759)

(assert (=> b!242891 (= e!168361 Unit!17766)))

(declare-fun b!242892 () Bool)

(declare-fun res!202871 () Bool)

(assert (=> b!242892 (=> (not res!202871) (not e!168360))))

(assert (=> b!242892 (= res!202871 (isPrefixOf!0 (_2!11313 lt!378641) (_2!11311 lt!378100)))))

(declare-fun d!81684 () Bool)

(assert (=> d!81684 e!168360))

(declare-fun res!202872 () Bool)

(assert (=> d!81684 (=> (not res!202872) (not e!168360))))

(assert (=> d!81684 (= res!202872 (isPrefixOf!0 (_1!11313 lt!378641) (_2!11313 lt!378641)))))

(declare-fun lt!378642 () BitStream!10598)

(assert (=> d!81684 (= lt!378641 (tuple2!20783 lt!378642 (_2!11311 lt!378100)))))

(declare-fun lt!378644 () Unit!17759)

(declare-fun lt!378655 () Unit!17759)

(assert (=> d!81684 (= lt!378644 lt!378655)))

(assert (=> d!81684 (isPrefixOf!0 lt!378642 (_2!11311 lt!378100))))

(assert (=> d!81684 (= lt!378655 (lemmaIsPrefixTransitive!0 lt!378642 (_2!11311 lt!378100) (_2!11311 lt!378100)))))

(declare-fun lt!378649 () Unit!17759)

(declare-fun lt!378651 () Unit!17759)

(assert (=> d!81684 (= lt!378649 lt!378651)))

(assert (=> d!81684 (isPrefixOf!0 lt!378642 (_2!11311 lt!378100))))

(assert (=> d!81684 (= lt!378651 (lemmaIsPrefixTransitive!0 lt!378642 thiss!1005 (_2!11311 lt!378100)))))

(declare-fun lt!378643 () Unit!17759)

(assert (=> d!81684 (= lt!378643 e!168361)))

(declare-fun c!11452 () Bool)

(assert (=> d!81684 (= c!11452 (not (= (size!5838 (buf!6304 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!378646 () Unit!17759)

(declare-fun lt!378645 () Unit!17759)

(assert (=> d!81684 (= lt!378646 lt!378645)))

(assert (=> d!81684 (isPrefixOf!0 (_2!11311 lt!378100) (_2!11311 lt!378100))))

(assert (=> d!81684 (= lt!378645 (lemmaIsPrefixRefl!0 (_2!11311 lt!378100)))))

(declare-fun lt!378653 () Unit!17759)

(declare-fun lt!378657 () Unit!17759)

(assert (=> d!81684 (= lt!378653 lt!378657)))

(assert (=> d!81684 (= lt!378657 (lemmaIsPrefixRefl!0 (_2!11311 lt!378100)))))

(declare-fun lt!378650 () Unit!17759)

(declare-fun lt!378654 () Unit!17759)

(assert (=> d!81684 (= lt!378650 lt!378654)))

(assert (=> d!81684 (isPrefixOf!0 lt!378642 lt!378642)))

(assert (=> d!81684 (= lt!378654 (lemmaIsPrefixRefl!0 lt!378642))))

(declare-fun lt!378656 () Unit!17759)

(declare-fun lt!378639 () Unit!17759)

(assert (=> d!81684 (= lt!378656 lt!378639)))

(assert (=> d!81684 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81684 (= lt!378639 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81684 (= lt!378642 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005)))))

(assert (=> d!81684 (isPrefixOf!0 thiss!1005 (_2!11311 lt!378100))))

(assert (=> d!81684 (= (reader!0 thiss!1005 (_2!11311 lt!378100)) lt!378641)))

(assert (= (and d!81684 c!11452) b!242889))

(assert (= (and d!81684 (not c!11452)) b!242891))

(assert (= (and d!81684 res!202872) b!242888))

(assert (= (and b!242888 res!202873) b!242892))

(assert (= (and b!242892 res!202871) b!242890))

(declare-fun m!365999 () Bool)

(assert (=> b!242890 m!365999))

(assert (=> b!242890 m!365567))

(assert (=> b!242890 m!365565))

(assert (=> b!242889 m!365565))

(declare-fun m!366001 () Bool)

(assert (=> b!242889 m!366001))

(declare-fun m!366003 () Bool)

(assert (=> b!242889 m!366003))

(declare-fun m!366005 () Bool)

(assert (=> b!242892 m!366005))

(declare-fun m!366007 () Bool)

(assert (=> b!242888 m!366007))

(declare-fun m!366009 () Bool)

(assert (=> d!81684 m!366009))

(declare-fun m!366011 () Bool)

(assert (=> d!81684 m!366011))

(declare-fun m!366013 () Bool)

(assert (=> d!81684 m!366013))

(declare-fun m!366015 () Bool)

(assert (=> d!81684 m!366015))

(assert (=> d!81684 m!365877))

(assert (=> d!81684 m!365879))

(declare-fun m!366017 () Bool)

(assert (=> d!81684 m!366017))

(assert (=> d!81684 m!365587))

(declare-fun m!366019 () Bool)

(assert (=> d!81684 m!366019))

(declare-fun m!366021 () Bool)

(assert (=> d!81684 m!366021))

(declare-fun m!366023 () Bool)

(assert (=> d!81684 m!366023))

(assert (=> b!242650 d!81684))

(declare-fun d!81686 () Bool)

(declare-fun lt!378659 () tuple2!20788)

(assert (=> d!81686 (= lt!378659 (readBit!0 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005))))))

(assert (=> d!81686 (= (readBitPure!0 (BitStream!10599 (buf!6304 (_2!11311 lt!378100)) (currentByte!11667 thiss!1005) (currentBit!11662 thiss!1005))) (tuple2!20781 (_2!11316 lt!378659) (_1!11316 lt!378659)))))

(declare-fun bs!20650 () Bool)

(assert (= bs!20650 d!81686))

(declare-fun m!366025 () Bool)

(assert (=> bs!20650 m!366025))

(assert (=> b!242650 d!81686))

(declare-fun d!81688 () Bool)

(declare-fun e!168366 () Bool)

(assert (=> d!81688 e!168366))

(declare-fun res!202882 () Bool)

(assert (=> d!81688 (=> (not res!202882) (not e!168366))))

(declare-fun lt!378681 () tuple2!20778)

(assert (=> d!81688 (= res!202882 (= (size!5838 (buf!6304 (_2!11311 lt!378108))) (size!5838 (buf!6304 (_2!11311 lt!378681)))))))

(declare-fun choose!51 (BitStream!10598 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20778)

(assert (=> d!81688 (= lt!378681 (choose!51 (_2!11311 lt!378108) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81688 (= (appendNBitsLoop!0 (_2!11311 lt!378108) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!378681)))

(declare-fun b!242904 () Bool)

(declare-fun e!168367 () Bool)

(declare-fun lt!378680 () (_ BitVec 64))

(assert (=> b!242904 (= e!168367 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) lt!378680))))

(declare-fun b!242902 () Bool)

(declare-fun res!202884 () Bool)

(assert (=> b!242902 (=> (not res!202884) (not e!168366))))

(assert (=> b!242902 (= res!202884 (isPrefixOf!0 (_2!11311 lt!378108) (_2!11311 lt!378681)))))

(declare-fun b!242901 () Bool)

(declare-fun res!202885 () Bool)

(assert (=> b!242901 (=> (not res!202885) (not e!168366))))

(declare-fun lt!378679 () (_ BitVec 64))

(declare-fun lt!378683 () (_ BitVec 64))

(assert (=> b!242901 (= res!202885 (= (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378681))) (currentByte!11667 (_2!11311 lt!378681)) (currentBit!11662 (_2!11311 lt!378681))) (bvadd lt!378683 lt!378679)))))

(assert (=> b!242901 (or (not (= (bvand lt!378683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378683 lt!378679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242901 (= lt!378679 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242901 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242901 (= lt!378683 (bitIndex!0 (size!5838 (buf!6304 (_2!11311 lt!378108))) (currentByte!11667 (_2!11311 lt!378108)) (currentBit!11662 (_2!11311 lt!378108))))))

(declare-fun b!242903 () Bool)

(declare-fun lt!378682 () tuple2!20780)

(declare-fun lt!378678 () tuple2!20782)

(assert (=> b!242903 (= e!168366 (and (_2!11312 lt!378682) (= (_1!11312 lt!378682) (_2!11313 lt!378678))))))

(assert (=> b!242903 (= lt!378682 (checkBitsLoopPure!0 (_1!11313 lt!378678) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!378677 () Unit!17759)

(declare-fun lt!378676 () Unit!17759)

(assert (=> b!242903 (= lt!378677 lt!378676)))

(assert (=> b!242903 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378681)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) lt!378680)))

(assert (=> b!242903 (= lt!378676 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11311 lt!378108) (buf!6304 (_2!11311 lt!378681)) lt!378680))))

(assert (=> b!242903 e!168367))

(declare-fun res!202883 () Bool)

(assert (=> b!242903 (=> (not res!202883) (not e!168367))))

(assert (=> b!242903 (= res!202883 (and (= (size!5838 (buf!6304 (_2!11311 lt!378108))) (size!5838 (buf!6304 (_2!11311 lt!378681)))) (bvsge lt!378680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242903 (= lt!378680 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242903 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242903 (= lt!378678 (reader!0 (_2!11311 lt!378108) (_2!11311 lt!378681)))))

(assert (= (and d!81688 res!202882) b!242901))

(assert (= (and b!242901 res!202885) b!242902))

(assert (= (and b!242902 res!202884) b!242903))

(assert (= (and b!242903 res!202883) b!242904))

(declare-fun m!366027 () Bool)

(assert (=> b!242902 m!366027))

(declare-fun m!366029 () Bool)

(assert (=> b!242904 m!366029))

(declare-fun m!366031 () Bool)

(assert (=> b!242901 m!366031))

(assert (=> b!242901 m!365563))

(declare-fun m!366033 () Bool)

(assert (=> b!242903 m!366033))

(declare-fun m!366035 () Bool)

(assert (=> b!242903 m!366035))

(declare-fun m!366037 () Bool)

(assert (=> b!242903 m!366037))

(declare-fun m!366039 () Bool)

(assert (=> b!242903 m!366039))

(declare-fun m!366041 () Bool)

(assert (=> d!81688 m!366041))

(assert (=> b!242650 d!81688))

(declare-fun d!81690 () Bool)

(declare-fun e!168368 () Bool)

(assert (=> d!81690 e!168368))

(declare-fun res!202886 () Bool)

(assert (=> d!81690 (=> (not res!202886) (not e!168368))))

(declare-fun lt!378687 () (_ BitVec 64))

(declare-fun lt!378686 () (_ BitVec 64))

(declare-fun lt!378688 () (_ BitVec 64))

(assert (=> d!81690 (= res!202886 (= lt!378686 (bvsub lt!378688 lt!378687)))))

(assert (=> d!81690 (or (= (bvand lt!378688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378688 lt!378687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81690 (= lt!378687 (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378110)))) ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378110))) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378110)))))))

(declare-fun lt!378684 () (_ BitVec 64))

(declare-fun lt!378689 () (_ BitVec 64))

(assert (=> d!81690 (= lt!378688 (bvmul lt!378684 lt!378689))))

(assert (=> d!81690 (or (= lt!378684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378689 (bvsdiv (bvmul lt!378684 lt!378689) lt!378684)))))

(assert (=> d!81690 (= lt!378689 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81690 (= lt!378684 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378110)))))))

(assert (=> d!81690 (= lt!378686 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11667 (_1!11312 lt!378110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11662 (_1!11312 lt!378110)))))))

(assert (=> d!81690 (invariant!0 (currentBit!11662 (_1!11312 lt!378110)) (currentByte!11667 (_1!11312 lt!378110)) (size!5838 (buf!6304 (_1!11312 lt!378110))))))

(assert (=> d!81690 (= (bitIndex!0 (size!5838 (buf!6304 (_1!11312 lt!378110))) (currentByte!11667 (_1!11312 lt!378110)) (currentBit!11662 (_1!11312 lt!378110))) lt!378686)))

(declare-fun b!242905 () Bool)

(declare-fun res!202887 () Bool)

(assert (=> b!242905 (=> (not res!202887) (not e!168368))))

(assert (=> b!242905 (= res!202887 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378686))))

(declare-fun b!242906 () Bool)

(declare-fun lt!378685 () (_ BitVec 64))

(assert (=> b!242906 (= e!168368 (bvsle lt!378686 (bvmul lt!378685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242906 (or (= lt!378685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378685)))))

(assert (=> b!242906 (= lt!378685 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11312 lt!378110)))))))

(assert (= (and d!81690 res!202886) b!242905))

(assert (= (and b!242905 res!202887) b!242906))

(declare-fun m!366043 () Bool)

(assert (=> d!81690 m!366043))

(declare-fun m!366045 () Bool)

(assert (=> d!81690 m!366045))

(assert (=> b!242650 d!81690))

(declare-fun d!81692 () Bool)

(assert (=> d!81692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20651 () Bool)

(assert (= bs!20651 d!81692))

(assert (=> bs!20651 m!365827))

(assert (=> b!242650 d!81692))

(declare-fun d!81694 () Bool)

(declare-fun lt!378690 () tuple2!20788)

(assert (=> d!81694 (= lt!378690 (readBit!0 lt!378113))))

(assert (=> d!81694 (= (readBitPure!0 lt!378113) (tuple2!20781 (_2!11316 lt!378690) (_1!11316 lt!378690)))))

(declare-fun bs!20652 () Bool)

(assert (= bs!20652 d!81694))

(declare-fun m!366047 () Bool)

(assert (=> bs!20652 m!366047))

(assert (=> b!242650 d!81694))

(declare-fun d!81696 () Bool)

(assert (=> d!81696 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11313 lt!378105)))) ((_ sign_extend 32) (currentByte!11667 (_1!11313 lt!378105))) ((_ sign_extend 32) (currentBit!11662 (_1!11313 lt!378105)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 (_1!11313 lt!378105)))) ((_ sign_extend 32) (currentByte!11667 (_1!11313 lt!378105))) ((_ sign_extend 32) (currentBit!11662 (_1!11313 lt!378105)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!20653 () Bool)

(assert (= bs!20653 d!81696))

(declare-fun m!366049 () Bool)

(assert (=> bs!20653 m!366049))

(assert (=> b!242650 d!81696))

(declare-fun d!81698 () Bool)

(declare-fun e!168371 () Bool)

(assert (=> d!81698 e!168371))

(declare-fun res!202890 () Bool)

(assert (=> d!81698 (=> (not res!202890) (not e!168371))))

(assert (=> d!81698 (= res!202890 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!378693 () Unit!17759)

(declare-fun choose!27 (BitStream!10598 BitStream!10598 (_ BitVec 64) (_ BitVec 64)) Unit!17759)

(assert (=> d!81698 (= lt!378693 (choose!27 thiss!1005 (_2!11311 lt!378108) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81698 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81698 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11311 lt!378108) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!378693)))

(declare-fun b!242909 () Bool)

(assert (=> b!242909 (= e!168371 (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 (_2!11311 lt!378108)))) ((_ sign_extend 32) (currentByte!11667 (_2!11311 lt!378108))) ((_ sign_extend 32) (currentBit!11662 (_2!11311 lt!378108))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81698 res!202890) b!242909))

(declare-fun m!366051 () Bool)

(assert (=> d!81698 m!366051))

(assert (=> b!242909 m!365593))

(assert (=> b!242650 d!81698))

(declare-fun d!81700 () Bool)

(assert (=> d!81700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))) ((_ sign_extend 32) (currentByte!11667 thiss!1005)) ((_ sign_extend 32) (currentBit!11662 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5838 (buf!6304 thiss!1005))) ((_ sign_extend 32) (currentByte!11667 thiss!1005)) ((_ sign_extend 32) (currentBit!11662 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20654 () Bool)

(assert (= bs!20654 d!81700))

(assert (=> bs!20654 m!365831))

(assert (=> b!242647 d!81700))

(push 1)

(assert (not b!242883))

(assert (not b!242815))

(assert (not b!242909))

(assert (not d!81624))

(assert (not b!242904))

(assert (not b!242837))

(assert (not d!81622))

(assert (not b!242888))

(assert (not b!242881))

(assert (not b!242885))

(assert (not d!81692))

(assert (not d!81654))

(assert (not b!242892))

(assert (not b!242842))

(assert (not d!81690))

(assert (not d!81652))

(assert (not b!242890))

(assert (not b!242817))

(assert (not b!242840))

(assert (not d!81666))

(assert (not d!81648))

(assert (not d!81696))

(assert (not d!81638))

(assert (not d!81684))

(assert (not d!81630))

(assert (not d!81614))

(assert (not b!242839))

(assert (not d!81634))

(assert (not d!81688))

(assert (not b!242903))

(assert (not b!242901))

(assert (not b!242816))

(assert (not d!81694))

(assert (not b!242887))

(assert (not b!242819))

(assert (not d!81682))

(assert (not b!242882))

(assert (not d!81700))

(assert (not b!242884))

(assert (not d!81636))

(assert (not d!81616))

(assert (not d!81698))

(assert (not b!242822))

(assert (not d!81686))

(assert (not d!81646))

(assert (not b!242902))

(assert (not d!81618))

(assert (not b!242889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

