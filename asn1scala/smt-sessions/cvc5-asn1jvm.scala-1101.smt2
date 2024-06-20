; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31614 () Bool)

(assert start!31614)

(declare-fun b!158212 () Bool)

(declare-fun e!107470 () Bool)

(declare-fun e!107471 () Bool)

(assert (=> b!158212 (= e!107470 e!107471)))

(declare-fun res!132171 () Bool)

(assert (=> b!158212 (=> (not res!132171) (not e!107471))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!158212 (= res!132171 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7356 0))(
  ( (array!7357 (arr!4239 (Array (_ BitVec 32) (_ BitVec 8))) (size!3330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5848 0))(
  ( (BitStream!5849 (buf!3798 array!7356) (currentByte!6977 (_ BitVec 32)) (currentBit!6972 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5848)

(declare-datatypes ((tuple2!14420 0))(
  ( (tuple2!14421 (_1!7672 BitStream!5848) (_2!7672 array!7356)) )
))
(declare-fun lt!249359 () tuple2!14420)

(declare-fun lt!249365 () BitStream!5848)

(declare-fun arr!153 () array!7356)

(declare-fun readByteArrayLoopPure!0 (BitStream!5848 array!7356 (_ BitVec 32) (_ BitVec 32)) tuple2!14420)

(declare-datatypes ((tuple2!14422 0))(
  ( (tuple2!14423 (_1!7673 BitStream!5848) (_2!7673 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5848) tuple2!14422)

(assert (=> b!158212 (= lt!249359 (readByteArrayLoopPure!0 lt!249365 (array!7357 (store (arr!4239 arr!153) from!240 (_2!7673 (readBytePure!0 bs!65))) (size!3330 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5848 (_ BitVec 32)) BitStream!5848)

(assert (=> b!158212 (= lt!249365 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!249361 () tuple2!14420)

(assert (=> b!158212 (= lt!249361 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!158213 () Bool)

(declare-fun e!107472 () Bool)

(assert (=> b!158213 (= e!107471 (not e!107472))))

(declare-fun res!132170 () Bool)

(assert (=> b!158213 (=> res!132170 e!107472)))

(assert (=> b!158213 (= res!132170 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!249366 () (_ BitVec 64))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158213 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3330 (buf!3798 lt!249365))) lt!249366 ((_ sign_extend 32) (currentBit!6972 lt!249365)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!158213 (= lt!249366 ((_ sign_extend 32) (currentByte!6977 lt!249365)))))

(declare-datatypes ((Unit!10574 0))(
  ( (Unit!10575) )
))
(declare-fun lt!249362 () Unit!10574)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5848 BitStream!5848 (_ BitVec 64) (_ BitVec 32)) Unit!10574)

(assert (=> b!158213 (= lt!249362 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!249365 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!249360 () tuple2!14422)

(assert (=> b!158213 (= lt!249360 (readBytePure!0 lt!249365))))

(declare-fun b!158214 () Bool)

(declare-fun e!107469 () Bool)

(assert (=> b!158214 (= e!107472 e!107469)))

(declare-fun res!132173 () Bool)

(assert (=> b!158214 (=> res!132173 e!107469)))

(declare-fun lt!249364 () (_ BitVec 32))

(assert (=> b!158214 (= res!132173 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3330 (buf!3798 lt!249365))) lt!249366 ((_ sign_extend 32) (currentBit!6972 lt!249365)) lt!249364)))))

(assert (=> b!158214 (= lt!249364 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!158216 () Bool)

(declare-fun res!132172 () Bool)

(assert (=> b!158216 (=> (not res!132172) (not e!107470))))

(assert (=> b!158216 (= res!132172 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3330 (buf!3798 bs!65))) ((_ sign_extend 32) (currentByte!6977 bs!65)) ((_ sign_extend 32) (currentBit!6972 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!158217 () Bool)

(declare-fun e!107475 () Bool)

(declare-fun array_inv!3087 (array!7356) Bool)

(assert (=> b!158217 (= e!107475 (array_inv!3087 (buf!3798 bs!65)))))

(declare-fun b!158215 () Bool)

(assert (=> b!158215 (= e!107469 (bvslt lt!249364 (bvsub to!236 from!240)))))

(declare-fun lt!249358 () tuple2!14420)

(assert (=> b!158215 (= lt!249358 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!249365 #b00000000000000000000000000000001) (array!7357 (store (store (arr!4239 arr!153) from!240 (_2!7673 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7673 lt!249360)) (size!3330 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!249363 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!158215 (= lt!249363 (store (arr!4239 arr!153) from!240 (_2!7673 (readBytePure!0 bs!65))))))

(declare-fun res!132169 () Bool)

(assert (=> start!31614 (=> (not res!132169) (not e!107470))))

(assert (=> start!31614 (= res!132169 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3330 arr!153))))))

(assert (=> start!31614 e!107470))

(assert (=> start!31614 true))

(assert (=> start!31614 (array_inv!3087 arr!153)))

(declare-fun inv!12 (BitStream!5848) Bool)

(assert (=> start!31614 (and (inv!12 bs!65) e!107475)))

(assert (= (and start!31614 res!132169) b!158216))

(assert (= (and b!158216 res!132172) b!158212))

(assert (= (and b!158212 res!132171) b!158213))

(assert (= (and b!158213 (not res!132170)) b!158214))

(assert (= (and b!158214 (not res!132173)) b!158215))

(assert (= start!31614 b!158217))

(declare-fun m!248089 () Bool)

(assert (=> start!31614 m!248089))

(declare-fun m!248091 () Bool)

(assert (=> start!31614 m!248091))

(declare-fun m!248093 () Bool)

(assert (=> b!158213 m!248093))

(declare-fun m!248095 () Bool)

(assert (=> b!158213 m!248095))

(declare-fun m!248097 () Bool)

(assert (=> b!158213 m!248097))

(declare-fun m!248099 () Bool)

(assert (=> b!158214 m!248099))

(declare-fun m!248101 () Bool)

(assert (=> b!158215 m!248101))

(declare-fun m!248103 () Bool)

(assert (=> b!158215 m!248103))

(declare-fun m!248105 () Bool)

(assert (=> b!158215 m!248105))

(declare-fun m!248107 () Bool)

(assert (=> b!158215 m!248107))

(assert (=> b!158215 m!248103))

(declare-fun m!248109 () Bool)

(assert (=> b!158215 m!248109))

(assert (=> b!158212 m!248107))

(declare-fun m!248111 () Bool)

(assert (=> b!158212 m!248111))

(assert (=> b!158212 m!248109))

(declare-fun m!248113 () Bool)

(assert (=> b!158212 m!248113))

(declare-fun m!248115 () Bool)

(assert (=> b!158212 m!248115))

(declare-fun m!248117 () Bool)

(assert (=> b!158216 m!248117))

(declare-fun m!248119 () Bool)

(assert (=> b!158217 m!248119))

(push 1)

(assert (not b!158212))

(assert (not b!158217))

(assert (not start!31614))

(assert (not b!158213))

(assert (not b!158216))

(assert (not b!158215))

(assert (not b!158214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

