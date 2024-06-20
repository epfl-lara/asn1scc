; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66056 () Bool)

(assert start!66056)

(declare-fun b!296186 () Bool)

(declare-fun e!211886 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!296186 (= e!211886 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!296187 () Bool)

(declare-fun e!211887 () Bool)

(assert (=> b!296187 (= e!211887 (not e!211886))))

(declare-fun res!244536 () Bool)

(assert (=> b!296187 (=> res!244536 e!211886)))

(declare-fun lt!431364 () Bool)

(declare-datatypes ((array!17724 0))(
  ( (array!17725 (arr!8739 (Array (_ BitVec 32) (_ BitVec 8))) (size!7680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13364 0))(
  ( (BitStream!13365 (buf!7743 array!17724) (currentByte!14264 (_ BitVec 32)) (currentBit!14259 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13364)

(declare-datatypes ((tuple2!23304 0))(
  ( (tuple2!23305 (_1!13040 BitStream!13364) (_2!13040 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13364) tuple2!23304)

(assert (=> b!296187 (= res!244536 (not (= lt!431364 (_2!13040 (readBitPure!0 thiss!1728)))))))

(declare-fun e!211890 () Bool)

(assert (=> b!296187 e!211890))

(declare-fun res!244538 () Bool)

(assert (=> b!296187 (=> (not res!244538) (not e!211890))))

(declare-fun lt!431365 () array!17724)

(declare-fun bitAt!0 (array!17724 (_ BitVec 64)) Bool)

(assert (=> b!296187 (= res!244538 (= (bitAt!0 lt!431365 from!505) lt!431364))))

(declare-datatypes ((Unit!20645 0))(
  ( (Unit!20646) )
))
(declare-datatypes ((tuple3!1876 0))(
  ( (tuple3!1877 (_1!13041 Unit!20645) (_2!13041 BitStream!13364) (_3!1388 array!17724)) )
))
(declare-fun lt!431366 () tuple3!1876)

(assert (=> b!296187 (= lt!431364 (bitAt!0 (_3!1388 lt!431366) from!505))))

(declare-fun lt!431363 () Unit!20645)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17724 array!17724 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20645)

(assert (=> b!296187 (= lt!431363 (arrayBitRangesEqImpliesEq!0 lt!431365 (_3!1388 lt!431366) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17724)

(declare-fun arrayBitRangesEq!0 (array!17724 array!17724 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296187 (arrayBitRangesEq!0 arr!273 (_3!1388 lt!431366) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431358 () Unit!20645)

(declare-fun arrayBitRangesEqTransitive!0 (array!17724 array!17724 array!17724 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20645)

(assert (=> b!296187 (= lt!431358 (arrayBitRangesEqTransitive!0 arr!273 lt!431365 (_3!1388 lt!431366) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296187 (arrayBitRangesEq!0 arr!273 lt!431365 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23306 0))(
  ( (tuple2!23307 (_1!13042 Bool) (_2!13042 BitStream!13364)) )
))
(declare-fun lt!431361 () tuple2!23306)

(declare-fun lt!431362 () Unit!20645)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17724 (_ BitVec 64) Bool) Unit!20645)

(assert (=> b!296187 (= lt!431362 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13042 lt!431361)))))

(declare-fun e!211888 () Bool)

(assert (=> b!296187 e!211888))

(declare-fun res!244537 () Bool)

(assert (=> b!296187 (=> (not res!244537) (not e!211888))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296187 (= res!244537 (= (bvsub (bvadd (bitIndex!0 (size!7680 (buf!7743 thiss!1728)) (currentByte!14264 thiss!1728) (currentBit!14259 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7680 (buf!7743 (_2!13041 lt!431366))) (currentByte!14264 (_2!13041 lt!431366)) (currentBit!14259 (_2!13041 lt!431366)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13364 (_ BitVec 64) array!17724 (_ BitVec 64) (_ BitVec 64)) tuple3!1876)

(assert (=> b!296187 (= lt!431366 (readBitsLoop!0 (_2!13042 lt!431361) nBits!523 lt!431365 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296187 (validate_offset_bits!1 ((_ sign_extend 32) (size!7680 (buf!7743 (_2!13042 lt!431361)))) ((_ sign_extend 32) (currentByte!14264 (_2!13042 lt!431361))) ((_ sign_extend 32) (currentBit!14259 (_2!13042 lt!431361))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431359 () Unit!20645)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13364 BitStream!13364 (_ BitVec 64) (_ BitVec 64)) Unit!20645)

(assert (=> b!296187 (= lt!431359 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13042 lt!431361) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431367 () (_ BitVec 32))

(declare-fun lt!431360 () (_ BitVec 32))

(assert (=> b!296187 (= lt!431365 (array!17725 (store (arr!8739 arr!273) lt!431367 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8739 arr!273) lt!431367)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431360)))) ((_ sign_extend 24) (ite (_1!13042 lt!431361) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431360) #b00000000))))) (size!7680 arr!273)))))

(assert (=> b!296187 (= lt!431360 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296187 (= lt!431367 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13364) tuple2!23306)

(assert (=> b!296187 (= lt!431361 (readBit!0 thiss!1728))))

(declare-fun b!296188 () Bool)

(declare-fun e!211884 () Bool)

(declare-fun array_inv!7292 (array!17724) Bool)

(assert (=> b!296188 (= e!211884 (array_inv!7292 (buf!7743 thiss!1728)))))

(declare-fun b!296189 () Bool)

(assert (=> b!296189 (= e!211888 (and (= (buf!7743 thiss!1728) (buf!7743 (_2!13041 lt!431366))) (= (size!7680 arr!273) (size!7680 (_3!1388 lt!431366)))))))

(declare-fun b!296190 () Bool)

(declare-fun res!244540 () Bool)

(assert (=> b!296190 (=> (not res!244540) (not e!211887))))

(assert (=> b!296190 (= res!244540 (bvslt from!505 to!474))))

(declare-fun b!296192 () Bool)

(declare-fun res!244539 () Bool)

(assert (=> b!296192 (=> res!244539 e!211886)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296192 (= res!244539 (not (invariant!0 (currentBit!14259 (_2!13041 lt!431366)) (currentByte!14264 (_2!13041 lt!431366)) (size!7680 (buf!7743 (_2!13041 lt!431366))))))))

(declare-fun b!296193 () Bool)

(declare-fun res!244535 () Bool)

(assert (=> b!296193 (=> (not res!244535) (not e!211887))))

(assert (=> b!296193 (= res!244535 (validate_offset_bits!1 ((_ sign_extend 32) (size!7680 (buf!7743 thiss!1728))) ((_ sign_extend 32) (currentByte!14264 thiss!1728)) ((_ sign_extend 32) (currentBit!14259 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!244541 () Bool)

(assert (=> start!66056 (=> (not res!244541) (not e!211887))))

(assert (=> start!66056 (= res!244541 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7680 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66056 e!211887))

(declare-fun inv!12 (BitStream!13364) Bool)

(assert (=> start!66056 (and (inv!12 thiss!1728) e!211884)))

(assert (=> start!66056 true))

(assert (=> start!66056 (array_inv!7292 arr!273)))

(declare-fun b!296191 () Bool)

(assert (=> b!296191 (= e!211890 (= lt!431364 (_1!13042 lt!431361)))))

(assert (= (and start!66056 res!244541) b!296193))

(assert (= (and b!296193 res!244535) b!296190))

(assert (= (and b!296190 res!244540) b!296187))

(assert (= (and b!296187 res!244537) b!296189))

(assert (= (and b!296187 res!244538) b!296191))

(assert (= (and b!296187 (not res!244536)) b!296192))

(assert (= (and b!296192 (not res!244539)) b!296186))

(assert (= start!66056 b!296188))

(declare-fun m!434081 () Bool)

(assert (=> b!296188 m!434081))

(declare-fun m!434083 () Bool)

(assert (=> b!296192 m!434083))

(declare-fun m!434085 () Bool)

(assert (=> b!296187 m!434085))

(declare-fun m!434087 () Bool)

(assert (=> b!296187 m!434087))

(declare-fun m!434089 () Bool)

(assert (=> b!296187 m!434089))

(declare-fun m!434091 () Bool)

(assert (=> b!296187 m!434091))

(declare-fun m!434093 () Bool)

(assert (=> b!296187 m!434093))

(declare-fun m!434095 () Bool)

(assert (=> b!296187 m!434095))

(declare-fun m!434097 () Bool)

(assert (=> b!296187 m!434097))

(declare-fun m!434099 () Bool)

(assert (=> b!296187 m!434099))

(declare-fun m!434101 () Bool)

(assert (=> b!296187 m!434101))

(declare-fun m!434103 () Bool)

(assert (=> b!296187 m!434103))

(declare-fun m!434105 () Bool)

(assert (=> b!296187 m!434105))

(declare-fun m!434107 () Bool)

(assert (=> b!296187 m!434107))

(declare-fun m!434109 () Bool)

(assert (=> b!296187 m!434109))

(declare-fun m!434111 () Bool)

(assert (=> b!296187 m!434111))

(declare-fun m!434113 () Bool)

(assert (=> b!296187 m!434113))

(declare-fun m!434115 () Bool)

(assert (=> b!296187 m!434115))

(declare-fun m!434117 () Bool)

(assert (=> b!296187 m!434117))

(declare-fun m!434119 () Bool)

(assert (=> b!296193 m!434119))

(declare-fun m!434121 () Bool)

(assert (=> start!66056 m!434121))

(declare-fun m!434123 () Bool)

(assert (=> start!66056 m!434123))

(push 1)

(assert (not b!296193))

(assert (not b!296188))

(assert (not start!66056))

(assert (not b!296192))

(assert (not b!296187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

