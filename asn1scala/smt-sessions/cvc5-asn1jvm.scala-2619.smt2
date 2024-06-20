; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64630 () Bool)

(assert start!64630)

(declare-fun b!290168 () Bool)

(declare-fun e!206625 () Bool)

(assert (=> b!290168 (= e!206625 (not true))))

(declare-datatypes ((array!17219 0))(
  ( (array!17220 (arr!8455 (Array (_ BitVec 32) (_ BitVec 8))) (size!7453 (_ BitVec 32))) )
))
(declare-fun lt!420851 () array!17219)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((BitStream!12916 0))(
  ( (BitStream!12917 (buf!7519 array!17219) (currentByte!13926 (_ BitVec 32)) (currentBit!13921 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20147 0))(
  ( (Unit!20148) )
))
(declare-datatypes ((tuple3!1650 0))(
  ( (tuple3!1651 (_1!12629 Unit!20147) (_2!12629 BitStream!12916) (_3!1239 array!17219)) )
))
(declare-fun lt!420849 () tuple3!1650)

(declare-fun bitAt!0 (array!17219 (_ BitVec 64)) Bool)

(assert (=> b!290168 (= (bitAt!0 lt!420851 from!505) (bitAt!0 (_3!1239 lt!420849) from!505))))

(declare-fun lt!420854 () Unit!20147)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17219 array!17219 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20147)

