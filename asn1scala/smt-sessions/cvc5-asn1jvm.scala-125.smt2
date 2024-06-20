; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3092 () Bool)

(assert start!3092)

(declare-fun b!14064 () Bool)

(declare-fun e!8650 () Bool)

(declare-fun lt!21716 () (_ BitVec 64))

(declare-fun lt!21712 () (_ BitVec 64))

(assert (=> b!14064 (= e!8650 (or (not (= lt!21716 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!21716 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21712) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!14064 (= lt!21716 (bvand lt!21712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!786 0))(
  ( (array!787 (arr!766 (Array (_ BitVec 32) (_ BitVec 8))) (size!337 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!634 0))(
  ( (BitStream!635 (buf!688 array!786) (currentByte!1820 (_ BitVec 32)) (currentBit!1815 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!634)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14064 (= lt!21712 (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)))))

(declare-fun b!14065 () Bool)

(declare-fun res!13345 () Bool)

(declare-fun e!8652 () Bool)

(assert (=> b!14065 (=> (not res!13345) (not e!8652))))

(declare-datatypes ((Unit!1139 0))(
  ( (Unit!1140) )
))
(declare-datatypes ((tuple2!1652 0))(
  ( (tuple2!1653 (_1!881 Unit!1139) (_2!881 BitStream!634)) )
))
(declare-fun lt!21711 () tuple2!1652)

(declare-fun isPrefixOf!0 (BitStream!634 BitStream!634) Bool)

(assert (=> b!14065 (= res!13345 (isPrefixOf!0 thiss!957 (_2!881 lt!21711)))))

(declare-fun b!14066 () Bool)

(declare-fun e!8654 () Bool)

(assert (=> b!14066 (= e!8652 e!8654)))

(declare-fun res!13346 () Bool)

(assert (=> b!14066 (=> (not res!13346) (not e!8654))))

(declare-datatypes ((tuple2!1654 0))(
  ( (tuple2!1655 (_1!882 BitStream!634) (_2!882 Bool)) )
))
(declare-fun lt!21713 () tuple2!1654)

(assert (=> b!14066 (= res!13346 (and (not (_2!882 lt!21713)) (= (_1!882 lt!21713) (_2!881 lt!21711))))))

(declare-fun readBitPure!0 (BitStream!634) tuple2!1654)

(declare-fun readerFrom!0 (BitStream!634 (_ BitVec 32) (_ BitVec 32)) BitStream!634)

(assert (=> b!14066 (= lt!21713 (readBitPure!0 (readerFrom!0 (_2!881 lt!21711) (currentBit!1815 thiss!957) (currentByte!1820 thiss!957))))))

(declare-fun b!14067 () Bool)

(declare-fun e!8651 () Bool)

(assert (=> b!14067 (= e!8651 (not e!8650))))

(declare-fun res!13343 () Bool)

(assert (=> b!14067 (=> res!13343 e!8650)))

(assert (=> b!14067 (= res!13343 (not (= (size!337 (buf!688 (_2!881 lt!21711))) (size!337 (buf!688 thiss!957)))))))

(declare-fun e!8649 () Bool)

(assert (=> b!14067 e!8649))

(declare-fun res!13348 () Bool)

(assert (=> b!14067 (=> (not res!13348) (not e!8649))))

(assert (=> b!14067 (= res!13348 (= (size!337 (buf!688 thiss!957)) (size!337 (buf!688 (_2!881 lt!21711)))))))

(declare-fun appendBit!0 (BitStream!634 Bool) tuple2!1652)

(assert (=> b!14067 (= lt!21711 (appendBit!0 thiss!957 false))))

(declare-fun res!13347 () Bool)

(assert (=> start!3092 (=> (not res!13347) (not e!8651))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3092 (= res!13347 (validate_offset_bit!0 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))) ((_ sign_extend 32) (currentByte!1820 thiss!957)) ((_ sign_extend 32) (currentBit!1815 thiss!957))))))

(assert (=> start!3092 e!8651))

(declare-fun e!8653 () Bool)

(declare-fun inv!12 (BitStream!634) Bool)

(assert (=> start!3092 (and (inv!12 thiss!957) e!8653)))

(declare-fun b!14068 () Bool)

(declare-fun lt!21715 () (_ BitVec 64))

(assert (=> b!14068 (= e!8654 (= (bitIndex!0 (size!337 (buf!688 (_1!882 lt!21713))) (currentByte!1820 (_1!882 lt!21713)) (currentBit!1815 (_1!882 lt!21713))) lt!21715))))

(declare-fun b!14069 () Bool)

(declare-fun array_inv!326 (array!786) Bool)

(assert (=> b!14069 (= e!8653 (array_inv!326 (buf!688 thiss!957)))))

(declare-fun b!14070 () Bool)

(assert (=> b!14070 (= e!8649 e!8652)))

(declare-fun res!13344 () Bool)

(assert (=> b!14070 (=> (not res!13344) (not e!8652))))

(declare-fun lt!21714 () (_ BitVec 64))

(assert (=> b!14070 (= res!13344 (= lt!21715 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21714)))))

(assert (=> b!14070 (= lt!21715 (bitIndex!0 (size!337 (buf!688 (_2!881 lt!21711))) (currentByte!1820 (_2!881 lt!21711)) (currentBit!1815 (_2!881 lt!21711))))))

(assert (=> b!14070 (= lt!21714 (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)))))

(assert (= (and start!3092 res!13347) b!14067))

(assert (= (and b!14067 res!13348) b!14070))

(assert (= (and b!14070 res!13344) b!14065))

(assert (= (and b!14065 res!13345) b!14066))

(assert (= (and b!14066 res!13346) b!14068))

(assert (= (and b!14067 (not res!13343)) b!14064))

(assert (= start!3092 b!14069))

(declare-fun m!20577 () Bool)

(assert (=> b!14068 m!20577))

(declare-fun m!20579 () Bool)

(assert (=> b!14065 m!20579))

(declare-fun m!20581 () Bool)

(assert (=> b!14067 m!20581))

(declare-fun m!20583 () Bool)

(assert (=> start!3092 m!20583))

(declare-fun m!20585 () Bool)

(assert (=> start!3092 m!20585))

(declare-fun m!20587 () Bool)

(assert (=> b!14064 m!20587))

(declare-fun m!20589 () Bool)

(assert (=> b!14069 m!20589))

(declare-fun m!20591 () Bool)

(assert (=> b!14066 m!20591))

(assert (=> b!14066 m!20591))

(declare-fun m!20593 () Bool)

(assert (=> b!14066 m!20593))

(declare-fun m!20595 () Bool)

(assert (=> b!14070 m!20595))

(assert (=> b!14070 m!20587))

(push 1)

(assert (not b!14064))

(assert (not b!14065))

(assert (not b!14070))

(assert (not b!14068))

(assert (not start!3092))

(assert (not b!14069))

(assert (not b!14066))

(assert (not b!14067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4576 () Bool)

(assert (=> d!4576 (= (array_inv!326 (buf!688 thiss!957)) (bvsge (size!337 (buf!688 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!14069 d!4576))

(declare-fun d!4578 () Bool)

(declare-fun e!8703 () Bool)

(assert (=> d!4578 e!8703))

(declare-fun res!13398 () Bool)

(assert (=> d!4578 (=> (not res!13398) (not e!8703))))

(declare-fun lt!21776 () (_ BitVec 64))

(declare-fun lt!21777 () (_ BitVec 64))

(declare-fun lt!21775 () (_ BitVec 64))

(assert (=> d!4578 (= res!13398 (= lt!21776 (bvsub lt!21777 lt!21775)))))

(assert (=> d!4578 (or (= (bvand lt!21777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21777 lt!21775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4578 (= lt!21775 (remainingBits!0 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))) ((_ sign_extend 32) (currentByte!1820 thiss!957)) ((_ sign_extend 32) (currentBit!1815 thiss!957))))))

(declare-fun lt!21778 () (_ BitVec 64))

(declare-fun lt!21774 () (_ BitVec 64))

(assert (=> d!4578 (= lt!21777 (bvmul lt!21778 lt!21774))))

(assert (=> d!4578 (or (= lt!21778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21774 (bvsdiv (bvmul lt!21778 lt!21774) lt!21778)))))

(assert (=> d!4578 (= lt!21774 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4578 (= lt!21778 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))))))

(assert (=> d!4578 (= lt!21776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1820 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1815 thiss!957))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4578 (invariant!0 (currentBit!1815 thiss!957) (currentByte!1820 thiss!957) (size!337 (buf!688 thiss!957)))))

(assert (=> d!4578 (= (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)) lt!21776)))

(declare-fun b!14126 () Bool)

(declare-fun res!13397 () Bool)

(assert (=> b!14126 (=> (not res!13397) (not e!8703))))

(assert (=> b!14126 (= res!13397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21776))))

(declare-fun b!14127 () Bool)

(declare-fun lt!21773 () (_ BitVec 64))

(assert (=> b!14127 (= e!8703 (bvsle lt!21776 (bvmul lt!21773 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14127 (or (= lt!21773 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21773 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21773)))))

(assert (=> b!14127 (= lt!21773 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))))))

(assert (= (and d!4578 res!13398) b!14126))

(assert (= (and b!14126 res!13397) b!14127))

(declare-fun m!20637 () Bool)

(assert (=> d!4578 m!20637))

(declare-fun m!20639 () Bool)

(assert (=> d!4578 m!20639))

(assert (=> b!14064 d!4578))

(declare-fun b!14166 () Bool)

(declare-fun e!8722 () Bool)

(declare-fun lt!21833 () tuple2!1654)

(declare-fun lt!21835 () tuple2!1652)

(assert (=> b!14166 (= e!8722 (= (bitIndex!0 (size!337 (buf!688 (_1!882 lt!21833))) (currentByte!1820 (_1!882 lt!21833)) (currentBit!1815 (_1!882 lt!21833))) (bitIndex!0 (size!337 (buf!688 (_2!881 lt!21835))) (currentByte!1820 (_2!881 lt!21835)) (currentBit!1815 (_2!881 lt!21835)))))))

(declare-fun b!14161 () Bool)

(declare-fun res!13433 () Bool)

(declare-fun e!8721 () Bool)

(assert (=> b!14161 (=> (not res!13433) (not e!8721))))

(declare-fun lt!21834 () (_ BitVec 64))

(declare-fun lt!21836 () (_ BitVec 64))

(assert (=> b!14161 (= res!13433 (= (bitIndex!0 (size!337 (buf!688 (_2!881 lt!21835))) (currentByte!1820 (_2!881 lt!21835)) (currentBit!1815 (_2!881 lt!21835))) (bvadd lt!21836 lt!21834)))))

(assert (=> b!14161 (or (not (= (bvand lt!21836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21834 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21836 lt!21834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14161 (= lt!21834 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14161 (= lt!21836 (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)))))

(declare-fun b!14164 () Bool)

(assert (=> b!14164 (= e!8721 e!8722)))

(declare-fun res!13434 () Bool)

(assert (=> b!14164 (=> (not res!13434) (not e!8722))))

(assert (=> b!14164 (= res!13434 (and (= (_2!882 lt!21833) false) (= (_1!882 lt!21833) (_2!881 lt!21835))))))

(assert (=> b!14164 (= lt!21833 (readBitPure!0 (readerFrom!0 (_2!881 lt!21835) (currentBit!1815 thiss!957) (currentByte!1820 thiss!957))))))

(declare-fun b!14162 () Bool)

(declare-fun res!13432 () Bool)

(assert (=> b!14162 (=> (not res!13432) (not e!8721))))

(assert (=> b!14162 (= res!13432 (isPrefixOf!0 thiss!957 (_2!881 lt!21835)))))

(declare-fun d!4584 () Bool)

(assert (=> d!4584 e!8721))

(declare-fun res!13431 () Bool)

(assert (=> d!4584 (=> (not res!13431) (not e!8721))))

(assert (=> d!4584 (= res!13431 (= (size!337 (buf!688 thiss!957)) (size!337 (buf!688 (_2!881 lt!21835)))))))

(declare-fun choose!16 (BitStream!634 Bool) tuple2!1652)

(assert (=> d!4584 (= lt!21835 (choose!16 thiss!957 false))))

(assert (=> d!4584 (validate_offset_bit!0 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))) ((_ sign_extend 32) (currentByte!1820 thiss!957)) ((_ sign_extend 32) (currentBit!1815 thiss!957)))))

(assert (=> d!4584 (= (appendBit!0 thiss!957 false) lt!21835)))

(assert (= (and d!4584 res!13431) b!14161))

(assert (= (and b!14161 res!13433) b!14162))

(assert (= (and b!14162 res!13432) b!14164))

(assert (= (and b!14164 res!13434) b!14166))

(declare-fun m!20667 () Bool)

(assert (=> b!14161 m!20667))

(assert (=> b!14161 m!20587))

(declare-fun m!20669 () Bool)

(assert (=> b!14164 m!20669))

(assert (=> b!14164 m!20669))

(declare-fun m!20671 () Bool)

(assert (=> b!14164 m!20671))

(declare-fun m!20673 () Bool)

(assert (=> d!4584 m!20673))

(assert (=> d!4584 m!20583))

(declare-fun m!20675 () Bool)

(assert (=> b!14162 m!20675))

(declare-fun m!20677 () Bool)

(assert (=> b!14166 m!20677))

(assert (=> b!14166 m!20667))

(assert (=> b!14067 d!4584))

(declare-fun d!4600 () Bool)

(declare-fun e!8726 () Bool)

(assert (=> d!4600 e!8726))

(declare-fun res!13441 () Bool)

(assert (=> d!4600 (=> (not res!13441) (not e!8726))))

(declare-fun lt!21847 () (_ BitVec 64))

(declare-fun lt!21845 () (_ BitVec 64))

(declare-fun lt!21846 () (_ BitVec 64))

(assert (=> d!4600 (= res!13441 (= lt!21846 (bvsub lt!21847 lt!21845)))))

(assert (=> d!4600 (or (= (bvand lt!21847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21845 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21847 lt!21845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4600 (= lt!21845 (remainingBits!0 ((_ sign_extend 32) (size!337 (buf!688 (_1!882 lt!21713)))) ((_ sign_extend 32) (currentByte!1820 (_1!882 lt!21713))) ((_ sign_extend 32) (currentBit!1815 (_1!882 lt!21713)))))))

(declare-fun lt!21848 () (_ BitVec 64))

(declare-fun lt!21844 () (_ BitVec 64))

(assert (=> d!4600 (= lt!21847 (bvmul lt!21848 lt!21844))))

(assert (=> d!4600 (or (= lt!21848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21844 (bvsdiv (bvmul lt!21848 lt!21844) lt!21848)))))

(assert (=> d!4600 (= lt!21844 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4600 (= lt!21848 ((_ sign_extend 32) (size!337 (buf!688 (_1!882 lt!21713)))))))

(assert (=> d!4600 (= lt!21846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1820 (_1!882 lt!21713))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1815 (_1!882 lt!21713)))))))

(assert (=> d!4600 (invariant!0 (currentBit!1815 (_1!882 lt!21713)) (currentByte!1820 (_1!882 lt!21713)) (size!337 (buf!688 (_1!882 lt!21713))))))

(assert (=> d!4600 (= (bitIndex!0 (size!337 (buf!688 (_1!882 lt!21713))) (currentByte!1820 (_1!882 lt!21713)) (currentBit!1815 (_1!882 lt!21713))) lt!21846)))

(declare-fun b!14170 () Bool)

(declare-fun res!13440 () Bool)

(assert (=> b!14170 (=> (not res!13440) (not e!8726))))

(assert (=> b!14170 (= res!13440 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21846))))

(declare-fun b!14171 () Bool)

(declare-fun lt!21843 () (_ BitVec 64))

(assert (=> b!14171 (= e!8726 (bvsle lt!21846 (bvmul lt!21843 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14171 (or (= lt!21843 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21843 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21843)))))

(assert (=> b!14171 (= lt!21843 ((_ sign_extend 32) (size!337 (buf!688 (_1!882 lt!21713)))))))

(assert (= (and d!4600 res!13441) b!14170))

(assert (= (and b!14170 res!13440) b!14171))

(declare-fun m!20683 () Bool)

(assert (=> d!4600 m!20683))

(declare-fun m!20685 () Bool)

(assert (=> d!4600 m!20685))

(assert (=> b!14068 d!4600))

(declare-fun d!4604 () Bool)

(declare-datatypes ((tuple2!1666 0))(
  ( (tuple2!1667 (_1!888 Bool) (_2!888 BitStream!634)) )
))
(declare-fun lt!21854 () tuple2!1666)

(declare-fun readBit!0 (BitStream!634) tuple2!1666)

(assert (=> d!4604 (= lt!21854 (readBit!0 (readerFrom!0 (_2!881 lt!21711) (currentBit!1815 thiss!957) (currentByte!1820 thiss!957))))))

(assert (=> d!4604 (= (readBitPure!0 (readerFrom!0 (_2!881 lt!21711) (currentBit!1815 thiss!957) (currentByte!1820 thiss!957))) (tuple2!1655 (_2!888 lt!21854) (_1!888 lt!21854)))))

(declare-fun bs!1258 () Bool)

(assert (= bs!1258 d!4604))

(assert (=> bs!1258 m!20591))

(declare-fun m!20689 () Bool)

(assert (=> bs!1258 m!20689))

(assert (=> b!14066 d!4604))

(declare-fun d!4608 () Bool)

(declare-fun e!8732 () Bool)

(assert (=> d!4608 e!8732))

(declare-fun res!13449 () Bool)

(assert (=> d!4608 (=> (not res!13449) (not e!8732))))

(assert (=> d!4608 (= res!13449 (invariant!0 (currentBit!1815 (_2!881 lt!21711)) (currentByte!1820 (_2!881 lt!21711)) (size!337 (buf!688 (_2!881 lt!21711)))))))

(assert (=> d!4608 (= (readerFrom!0 (_2!881 lt!21711) (currentBit!1815 thiss!957) (currentByte!1820 thiss!957)) (BitStream!635 (buf!688 (_2!881 lt!21711)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)))))

(declare-fun b!14177 () Bool)

(assert (=> b!14177 (= e!8732 (invariant!0 (currentBit!1815 thiss!957) (currentByte!1820 thiss!957) (size!337 (buf!688 (_2!881 lt!21711)))))))

(assert (= (and d!4608 res!13449) b!14177))

(declare-fun m!20693 () Bool)

(assert (=> d!4608 m!20693))

(declare-fun m!20695 () Bool)

(assert (=> b!14177 m!20695))

(assert (=> b!14066 d!4608))

(declare-fun d!4612 () Bool)

(assert (=> d!4612 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))) ((_ sign_extend 32) (currentByte!1820 thiss!957)) ((_ sign_extend 32) (currentBit!1815 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!337 (buf!688 thiss!957))) ((_ sign_extend 32) (currentByte!1820 thiss!957)) ((_ sign_extend 32) (currentBit!1815 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1259 () Bool)

(assert (= bs!1259 d!4612))

(assert (=> bs!1259 m!20637))

(assert (=> start!3092 d!4612))

(declare-fun d!4614 () Bool)

(assert (=> d!4614 (= (inv!12 thiss!957) (invariant!0 (currentBit!1815 thiss!957) (currentByte!1820 thiss!957) (size!337 (buf!688 thiss!957))))))

(declare-fun bs!1260 () Bool)

(assert (= bs!1260 d!4614))

(assert (=> bs!1260 m!20639))

(assert (=> start!3092 d!4614))

(declare-fun d!4616 () Bool)

(declare-fun e!8737 () Bool)

(assert (=> d!4616 e!8737))

(declare-fun res!13459 () Bool)

(assert (=> d!4616 (=> (not res!13459) (not e!8737))))

(declare-fun lt!21866 () (_ BitVec 64))

(declare-fun lt!21865 () (_ BitVec 64))

(declare-fun lt!21867 () (_ BitVec 64))

(assert (=> d!4616 (= res!13459 (= lt!21866 (bvsub lt!21867 lt!21865)))))

(assert (=> d!4616 (or (= (bvand lt!21867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21867 lt!21865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4616 (= lt!21865 (remainingBits!0 ((_ sign_extend 32) (size!337 (buf!688 (_2!881 lt!21711)))) ((_ sign_extend 32) (currentByte!1820 (_2!881 lt!21711))) ((_ sign_extend 32) (currentBit!1815 (_2!881 lt!21711)))))))

(declare-fun lt!21868 () (_ BitVec 64))

(declare-fun lt!21864 () (_ BitVec 64))

(assert (=> d!4616 (= lt!21867 (bvmul lt!21868 lt!21864))))

(assert (=> d!4616 (or (= lt!21868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21864 (bvsdiv (bvmul lt!21868 lt!21864) lt!21868)))))

(assert (=> d!4616 (= lt!21864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4616 (= lt!21868 ((_ sign_extend 32) (size!337 (buf!688 (_2!881 lt!21711)))))))

(assert (=> d!4616 (= lt!21866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1820 (_2!881 lt!21711))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1815 (_2!881 lt!21711)))))))

(assert (=> d!4616 (invariant!0 (currentBit!1815 (_2!881 lt!21711)) (currentByte!1820 (_2!881 lt!21711)) (size!337 (buf!688 (_2!881 lt!21711))))))

(assert (=> d!4616 (= (bitIndex!0 (size!337 (buf!688 (_2!881 lt!21711))) (currentByte!1820 (_2!881 lt!21711)) (currentBit!1815 (_2!881 lt!21711))) lt!21866)))

(declare-fun b!14187 () Bool)

(declare-fun res!13458 () Bool)

(assert (=> b!14187 (=> (not res!13458) (not e!8737))))

(assert (=> b!14187 (= res!13458 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21866))))

(declare-fun b!14188 () Bool)

(declare-fun lt!21863 () (_ BitVec 64))

(assert (=> b!14188 (= e!8737 (bvsle lt!21866 (bvmul lt!21863 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14188 (or (= lt!21863 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21863 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21863)))))

(assert (=> b!14188 (= lt!21863 ((_ sign_extend 32) (size!337 (buf!688 (_2!881 lt!21711)))))))

(assert (= (and d!4616 res!13459) b!14187))

(assert (= (and b!14187 res!13458) b!14188))

(declare-fun m!20697 () Bool)

(assert (=> d!4616 m!20697))

(assert (=> d!4616 m!20693))

(assert (=> b!14070 d!4616))

(assert (=> b!14070 d!4578))

(declare-fun d!4618 () Bool)

(declare-fun res!13474 () Bool)

(declare-fun e!8745 () Bool)

(assert (=> d!4618 (=> (not res!13474) (not e!8745))))

(assert (=> d!4618 (= res!13474 (= (size!337 (buf!688 thiss!957)) (size!337 (buf!688 (_2!881 lt!21711)))))))

(assert (=> d!4618 (= (isPrefixOf!0 thiss!957 (_2!881 lt!21711)) e!8745)))

(declare-fun b!14201 () Bool)

(declare-fun res!13472 () Bool)

(assert (=> b!14201 (=> (not res!13472) (not e!8745))))

(assert (=> b!14201 (= res!13472 (bvsle (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957)) (bitIndex!0 (size!337 (buf!688 (_2!881 lt!21711))) (currentByte!1820 (_2!881 lt!21711)) (currentBit!1815 (_2!881 lt!21711)))))))

(declare-fun b!14202 () Bool)

(declare-fun e!8746 () Bool)

(assert (=> b!14202 (= e!8745 e!8746)))

(declare-fun res!13473 () Bool)

(assert (=> b!14202 (=> res!13473 e!8746)))

(assert (=> b!14202 (= res!13473 (= (size!337 (buf!688 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!14203 () Bool)

(declare-fun arrayBitRangesEq!0 (array!786 array!786 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14203 (= e!8746 (arrayBitRangesEq!0 (buf!688 thiss!957) (buf!688 (_2!881 lt!21711)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!337 (buf!688 thiss!957)) (currentByte!1820 thiss!957) (currentBit!1815 thiss!957))))))

(assert (= (and d!4618 res!13474) b!14201))

(assert (= (and b!14201 res!13472) b!14202))

(assert (= (and b!14202 (not res!13473)) b!14203))

(assert (=> b!14201 m!20587))

(assert (=> b!14201 m!20595))

(assert (=> b!14203 m!20587))

(assert (=> b!14203 m!20587))

(declare-fun m!20715 () Bool)

(assert (=> b!14203 m!20715))

(assert (=> b!14065 d!4618))

(push 1)

(assert (not d!4612))

(assert (not d!4608))

(assert (not b!14203))

(assert (not b!14166))

(assert (not d!4616))

(assert (not d!4604))

(assert (not b!14177))

(assert (not b!14201))

(assert (not b!14164))

(assert (not d!4578))

(assert (not b!14161))

(assert (not d!4600))

(assert (not d!4614))

(assert (not d!4584))

(assert (not b!14162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

