; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15978 () Bool)

(assert start!15978)

(declare-fun res!66795 () Bool)

(declare-fun e!53099 () Bool)

(assert (=> start!15978 (=> (not res!66795) (not e!53099))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15978 (= res!66795 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15978 e!53099))

(assert (=> start!15978 true))

(declare-datatypes ((array!3563 0))(
  ( (array!3564 (arr!2255 (Array (_ BitVec 32) (_ BitVec 8))) (size!1645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2852 0))(
  ( (BitStream!2853 (buf!2035 array!3563) (currentByte!3933 (_ BitVec 32)) (currentBit!3928 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2852)

(declare-fun e!53100 () Bool)

(declare-fun inv!12 (BitStream!2852) Bool)

(assert (=> start!15978 (and (inv!12 thiss!1716) e!53100)))

(declare-fun b!80746 () Bool)

(declare-fun res!66796 () Bool)

(assert (=> b!80746 (=> (not res!66796) (not e!53099))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80746 (= res!66796 (validate_offset_bits!1 ((_ sign_extend 32) (size!1645 (buf!2035 thiss!1716))) ((_ sign_extend 32) (currentByte!3933 thiss!1716)) ((_ sign_extend 32) (currentBit!3928 thiss!1716)) nBits!516))))

(declare-fun b!80747 () Bool)

(declare-datatypes ((Unit!5348 0))(
  ( (Unit!5349) )
))
(declare-datatypes ((tuple3!326 0))(
  ( (tuple3!327 (_1!3754 Unit!5348) (_2!3754 BitStream!2852) (_3!184 array!3563)) )
))
(declare-fun readBitsLoop!0 (BitStream!2852 (_ BitVec 64) array!3563 (_ BitVec 64) (_ BitVec 64)) tuple3!326)

(assert (=> b!80747 (= e!53099 (not (= (buf!2035 (_2!3754 (readBitsLoop!0 thiss!1716 nBits!516 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))) (buf!2035 thiss!1716))))))

(declare-fun b!80748 () Bool)

(declare-fun array_inv!1491 (array!3563) Bool)

(assert (=> b!80748 (= e!53100 (array_inv!1491 (buf!2035 thiss!1716)))))

(assert (= (and start!15978 res!66795) b!80746))

(assert (= (and b!80746 res!66796) b!80747))

(assert (= start!15978 b!80748))

(declare-fun m!126229 () Bool)

(assert (=> start!15978 m!126229))

(declare-fun m!126231 () Bool)

(assert (=> b!80746 m!126231))

(declare-fun m!126233 () Bool)

(assert (=> b!80747 m!126233))

(declare-fun m!126235 () Bool)

(assert (=> b!80748 m!126235))

(push 1)

(assert (not b!80747))

(assert (not b!80746))

(assert (not start!15978))

(assert (not b!80748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!127999 () tuple3!326)

(declare-fun b!80821 () Bool)

(declare-fun e!53135 () Bool)

(declare-datatypes ((List!800 0))(
  ( (Nil!797) (Cons!796 (h!915 Bool) (t!1550 List!800)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2852 array!3563 (_ BitVec 64) (_ BitVec 64)) List!800)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2852 BitStream!2852 (_ BitVec 64)) List!800)

(assert (=> b!80821 (= e!53135 (= (byteArrayBitContentToList!0 (_2!3754 lt!127999) (_3!184 lt!127999) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!3754 lt!127999) thiss!1716 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!80821 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!80821 (or (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!80822 () Bool)

(declare-fun e!53133 () Bool)

(declare-fun bitAt!0 (array!3563 (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!7142 0))(
  ( (tuple2!7143 (_1!3756 BitStream!2852) (_2!3756 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2852) tuple2!7142)

(assert (=> b!80822 (= e!53133 (= (bitAt!0 (_3!184 lt!127999) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!3756 (readBitPure!0 thiss!1716))))))

(declare-fun bm!1031 () Bool)

(declare-fun call!1035 () Bool)

(declare-fun lt!127977 () (_ BitVec 64))

(declare-fun lt!127992 () tuple3!326)

(declare-fun lt!127996 () (_ BitVec 64))

(declare-fun lt!127981 () (_ BitVec 64))

(declare-fun lt!128009 () array!3563)

(declare-fun c!5666 () Bool)

(declare-fun lt!128002 () array!3563)

(declare-fun arrayBitRangesEq!0 (array!3563 array!3563 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> bm!1031 (= call!1035 (arrayBitRangesEq!0 (ite c!5666 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!128002) (ite c!5666 (_3!184 lt!127992) lt!128009) (ite c!5666 lt!127981 lt!127996) (ite c!5666 #b0000000000000000000000000000000000000000000000000000000000000000 lt!127977)))))

(declare-fun b!80823 () Bool)

(declare-fun res!66858 () Bool)

(assert (=> b!80823 (=> (not res!66858) (not e!53135))))

(assert (=> b!80823 (= res!66858 e!53133)))

(declare-fun res!66856 () Bool)

(assert (=> b!80823 (=> res!66856 e!53133)))

(assert (=> b!80823 (= res!66856 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516)))))

(declare-fun d!25234 () Bool)

(assert (=> d!25234 e!53135))

(declare-fun res!66855 () Bool)

(assert (=> d!25234 (=> (not res!66855) (not e!53135))))

(declare-fun lt!127997 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!25234 (= res!66855 (= (bvsub lt!127997 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1645 (buf!2035 (_2!3754 lt!127999))) (currentByte!3933 (_2!3754 lt!127999)) (currentBit!3928 (_2!3754 lt!127999)))))))

(assert (=> d!25234 (or (= (bvand lt!127997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!127997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!127997 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!127982 () (_ BitVec 64))

(assert (=> d!25234 (= lt!127997 (bvadd lt!127982 nBits!516))))

(assert (=> d!25234 (or (not (= (bvand lt!127982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!127982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!127982 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25234 (= lt!127982 (bitIndex!0 (size!1645 (buf!2035 thiss!1716)) (currentByte!3933 thiss!1716) (currentBit!3928 thiss!1716)))))

(declare-fun e!53134 () tuple3!326)

(assert (=> d!25234 (= lt!127999 e!53134)))

(assert (=> d!25234 (= c!5666 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> d!25234 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!25234 (= (readBitsLoop!0 thiss!1716 nBits!516 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) lt!127999)))

(declare-fun b!80824 () Bool)

(declare-fun lt!127991 () Unit!5348)

(assert (=> b!80824 (= e!53134 (tuple3!327 lt!127991 (_2!3754 lt!127992) (_3!184 lt!127992)))))

(declare-datatypes ((tuple2!7148 0))(
  ( (tuple2!7149 (_1!3759 Bool) (_2!3759 BitStream!2852)) )
))
(declare-fun lt!127987 () tuple2!7148)

(declare-fun readBit!0 (BitStream!2852) tuple2!7148)

(assert (=> b!80824 (= lt!127987 (readBit!0 thiss!1716))))

(declare-fun lt!127990 () (_ BitVec 32))

(assert (=> b!80824 (= lt!127990 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128005 () (_ BitVec 32))

(assert (=> b!80824 (= lt!128005 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128001 () array!3563)

(assert (=> b!80824 (= lt!128001 (array!3564 (store (arr!2255 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127990 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2255 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127990)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128005)))) ((_ sign_extend 24) (ite (_1!3759 lt!127987) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!128005) #b00000000))))) (size!1645 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!128003 () (_ BitVec 64))

(assert (=> b!80824 (= lt!128003 (bvsub nBits!516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!127975 () (_ BitVec 64))

(assert (=> b!80824 (= lt!127975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!128004 () Unit!5348)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2852 BitStream!2852 (_ BitVec 64) (_ BitVec 64)) Unit!5348)

(assert (=> b!80824 (= lt!128004 (validateOffsetBitsIneqLemma!0 thiss!1716 (_2!3759 lt!127987) lt!128003 lt!127975))))

(assert (=> b!80824 (validate_offset_bits!1 ((_ sign_extend 32) (size!1645 (buf!2035 (_2!3759 lt!127987)))) ((_ sign_extend 32) (currentByte!3933 (_2!3759 lt!127987))) ((_ sign_extend 32) (currentBit!3928 (_2!3759 lt!127987))) (bvsub lt!128003 lt!127975))))

(declare-fun lt!127980 () Unit!5348)

(assert (=> b!80824 (= lt!127980 lt!128004)))

(assert (=> b!80824 (= lt!127992 (readBitsLoop!0 (_2!3759 lt!127987) nBits!516 lt!128001 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!516))))

(declare-fun res!66853 () Bool)

(assert (=> b!80824 (= res!66853 (= (bvsub (bvadd (bitIndex!0 (size!1645 (buf!2035 thiss!1716)) (currentByte!3933 thiss!1716) (currentBit!3928 thiss!1716)) nBits!516) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!1645 (buf!2035 (_2!3754 lt!127992))) (currentByte!3933 (_2!3754 lt!127992)) (currentBit!3928 (_2!3754 lt!127992)))))))

(declare-fun e!53136 () Bool)

(assert (=> b!80824 (=> (not res!66853) (not e!53136))))

(assert (=> b!80824 e!53136))

(declare-fun lt!128000 () Unit!5348)

(declare-fun Unit!5358 () Unit!5348)

(assert (=> b!80824 (= lt!128000 Unit!5358)))

(declare-fun lt!127989 () (_ BitVec 32))

(assert (=> b!80824 (= lt!127989 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!127983 () (_ BitVec 32))

(assert (=> b!80824 (= lt!127983 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!128010 () Unit!5348)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!3563 (_ BitVec 64) Bool) Unit!5348)

(assert (=> b!80824 (= lt!128010 (arrayBitRangesUpdatedAtLemma!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!3759 lt!127987)))))

(declare-fun call!1034 () Bool)

(assert (=> b!80824 call!1034))

(declare-fun lt!127988 () Unit!5348)

(assert (=> b!80824 (= lt!127988 lt!128010)))

(assert (=> b!80824 (= lt!127981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127986 () Unit!5348)

(declare-fun arrayBitRangesEqTransitive!0 (array!3563 array!3563 array!3563 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5348)

(assert (=> b!80824 (= lt!127986 (arrayBitRangesEqTransitive!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!128001 (_3!184 lt!127992) lt!127981 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!80824 call!1035))

(declare-fun lt!127976 () Unit!5348)

(assert (=> b!80824 (= lt!127976 lt!127986)))

(assert (=> b!80824 (arrayBitRangesEq!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!184 lt!127992) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127994 () Unit!5348)

(declare-fun Unit!5359 () Unit!5348)

(assert (=> b!80824 (= lt!127994 Unit!5359)))

(declare-fun lt!128006 () Unit!5348)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!3563 array!3563 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5348)

(assert (=> b!80824 (= lt!128006 (arrayBitRangesEqImpliesEq!0 lt!128001 (_3!184 lt!127992) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!80824 (= (bitAt!0 lt!128001 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!184 lt!127992) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!128008 () Unit!5348)

(assert (=> b!80824 (= lt!128008 lt!128006)))

(declare-fun lt!127979 () Unit!5348)

(declare-fun Unit!5360 () Unit!5348)

(assert (=> b!80824 (= lt!127979 Unit!5360)))

(declare-fun lt!127984 () Bool)

(assert (=> b!80824 (= lt!127984 (= (bitAt!0 (_3!184 lt!127992) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!3759 lt!127987)))))

(declare-fun Unit!5361 () Unit!5348)

(assert (=> b!80824 (= lt!127991 Unit!5361)))

(assert (=> b!80824 lt!127984))

(declare-fun b!80825 () Bool)

(assert (=> b!80825 (= e!53136 (and (= (buf!2035 thiss!1716) (buf!2035 (_2!3754 lt!127992))) (= (size!1645 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!1645 (_3!184 lt!127992)))))))

(declare-fun b!80826 () Bool)

(declare-fun lt!127998 () Unit!5348)

(assert (=> b!80826 (= e!53134 (tuple3!327 lt!127998 thiss!1716 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!127995 () Unit!5348)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!3563) Unit!5348)

(assert (=> b!80826 (= lt!127995 (arrayBitRangesEqReflexiveLemma!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!80826 call!1034))

(declare-fun lt!128007 () Unit!5348)

(assert (=> b!80826 (= lt!128007 lt!127995)))

(assert (=> b!80826 (= lt!128002 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!80826 (= lt!128009 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!127993 () (_ BitVec 64))

(assert (=> b!80826 (= lt!127993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127978 () (_ BitVec 64))

(assert (=> b!80826 (= lt!127978 ((_ sign_extend 32) (size!1645 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!127985 () (_ BitVec 64))

(assert (=> b!80826 (= lt!127985 (bvmul lt!127978 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!80826 (= lt!127996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!80826 (= lt!127977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!3563 array!3563 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!5348)

(assert (=> b!80826 (= lt!127998 (arrayBitRangesEqSlicedLemma!0 lt!128002 lt!128009 lt!127993 lt!127985 lt!127996 lt!127977))))

(assert (=> b!80826 call!1035))

(declare-fun b!80827 () Bool)

(declare-fun res!66857 () Bool)

(assert (=> b!80827 (=> (not res!66857) (not e!53135))))

(assert (=> b!80827 (= res!66857 (arrayBitRangesEq!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!184 lt!127999) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1032 () Bool)

(assert (=> bm!1032 (= call!1034 (arrayBitRangesEq!0 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!5666 (array!3564 (store (arr!2255 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127989 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!2255 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!127989)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127983)))) ((_ sign_extend 24) (ite (_1!3759 lt!127987) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!127983) #b00000000))))) (size!1645 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!5666 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!1645 (array!3564 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!80828 () Bool)

(declare-fun res!66854 () Bool)

(assert (=> b!80828 (=> (not res!66854) (not e!53135))))