(assert (=> b!290168 (= lt!420854 (arrayBitRangesEqImpliesEq!0 lt!420851 (_3!1239 lt!420849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17219)

(declare-fun arrayBitRangesEq!0 (array!17219 array!17219 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290168 (arrayBitRangesEq!0 arr!273 (_3!1239 lt!420849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420852 () Unit!20147)

(declare-fun arrayBitRangesEqTransitive!0 (array!17219 array!17219 array!17219 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20147)

(assert (=> b!290168 (= lt!420852 (arrayBitRangesEqTransitive!0 arr!273 lt!420851 (_3!1239 lt!420849) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290168 (arrayBitRangesEq!0 arr!273 lt!420851 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22780 0))(
  ( (tuple2!22781 (_1!12630 Bool) (_2!12630 BitStream!12916)) )
))
(declare-fun lt!420855 () tuple2!22780)

(declare-fun lt!420848 () Unit!20147)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17219 (_ BitVec 64) Bool) Unit!20147)

(assert (=> b!290168 (= lt!420848 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12630 lt!420855)))))

(declare-fun e!206627 () Bool)

(assert (=> b!290168 e!206627))

(declare-fun res!239728 () Bool)

(assert (=> b!290168 (=> (not res!239728) (not e!206627))))

(declare-fun thiss!1728 () BitStream!12916)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290168 (= res!239728 (= (bvsub (bvadd (bitIndex!0 (size!7453 (buf!7519 thiss!1728)) (currentByte!13926 thiss!1728) (currentBit!13921 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7453 (buf!7519 (_2!12629 lt!420849))) (currentByte!13926 (_2!12629 lt!420849)) (currentBit!13921 (_2!12629 lt!420849)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12916 (_ BitVec 64) array!17219 (_ BitVec 64) (_ BitVec 64)) tuple3!1650)

(assert (=> b!290168 (= lt!420849 (readBitsLoop!0 (_2!12630 lt!420855) nBits!523 lt!420851 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290168 (validate_offset_bits!1 ((_ sign_extend 32) (size!7453 (buf!7519 (_2!12630 lt!420855)))) ((_ sign_extend 32) (currentByte!13926 (_2!12630 lt!420855))) ((_ sign_extend 32) (currentBit!13921 (_2!12630 lt!420855))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420847 () Unit!20147)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12916 BitStream!12916 (_ BitVec 64) (_ BitVec 64)) Unit!20147)

(assert (=> b!290168 (= lt!420847 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12630 lt!420855) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420853 () (_ BitVec 32))

(declare-fun lt!420850 () (_ BitVec 32))

(assert (=> b!290168 (= lt!420851 (array!17220 (store (arr!8455 arr!273) lt!420853 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8455 arr!273) lt!420853)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420850)))) ((_ sign_extend 24) (ite (_1!12630 lt!420855) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420850) #b00000000))))) (size!7453 arr!273)))))

(assert (=> b!290168 (= lt!420850 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290168 (= lt!420853 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12916) tuple2!22780)

(assert (=> b!290168 (= lt!420855 (readBit!0 thiss!1728))))

(declare-fun b!290169 () Bool)

(declare-fun e!206626 () Bool)

(declare-fun array_inv!7065 (array!17219) Bool)

(assert (=> b!290169 (= e!206626 (array_inv!7065 (buf!7519 thiss!1728)))))

(declare-fun b!290170 () Bool)

(assert (=> b!290170 (= e!206627 (and (= (buf!7519 thiss!1728) (buf!7519 (_2!12629 lt!420849))) (= (size!7453 arr!273) (size!7453 (_3!1239 lt!420849)))))))

(declare-fun res!239727 () Bool)

(assert (=> start!64630 (=> (not res!239727) (not e!206625))))

(assert (=> start!64630 (= res!239727 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7453 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64630 e!206625))

(declare-fun inv!12 (BitStream!12916) Bool)

(assert (=> start!64630 (and (inv!12 thiss!1728) e!206626)))

(assert (=> start!64630 true))

(assert (=> start!64630 (array_inv!7065 arr!273)))

(declare-fun b!290171 () Bool)

(declare-fun res!239729 () Bool)

(assert (=> b!290171 (=> (not res!239729) (not e!206625))))

(assert (=> b!290171 (= res!239729 (bvslt from!505 to!474))))

(declare-fun b!290172 () Bool)

(declare-fun res!239726 () Bool)

(assert (=> b!290172 (=> (not res!239726) (not e!206625))))

(assert (=> b!290172 (= res!239726 (validate_offset_bits!1 ((_ sign_extend 32) (size!7453 (buf!7519 thiss!1728))) ((_ sign_extend 32) (currentByte!13926 thiss!1728)) ((_ sign_extend 32) (currentBit!13921 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64630 res!239727) b!290172))

(assert (= (and b!290172 res!239726) b!290171))

(assert (= (and b!290171 res!239729) b!290168))

(assert (= (and b!290168 res!239728) b!290170))

(assert (= start!64630 b!290169))

(declare-fun m!423895 () Bool)

(assert (=> b!290168 m!423895))

(declare-fun m!423897 () Bool)

(assert (=> b!290168 m!423897))

(declare-fun m!423899 () Bool)

(assert (=> b!290168 m!423899))

(declare-fun m!423901 () Bool)

(assert (=> b!290168 m!423901))

(declare-fun m!423903 () Bool)

(assert (=> b!290168 m!423903))

(declare-fun m!423905 () Bool)

(assert (=> b!290168 m!423905))

(declare-fun m!423907 () Bool)

(assert (=> b!290168 m!423907))

(declare-fun m!423909 () Bool)

(assert (=> b!290168 m!423909))

(declare-fun m!423911 () Bool)

(assert (=> b!290168 m!423911))

(declare-fun m!423913 () Bool)

(assert (=> b!290168 m!423913))

(declare-fun m!423915 () Bool)

(assert (=> b!290168 m!423915))

(declare-fun m!423917 () Bool)

(assert (=> b!290168 m!423917))

(declare-fun m!423919 () Bool)

(assert (=> b!290168 m!423919))

(declare-fun m!423921 () Bool)

(assert (=> b!290168 m!423921))

(declare-fun m!423923 () Bool)

(assert (=> b!290168 m!423923))

(declare-fun m!423925 () Bool)

(assert (=> b!290168 m!423925))

(declare-fun m!423927 () Bool)

(assert (=> b!290169 m!423927))

(declare-fun m!423929 () Bool)

(assert (=> start!64630 m!423929))

(declare-fun m!423931 () Bool)

(assert (=> start!64630 m!423931))

(declare-fun m!423933 () Bool)

(assert (=> b!290172 m!423933))

(push 1)

(assert (not start!64630))

(assert (not b!290168))

(assert (not b!290169))

(assert (not b!290172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

