; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65618 () Bool)

(assert start!65618)

(declare-fun b!294164 () Bool)

(declare-fun res!242906 () Bool)

(declare-fun e!210184 () Bool)

(assert (=> b!294164 (=> (not res!242906) (not e!210184))))

(declare-datatypes ((array!17601 0))(
  ( (array!17602 (arr!8661 (Array (_ BitVec 32) (_ BitVec 8))) (size!7626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13256 0))(
  ( (BitStream!13257 (buf!7689 array!17601) (currentByte!14180 (_ BitVec 32)) (currentBit!14175 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13256)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294164 (= res!242906 (validate_offset_bits!1 ((_ sign_extend 32) (size!7626 (buf!7689 thiss!1728))) ((_ sign_extend 32) (currentByte!14180 thiss!1728)) ((_ sign_extend 32) (currentBit!14175 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294165 () Bool)

(declare-fun res!242909 () Bool)

(assert (=> b!294165 (=> (not res!242909) (not e!210184))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294165 (= res!242909 (bvslt from!505 to!474))))

(declare-fun res!242907 () Bool)

(assert (=> start!65618 (=> (not res!242907) (not e!210184))))

(declare-fun arr!273 () array!17601)

(assert (=> start!65618 (= res!242907 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7626 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65618 e!210184))

(declare-fun e!210185 () Bool)

(declare-fun inv!12 (BitStream!13256) Bool)

(assert (=> start!65618 (and (inv!12 thiss!1728) e!210185)))

(assert (=> start!65618 true))

(declare-fun array_inv!7238 (array!17601) Bool)

(assert (=> start!65618 (array_inv!7238 arr!273)))

(declare-fun b!294166 () Bool)

(assert (=> b!294166 (= e!210185 (array_inv!7238 (buf!7689 thiss!1728)))))

(declare-fun b!294167 () Bool)

(assert (=> b!294167 (= e!210184 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!427178 () array!17601)

(declare-fun arrayBitRangesEq!0 (array!17601 array!17601 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294167 (arrayBitRangesEq!0 arr!273 lt!427178 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23126 0))(
  ( (tuple2!23127 (_1!12882 Bool) (_2!12882 BitStream!13256)) )
))
(declare-fun lt!427182 () tuple2!23126)

(declare-datatypes ((Unit!20477 0))(
  ( (Unit!20478) )
))
(declare-fun lt!427180 () Unit!20477)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17601 (_ BitVec 64) Bool) Unit!20477)

(assert (=> b!294167 (= lt!427180 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12882 lt!427182)))))

(declare-fun e!210186 () Bool)

(assert (=> b!294167 e!210186))

(declare-fun res!242908 () Bool)

(assert (=> b!294167 (=> (not res!242908) (not e!210186))))

(declare-datatypes ((tuple3!1768 0))(
  ( (tuple3!1769 (_1!12883 Unit!20477) (_2!12883 BitStream!13256) (_3!1319 array!17601)) )
))
(declare-fun lt!427181 () tuple3!1768)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294167 (= res!242908 (= (bvsub (bvadd (bitIndex!0 (size!7626 (buf!7689 thiss!1728)) (currentByte!14180 thiss!1728) (currentBit!14175 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7626 (buf!7689 (_2!12883 lt!427181))) (currentByte!14180 (_2!12883 lt!427181)) (currentBit!14175 (_2!12883 lt!427181)))))))

(declare-fun readBitsLoop!0 (BitStream!13256 (_ BitVec 64) array!17601 (_ BitVec 64) (_ BitVec 64)) tuple3!1768)

(assert (=> b!294167 (= lt!427181 (readBitsLoop!0 (_2!12882 lt!427182) nBits!523 lt!427178 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294167 (validate_offset_bits!1 ((_ sign_extend 32) (size!7626 (buf!7689 (_2!12882 lt!427182)))) ((_ sign_extend 32) (currentByte!14180 (_2!12882 lt!427182))) ((_ sign_extend 32) (currentBit!14175 (_2!12882 lt!427182))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427176 () Unit!20477)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13256 BitStream!13256 (_ BitVec 64) (_ BitVec 64)) Unit!20477)

(assert (=> b!294167 (= lt!427176 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12882 lt!427182) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427179 () (_ BitVec 32))

(declare-fun lt!427177 () (_ BitVec 32))

(assert (=> b!294167 (= lt!427178 (array!17602 (store (arr!8661 arr!273) lt!427179 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8661 arr!273) lt!427179)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427177)))) ((_ sign_extend 24) (ite (_1!12882 lt!427182) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427177) #b00000000))))) (size!7626 arr!273)))))

(assert (=> b!294167 (= lt!427177 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294167 (= lt!427179 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13256) tuple2!23126)

(assert (=> b!294167 (= lt!427182 (readBit!0 thiss!1728))))

(declare-fun b!294168 () Bool)

(assert (=> b!294168 (= e!210186 (and (= (buf!7689 thiss!1728) (buf!7689 (_2!12883 lt!427181))) (= (size!7626 arr!273) (size!7626 (_3!1319 lt!427181)))))))

(assert (= (and start!65618 res!242907) b!294164))

(assert (= (and b!294164 res!242906) b!294165))

(assert (= (and b!294165 res!242909) b!294167))

(assert (= (and b!294167 res!242908) b!294168))

(assert (= start!65618 b!294166))

(declare-fun m!430225 () Bool)

(assert (=> b!294164 m!430225))

(declare-fun m!430227 () Bool)

(assert (=> start!65618 m!430227))

(declare-fun m!430229 () Bool)

(assert (=> start!65618 m!430229))

(declare-fun m!430231 () Bool)

(assert (=> b!294166 m!430231))

(declare-fun m!430233 () Bool)

(assert (=> b!294167 m!430233))

(declare-fun m!430235 () Bool)

(assert (=> b!294167 m!430235))

(declare-fun m!430237 () Bool)

(assert (=> b!294167 m!430237))

(declare-fun m!430239 () Bool)

(assert (=> b!294167 m!430239))

(declare-fun m!430241 () Bool)

(assert (=> b!294167 m!430241))

(declare-fun m!430243 () Bool)

(assert (=> b!294167 m!430243))

(declare-fun m!430245 () Bool)

(assert (=> b!294167 m!430245))

(declare-fun m!430247 () Bool)

(assert (=> b!294167 m!430247))

(declare-fun m!430249 () Bool)

(assert (=> b!294167 m!430249))

(declare-fun m!430251 () Bool)

(assert (=> b!294167 m!430251))

(declare-fun m!430253 () Bool)

(assert (=> b!294167 m!430253))

(push 1)

(assert (not b!294166))

(assert (not b!294164))

(assert (not start!65618))

(assert (not b!294167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

