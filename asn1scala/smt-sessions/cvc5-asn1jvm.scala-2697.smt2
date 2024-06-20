; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66058 () Bool)

(assert start!66058)

(declare-fun b!296206 () Bool)

(declare-fun e!211907 () Bool)

(declare-datatypes ((array!17726 0))(
  ( (array!17727 (arr!8740 (Array (_ BitVec 32) (_ BitVec 8))) (size!7681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13366 0))(
  ( (BitStream!13367 (buf!7744 array!17726) (currentByte!14265 (_ BitVec 32)) (currentBit!14260 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13366)

(declare-fun array_inv!7293 (array!17726) Bool)

(assert (=> b!296206 (= e!211907 (array_inv!7293 (buf!7744 thiss!1728)))))

(declare-fun b!296207 () Bool)

(declare-fun e!211905 () Bool)

(declare-fun lt!431397 () Bool)

(declare-datatypes ((tuple2!23308 0))(
  ( (tuple2!23309 (_1!13043 Bool) (_2!13043 BitStream!13366)) )
))
(declare-fun lt!431394 () tuple2!23308)

(assert (=> b!296207 (= e!211905 (= lt!431397 (_1!13043 lt!431394)))))

(declare-fun b!296208 () Bool)

(declare-fun e!211908 () Bool)

(declare-datatypes ((Unit!20647 0))(
  ( (Unit!20648) )
))
(declare-datatypes ((tuple3!1878 0))(
  ( (tuple3!1879 (_1!13044 Unit!20647) (_2!13044 BitStream!13366) (_3!1389 array!17726)) )
))
(declare-fun lt!431396 () tuple3!1878)

(declare-fun arr!273 () array!17726)

(assert (=> b!296208 (= e!211908 (and (= (buf!7744 thiss!1728) (buf!7744 (_2!13044 lt!431396))) (= (size!7681 arr!273) (size!7681 (_3!1389 lt!431396)))))))

(declare-fun b!296210 () Bool)

(declare-fun res!244552 () Bool)

(declare-fun e!211903 () Bool)

(assert (=> b!296210 (=> (not res!244552) (not e!211903))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!296210 (= res!244552 (bvslt from!505 to!474))))

(declare-fun b!296211 () Bool)

(assert (=> b!296211 (= e!211903 (not true))))

(assert (=> b!296211 e!211905))

(declare-fun res!244553 () Bool)

(assert (=> b!296211 (=> (not res!244553) (not e!211905))))

(declare-fun lt!431390 () array!17726)

(declare-fun bitAt!0 (array!17726 (_ BitVec 64)) Bool)

(assert (=> b!296211 (= res!244553 (= (bitAt!0 lt!431390 from!505) lt!431397))))

(assert (=> b!296211 (= lt!431397 (bitAt!0 (_3!1389 lt!431396) from!505))))

(declare-fun lt!431388 () Unit!20647)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17726 array!17726 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20647)

(assert (=> b!296211 (= lt!431388 (arrayBitRangesEqImpliesEq!0 lt!431390 (_3!1389 lt!431396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17726 array!17726 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296211 (arrayBitRangesEq!0 arr!273 (_3!1389 lt!431396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431392 () Unit!20647)

(declare-fun arrayBitRangesEqTransitive!0 (array!17726 array!17726 array!17726 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20647)

(assert (=> b!296211 (= lt!431392 (arrayBitRangesEqTransitive!0 arr!273 lt!431390 (_3!1389 lt!431396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296211 (arrayBitRangesEq!0 arr!273 lt!431390 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431395 () Unit!20647)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17726 (_ BitVec 64) Bool) Unit!20647)

(assert (=> b!296211 (= lt!431395 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13043 lt!431394)))))

(assert (=> b!296211 e!211908))

(declare-fun res!244556 () Bool)

(assert (=> b!296211 (=> (not res!244556) (not e!211908))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296211 (= res!244556 (= (bvsub (bvadd (bitIndex!0 (size!7681 (buf!7744 thiss!1728)) (currentByte!14265 thiss!1728) (currentBit!14260 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7681 (buf!7744 (_2!13044 lt!431396))) (currentByte!14265 (_2!13044 lt!431396)) (currentBit!14260 (_2!13044 lt!431396)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13366 (_ BitVec 64) array!17726 (_ BitVec 64) (_ BitVec 64)) tuple3!1878)

(assert (=> b!296211 (= lt!431396 (readBitsLoop!0 (_2!13043 lt!431394) nBits!523 lt!431390 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296211 (validate_offset_bits!1 ((_ sign_extend 32) (size!7681 (buf!7744 (_2!13043 lt!431394)))) ((_ sign_extend 32) (currentByte!14265 (_2!13043 lt!431394))) ((_ sign_extend 32) (currentBit!14260 (_2!13043 lt!431394))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431391 () Unit!20647)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13366 BitStream!13366 (_ BitVec 64) (_ BitVec 64)) Unit!20647)

(assert (=> b!296211 (= lt!431391 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13043 lt!431394) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431393 () (_ BitVec 32))

(declare-fun lt!431389 () (_ BitVec 32))

(assert (=> b!296211 (= lt!431390 (array!17727 (store (arr!8740 arr!273) lt!431393 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8740 arr!273) lt!431393)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431389)))) ((_ sign_extend 24) (ite (_1!13043 lt!431394) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431389) #b00000000))))) (size!7681 arr!273)))))

(assert (=> b!296211 (= lt!431389 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296211 (= lt!431393 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13366) tuple2!23308)

(assert (=> b!296211 (= lt!431394 (readBit!0 thiss!1728))))

(declare-fun res!244555 () Bool)

(assert (=> start!66058 (=> (not res!244555) (not e!211903))))

(assert (=> start!66058 (= res!244555 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7681 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66058 e!211903))

(declare-fun inv!12 (BitStream!13366) Bool)

(assert (=> start!66058 (and (inv!12 thiss!1728) e!211907)))

(assert (=> start!66058 true))

(assert (=> start!66058 (array_inv!7293 arr!273)))

(declare-fun b!296209 () Bool)

(declare-fun res!244554 () Bool)

(assert (=> b!296209 (=> (not res!244554) (not e!211903))))

(assert (=> b!296209 (= res!244554 (validate_offset_bits!1 ((_ sign_extend 32) (size!7681 (buf!7744 thiss!1728))) ((_ sign_extend 32) (currentByte!14265 thiss!1728)) ((_ sign_extend 32) (currentBit!14260 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66058 res!244555) b!296209))

(assert (= (and b!296209 res!244554) b!296210))

(assert (= (and b!296210 res!244552) b!296211))

(assert (= (and b!296211 res!244556) b!296208))

(assert (= (and b!296211 res!244553) b!296207))

(assert (= start!66058 b!296206))

(declare-fun m!434125 () Bool)

(assert (=> b!296206 m!434125))

(declare-fun m!434127 () Bool)

(assert (=> b!296211 m!434127))

(declare-fun m!434129 () Bool)

(assert (=> b!296211 m!434129))

(declare-fun m!434131 () Bool)

(assert (=> b!296211 m!434131))

(declare-fun m!434133 () Bool)

(assert (=> b!296211 m!434133))

(declare-fun m!434135 () Bool)

(assert (=> b!296211 m!434135))

(declare-fun m!434137 () Bool)

(assert (=> b!296211 m!434137))

(declare-fun m!434139 () Bool)

(assert (=> b!296211 m!434139))

(declare-fun m!434141 () Bool)

(assert (=> b!296211 m!434141))

(declare-fun m!434143 () Bool)

(assert (=> b!296211 m!434143))

(declare-fun m!434145 () Bool)

(assert (=> b!296211 m!434145))

(declare-fun m!434147 () Bool)

(assert (=> b!296211 m!434147))

(declare-fun m!434149 () Bool)

(assert (=> b!296211 m!434149))

(declare-fun m!434151 () Bool)

(assert (=> b!296211 m!434151))

(declare-fun m!434153 () Bool)

(assert (=> b!296211 m!434153))

(declare-fun m!434155 () Bool)

(assert (=> b!296211 m!434155))

(declare-fun m!434157 () Bool)

(assert (=> b!296211 m!434157))

(declare-fun m!434159 () Bool)

(assert (=> start!66058 m!434159))

(declare-fun m!434161 () Bool)

(assert (=> start!66058 m!434161))

(declare-fun m!434163 () Bool)

(assert (=> b!296209 m!434163))

(push 1)

(assert (not b!296209))

(assert (not b!296211))

(assert (not start!66058))

(assert (not b!296206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

