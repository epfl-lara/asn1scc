; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64642 () Bool)

(assert start!64642)

(declare-fun b!290258 () Bool)

(declare-fun e!206714 () Bool)

(declare-datatypes ((array!17231 0))(
  ( (array!17232 (arr!8461 (Array (_ BitVec 32) (_ BitVec 8))) (size!7459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12928 0))(
  ( (BitStream!12929 (buf!7525 array!17231) (currentByte!13932 (_ BitVec 32)) (currentBit!13927 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12928)

(declare-fun array_inv!7071 (array!17231) Bool)

(assert (=> b!290258 (= e!206714 (array_inv!7071 (buf!7525 thiss!1728)))))

(declare-fun b!290260 () Bool)

(declare-datatypes ((Unit!20159 0))(
  ( (Unit!20160) )
))
(declare-datatypes ((tuple3!1662 0))(
  ( (tuple3!1663 (_1!12641 Unit!20159) (_2!12641 BitStream!12928) (_3!1245 array!17231)) )
))
(declare-fun lt!421015 () tuple3!1662)

(declare-fun e!206715 () Bool)

(declare-fun arr!273 () array!17231)

(assert (=> b!290260 (= e!206715 (and (= (buf!7525 thiss!1728) (buf!7525 (_2!12641 lt!421015))) (= (size!7459 arr!273) (size!7459 (_3!1245 lt!421015)))))))

(declare-fun b!290261 () Bool)

(declare-fun res!239801 () Bool)

(declare-fun e!206716 () Bool)

(assert (=> b!290261 (=> (not res!239801) (not e!206716))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290261 (= res!239801 (bvslt from!505 to!474))))

(declare-fun b!290262 () Bool)

(declare-fun res!239798 () Bool)

(assert (=> b!290262 (=> (not res!239798) (not e!206716))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290262 (= res!239798 (validate_offset_bits!1 ((_ sign_extend 32) (size!7459 (buf!7525 thiss!1728))) ((_ sign_extend 32) (currentByte!13932 thiss!1728)) ((_ sign_extend 32) (currentBit!13927 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290259 () Bool)

(assert (=> b!290259 (= e!206716 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7459 (_3!1245 lt!421015)))))))))

(declare-fun lt!421013 () array!17231)

(declare-fun bitAt!0 (array!17231 (_ BitVec 64)) Bool)

(assert (=> b!290259 (= (bitAt!0 lt!421013 from!505) (bitAt!0 (_3!1245 lt!421015) from!505))))

(declare-fun lt!421017 () Unit!20159)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17231 array!17231 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20159)

(assert (=> b!290259 (= lt!421017 (arrayBitRangesEqImpliesEq!0 lt!421013 (_3!1245 lt!421015) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17231 array!17231 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290259 (arrayBitRangesEq!0 arr!273 (_3!1245 lt!421015) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421009 () Unit!20159)

(declare-fun arrayBitRangesEqTransitive!0 (array!17231 array!17231 array!17231 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20159)

(assert (=> b!290259 (= lt!421009 (arrayBitRangesEqTransitive!0 arr!273 lt!421013 (_3!1245 lt!421015) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290259 (arrayBitRangesEq!0 arr!273 lt!421013 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421014 () Unit!20159)

(declare-datatypes ((tuple2!22792 0))(
  ( (tuple2!22793 (_1!12642 Bool) (_2!12642 BitStream!12928)) )
))
(declare-fun lt!421012 () tuple2!22792)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17231 (_ BitVec 64) Bool) Unit!20159)

(assert (=> b!290259 (= lt!421014 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12642 lt!421012)))))

(assert (=> b!290259 e!206715))

(declare-fun res!239800 () Bool)

(assert (=> b!290259 (=> (not res!239800) (not e!206715))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290259 (= res!239800 (= (bvsub (bvadd (bitIndex!0 (size!7459 (buf!7525 thiss!1728)) (currentByte!13932 thiss!1728) (currentBit!13927 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7459 (buf!7525 (_2!12641 lt!421015))) (currentByte!13932 (_2!12641 lt!421015)) (currentBit!13927 (_2!12641 lt!421015)))))))

(declare-fun readBitsLoop!0 (BitStream!12928 (_ BitVec 64) array!17231 (_ BitVec 64) (_ BitVec 64)) tuple3!1662)

(assert (=> b!290259 (= lt!421015 (readBitsLoop!0 (_2!12642 lt!421012) nBits!523 lt!421013 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290259 (validate_offset_bits!1 ((_ sign_extend 32) (size!7459 (buf!7525 (_2!12642 lt!421012)))) ((_ sign_extend 32) (currentByte!13932 (_2!12642 lt!421012))) ((_ sign_extend 32) (currentBit!13927 (_2!12642 lt!421012))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421016 () Unit!20159)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12928 BitStream!12928 (_ BitVec 64) (_ BitVec 64)) Unit!20159)

(assert (=> b!290259 (= lt!421016 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12642 lt!421012) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421010 () (_ BitVec 32))

(declare-fun lt!421011 () (_ BitVec 32))

(assert (=> b!290259 (= lt!421013 (array!17232 (store (arr!8461 arr!273) lt!421010 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8461 arr!273) lt!421010)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421011)))) ((_ sign_extend 24) (ite (_1!12642 lt!421012) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421011) #b00000000))))) (size!7459 arr!273)))))

(assert (=> b!290259 (= lt!421011 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290259 (= lt!421010 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12928) tuple2!22792)

(assert (=> b!290259 (= lt!421012 (readBit!0 thiss!1728))))

(declare-fun res!239799 () Bool)

(assert (=> start!64642 (=> (not res!239799) (not e!206716))))

(assert (=> start!64642 (= res!239799 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7459 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64642 e!206716))

(declare-fun inv!12 (BitStream!12928) Bool)

(assert (=> start!64642 (and (inv!12 thiss!1728) e!206714)))

(assert (=> start!64642 true))

(assert (=> start!64642 (array_inv!7071 arr!273)))

(assert (= (and start!64642 res!239799) b!290262))

(assert (= (and b!290262 res!239798) b!290261))

(assert (= (and b!290261 res!239801) b!290259))

(assert (= (and b!290259 res!239800) b!290260))

(assert (= start!64642 b!290258))

(declare-fun m!424135 () Bool)

(assert (=> b!290258 m!424135))

(declare-fun m!424137 () Bool)

(assert (=> b!290262 m!424137))

(declare-fun m!424139 () Bool)

(assert (=> b!290259 m!424139))

(declare-fun m!424141 () Bool)

(assert (=> b!290259 m!424141))

(declare-fun m!424143 () Bool)

(assert (=> b!290259 m!424143))

(declare-fun m!424145 () Bool)

(assert (=> b!290259 m!424145))

(declare-fun m!424147 () Bool)

(assert (=> b!290259 m!424147))

(declare-fun m!424149 () Bool)

(assert (=> b!290259 m!424149))

(declare-fun m!424151 () Bool)

(assert (=> b!290259 m!424151))

(declare-fun m!424153 () Bool)

(assert (=> b!290259 m!424153))

(declare-fun m!424155 () Bool)

(assert (=> b!290259 m!424155))

(declare-fun m!424157 () Bool)

(assert (=> b!290259 m!424157))

(declare-fun m!424159 () Bool)

(assert (=> b!290259 m!424159))

(declare-fun m!424161 () Bool)

(assert (=> b!290259 m!424161))

(declare-fun m!424163 () Bool)

(assert (=> b!290259 m!424163))

(declare-fun m!424165 () Bool)

(assert (=> b!290259 m!424165))

(declare-fun m!424167 () Bool)

(assert (=> b!290259 m!424167))

(declare-fun m!424169 () Bool)

(assert (=> b!290259 m!424169))

(declare-fun m!424171 () Bool)

(assert (=> start!64642 m!424171))

(declare-fun m!424173 () Bool)

(assert (=> start!64642 m!424173))

(push 1)

(assert (not b!290262))

(assert (not start!64642))

(assert (not b!290258))

(assert (not b!290259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

