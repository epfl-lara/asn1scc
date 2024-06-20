; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52610 () Bool)

(assert start!52610)

(declare-fun b!242939 () Bool)

(declare-fun e!168401 () Bool)

(declare-datatypes ((array!13322 0))(
  ( (array!13323 (arr!6826 (Array (_ BitVec 32) (_ BitVec 8))) (size!5839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10600 0))(
  ( (BitStream!10601 (buf!6308 array!13322) (currentByte!11680 (_ BitVec 32)) (currentBit!11675 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10600)

(declare-datatypes ((Unit!17767 0))(
  ( (Unit!17768) )
))
(declare-datatypes ((tuple2!20790 0))(
  ( (tuple2!20791 (_1!11317 Unit!17767) (_2!11317 BitStream!10600)) )
))
(declare-fun lt!378736 () tuple2!20790)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242939 (= e!168401 (invariant!0 (currentBit!11675 thiss!1005) (currentByte!11680 thiss!1005) (size!5839 (buf!6308 (_2!11317 lt!378736)))))))

(declare-fun b!242940 () Bool)

(declare-fun e!168395 () Bool)

(declare-fun e!168394 () Bool)

(assert (=> b!242940 (= e!168395 e!168394)))

(declare-fun res!202924 () Bool)

(assert (=> b!242940 (=> (not res!202924) (not e!168394))))

(declare-fun lt!378742 () (_ BitVec 64))

(declare-fun lt!378734 () tuple2!20790)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242940 (= res!202924 (= (bitIndex!0 (size!5839 (buf!6308 (_2!11317 lt!378736))) (currentByte!11680 (_2!11317 lt!378736)) (currentBit!11675 (_2!11317 lt!378736))) (bvadd (bitIndex!0 (size!5839 (buf!6308 (_2!11317 lt!378734))) (currentByte!11680 (_2!11317 lt!378734)) (currentBit!11675 (_2!11317 lt!378734))) lt!378742)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!242940 (= lt!378742 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242941 () Bool)

(declare-fun e!168397 () Bool)

(declare-datatypes ((tuple2!20792 0))(
  ( (tuple2!20793 (_1!11318 BitStream!10600) (_2!11318 Bool)) )
))
(declare-fun lt!378731 () tuple2!20792)

(declare-fun lt!378728 () (_ BitVec 64))

(assert (=> b!242941 (= e!168397 (= (bitIndex!0 (size!5839 (buf!6308 (_1!11318 lt!378731))) (currentByte!11680 (_1!11318 lt!378731)) (currentBit!11675 (_1!11318 lt!378731))) lt!378728))))

(declare-fun b!242942 () Bool)

(declare-fun res!202927 () Bool)

(declare-fun e!168400 () Bool)

(assert (=> b!242942 (=> (not res!202927) (not e!168400))))

(assert (=> b!242942 (= res!202927 (bvslt from!289 nBits!297))))

(declare-fun b!242938 () Bool)

(declare-fun res!202926 () Bool)

(assert (=> b!242938 (=> (not res!202926) (not e!168400))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242938 (= res!202926 (validate_offset_bits!1 ((_ sign_extend 32) (size!5839 (buf!6308 thiss!1005))) ((_ sign_extend 32) (currentByte!11680 thiss!1005)) ((_ sign_extend 32) (currentBit!11675 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!202928 () Bool)

(assert (=> start!52610 (=> (not res!202928) (not e!168400))))

(assert (=> start!52610 (= res!202928 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52610 e!168400))

(assert (=> start!52610 true))

(declare-fun e!168392 () Bool)

(declare-fun inv!12 (BitStream!10600) Bool)

(assert (=> start!52610 (and (inv!12 thiss!1005) e!168392)))

(declare-fun b!242943 () Bool)

(declare-fun e!168396 () Bool)

(assert (=> b!242943 (= e!168396 e!168397)))

(declare-fun res!202925 () Bool)

(assert (=> b!242943 (=> (not res!202925) (not e!168397))))

(declare-fun bit!26 () Bool)

(assert (=> b!242943 (= res!202925 (and (= (_2!11318 lt!378731) bit!26) (= (_1!11318 lt!378731) (_2!11317 lt!378734))))))

(declare-fun readBitPure!0 (BitStream!10600) tuple2!20792)

(declare-fun readerFrom!0 (BitStream!10600 (_ BitVec 32) (_ BitVec 32)) BitStream!10600)

(assert (=> b!242943 (= lt!378731 (readBitPure!0 (readerFrom!0 (_2!11317 lt!378734) (currentBit!11675 thiss!1005) (currentByte!11680 thiss!1005))))))

(declare-fun b!242944 () Bool)

(declare-fun e!168393 () Bool)

(declare-fun lt!378740 () tuple2!20792)

(declare-fun lt!378744 () tuple2!20792)

(assert (=> b!242944 (= e!168393 (= (_2!11318 lt!378740) (_2!11318 lt!378744)))))

(declare-fun b!242945 () Bool)

(declare-fun res!202919 () Bool)

(assert (=> b!242945 (=> (not res!202919) (not e!168401))))

(assert (=> b!242945 (= res!202919 (invariant!0 (currentBit!11675 thiss!1005) (currentByte!11680 thiss!1005) (size!5839 (buf!6308 (_2!11317 lt!378734)))))))

(declare-fun b!242946 () Bool)

(declare-fun lt!378739 () tuple2!20792)

(declare-datatypes ((tuple2!20794 0))(
  ( (tuple2!20795 (_1!11319 BitStream!10600) (_2!11319 BitStream!10600)) )
))
(declare-fun lt!378743 () tuple2!20794)

(assert (=> b!242946 (= e!168394 (not (or (not (_2!11318 lt!378739)) (not (= (_1!11318 lt!378739) (_2!11319 lt!378743))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10600 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20792)

(assert (=> b!242946 (= lt!378739 (checkBitsLoopPure!0 (_1!11319 lt!378743) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242946 (validate_offset_bits!1 ((_ sign_extend 32) (size!5839 (buf!6308 (_2!11317 lt!378736)))) ((_ sign_extend 32) (currentByte!11680 (_2!11317 lt!378734))) ((_ sign_extend 32) (currentBit!11675 (_2!11317 lt!378734))) lt!378742)))

(declare-fun lt!378737 () Unit!17767)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10600 array!13322 (_ BitVec 64)) Unit!17767)

(assert (=> b!242946 (= lt!378737 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11317 lt!378734) (buf!6308 (_2!11317 lt!378736)) lt!378742))))

(declare-fun reader!0 (BitStream!10600 BitStream!10600) tuple2!20794)

(assert (=> b!242946 (= lt!378743 (reader!0 (_2!11317 lt!378734) (_2!11317 lt!378736)))))

(declare-fun b!242947 () Bool)

(declare-fun res!202922 () Bool)

(assert (=> b!242947 (=> (not res!202922) (not e!168396))))

(declare-fun isPrefixOf!0 (BitStream!10600 BitStream!10600) Bool)

(assert (=> b!242947 (= res!202922 (isPrefixOf!0 thiss!1005 (_2!11317 lt!378734)))))

(declare-fun b!242948 () Bool)

(declare-fun array_inv!5580 (array!13322) Bool)

(assert (=> b!242948 (= e!168392 (array_inv!5580 (buf!6308 thiss!1005)))))

(declare-fun b!242949 () Bool)

(assert (=> b!242949 (= e!168400 (not true))))

(declare-fun lt!378730 () tuple2!20794)

(assert (=> b!242949 (= (_2!11318 (readBitPure!0 (_1!11319 lt!378730))) bit!26)))

(declare-fun lt!378741 () tuple2!20794)

(assert (=> b!242949 (= lt!378741 (reader!0 (_2!11317 lt!378734) (_2!11317 lt!378736)))))

(assert (=> b!242949 (= lt!378730 (reader!0 thiss!1005 (_2!11317 lt!378736)))))

(assert (=> b!242949 e!168393))

(declare-fun res!202918 () Bool)

(assert (=> b!242949 (=> (not res!202918) (not e!168393))))

(assert (=> b!242949 (= res!202918 (= (bitIndex!0 (size!5839 (buf!6308 (_1!11318 lt!378740))) (currentByte!11680 (_1!11318 lt!378740)) (currentBit!11675 (_1!11318 lt!378740))) (bitIndex!0 (size!5839 (buf!6308 (_1!11318 lt!378744))) (currentByte!11680 (_1!11318 lt!378744)) (currentBit!11675 (_1!11318 lt!378744)))))))

(declare-fun lt!378735 () Unit!17767)

(declare-fun lt!378738 () BitStream!10600)

(declare-fun readBitPrefixLemma!0 (BitStream!10600 BitStream!10600) Unit!17767)

(assert (=> b!242949 (= lt!378735 (readBitPrefixLemma!0 lt!378738 (_2!11317 lt!378736)))))

(assert (=> b!242949 (= lt!378744 (readBitPure!0 (BitStream!10601 (buf!6308 (_2!11317 lt!378736)) (currentByte!11680 thiss!1005) (currentBit!11675 thiss!1005))))))

(assert (=> b!242949 (= lt!378740 (readBitPure!0 lt!378738))))

(assert (=> b!242949 (= lt!378738 (BitStream!10601 (buf!6308 (_2!11317 lt!378734)) (currentByte!11680 thiss!1005) (currentBit!11675 thiss!1005)))))

(assert (=> b!242949 e!168401))

(declare-fun res!202929 () Bool)

(assert (=> b!242949 (=> (not res!202929) (not e!168401))))

(assert (=> b!242949 (= res!202929 (isPrefixOf!0 thiss!1005 (_2!11317 lt!378736)))))

(declare-fun lt!378729 () Unit!17767)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10600 BitStream!10600 BitStream!10600) Unit!17767)

(assert (=> b!242949 (= lt!378729 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11317 lt!378734) (_2!11317 lt!378736)))))

(assert (=> b!242949 e!168395))

(declare-fun res!202920 () Bool)

(assert (=> b!242949 (=> (not res!202920) (not e!168395))))

(assert (=> b!242949 (= res!202920 (= (size!5839 (buf!6308 (_2!11317 lt!378734))) (size!5839 (buf!6308 (_2!11317 lt!378736)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10600 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20790)

(assert (=> b!242949 (= lt!378736 (appendNBitsLoop!0 (_2!11317 lt!378734) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242949 (validate_offset_bits!1 ((_ sign_extend 32) (size!5839 (buf!6308 (_2!11317 lt!378734)))) ((_ sign_extend 32) (currentByte!11680 (_2!11317 lt!378734))) ((_ sign_extend 32) (currentBit!11675 (_2!11317 lt!378734))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378732 () Unit!17767)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10600 BitStream!10600 (_ BitVec 64) (_ BitVec 64)) Unit!17767)

(assert (=> b!242949 (= lt!378732 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11317 lt!378734) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168398 () Bool)

(assert (=> b!242949 e!168398))

(declare-fun res!202921 () Bool)

(assert (=> b!242949 (=> (not res!202921) (not e!168398))))

(assert (=> b!242949 (= res!202921 (= (size!5839 (buf!6308 thiss!1005)) (size!5839 (buf!6308 (_2!11317 lt!378734)))))))

(declare-fun appendBit!0 (BitStream!10600 Bool) tuple2!20790)

(assert (=> b!242949 (= lt!378734 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242950 () Bool)

(assert (=> b!242950 (= e!168398 e!168396)))

(declare-fun res!202917 () Bool)

(assert (=> b!242950 (=> (not res!202917) (not e!168396))))

(declare-fun lt!378733 () (_ BitVec 64))

(assert (=> b!242950 (= res!202917 (= lt!378728 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378733)))))

(assert (=> b!242950 (= lt!378728 (bitIndex!0 (size!5839 (buf!6308 (_2!11317 lt!378734))) (currentByte!11680 (_2!11317 lt!378734)) (currentBit!11675 (_2!11317 lt!378734))))))

(assert (=> b!242950 (= lt!378733 (bitIndex!0 (size!5839 (buf!6308 thiss!1005)) (currentByte!11680 thiss!1005) (currentBit!11675 thiss!1005)))))

(declare-fun b!242951 () Bool)

(declare-fun res!202923 () Bool)

(assert (=> b!242951 (=> (not res!202923) (not e!168394))))

(assert (=> b!242951 (= res!202923 (isPrefixOf!0 (_2!11317 lt!378734) (_2!11317 lt!378736)))))

(assert (= (and start!52610 res!202928) b!242938))

(assert (= (and b!242938 res!202926) b!242942))

(assert (= (and b!242942 res!202927) b!242949))

(assert (= (and b!242949 res!202921) b!242950))

(assert (= (and b!242950 res!202917) b!242947))

(assert (= (and b!242947 res!202922) b!242943))

(assert (= (and b!242943 res!202925) b!242941))

(assert (= (and b!242949 res!202920) b!242940))

(assert (= (and b!242940 res!202924) b!242951))

(assert (= (and b!242951 res!202923) b!242946))

(assert (= (and b!242949 res!202929) b!242945))

(assert (= (and b!242945 res!202919) b!242939))

(assert (= (and b!242949 res!202918) b!242944))

(assert (= start!52610 b!242948))

(declare-fun m!366053 () Bool)

(assert (=> b!242943 m!366053))

(assert (=> b!242943 m!366053))

(declare-fun m!366055 () Bool)

(assert (=> b!242943 m!366055))

(declare-fun m!366057 () Bool)

(assert (=> b!242949 m!366057))

(declare-fun m!366059 () Bool)

(assert (=> b!242949 m!366059))

(declare-fun m!366061 () Bool)

(assert (=> b!242949 m!366061))

(declare-fun m!366063 () Bool)

(assert (=> b!242949 m!366063))

(declare-fun m!366065 () Bool)

(assert (=> b!242949 m!366065))

(declare-fun m!366067 () Bool)

(assert (=> b!242949 m!366067))

(declare-fun m!366069 () Bool)

(assert (=> b!242949 m!366069))

(declare-fun m!366071 () Bool)

(assert (=> b!242949 m!366071))

(declare-fun m!366073 () Bool)

(assert (=> b!242949 m!366073))

(declare-fun m!366075 () Bool)

(assert (=> b!242949 m!366075))

(declare-fun m!366077 () Bool)

(assert (=> b!242949 m!366077))

(declare-fun m!366079 () Bool)

(assert (=> b!242949 m!366079))

(declare-fun m!366081 () Bool)

(assert (=> b!242949 m!366081))

(declare-fun m!366083 () Bool)

(assert (=> b!242949 m!366083))

(declare-fun m!366085 () Bool)

(assert (=> b!242938 m!366085))

(declare-fun m!366087 () Bool)

(assert (=> b!242945 m!366087))

(declare-fun m!366089 () Bool)

(assert (=> start!52610 m!366089))

(declare-fun m!366091 () Bool)

(assert (=> b!242948 m!366091))

(declare-fun m!366093 () Bool)

(assert (=> b!242947 m!366093))

(declare-fun m!366095 () Bool)

(assert (=> b!242950 m!366095))

(declare-fun m!366097 () Bool)

(assert (=> b!242950 m!366097))

(declare-fun m!366099 () Bool)

(assert (=> b!242946 m!366099))

(declare-fun m!366101 () Bool)

(assert (=> b!242946 m!366101))

(declare-fun m!366103 () Bool)

(assert (=> b!242946 m!366103))

(assert (=> b!242946 m!366073))

(declare-fun m!366105 () Bool)

(assert (=> b!242939 m!366105))

(declare-fun m!366107 () Bool)

(assert (=> b!242941 m!366107))

(declare-fun m!366109 () Bool)

(assert (=> b!242951 m!366109))

(declare-fun m!366111 () Bool)

(assert (=> b!242940 m!366111))

(assert (=> b!242940 m!366095))

(push 1)

(assert (not b!242946))

(assert (not b!242943))

(assert (not b!242939))

(assert (not b!242947))

(assert (not start!52610))

(assert (not b!242951))

(assert (not b!242945))

(assert (not b!242938))

(assert (not b!242941))

(assert (not b!242949))

(assert (not b!242940))

(assert (not b!242948))

(assert (not b!242950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

