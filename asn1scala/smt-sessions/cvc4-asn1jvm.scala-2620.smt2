; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64640 () Bool)

(assert start!64640)

(declare-fun b!290243 () Bool)

(declare-fun res!239786 () Bool)

(declare-fun e!206701 () Bool)

(assert (=> b!290243 (=> (not res!239786) (not e!206701))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290243 (= res!239786 (bvslt from!505 to!474))))

(declare-fun res!239789 () Bool)

(assert (=> start!64640 (=> (not res!239789) (not e!206701))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17229 0))(
  ( (array!17230 (arr!8460 (Array (_ BitVec 32) (_ BitVec 8))) (size!7458 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17229)

(assert (=> start!64640 (= res!239789 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7458 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64640 e!206701))

(declare-datatypes ((BitStream!12926 0))(
  ( (BitStream!12927 (buf!7524 array!17229) (currentByte!13931 (_ BitVec 32)) (currentBit!13926 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12926)

(declare-fun e!206703 () Bool)

(declare-fun inv!12 (BitStream!12926) Bool)

(assert (=> start!64640 (and (inv!12 thiss!1728) e!206703)))

(assert (=> start!64640 true))

(declare-fun array_inv!7070 (array!17229) Bool)

(assert (=> start!64640 (array_inv!7070 arr!273)))

(declare-fun b!290244 () Bool)

(declare-fun res!239787 () Bool)

(assert (=> b!290244 (=> (not res!239787) (not e!206701))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290244 (= res!239787 (validate_offset_bits!1 ((_ sign_extend 32) (size!7458 (buf!7524 thiss!1728))) ((_ sign_extend 32) (currentByte!13931 thiss!1728)) ((_ sign_extend 32) (currentBit!13926 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290245 () Bool)

(assert (=> b!290245 (= e!206703 (array_inv!7070 (buf!7524 thiss!1728)))))

(declare-datatypes ((Unit!20157 0))(
  ( (Unit!20158) )
))
(declare-datatypes ((tuple3!1660 0))(
  ( (tuple3!1661 (_1!12639 Unit!20157) (_2!12639 BitStream!12926) (_3!1244 array!17229)) )
))
(declare-fun lt!420985 () tuple3!1660)

(declare-fun e!206700 () Bool)

(declare-fun b!290246 () Bool)

(assert (=> b!290246 (= e!206700 (and (= (buf!7524 thiss!1728) (buf!7524 (_2!12639 lt!420985))) (= (size!7458 arr!273) (size!7458 (_3!1244 lt!420985)))))))

(declare-fun b!290247 () Bool)

(assert (=> b!290247 (= e!206701 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7458 arr!273))))))))

(declare-fun lt!420989 () array!17229)

(declare-fun bitAt!0 (array!17229 (_ BitVec 64)) Bool)

(assert (=> b!290247 (= (bitAt!0 lt!420989 from!505) (bitAt!0 (_3!1244 lt!420985) from!505))))

(declare-fun lt!420982 () Unit!20157)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17229 array!17229 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20157)

(assert (=> b!290247 (= lt!420982 (arrayBitRangesEqImpliesEq!0 lt!420989 (_3!1244 lt!420985) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17229 array!17229 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290247 (arrayBitRangesEq!0 arr!273 (_3!1244 lt!420985) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420986 () Unit!20157)

(declare-fun arrayBitRangesEqTransitive!0 (array!17229 array!17229 array!17229 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20157)

(assert (=> b!290247 (= lt!420986 (arrayBitRangesEqTransitive!0 arr!273 lt!420989 (_3!1244 lt!420985) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290247 (arrayBitRangesEq!0 arr!273 lt!420989 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420984 () Unit!20157)

(declare-datatypes ((tuple2!22790 0))(
  ( (tuple2!22791 (_1!12640 Bool) (_2!12640 BitStream!12926)) )
))
(declare-fun lt!420990 () tuple2!22790)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17229 (_ BitVec 64) Bool) Unit!20157)

(assert (=> b!290247 (= lt!420984 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12640 lt!420990)))))

(assert (=> b!290247 e!206700))

(declare-fun res!239788 () Bool)

(assert (=> b!290247 (=> (not res!239788) (not e!206700))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290247 (= res!239788 (= (bvsub (bvadd (bitIndex!0 (size!7458 (buf!7524 thiss!1728)) (currentByte!13931 thiss!1728) (currentBit!13926 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7458 (buf!7524 (_2!12639 lt!420985))) (currentByte!13931 (_2!12639 lt!420985)) (currentBit!13926 (_2!12639 lt!420985)))))))

(declare-fun readBitsLoop!0 (BitStream!12926 (_ BitVec 64) array!17229 (_ BitVec 64) (_ BitVec 64)) tuple3!1660)

(assert (=> b!290247 (= lt!420985 (readBitsLoop!0 (_2!12640 lt!420990) nBits!523 lt!420989 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290247 (validate_offset_bits!1 ((_ sign_extend 32) (size!7458 (buf!7524 (_2!12640 lt!420990)))) ((_ sign_extend 32) (currentByte!13931 (_2!12640 lt!420990))) ((_ sign_extend 32) (currentBit!13926 (_2!12640 lt!420990))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420983 () Unit!20157)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12926 BitStream!12926 (_ BitVec 64) (_ BitVec 64)) Unit!20157)

(assert (=> b!290247 (= lt!420983 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12640 lt!420990) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420987 () (_ BitVec 32))

(declare-fun lt!420988 () (_ BitVec 32))

(assert (=> b!290247 (= lt!420989 (array!17230 (store (arr!8460 arr!273) lt!420987 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8460 arr!273) lt!420987)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420988)))) ((_ sign_extend 24) (ite (_1!12640 lt!420990) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420988) #b00000000))))) (size!7458 arr!273)))))

(assert (=> b!290247 (= lt!420988 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290247 (= lt!420987 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12926) tuple2!22790)

(assert (=> b!290247 (= lt!420990 (readBit!0 thiss!1728))))

(assert (= (and start!64640 res!239789) b!290244))

(assert (= (and b!290244 res!239787) b!290243))

(assert (= (and b!290243 res!239786) b!290247))

(assert (= (and b!290247 res!239788) b!290246))

(assert (= start!64640 b!290245))

(declare-fun m!424095 () Bool)

(assert (=> start!64640 m!424095))

(declare-fun m!424097 () Bool)

(assert (=> start!64640 m!424097))

(declare-fun m!424099 () Bool)

(assert (=> b!290244 m!424099))

(declare-fun m!424101 () Bool)

(assert (=> b!290245 m!424101))

(declare-fun m!424103 () Bool)

(assert (=> b!290247 m!424103))

(declare-fun m!424105 () Bool)

(assert (=> b!290247 m!424105))

(declare-fun m!424107 () Bool)

(assert (=> b!290247 m!424107))

(declare-fun m!424109 () Bool)

(assert (=> b!290247 m!424109))

(declare-fun m!424111 () Bool)

(assert (=> b!290247 m!424111))

(declare-fun m!424113 () Bool)

(assert (=> b!290247 m!424113))

(declare-fun m!424115 () Bool)

(assert (=> b!290247 m!424115))

(declare-fun m!424117 () Bool)

(assert (=> b!290247 m!424117))

(declare-fun m!424119 () Bool)

(assert (=> b!290247 m!424119))

(declare-fun m!424121 () Bool)

(assert (=> b!290247 m!424121))

(declare-fun m!424123 () Bool)

(assert (=> b!290247 m!424123))

(declare-fun m!424125 () Bool)

(assert (=> b!290247 m!424125))

(declare-fun m!424127 () Bool)

(assert (=> b!290247 m!424127))

(declare-fun m!424129 () Bool)

(assert (=> b!290247 m!424129))

(declare-fun m!424131 () Bool)

(assert (=> b!290247 m!424131))

(declare-fun m!424133 () Bool)

(assert (=> b!290247 m!424133))

(push 1)

(assert (not start!64640))

(assert (not b!290247))

(assert (not b!290244))

(assert (not b!290245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

