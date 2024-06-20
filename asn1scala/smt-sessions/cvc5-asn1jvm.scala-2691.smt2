; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65806 () Bool)

(assert start!65806)

(declare-fun b!295205 () Bool)

(declare-fun e!211101 () Bool)

(declare-datatypes ((array!17681 0))(
  ( (array!17682 (arr!8704 (Array (_ BitVec 32) (_ BitVec 8))) (size!7663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13330 0))(
  ( (BitStream!13331 (buf!7726 array!17681) (currentByte!14229 (_ BitVec 32)) (currentBit!14224 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13330)

(declare-fun array_inv!7275 (array!17681) Bool)

(assert (=> b!295205 (= e!211101 (array_inv!7275 (buf!7726 thiss!1728)))))

(declare-fun b!295206 () Bool)

(declare-fun res!243743 () Bool)

(declare-fun e!211104 () Bool)

(assert (=> b!295206 (=> (not res!243743) (not e!211104))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295206 (= res!243743 (validate_offset_bits!1 ((_ sign_extend 32) (size!7663 (buf!7726 thiss!1728))) ((_ sign_extend 32) (currentByte!14229 thiss!1728)) ((_ sign_extend 32) (currentBit!14224 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243742 () Bool)

(assert (=> start!65806 (=> (not res!243742) (not e!211104))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17681)

(assert (=> start!65806 (= res!243742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7663 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65806 e!211104))

(declare-fun inv!12 (BitStream!13330) Bool)

(assert (=> start!65806 (and (inv!12 thiss!1728) e!211101)))

(assert (=> start!65806 true))

(assert (=> start!65806 (array_inv!7275 arr!273)))

(declare-fun e!211100 () Bool)

(declare-fun b!295207 () Bool)

(declare-datatypes ((Unit!20575 0))(
  ( (Unit!20576) )
))
(declare-datatypes ((tuple3!1842 0))(
  ( (tuple3!1843 (_1!12974 Unit!20575) (_2!12974 BitStream!13330) (_3!1362 array!17681)) )
))
(declare-fun lt!429130 () tuple3!1842)

(assert (=> b!295207 (= e!211100 (and (= (buf!7726 thiss!1728) (buf!7726 (_2!12974 lt!429130))) (= (size!7663 arr!273) (size!7663 (_3!1362 lt!429130)))))))

(declare-fun b!295208 () Bool)

(declare-fun res!243740 () Bool)

(assert (=> b!295208 (=> (not res!243740) (not e!211104))))

(assert (=> b!295208 (= res!243740 (bvslt from!505 to!474))))

(declare-fun b!295209 () Bool)

(assert (=> b!295209 (= e!211104 (not true))))

(declare-fun lt!429134 () array!17681)

(declare-fun bitAt!0 (array!17681 (_ BitVec 64)) Bool)

(assert (=> b!295209 (= (bitAt!0 lt!429134 from!505) (bitAt!0 (_3!1362 lt!429130) from!505))))

(declare-fun lt!429133 () Unit!20575)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17681 array!17681 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20575)

(assert (=> b!295209 (= lt!429133 (arrayBitRangesEqImpliesEq!0 lt!429134 (_3!1362 lt!429130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17681 array!17681 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295209 (arrayBitRangesEq!0 arr!273 (_3!1362 lt!429130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429135 () Unit!20575)

(declare-fun arrayBitRangesEqTransitive!0 (array!17681 array!17681 array!17681 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20575)

(assert (=> b!295209 (= lt!429135 (arrayBitRangesEqTransitive!0 arr!273 lt!429134 (_3!1362 lt!429130) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295209 (arrayBitRangesEq!0 arr!273 lt!429134 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429128 () Unit!20575)

(declare-datatypes ((tuple2!23224 0))(
  ( (tuple2!23225 (_1!12975 Bool) (_2!12975 BitStream!13330)) )
))
(declare-fun lt!429129 () tuple2!23224)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17681 (_ BitVec 64) Bool) Unit!20575)

(assert (=> b!295209 (= lt!429128 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12975 lt!429129)))))

(assert (=> b!295209 e!211100))

(declare-fun res!243741 () Bool)

(assert (=> b!295209 (=> (not res!243741) (not e!211100))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295209 (= res!243741 (= (bvsub (bvadd (bitIndex!0 (size!7663 (buf!7726 thiss!1728)) (currentByte!14229 thiss!1728) (currentBit!14224 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7663 (buf!7726 (_2!12974 lt!429130))) (currentByte!14229 (_2!12974 lt!429130)) (currentBit!14224 (_2!12974 lt!429130)))))))

(declare-fun readBitsLoop!0 (BitStream!13330 (_ BitVec 64) array!17681 (_ BitVec 64) (_ BitVec 64)) tuple3!1842)

(assert (=> b!295209 (= lt!429130 (readBitsLoop!0 (_2!12975 lt!429129) nBits!523 lt!429134 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295209 (validate_offset_bits!1 ((_ sign_extend 32) (size!7663 (buf!7726 (_2!12975 lt!429129)))) ((_ sign_extend 32) (currentByte!14229 (_2!12975 lt!429129))) ((_ sign_extend 32) (currentBit!14224 (_2!12975 lt!429129))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429132 () Unit!20575)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13330 BitStream!13330 (_ BitVec 64) (_ BitVec 64)) Unit!20575)

(assert (=> b!295209 (= lt!429132 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12975 lt!429129) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429131 () (_ BitVec 32))

(declare-fun lt!429127 () (_ BitVec 32))

(assert (=> b!295209 (= lt!429134 (array!17682 (store (arr!8704 arr!273) lt!429131 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8704 arr!273) lt!429131)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429127)))) ((_ sign_extend 24) (ite (_1!12975 lt!429129) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429127) #b00000000))))) (size!7663 arr!273)))))

(assert (=> b!295209 (= lt!429127 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295209 (= lt!429131 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13330) tuple2!23224)

(assert (=> b!295209 (= lt!429129 (readBit!0 thiss!1728))))

(assert (= (and start!65806 res!243742) b!295206))

(assert (= (and b!295206 res!243743) b!295208))

(assert (= (and b!295208 res!243740) b!295209))

(assert (= (and b!295209 res!243741) b!295207))

(assert (= start!65806 b!295205))

(declare-fun m!432211 () Bool)

(assert (=> b!295205 m!432211))

(declare-fun m!432213 () Bool)

(assert (=> b!295206 m!432213))

(declare-fun m!432215 () Bool)

(assert (=> start!65806 m!432215))

(declare-fun m!432217 () Bool)

(assert (=> start!65806 m!432217))

(declare-fun m!432219 () Bool)

(assert (=> b!295209 m!432219))

(declare-fun m!432221 () Bool)

(assert (=> b!295209 m!432221))

(declare-fun m!432223 () Bool)

(assert (=> b!295209 m!432223))

(declare-fun m!432225 () Bool)

(assert (=> b!295209 m!432225))

(declare-fun m!432227 () Bool)

(assert (=> b!295209 m!432227))

(declare-fun m!432229 () Bool)

(assert (=> b!295209 m!432229))

(declare-fun m!432231 () Bool)

(assert (=> b!295209 m!432231))

(declare-fun m!432233 () Bool)

(assert (=> b!295209 m!432233))

(declare-fun m!432235 () Bool)

(assert (=> b!295209 m!432235))

(declare-fun m!432237 () Bool)

(assert (=> b!295209 m!432237))

(declare-fun m!432239 () Bool)

(assert (=> b!295209 m!432239))

(declare-fun m!432241 () Bool)

(assert (=> b!295209 m!432241))

(declare-fun m!432243 () Bool)

(assert (=> b!295209 m!432243))

(declare-fun m!432245 () Bool)

(assert (=> b!295209 m!432245))

(declare-fun m!432247 () Bool)

(assert (=> b!295209 m!432247))

(declare-fun m!432249 () Bool)

(assert (=> b!295209 m!432249))

(push 1)

(assert (not b!295206))

(assert (not start!65806))

(assert (not b!295209))

(assert (not b!295205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

