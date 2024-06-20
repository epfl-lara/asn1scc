; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64952 () Bool)

(assert start!64952)

(declare-fun e!207894 () Bool)

(declare-datatypes ((array!17316 0))(
  ( (array!17317 (arr!8517 (Array (_ BitVec 32) (_ BitVec 8))) (size!7497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13004 0))(
  ( (BitStream!13005 (buf!7563 array!17316) (currentByte!13997 (_ BitVec 32)) (currentBit!13992 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13004)

(declare-fun b!291644 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291644 (= e!207894 (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728)) (bvsub to!474 from!505)))))

(declare-fun b!291645 () Bool)

(declare-fun e!207897 () Bool)

(assert (=> b!291645 (= e!207897 (not e!207894))))

(declare-fun res!240937 () Bool)

(assert (=> b!291645 (=> res!240937 e!207894)))

(declare-fun lt!423848 () Bool)

(declare-datatypes ((tuple2!22936 0))(
  ( (tuple2!22937 (_1!12760 BitStream!13004) (_2!12760 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13004) tuple2!22936)

(assert (=> b!291645 (= res!240937 (not (= lt!423848 (_2!12760 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207896 () Bool)

(assert (=> b!291645 e!207896))

(declare-fun res!240940 () Bool)

(assert (=> b!291645 (=> (not res!240940) (not e!207896))))

(declare-fun lt!423846 () array!17316)

(declare-fun bitAt!0 (array!17316 (_ BitVec 64)) Bool)

(assert (=> b!291645 (= res!240940 (= (bitAt!0 lt!423846 from!505) lt!423848))))

(declare-datatypes ((Unit!20271 0))(
  ( (Unit!20272) )
))
(declare-datatypes ((tuple3!1738 0))(
  ( (tuple3!1739 (_1!12761 Unit!20271) (_2!12761 BitStream!13004) (_3!1292 array!17316)) )
))
(declare-fun lt!423849 () tuple3!1738)

(assert (=> b!291645 (= lt!423848 (bitAt!0 (_3!1292 lt!423849) from!505))))

(declare-fun lt!423845 () Unit!20271)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17316 array!17316 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> b!291645 (= lt!423845 (arrayBitRangesEqImpliesEq!0 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17316)

(declare-fun arrayBitRangesEq!0 (array!17316 array!17316 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291645 (arrayBitRangesEq!0 arr!273 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423851 () Unit!20271)

(declare-fun arrayBitRangesEqTransitive!0 (array!17316 array!17316 array!17316 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> b!291645 (= lt!423851 (arrayBitRangesEqTransitive!0 arr!273 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291645 (arrayBitRangesEq!0 arr!273 lt!423846 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423844 () Unit!20271)

(declare-datatypes ((tuple2!22938 0))(
  ( (tuple2!22939 (_1!12762 Bool) (_2!12762 BitStream!13004)) )
))
(declare-fun lt!423852 () tuple2!22938)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17316 (_ BitVec 64) Bool) Unit!20271)

(assert (=> b!291645 (= lt!423844 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12762 lt!423852)))))

(declare-fun e!207898 () Bool)

(assert (=> b!291645 e!207898))

(declare-fun res!240938 () Bool)

(assert (=> b!291645 (=> (not res!240938) (not e!207898))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291645 (= res!240938 (= (bvsub (bvadd (bitIndex!0 (size!7497 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728) (currentBit!13992 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7497 (buf!7563 (_2!12761 lt!423849))) (currentByte!13997 (_2!12761 lt!423849)) (currentBit!13992 (_2!12761 lt!423849)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13004 (_ BitVec 64) array!17316 (_ BitVec 64) (_ BitVec 64)) tuple3!1738)

(assert (=> b!291645 (= lt!423849 (readBitsLoop!0 (_2!12762 lt!423852) nBits!523 lt!423846 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291645 (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12762 lt!423852)))) ((_ sign_extend 32) (currentByte!13997 (_2!12762 lt!423852))) ((_ sign_extend 32) (currentBit!13992 (_2!12762 lt!423852))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423847 () Unit!20271)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13004 BitStream!13004 (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> b!291645 (= lt!423847 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12762 lt!423852) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423850 () (_ BitVec 32))

(declare-fun lt!423843 () (_ BitVec 32))

(assert (=> b!291645 (= lt!423846 (array!17317 (store (arr!8517 arr!273) lt!423843 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8517 arr!273) lt!423843)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423850)))) ((_ sign_extend 24) (ite (_1!12762 lt!423852) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423850) #b00000000))))) (size!7497 arr!273)))))

(assert (=> b!291645 (= lt!423850 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291645 (= lt!423843 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13004) tuple2!22938)

(assert (=> b!291645 (= lt!423852 (readBit!0 thiss!1728))))

(declare-fun b!291646 () Bool)

(assert (=> b!291646 (= e!207896 (= lt!423848 (_1!12762 lt!423852)))))

(declare-fun b!291647 () Bool)

(declare-fun e!207900 () Bool)

(declare-fun array_inv!7109 (array!17316) Bool)

(assert (=> b!291647 (= e!207900 (array_inv!7109 (buf!7563 thiss!1728)))))

(declare-fun res!240936 () Bool)

(assert (=> start!64952 (=> (not res!240936) (not e!207897))))

(assert (=> start!64952 (= res!240936 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7497 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64952 e!207897))

(declare-fun inv!12 (BitStream!13004) Bool)

(assert (=> start!64952 (and (inv!12 thiss!1728) e!207900)))

(assert (=> start!64952 true))

(assert (=> start!64952 (array_inv!7109 arr!273)))

(declare-fun b!291648 () Bool)

(declare-fun res!240939 () Bool)

(assert (=> b!291648 (=> (not res!240939) (not e!207897))))

(assert (=> b!291648 (= res!240939 (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291649 () Bool)

(declare-fun res!240935 () Bool)

(assert (=> b!291649 (=> res!240935 e!207894)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291649 (= res!240935 (not (invariant!0 (currentBit!13992 (_2!12761 lt!423849)) (currentByte!13997 (_2!12761 lt!423849)) (size!7497 (buf!7563 (_2!12761 lt!423849))))))))

(declare-fun b!291650 () Bool)

(assert (=> b!291650 (= e!207898 (and (= (buf!7563 thiss!1728) (buf!7563 (_2!12761 lt!423849))) (= (size!7497 arr!273) (size!7497 (_3!1292 lt!423849)))))))

(declare-fun b!291651 () Bool)

(declare-fun res!240941 () Bool)

(assert (=> b!291651 (=> (not res!240941) (not e!207897))))

(assert (=> b!291651 (= res!240941 (bvslt from!505 to!474))))

(assert (= (and start!64952 res!240936) b!291648))

(assert (= (and b!291648 res!240939) b!291651))

(assert (= (and b!291651 res!240941) b!291645))

(assert (= (and b!291645 res!240938) b!291650))

(assert (= (and b!291645 res!240940) b!291646))

(assert (= (and b!291645 (not res!240937)) b!291649))

(assert (= (and b!291649 (not res!240935)) b!291644))

(assert (= start!64952 b!291647))

(declare-fun m!426879 () Bool)

(assert (=> b!291647 m!426879))

(declare-fun m!426881 () Bool)

(assert (=> b!291644 m!426881))

(declare-fun m!426883 () Bool)

(assert (=> start!64952 m!426883))

(declare-fun m!426885 () Bool)

(assert (=> start!64952 m!426885))

(declare-fun m!426887 () Bool)

(assert (=> b!291645 m!426887))

(declare-fun m!426889 () Bool)

(assert (=> b!291645 m!426889))

(declare-fun m!426891 () Bool)

(assert (=> b!291645 m!426891))

(declare-fun m!426893 () Bool)

(assert (=> b!291645 m!426893))

(declare-fun m!426895 () Bool)

(assert (=> b!291645 m!426895))

(declare-fun m!426897 () Bool)

(assert (=> b!291645 m!426897))

(declare-fun m!426899 () Bool)

(assert (=> b!291645 m!426899))

(declare-fun m!426901 () Bool)

(assert (=> b!291645 m!426901))

(declare-fun m!426903 () Bool)

(assert (=> b!291645 m!426903))

(declare-fun m!426905 () Bool)

(assert (=> b!291645 m!426905))

(declare-fun m!426907 () Bool)

(assert (=> b!291645 m!426907))

(declare-fun m!426909 () Bool)

(assert (=> b!291645 m!426909))

(declare-fun m!426911 () Bool)

(assert (=> b!291645 m!426911))

(declare-fun m!426913 () Bool)

(assert (=> b!291645 m!426913))

(declare-fun m!426915 () Bool)

(assert (=> b!291645 m!426915))

(declare-fun m!426917 () Bool)

(assert (=> b!291645 m!426917))

(declare-fun m!426919 () Bool)

(assert (=> b!291645 m!426919))

(declare-fun m!426921 () Bool)

(assert (=> b!291649 m!426921))

(declare-fun m!426923 () Bool)

(assert (=> b!291648 m!426923))

(push 1)

(assert (not b!291647))

(assert (not b!291645))

(assert (not b!291649))

(assert (not b!291648))

(assert (not start!64952))

(assert (not b!291644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98708 () Bool)

(assert (=> d!98708 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13992 thiss!1728) (currentByte!13997 thiss!1728) (size!7497 (buf!7563 thiss!1728))))))

(declare-fun bs!25158 () Bool)

(assert (= bs!25158 d!98708))

(declare-fun m!426945 () Bool)

(assert (=> bs!25158 m!426945))

(assert (=> start!64952 d!98708))

(declare-fun d!98710 () Bool)

(assert (=> d!98710 (= (array_inv!7109 arr!273) (bvsge (size!7497 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64952 d!98710))

(declare-fun d!98712 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98712 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25159 () Bool)

(assert (= bs!25159 d!98712))

(declare-fun m!426947 () Bool)

(assert (=> bs!25159 m!426947))

(assert (=> b!291644 d!98712))

(declare-fun b!291747 () Bool)

(declare-fun res!241019 () Bool)

(declare-fun e!207961 () Bool)

(assert (=> b!291747 (=> (not res!241019) (not e!207961))))

(declare-fun lt!424105 () tuple3!1738)

(assert (=> b!291747 (= res!241019 (arrayBitRangesEq!0 lt!423846 (_3!1292 lt!424105) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!291748 () Bool)

(declare-datatypes ((List!963 0))(
  ( (Nil!960) (Cons!959 (h!1078 Bool) (t!1848 List!963)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13004 array!17316 (_ BitVec 64) (_ BitVec 64)) List!963)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13004 BitStream!13004 (_ BitVec 64)) List!963)

(assert (=> b!291748 (= e!207961 (= (byteArrayBitContentToList!0 (_2!12761 lt!424105) (_3!1292 lt!424105) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12761 lt!424105) (_2!12762 lt!423852) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291748 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291748 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291749 () Bool)

(declare-fun res!241020 () Bool)

(assert (=> b!291749 (=> (not res!241020) (not e!207961))))

(assert (=> b!291749 (= res!241020 (invariant!0 (currentBit!13992 (_2!12761 lt!424105)) (currentByte!13997 (_2!12761 lt!424105)) (size!7497 (buf!7563 (_2!12761 lt!424105)))))))

(declare-fun b!291750 () Bool)

(declare-fun res!241022 () Bool)

(assert (=> b!291750 (=> (not res!241022) (not e!207961))))

(declare-fun e!207962 () Bool)

(assert (=> b!291750 (= res!241022 e!207962)))

(declare-fun res!241023 () Bool)

(assert (=> b!291750 (=> res!241023 e!207962)))

(assert (=> b!291750 (= res!241023 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!291751 () Bool)

(assert (=> b!291751 (= e!207962 (= (bitAt!0 (_3!1292 lt!424105) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12760 (readBitPure!0 (_2!12762 lt!423852)))))))

(declare-fun d!98714 () Bool)

(assert (=> d!98714 e!207961))

(declare-fun res!241018 () Bool)

(assert (=> d!98714 (=> (not res!241018) (not e!207961))))

(declare-fun lt!424121 () (_ BitVec 64))

(assert (=> d!98714 (= res!241018 (= (bvsub lt!424121 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7497 (buf!7563 (_2!12761 lt!424105))) (currentByte!13997 (_2!12761 lt!424105)) (currentBit!13992 (_2!12761 lt!424105)))))))

(assert (=> d!98714 (or (= (bvand lt!424121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424121 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424131 () (_ BitVec 64))

(assert (=> d!98714 (= lt!424121 (bvadd lt!424131 to!474))))

(assert (=> d!98714 (or (not (= (bvand lt!424131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!424131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!424131 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98714 (= lt!424131 (bitIndex!0 (size!7497 (buf!7563 (_2!12762 lt!423852))) (currentByte!13997 (_2!12762 lt!423852)) (currentBit!13992 (_2!12762 lt!423852))))))

(declare-fun e!207963 () tuple3!1738)

(assert (=> d!98714 (= lt!424105 e!207963)))

(declare-fun c!13333 () Bool)

(assert (=> d!98714 (= c!13333 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98714 (= (readBitsLoop!0 (_2!12762 lt!423852) nBits!523 lt!423846 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!424105)))

(declare-fun b!291752 () Bool)

(declare-fun lt!424120 () Unit!20271)

(assert (=> b!291752 (= e!207963 (tuple3!1739 lt!424120 (_2!12762 lt!423852) lt!423846))))

(declare-fun lt!424109 () Unit!20271)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17316) Unit!20271)

(assert (=> b!291752 (= lt!424109 (arrayBitRangesEqReflexiveLemma!0 lt!423846))))

(declare-fun call!4896 () Bool)

(assert (=> b!291752 call!4896))

(declare-fun lt!424135 () Unit!20271)

(assert (=> b!291752 (= lt!424135 lt!424109)))

(declare-fun lt!424108 () array!17316)

(assert (=> b!291752 (= lt!424108 lt!423846)))

(declare-fun lt!424132 () array!17316)

(assert (=> b!291752 (= lt!424132 lt!423846)))

(declare-fun lt!424104 () (_ BitVec 64))

(assert (=> b!291752 (= lt!424104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424116 () (_ BitVec 64))

(assert (=> b!291752 (= lt!424116 ((_ sign_extend 32) (size!7497 lt!423846)))))

(declare-fun lt!424114 () (_ BitVec 64))

(assert (=> b!291752 (= lt!424114 (bvmul lt!424116 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!424128 () (_ BitVec 64))

(assert (=> b!291752 (= lt!424128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424125 () (_ BitVec 64))

(assert (=> b!291752 (= lt!424125 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17316 array!17316 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> b!291752 (= lt!424120 (arrayBitRangesEqSlicedLemma!0 lt!424108 lt!424132 lt!424104 lt!424114 lt!424128 lt!424125))))

(declare-fun call!4895 () Bool)

(assert (=> b!291752 call!4895))

(declare-fun b!291753 () Bool)

(declare-fun res!241021 () Bool)

(assert (=> b!291753 (=> (not res!241021) (not e!207961))))

(assert (=> b!291753 (= res!241021 (and (= (buf!7563 (_2!12762 lt!423852)) (buf!7563 (_2!12761 lt!424105))) (= (size!7497 lt!423846) (size!7497 (_3!1292 lt!424105)))))))

(declare-fun bm!4892 () Bool)

(declare-fun lt!424117 () tuple3!1738)

(assert (=> bm!4892 (= call!4896 (arrayBitRangesEq!0 lt!423846 (ite c!13333 (_3!1292 lt!424117) lt!423846) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7497 lt!423846)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!207960 () Bool)

(declare-fun b!291754 () Bool)

(assert (=> b!291754 (= e!207960 (and (= (buf!7563 (_2!12762 lt!423852)) (buf!7563 (_2!12761 lt!424117))) (= (size!7497 lt!423846) (size!7497 (_3!1292 lt!424117)))))))

(declare-fun b!291755 () Bool)

(declare-fun lt!424103 () Unit!20271)

(assert (=> b!291755 (= e!207963 (tuple3!1739 lt!424103 (_2!12761 lt!424117) (_3!1292 lt!424117)))))

(declare-fun lt!424126 () tuple2!22938)

(assert (=> b!291755 (= lt!424126 (readBit!0 (_2!12762 lt!423852)))))

(declare-fun lt!424124 () (_ BitVec 32))

(assert (=> b!291755 (= lt!424124 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424134 () (_ BitVec 32))

(assert (=> b!291755 (= lt!424134 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424118 () array!17316)

(assert (=> b!291755 (= lt!424118 (array!17317 (store (arr!8517 lt!423846) lt!424124 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8517 lt!423846) lt!424124)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424134)))) ((_ sign_extend 24) (ite (_1!12762 lt!424126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424134) #b00000000))))) (size!7497 lt!423846)))))

(declare-fun lt!424102 () (_ BitVec 64))

(assert (=> b!291755 (= lt!424102 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!424123 () (_ BitVec 64))

(assert (=> b!291755 (= lt!424123 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!424115 () Unit!20271)

(assert (=> b!291755 (= lt!424115 (validateOffsetBitsIneqLemma!0 (_2!12762 lt!423852) (_2!12762 lt!424126) lt!424102 lt!424123))))

(assert (=> b!291755 (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12762 lt!424126)))) ((_ sign_extend 32) (currentByte!13997 (_2!12762 lt!424126))) ((_ sign_extend 32) (currentBit!13992 (_2!12762 lt!424126))) (bvsub lt!424102 lt!424123))))

(declare-fun lt!424113 () Unit!20271)

(assert (=> b!291755 (= lt!424113 lt!424115)))

(assert (=> b!291755 (= lt!424117 (readBitsLoop!0 (_2!12762 lt!424126) nBits!523 lt!424118 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!241024 () Bool)

(assert (=> b!291755 (= res!241024 (= (bvsub (bvadd (bitIndex!0 (size!7497 (buf!7563 (_2!12762 lt!423852))) (currentByte!13997 (_2!12762 lt!423852)) (currentBit!13992 (_2!12762 lt!423852))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7497 (buf!7563 (_2!12761 lt!424117))) (currentByte!13997 (_2!12761 lt!424117)) (currentBit!13992 (_2!12761 lt!424117)))))))

(assert (=> b!291755 (=> (not res!241024) (not e!207960))))

(assert (=> b!291755 e!207960))

(declare-fun lt!424112 () Unit!20271)

(declare-fun Unit!20277 () Unit!20271)

(assert (=> b!291755 (= lt!424112 Unit!20277)))

(declare-fun lt!424110 () (_ BitVec 32))

(assert (=> b!291755 (= lt!424110 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424127 () (_ BitVec 32))

(assert (=> b!291755 (= lt!424127 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424130 () Unit!20271)

(assert (=> b!291755 (= lt!424130 (arrayBitRangesUpdatedAtLemma!0 lt!423846 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12762 lt!424126)))))

(assert (=> b!291755 call!4895))

(declare-fun lt!424122 () Unit!20271)

(assert (=> b!291755 (= lt!424122 lt!424130)))

(declare-fun lt!424129 () (_ BitVec 64))

(assert (=> b!291755 (= lt!424129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424119 () Unit!20271)

(assert (=> b!291755 (= lt!424119 (arrayBitRangesEqTransitive!0 lt!423846 lt!424118 (_3!1292 lt!424117) lt!424129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291755 (arrayBitRangesEq!0 lt!423846 (_3!1292 lt!424117) lt!424129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!424133 () Unit!20271)

(assert (=> b!291755 (= lt!424133 lt!424119)))

(assert (=> b!291755 call!4896))

(declare-fun lt!424107 () Unit!20271)

(declare-fun Unit!20278 () Unit!20271)

(assert (=> b!291755 (= lt!424107 Unit!20278)))

(declare-fun lt!424111 () Unit!20271)

(assert (=> b!291755 (= lt!424111 (arrayBitRangesEqImpliesEq!0 lt!424118 (_3!1292 lt!424117) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291755 (= (bitAt!0 lt!424118 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1292 lt!424117) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!424106 () Unit!20271)

(assert (=> b!291755 (= lt!424106 lt!424111)))

(declare-fun lt!424136 () Unit!20271)

(declare-fun Unit!20279 () Unit!20271)

(assert (=> b!291755 (= lt!424136 Unit!20279)))

(declare-fun lt!424137 () Bool)

(assert (=> b!291755 (= lt!424137 (= (bitAt!0 (_3!1292 lt!424117) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12762 lt!424126)))))

(declare-fun Unit!20280 () Unit!20271)

(assert (=> b!291755 (= lt!424103 Unit!20280)))

(assert (=> b!291755 lt!424137))

(declare-fun bm!4893 () Bool)

(assert (=> bm!4893 (= call!4895 (arrayBitRangesEq!0 (ite c!13333 lt!423846 lt!424108) (ite c!13333 (array!17317 (store (arr!8517 lt!423846) lt!424110 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8517 lt!423846) lt!424110)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424127)))) ((_ sign_extend 24) (ite (_1!12762 lt!424126) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424127) #b00000000))))) (size!7497 lt!423846)) lt!424132) (ite c!13333 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424128) (ite c!13333 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!424125)))))

(assert (= (and d!98714 c!13333) b!291755))

(assert (= (and d!98714 (not c!13333)) b!291752))

(assert (= (and b!291755 res!241024) b!291754))

(assert (= (or b!291755 b!291752) bm!4893))

(assert (= (or b!291755 b!291752) bm!4892))

(assert (= (and d!98714 res!241018) b!291753))

(assert (= (and b!291753 res!241021) b!291747))

(assert (= (and b!291747 res!241019) b!291750))

(assert (= (and b!291750 (not res!241023)) b!291751))

(assert (= (and b!291750 res!241022) b!291749))

(assert (= (and b!291749 res!241020) b!291748))

(declare-fun m!427053 () Bool)

(assert (=> bm!4892 m!427053))

(declare-fun m!427055 () Bool)

(assert (=> bm!4893 m!427055))

(declare-fun m!427057 () Bool)

(assert (=> bm!4893 m!427057))

(declare-fun m!427059 () Bool)

(assert (=> bm!4893 m!427059))

(declare-fun m!427061 () Bool)

(assert (=> bm!4893 m!427061))

(declare-fun m!427063 () Bool)

(assert (=> b!291748 m!427063))

(declare-fun m!427065 () Bool)

(assert (=> b!291748 m!427065))

(declare-fun m!427067 () Bool)

(assert (=> d!98714 m!427067))

(declare-fun m!427069 () Bool)

(assert (=> d!98714 m!427069))

(declare-fun m!427071 () Bool)

(assert (=> b!291755 m!427071))

(declare-fun m!427073 () Bool)

(assert (=> b!291755 m!427073))

(declare-fun m!427075 () Bool)

(assert (=> b!291755 m!427075))

(declare-fun m!427077 () Bool)

(assert (=> b!291755 m!427077))

(declare-fun m!427079 () Bool)

(assert (=> b!291755 m!427079))

(declare-fun m!427081 () Bool)

(assert (=> b!291755 m!427081))

(declare-fun m!427083 () Bool)

(assert (=> b!291755 m!427083))

(assert (=> b!291755 m!427069))

(declare-fun m!427085 () Bool)

(assert (=> b!291755 m!427085))

(declare-fun m!427087 () Bool)

(assert (=> b!291755 m!427087))

(declare-fun m!427089 () Bool)

(assert (=> b!291755 m!427089))

(declare-fun m!427091 () Bool)

(assert (=> b!291755 m!427091))

(declare-fun m!427093 () Bool)

(assert (=> b!291755 m!427093))

(declare-fun m!427095 () Bool)

(assert (=> b!291755 m!427095))

(declare-fun m!427097 () Bool)

(assert (=> b!291755 m!427097))

(declare-fun m!427099 () Bool)

(assert (=> b!291749 m!427099))

(declare-fun m!427101 () Bool)

(assert (=> b!291752 m!427101))

(declare-fun m!427103 () Bool)

(assert (=> b!291752 m!427103))

(declare-fun m!427105 () Bool)

(assert (=> b!291747 m!427105))

(declare-fun m!427107 () Bool)

(assert (=> b!291751 m!427107))

(declare-fun m!427109 () Bool)

(assert (=> b!291751 m!427109))

(assert (=> b!291645 d!98714))

(declare-fun b!291770 () Bool)

(declare-fun e!207981 () Bool)

(declare-fun e!207984 () Bool)

(assert (=> b!291770 (= e!207981 e!207984)))

(declare-fun c!13336 () Bool)

(declare-datatypes ((tuple4!848 0))(
  ( (tuple4!849 (_1!12765 (_ BitVec 32)) (_2!12765 (_ BitVec 32)) (_3!1294 (_ BitVec 32)) (_4!424 (_ BitVec 32))) )
))
(declare-fun lt!424149 () tuple4!848)

(assert (=> b!291770 (= c!13336 (= (_3!1294 lt!424149) (_4!424 lt!424149)))))

(declare-fun d!98736 () Bool)

(declare-fun res!241035 () Bool)

(declare-fun e!207983 () Bool)

(assert (=> d!98736 (=> res!241035 e!207983)))

(assert (=> d!98736 (= res!241035 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98736 (= (arrayBitRangesEq!0 arr!273 lt!423846 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207983)))

(declare-fun b!291771 () Bool)

(declare-fun call!4899 () Bool)

(assert (=> b!291771 (= e!207984 call!4899)))

(declare-fun b!291772 () Bool)

(declare-fun res!241038 () Bool)

(declare-fun lt!424147 () (_ BitVec 32))

(assert (=> b!291772 (= res!241038 (= lt!424147 #b00000000000000000000000000000000))))

(declare-fun e!207980 () Bool)

(assert (=> b!291772 (=> res!241038 e!207980)))

(declare-fun e!207985 () Bool)

(assert (=> b!291772 (= e!207985 e!207980)))

(declare-fun b!291773 () Bool)

(assert (=> b!291773 (= e!207980 call!4899)))

(declare-fun b!291774 () Bool)

(declare-fun e!207982 () Bool)

(declare-fun arrayRangesEq!1482 (array!17316 array!17316 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291774 (= e!207982 (arrayRangesEq!1482 arr!273 lt!423846 (_1!12765 lt!424149) (_2!12765 lt!424149)))))

(declare-fun bm!4896 () Bool)

(declare-fun lt!424148 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4896 (= call!4899 (byteRangesEq!0 (ite c!13336 (select (arr!8517 arr!273) (_3!1294 lt!424149)) (select (arr!8517 arr!273) (_4!424 lt!424149))) (ite c!13336 (select (arr!8517 lt!423846) (_3!1294 lt!424149)) (select (arr!8517 lt!423846) (_4!424 lt!424149))) (ite c!13336 lt!424148 #b00000000000000000000000000000000) lt!424147))))

(declare-fun b!291775 () Bool)

(assert (=> b!291775 (= e!207983 e!207981)))

(declare-fun res!241037 () Bool)

(assert (=> b!291775 (=> (not res!241037) (not e!207981))))

(assert (=> b!291775 (= res!241037 e!207982)))

(declare-fun res!241036 () Bool)

(assert (=> b!291775 (=> res!241036 e!207982)))

(assert (=> b!291775 (= res!241036 (bvsge (_1!12765 lt!424149) (_2!12765 lt!424149)))))

(assert (=> b!291775 (= lt!424147 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291775 (= lt!424148 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!848)

(assert (=> b!291775 (= lt!424149 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291776 () Bool)

(assert (=> b!291776 (= e!207984 e!207985)))

(declare-fun res!241039 () Bool)

(assert (=> b!291776 (= res!241039 (byteRangesEq!0 (select (arr!8517 arr!273) (_3!1294 lt!424149)) (select (arr!8517 lt!423846) (_3!1294 lt!424149)) lt!424148 #b00000000000000000000000000001000))))

(assert (=> b!291776 (=> (not res!241039) (not e!207985))))

(assert (= (and d!98736 (not res!241035)) b!291775))

(assert (= (and b!291775 (not res!241036)) b!291774))

(assert (= (and b!291775 res!241037) b!291770))

(assert (= (and b!291770 c!13336) b!291771))

(assert (= (and b!291770 (not c!13336)) b!291776))

(assert (= (and b!291776 res!241039) b!291772))

(assert (= (and b!291772 (not res!241038)) b!291773))

(assert (= (or b!291771 b!291773) bm!4896))

(declare-fun m!427111 () Bool)

(assert (=> b!291774 m!427111))

(declare-fun m!427113 () Bool)

(assert (=> bm!4896 m!427113))

(declare-fun m!427115 () Bool)

(assert (=> bm!4896 m!427115))

(declare-fun m!427117 () Bool)

(assert (=> bm!4896 m!427117))

(declare-fun m!427119 () Bool)

(assert (=> bm!4896 m!427119))

(declare-fun m!427121 () Bool)

(assert (=> bm!4896 m!427121))

(declare-fun m!427123 () Bool)

(assert (=> b!291775 m!427123))

(assert (=> b!291776 m!427121))

(assert (=> b!291776 m!427117))

(assert (=> b!291776 m!427121))

(assert (=> b!291776 m!427117))

(declare-fun m!427125 () Bool)

(assert (=> b!291776 m!427125))

(assert (=> b!291645 d!98736))

(declare-fun d!98738 () Bool)

(assert (=> d!98738 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12762 lt!423852)))) ((_ sign_extend 32) (currentByte!13997 (_2!12762 lt!423852))) ((_ sign_extend 32) (currentBit!13992 (_2!12762 lt!423852))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12762 lt!423852)))) ((_ sign_extend 32) (currentByte!13997 (_2!12762 lt!423852))) ((_ sign_extend 32) (currentBit!13992 (_2!12762 lt!423852)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25164 () Bool)

(assert (= bs!25164 d!98738))

(declare-fun m!427127 () Bool)

(assert (=> bs!25164 m!427127))

(assert (=> b!291645 d!98738))

(declare-fun d!98740 () Bool)

(assert (=> d!98740 (= (bitAt!0 (_3!1292 lt!423849) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (_3!1292 lt!423849)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25165 () Bool)

(assert (= bs!25165 d!98740))

(declare-fun m!427129 () Bool)

(assert (=> bs!25165 m!427129))

(declare-fun m!427131 () Bool)

(assert (=> bs!25165 m!427131))

(assert (=> b!291645 d!98740))

(declare-fun d!98742 () Bool)

(assert (=> d!98742 (= (bitAt!0 lt!423846 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8517 lt!423846) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25166 () Bool)

(assert (= bs!25166 d!98742))

(declare-fun m!427133 () Bool)

(assert (=> bs!25166 m!427133))

(assert (=> bs!25166 m!427131))

(assert (=> b!291645 d!98742))

(declare-fun d!98744 () Bool)

(declare-fun e!207991 () Bool)

(assert (=> d!98744 e!207991))

(declare-fun res!241045 () Bool)

(assert (=> d!98744 (=> (not res!241045) (not e!207991))))

(declare-fun lt!424182 () (_ BitVec 32))

(assert (=> d!98744 (= res!241045 (and (bvsge lt!424182 #b00000000000000000000000000000000) (bvslt lt!424182 (size!7497 arr!273))))))

(declare-fun lt!424181 () (_ BitVec 8))

(declare-fun lt!424179 () (_ BitVec 32))

(declare-fun lt!424180 () Unit!20271)

(declare-fun choose!53 (array!17316 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20271)

(assert (=> d!98744 (= lt!424180 (choose!53 arr!273 from!505 (_1!12762 lt!423852) lt!424182 lt!424179 lt!424181))))

(assert (=> d!98744 (= lt!424181 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8517 arr!273) lt!424182)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424179)))) ((_ sign_extend 24) (ite (_1!12762 lt!423852) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424179) #b00000000)))))))

(assert (=> d!98744 (= lt!424179 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98744 (= lt!424182 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98744 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12762 lt!423852)) lt!424180)))

(declare-fun b!291783 () Bool)

(assert (=> b!291783 (= e!207991 (arrayBitRangesEq!0 arr!273 (array!17317 (store (arr!8517 arr!273) lt!424182 lt!424181) (size!7497 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98744 res!241045) b!291783))

(declare-fun m!427145 () Bool)

(assert (=> d!98744 m!427145))

(declare-fun m!427147 () Bool)

(assert (=> d!98744 m!427147))

(declare-fun m!427149 () Bool)

(assert (=> d!98744 m!427149))

(declare-fun m!427151 () Bool)

(assert (=> b!291783 m!427151))

(declare-fun m!427153 () Bool)

(assert (=> b!291783 m!427153))

(assert (=> b!291645 d!98744))

(declare-fun d!98748 () Bool)

(declare-fun e!207999 () Bool)

(assert (=> d!98748 e!207999))

(declare-fun res!241053 () Bool)

(assert (=> d!98748 (=> (not res!241053) (not e!207999))))

(declare-fun lt!424217 () (_ BitVec 64))

(declare-fun lt!424215 () (_ BitVec 64))

(declare-fun lt!424216 () (_ BitVec 64))

(assert (=> d!98748 (= res!241053 (= lt!424216 (bvsub lt!424217 lt!424215)))))

(assert (=> d!98748 (or (= (bvand lt!424217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424217 lt!424215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98748 (= lt!424215 (remainingBits!0 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12761 lt!423849)))) ((_ sign_extend 32) (currentByte!13997 (_2!12761 lt!423849))) ((_ sign_extend 32) (currentBit!13992 (_2!12761 lt!423849)))))))

(declare-fun lt!424220 () (_ BitVec 64))

(declare-fun lt!424219 () (_ BitVec 64))

(assert (=> d!98748 (= lt!424217 (bvmul lt!424220 lt!424219))))

(assert (=> d!98748 (or (= lt!424220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!424219 (bvsdiv (bvmul lt!424220 lt!424219) lt!424220)))))

(assert (=> d!98748 (= lt!424219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98748 (= lt!424220 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12761 lt!423849)))))))

(assert (=> d!98748 (= lt!424216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13997 (_2!12761 lt!423849))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13992 (_2!12761 lt!423849)))))))

(assert (=> d!98748 (invariant!0 (currentBit!13992 (_2!12761 lt!423849)) (currentByte!13997 (_2!12761 lt!423849)) (size!7497 (buf!7563 (_2!12761 lt!423849))))))

(assert (=> d!98748 (= (bitIndex!0 (size!7497 (buf!7563 (_2!12761 lt!423849))) (currentByte!13997 (_2!12761 lt!423849)) (currentBit!13992 (_2!12761 lt!423849))) lt!424216)))

(declare-fun b!291796 () Bool)

(declare-fun res!241054 () Bool)

(assert (=> b!291796 (=> (not res!241054) (not e!207999))))

(assert (=> b!291796 (= res!241054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!424216))))

(declare-fun b!291797 () Bool)

(declare-fun lt!424218 () (_ BitVec 64))

(assert (=> b!291797 (= e!207999 (bvsle lt!424216 (bvmul lt!424218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291797 (or (= lt!424218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424218)))))

(assert (=> b!291797 (= lt!424218 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12761 lt!423849)))))))

(assert (= (and d!98748 res!241053) b!291796))

(assert (= (and b!291796 res!241054) b!291797))

(declare-fun m!427165 () Bool)

(assert (=> d!98748 m!427165))

(assert (=> d!98748 m!426921))

(assert (=> b!291645 d!98748))

(declare-fun d!98752 () Bool)

(declare-fun lt!424271 () tuple2!22938)

(assert (=> d!98752 (= lt!424271 (readBit!0 thiss!1728))))

(assert (=> d!98752 (= (readBitPure!0 thiss!1728) (tuple2!22937 (_2!12762 lt!424271) (_1!12762 lt!424271)))))

(declare-fun bs!25167 () Bool)

(assert (= bs!25167 d!98752))

(assert (=> bs!25167 m!426905))

(assert (=> b!291645 d!98752))

(declare-fun d!98754 () Bool)

(declare-fun e!208002 () Bool)

(assert (=> d!98754 e!208002))

(declare-fun res!241057 () Bool)

(assert (=> d!98754 (=> (not res!241057) (not e!208002))))

(declare-fun lt!424282 () (_ BitVec 64))

(declare-fun lt!424286 () (_ BitVec 64))

(declare-fun lt!424285 () (_ BitVec 64))

(assert (=> d!98754 (= res!241057 (= lt!424285 (bvsub lt!424286 lt!424282)))))

(assert (=> d!98754 (or (= (bvand lt!424286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424286 lt!424282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98754 (= lt!424282 (remainingBits!0 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728))))))

(declare-fun lt!424289 () (_ BitVec 64))

(declare-fun lt!424288 () (_ BitVec 64))

(assert (=> d!98754 (= lt!424286 (bvmul lt!424289 lt!424288))))

(assert (=> d!98754 (or (= lt!424289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!424288 (bvsdiv (bvmul lt!424289 lt!424288) lt!424289)))))

(assert (=> d!98754 (= lt!424288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98754 (= lt!424289 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))))))

(assert (=> d!98754 (= lt!424285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13997 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13992 thiss!1728))))))

(assert (=> d!98754 (invariant!0 (currentBit!13992 thiss!1728) (currentByte!13997 thiss!1728) (size!7497 (buf!7563 thiss!1728)))))

(assert (=> d!98754 (= (bitIndex!0 (size!7497 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728) (currentBit!13992 thiss!1728)) lt!424285)))

(declare-fun b!291800 () Bool)

(declare-fun res!241058 () Bool)

(assert (=> b!291800 (=> (not res!241058) (not e!208002))))

(assert (=> b!291800 (= res!241058 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!424285))))

(declare-fun b!291801 () Bool)

(declare-fun lt!424287 () (_ BitVec 64))

(assert (=> b!291801 (= e!208002 (bvsle lt!424285 (bvmul lt!424287 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291801 (or (= lt!424287 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424287 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424287)))))

(assert (=> b!291801 (= lt!424287 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))))))

(assert (= (and d!98754 res!241057) b!291800))

(assert (= (and b!291800 res!241058) b!291801))

(assert (=> d!98754 m!426947))

(assert (=> d!98754 m!426945))

(assert (=> b!291645 d!98754))

(declare-fun d!98756 () Bool)

(assert (=> d!98756 (= (bitAt!0 lt!423846 from!505) (bitAt!0 (_3!1292 lt!423849) from!505))))

(declare-fun lt!424292 () Unit!20271)

(declare-fun choose!31 (array!17316 array!17316 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> d!98756 (= lt!424292 (choose!31 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98756 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98756 (= (arrayBitRangesEqImpliesEq!0 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424292)))

(declare-fun bs!25168 () Bool)

(assert (= bs!25168 d!98756))

(assert (=> bs!25168 m!426913))

(assert (=> bs!25168 m!426903))

(declare-fun m!427167 () Bool)

(assert (=> bs!25168 m!427167))

(assert (=> b!291645 d!98756))

(declare-fun d!98758 () Bool)

(declare-fun e!208021 () Bool)

(assert (=> d!98758 e!208021))

(declare-fun res!241083 () Bool)

(assert (=> d!98758 (=> (not res!241083) (not e!208021))))

(assert (=> d!98758 (= res!241083 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424305 () Unit!20271)

(declare-fun choose!27 (BitStream!13004 BitStream!13004 (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> d!98758 (= lt!424305 (choose!27 thiss!1728 (_2!12762 lt!423852) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98758 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98758 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12762 lt!423852) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!424305)))

(declare-fun b!291830 () Bool)

(assert (=> b!291830 (= e!208021 (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 (_2!12762 lt!423852)))) ((_ sign_extend 32) (currentByte!13997 (_2!12762 lt!423852))) ((_ sign_extend 32) (currentBit!13992 (_2!12762 lt!423852))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98758 res!241083) b!291830))

(declare-fun m!427169 () Bool)

(assert (=> d!98758 m!427169))

(assert (=> b!291830 m!426909))

(assert (=> b!291645 d!98758))

(declare-fun d!98760 () Bool)

(declare-fun e!208046 () Bool)

(assert (=> d!98760 e!208046))

(declare-fun res!241107 () Bool)

(assert (=> d!98760 (=> (not res!241107) (not e!208046))))

(declare-datatypes ((tuple2!22944 0))(
  ( (tuple2!22945 (_1!12768 Unit!20271) (_2!12768 BitStream!13004)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13004) tuple2!22944)

(assert (=> d!98760 (= res!241107 (= (buf!7563 (_2!12768 (increaseBitIndex!0 thiss!1728))) (buf!7563 thiss!1728)))))

(declare-fun lt!424385 () Bool)

(assert (=> d!98760 (= lt!424385 (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13992 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424384 () tuple2!22938)

(assert (=> d!98760 (= lt!424384 (tuple2!22939 (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13992 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12768 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98760 (validate_offset_bit!0 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728)))))

(assert (=> d!98760 (= (readBit!0 thiss!1728) lt!424384)))

(declare-fun lt!424389 () (_ BitVec 64))

(declare-fun b!291860 () Bool)

(declare-fun lt!424388 () (_ BitVec 64))

(assert (=> b!291860 (= e!208046 (= (bitIndex!0 (size!7497 (buf!7563 (_2!12768 (increaseBitIndex!0 thiss!1728)))) (currentByte!13997 (_2!12768 (increaseBitIndex!0 thiss!1728))) (currentBit!13992 (_2!12768 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!424389 lt!424388)))))

(assert (=> b!291860 (or (not (= (bvand lt!424389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424388 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!424389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!424389 lt!424388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291860 (= lt!424388 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291860 (= lt!424389 (bitIndex!0 (size!7497 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728) (currentBit!13992 thiss!1728)))))

(declare-fun lt!424387 () Bool)

(assert (=> b!291860 (= lt!424387 (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13992 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424386 () Bool)

(assert (=> b!291860 (= lt!424386 (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13992 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424383 () Bool)

(assert (=> b!291860 (= lt!424383 (not (= (bvand ((_ sign_extend 24) (select (arr!8517 (buf!7563 thiss!1728)) (currentByte!13997 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13992 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98760 res!241107) b!291860))

(declare-fun m!427271 () Bool)

(assert (=> d!98760 m!427271))

(declare-fun m!427273 () Bool)

(assert (=> d!98760 m!427273))

(declare-fun m!427275 () Bool)

(assert (=> d!98760 m!427275))

(declare-fun m!427277 () Bool)

(assert (=> d!98760 m!427277))

(assert (=> b!291860 m!427275))

(declare-fun m!427279 () Bool)

(assert (=> b!291860 m!427279))

(assert (=> b!291860 m!427273))

(assert (=> b!291860 m!427271))

(assert (=> b!291860 m!426911))

(assert (=> b!291645 d!98760))

(declare-fun b!291861 () Bool)

(declare-fun e!208048 () Bool)

(declare-fun e!208051 () Bool)

(assert (=> b!291861 (= e!208048 e!208051)))

(declare-fun c!13344 () Bool)

(declare-fun lt!424392 () tuple4!848)

(assert (=> b!291861 (= c!13344 (= (_3!1294 lt!424392) (_4!424 lt!424392)))))

(declare-fun d!98790 () Bool)

(declare-fun res!241108 () Bool)

(declare-fun e!208050 () Bool)

(assert (=> d!98790 (=> res!241108 e!208050)))

(assert (=> d!98790 (= res!241108 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98790 (= (arrayBitRangesEq!0 arr!273 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208050)))

(declare-fun b!291862 () Bool)

(declare-fun call!4910 () Bool)

(assert (=> b!291862 (= e!208051 call!4910)))

(declare-fun b!291863 () Bool)

(declare-fun res!241111 () Bool)

(declare-fun lt!424390 () (_ BitVec 32))

(assert (=> b!291863 (= res!241111 (= lt!424390 #b00000000000000000000000000000000))))

(declare-fun e!208047 () Bool)

(assert (=> b!291863 (=> res!241111 e!208047)))

(declare-fun e!208052 () Bool)

(assert (=> b!291863 (= e!208052 e!208047)))

(declare-fun b!291864 () Bool)

(assert (=> b!291864 (= e!208047 call!4910)))

(declare-fun b!291865 () Bool)

(declare-fun e!208049 () Bool)

(assert (=> b!291865 (= e!208049 (arrayRangesEq!1482 arr!273 (_3!1292 lt!423849) (_1!12765 lt!424392) (_2!12765 lt!424392)))))

(declare-fun bm!4907 () Bool)

(declare-fun lt!424391 () (_ BitVec 32))

(assert (=> bm!4907 (= call!4910 (byteRangesEq!0 (ite c!13344 (select (arr!8517 arr!273) (_3!1294 lt!424392)) (select (arr!8517 arr!273) (_4!424 lt!424392))) (ite c!13344 (select (arr!8517 (_3!1292 lt!423849)) (_3!1294 lt!424392)) (select (arr!8517 (_3!1292 lt!423849)) (_4!424 lt!424392))) (ite c!13344 lt!424391 #b00000000000000000000000000000000) lt!424390))))

(declare-fun b!291866 () Bool)

(assert (=> b!291866 (= e!208050 e!208048)))

(declare-fun res!241110 () Bool)

(assert (=> b!291866 (=> (not res!241110) (not e!208048))))

(assert (=> b!291866 (= res!241110 e!208049)))

(declare-fun res!241109 () Bool)

(assert (=> b!291866 (=> res!241109 e!208049)))

(assert (=> b!291866 (= res!241109 (bvsge (_1!12765 lt!424392) (_2!12765 lt!424392)))))

(assert (=> b!291866 (= lt!424390 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291866 (= lt!424391 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291866 (= lt!424392 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291867 () Bool)

(assert (=> b!291867 (= e!208051 e!208052)))

(declare-fun res!241112 () Bool)

(assert (=> b!291867 (= res!241112 (byteRangesEq!0 (select (arr!8517 arr!273) (_3!1294 lt!424392)) (select (arr!8517 (_3!1292 lt!423849)) (_3!1294 lt!424392)) lt!424391 #b00000000000000000000000000001000))))

(assert (=> b!291867 (=> (not res!241112) (not e!208052))))

(assert (= (and d!98790 (not res!241108)) b!291866))

(assert (= (and b!291866 (not res!241109)) b!291865))

(assert (= (and b!291866 res!241110) b!291861))

(assert (= (and b!291861 c!13344) b!291862))

(assert (= (and b!291861 (not c!13344)) b!291867))

(assert (= (and b!291867 res!241112) b!291863))

(assert (= (and b!291863 (not res!241111)) b!291864))

(assert (= (or b!291862 b!291864) bm!4907))

(declare-fun m!427281 () Bool)

(assert (=> b!291865 m!427281))

(declare-fun m!427283 () Bool)

(assert (=> bm!4907 m!427283))

(declare-fun m!427285 () Bool)

(assert (=> bm!4907 m!427285))

(declare-fun m!427287 () Bool)

(assert (=> bm!4907 m!427287))

(declare-fun m!427289 () Bool)

(assert (=> bm!4907 m!427289))

(declare-fun m!427291 () Bool)

(assert (=> bm!4907 m!427291))

(assert (=> b!291866 m!427123))

(assert (=> b!291867 m!427291))

(assert (=> b!291867 m!427287))

(assert (=> b!291867 m!427291))

(assert (=> b!291867 m!427287))

(declare-fun m!427293 () Bool)

(assert (=> b!291867 m!427293))

(assert (=> b!291645 d!98790))

(declare-fun d!98792 () Bool)

(assert (=> d!98792 (arrayBitRangesEq!0 arr!273 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424395 () Unit!20271)

(declare-fun choose!49 (array!17316 array!17316 array!17316 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20271)

(assert (=> d!98792 (= lt!424395 (choose!49 arr!273 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98792 (= (arrayBitRangesEqTransitive!0 arr!273 lt!423846 (_3!1292 lt!423849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424395)))

(declare-fun bs!25176 () Bool)

(assert (= bs!25176 d!98792))

(assert (=> bs!25176 m!426919))

(declare-fun m!427295 () Bool)

(assert (=> bs!25176 m!427295))

(assert (=> b!291645 d!98792))

(declare-fun d!98794 () Bool)

(assert (=> d!98794 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7497 (buf!7563 thiss!1728))) ((_ sign_extend 32) (currentByte!13997 thiss!1728)) ((_ sign_extend 32) (currentBit!13992 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25177 () Bool)

(assert (= bs!25177 d!98794))

(assert (=> bs!25177 m!426947))

(assert (=> b!291648 d!98794))

(declare-fun d!98796 () Bool)

(assert (=> d!98796 (= (invariant!0 (currentBit!13992 (_2!12761 lt!423849)) (currentByte!13997 (_2!12761 lt!423849)) (size!7497 (buf!7563 (_2!12761 lt!423849)))) (and (bvsge (currentBit!13992 (_2!12761 lt!423849)) #b00000000000000000000000000000000) (bvslt (currentBit!13992 (_2!12761 lt!423849)) #b00000000000000000000000000001000) (bvsge (currentByte!13997 (_2!12761 lt!423849)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13997 (_2!12761 lt!423849)) (size!7497 (buf!7563 (_2!12761 lt!423849)))) (and (= (currentBit!13992 (_2!12761 lt!423849)) #b00000000000000000000000000000000) (= (currentByte!13997 (_2!12761 lt!423849)) (size!7497 (buf!7563 (_2!12761 lt!423849))))))))))

(assert (=> b!291649 d!98796))

(declare-fun d!98798 () Bool)

(assert (=> d!98798 (= (array_inv!7109 (buf!7563 thiss!1728)) (bvsge (size!7497 (buf!7563 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291647 d!98798))

(push 1)

(assert (not d!98712))

(assert (not b!291867))

(assert (not b!291830))

(assert (not d!98756))

(assert (not b!291747))

(assert (not bm!4896))

(assert (not bm!4893))

(assert (not b!291755))

(assert (not d!98744))

(assert (not b!291774))

(assert (not b!291748))

(assert (not b!291775))

(assert (not d!98760))

(assert (not b!291860))

(assert (not b!291865))

(assert (not d!98748))

(assert (not b!291749))

(assert (not d!98758))

(assert (not b!291751))

(assert (not d!98738))

(assert (not d!98792))

(assert (not b!291866))

(assert (not b!291752))

(assert (not d!98708))

(assert (not b!291783))

(assert (not d!98752))

(assert (not d!98714))

(assert (not b!291776))

(assert (not d!98794))

(assert (not d!98754))

(assert (not bm!4907))

(assert (not bm!4892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

