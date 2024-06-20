; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65614 () Bool)

(assert start!65614)

(declare-fun e!210154 () Bool)

(declare-datatypes ((array!17597 0))(
  ( (array!17598 (arr!8659 (Array (_ BitVec 32) (_ BitVec 8))) (size!7624 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13252 0))(
  ( (BitStream!13253 (buf!7687 array!17597) (currentByte!14178 (_ BitVec 32)) (currentBit!14173 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13252)

(declare-fun b!294134 () Bool)

(declare-datatypes ((Unit!20473 0))(
  ( (Unit!20474) )
))
(declare-datatypes ((tuple3!1764 0))(
  ( (tuple3!1765 (_1!12878 Unit!20473) (_2!12878 BitStream!13252) (_3!1317 array!17597)) )
))
(declare-fun lt!427134 () tuple3!1764)

(declare-fun arr!273 () array!17597)

(assert (=> b!294134 (= e!210154 (and (= (buf!7687 thiss!1728) (buf!7687 (_2!12878 lt!427134))) (= (size!7624 arr!273) (size!7624 (_3!1317 lt!427134)))))))

(declare-fun b!294135 () Bool)

(declare-fun res!242885 () Bool)

(declare-fun e!210156 () Bool)

(assert (=> b!294135 (=> (not res!242885) (not e!210156))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294135 (= res!242885 (validate_offset_bits!1 ((_ sign_extend 32) (size!7624 (buf!7687 thiss!1728))) ((_ sign_extend 32) (currentByte!14178 thiss!1728)) ((_ sign_extend 32) (currentBit!14173 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294136 () Bool)

(assert (=> b!294136 (= e!210156 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!427135 () array!17597)

(declare-fun arrayBitRangesEq!0 (array!17597 array!17597 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294136 (arrayBitRangesEq!0 arr!273 lt!427135 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23122 0))(
  ( (tuple2!23123 (_1!12879 Bool) (_2!12879 BitStream!13252)) )
))
(declare-fun lt!427139 () tuple2!23122)

(declare-fun lt!427136 () Unit!20473)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17597 (_ BitVec 64) Bool) Unit!20473)

(assert (=> b!294136 (= lt!427136 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12879 lt!427139)))))

(assert (=> b!294136 e!210154))

(declare-fun res!242884 () Bool)

(assert (=> b!294136 (=> (not res!242884) (not e!210154))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294136 (= res!242884 (= (bvsub (bvadd (bitIndex!0 (size!7624 (buf!7687 thiss!1728)) (currentByte!14178 thiss!1728) (currentBit!14173 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7624 (buf!7687 (_2!12878 lt!427134))) (currentByte!14178 (_2!12878 lt!427134)) (currentBit!14173 (_2!12878 lt!427134)))))))

(declare-fun readBitsLoop!0 (BitStream!13252 (_ BitVec 64) array!17597 (_ BitVec 64) (_ BitVec 64)) tuple3!1764)

(assert (=> b!294136 (= lt!427134 (readBitsLoop!0 (_2!12879 lt!427139) nBits!523 lt!427135 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294136 (validate_offset_bits!1 ((_ sign_extend 32) (size!7624 (buf!7687 (_2!12879 lt!427139)))) ((_ sign_extend 32) (currentByte!14178 (_2!12879 lt!427139))) ((_ sign_extend 32) (currentBit!14173 (_2!12879 lt!427139))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427138 () Unit!20473)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13252 BitStream!13252 (_ BitVec 64) (_ BitVec 64)) Unit!20473)

(assert (=> b!294136 (= lt!427138 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12879 lt!427139) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427137 () (_ BitVec 32))

(declare-fun lt!427140 () (_ BitVec 32))

(assert (=> b!294136 (= lt!427135 (array!17598 (store (arr!8659 arr!273) lt!427140 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8659 arr!273) lt!427140)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427137)))) ((_ sign_extend 24) (ite (_1!12879 lt!427139) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427137) #b00000000))))) (size!7624 arr!273)))))

(assert (=> b!294136 (= lt!427137 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294136 (= lt!427140 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13252) tuple2!23122)

(assert (=> b!294136 (= lt!427139 (readBit!0 thiss!1728))))

(declare-fun res!242882 () Bool)

(assert (=> start!65614 (=> (not res!242882) (not e!210156))))

(assert (=> start!65614 (= res!242882 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7624 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65614 e!210156))

(declare-fun e!210153 () Bool)

(declare-fun inv!12 (BitStream!13252) Bool)

(assert (=> start!65614 (and (inv!12 thiss!1728) e!210153)))

(assert (=> start!65614 true))

(declare-fun array_inv!7236 (array!17597) Bool)

(assert (=> start!65614 (array_inv!7236 arr!273)))

(declare-fun b!294137 () Bool)

(assert (=> b!294137 (= e!210153 (array_inv!7236 (buf!7687 thiss!1728)))))

(declare-fun b!294138 () Bool)

(declare-fun res!242883 () Bool)

(assert (=> b!294138 (=> (not res!242883) (not e!210156))))

(assert (=> b!294138 (= res!242883 (bvslt from!505 to!474))))

(assert (= (and start!65614 res!242882) b!294135))

(assert (= (and b!294135 res!242885) b!294138))

(assert (= (and b!294138 res!242883) b!294136))

(assert (= (and b!294136 res!242884) b!294134))

(assert (= start!65614 b!294137))

(declare-fun m!430165 () Bool)

(assert (=> b!294135 m!430165))

(declare-fun m!430167 () Bool)

(assert (=> b!294136 m!430167))

(declare-fun m!430169 () Bool)

(assert (=> b!294136 m!430169))

(declare-fun m!430171 () Bool)

(assert (=> b!294136 m!430171))

(declare-fun m!430173 () Bool)

(assert (=> b!294136 m!430173))

(declare-fun m!430175 () Bool)

(assert (=> b!294136 m!430175))

(declare-fun m!430177 () Bool)

(assert (=> b!294136 m!430177))

(declare-fun m!430179 () Bool)

(assert (=> b!294136 m!430179))

(declare-fun m!430181 () Bool)

(assert (=> b!294136 m!430181))

(declare-fun m!430183 () Bool)

(assert (=> b!294136 m!430183))

(declare-fun m!430185 () Bool)

(assert (=> b!294136 m!430185))

(declare-fun m!430187 () Bool)

(assert (=> b!294136 m!430187))

(declare-fun m!430189 () Bool)

(assert (=> start!65614 m!430189))

(declare-fun m!430191 () Bool)

(assert (=> start!65614 m!430191))

(declare-fun m!430193 () Bool)

(assert (=> b!294137 m!430193))

(push 1)

(assert (not start!65614))

(assert (not b!294137))

(assert (not b!294136))

(assert (not b!294135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

