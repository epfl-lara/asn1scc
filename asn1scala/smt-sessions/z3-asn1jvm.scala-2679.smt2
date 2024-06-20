; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65622 () Bool)

(assert start!65622)

(declare-fun b!294194 () Bool)

(declare-fun e!210216 () Bool)

(declare-datatypes ((array!17605 0))(
  ( (array!17606 (arr!8663 (Array (_ BitVec 32) (_ BitVec 8))) (size!7628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13260 0))(
  ( (BitStream!13261 (buf!7691 array!17605) (currentByte!14182 (_ BitVec 32)) (currentBit!14177 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13260)

(declare-fun array_inv!7240 (array!17605) Bool)

(assert (=> b!294194 (= e!210216 (array_inv!7240 (buf!7691 thiss!1728)))))

(declare-fun b!294195 () Bool)

(declare-fun res!242932 () Bool)

(declare-fun e!210212 () Bool)

(assert (=> b!294195 (=> (not res!242932) (not e!210212))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294195 (= res!242932 (validate_offset_bits!1 ((_ sign_extend 32) (size!7628 (buf!7691 thiss!1728))) ((_ sign_extend 32) (currentByte!14182 thiss!1728)) ((_ sign_extend 32) (currentBit!14177 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242931 () Bool)

(assert (=> start!65622 (=> (not res!242931) (not e!210212))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17605)

(assert (=> start!65622 (= res!242931 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7628 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65622 e!210212))

(declare-fun inv!12 (BitStream!13260) Bool)

(assert (=> start!65622 (and (inv!12 thiss!1728) e!210216)))

(assert (=> start!65622 true))

(assert (=> start!65622 (array_inv!7240 arr!273)))

(declare-fun e!210215 () Bool)

(declare-datatypes ((Unit!20481 0))(
  ( (Unit!20482) )
))
(declare-datatypes ((tuple3!1772 0))(
  ( (tuple3!1773 (_1!12886 Unit!20481) (_2!12886 BitStream!13260) (_3!1321 array!17605)) )
))
(declare-fun lt!427219 () tuple3!1772)

(declare-fun b!294196 () Bool)

(assert (=> b!294196 (= e!210215 (and (= (buf!7691 thiss!1728) (buf!7691 (_2!12886 lt!427219))) (= (size!7628 arr!273) (size!7628 (_3!1321 lt!427219)))))))

(declare-fun b!294197 () Bool)

(assert (=> b!294197 (= e!210212 (not (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun lt!427223 () array!17605)

(declare-fun arrayBitRangesEq!0 (array!17605 array!17605 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294197 (arrayBitRangesEq!0 arr!273 lt!427223 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23130 0))(
  ( (tuple2!23131 (_1!12887 Bool) (_2!12887 BitStream!13260)) )
))
(declare-fun lt!427220 () tuple2!23130)

(declare-fun lt!427218 () Unit!20481)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17605 (_ BitVec 64) Bool) Unit!20481)

(assert (=> b!294197 (= lt!427218 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12887 lt!427220)))))

(assert (=> b!294197 e!210215))

(declare-fun res!242930 () Bool)

(assert (=> b!294197 (=> (not res!242930) (not e!210215))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294197 (= res!242930 (= (bvsub (bvadd (bitIndex!0 (size!7628 (buf!7691 thiss!1728)) (currentByte!14182 thiss!1728) (currentBit!14177 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7628 (buf!7691 (_2!12886 lt!427219))) (currentByte!14182 (_2!12886 lt!427219)) (currentBit!14177 (_2!12886 lt!427219)))))))

(declare-fun readBitsLoop!0 (BitStream!13260 (_ BitVec 64) array!17605 (_ BitVec 64) (_ BitVec 64)) tuple3!1772)

(assert (=> b!294197 (= lt!427219 (readBitsLoop!0 (_2!12887 lt!427220) nBits!523 lt!427223 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294197 (validate_offset_bits!1 ((_ sign_extend 32) (size!7628 (buf!7691 (_2!12887 lt!427220)))) ((_ sign_extend 32) (currentByte!14182 (_2!12887 lt!427220))) ((_ sign_extend 32) (currentBit!14177 (_2!12887 lt!427220))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427222 () Unit!20481)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13260 BitStream!13260 (_ BitVec 64) (_ BitVec 64)) Unit!20481)

(assert (=> b!294197 (= lt!427222 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12887 lt!427220) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427224 () (_ BitVec 32))

(declare-fun lt!427221 () (_ BitVec 32))

(assert (=> b!294197 (= lt!427223 (array!17606 (store (arr!8663 arr!273) lt!427224 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8663 arr!273) lt!427224)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427221)))) ((_ sign_extend 24) (ite (_1!12887 lt!427220) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427221) #b00000000))))) (size!7628 arr!273)))))

(assert (=> b!294197 (= lt!427221 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294197 (= lt!427224 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13260) tuple2!23130)

(assert (=> b!294197 (= lt!427220 (readBit!0 thiss!1728))))

(declare-fun b!294198 () Bool)

(declare-fun res!242933 () Bool)

(assert (=> b!294198 (=> (not res!242933) (not e!210212))))

(assert (=> b!294198 (= res!242933 (bvslt from!505 to!474))))

(assert (= (and start!65622 res!242931) b!294195))

(assert (= (and b!294195 res!242932) b!294198))

(assert (= (and b!294198 res!242933) b!294197))

(assert (= (and b!294197 res!242930) b!294196))

(assert (= start!65622 b!294194))

(declare-fun m!430285 () Bool)

(assert (=> b!294194 m!430285))

(declare-fun m!430287 () Bool)

(assert (=> b!294195 m!430287))

(declare-fun m!430289 () Bool)

(assert (=> start!65622 m!430289))

(declare-fun m!430291 () Bool)

(assert (=> start!65622 m!430291))

(declare-fun m!430293 () Bool)

(assert (=> b!294197 m!430293))

(declare-fun m!430295 () Bool)

(assert (=> b!294197 m!430295))

(declare-fun m!430297 () Bool)

(assert (=> b!294197 m!430297))

(declare-fun m!430299 () Bool)

(assert (=> b!294197 m!430299))

(declare-fun m!430301 () Bool)

(assert (=> b!294197 m!430301))

(declare-fun m!430303 () Bool)

(assert (=> b!294197 m!430303))

(declare-fun m!430305 () Bool)

(assert (=> b!294197 m!430305))

(declare-fun m!430307 () Bool)

(assert (=> b!294197 m!430307))

(declare-fun m!430309 () Bool)

(assert (=> b!294197 m!430309))

(declare-fun m!430311 () Bool)

(assert (=> b!294197 m!430311))

(declare-fun m!430313 () Bool)

(assert (=> b!294197 m!430313))

(check-sat (not b!294195) (not b!294194) (not start!65622) (not b!294197))
(check-sat)
