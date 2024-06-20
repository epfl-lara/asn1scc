; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64816 () Bool)

(assert start!64816)

(declare-fun b!290851 () Bool)

(declare-fun e!207190 () Bool)

(assert (=> b!290851 (= e!207190 (not true))))

(declare-fun e!207187 () Bool)

(assert (=> b!290851 e!207187))

(declare-fun res!240274 () Bool)

(assert (=> b!290851 (=> (not res!240274) (not e!207187))))

(declare-fun lt!422391 () Bool)

(declare-datatypes ((array!17255 0))(
  ( (array!17256 (arr!8482 (Array (_ BitVec 32) (_ BitVec 8))) (size!7468 (_ BitVec 32))) )
))
(declare-fun lt!422392 () array!17255)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17255 (_ BitVec 64)) Bool)

(assert (=> b!290851 (= res!240274 (= (bitAt!0 lt!422392 from!505) lt!422391))))

(declare-datatypes ((BitStream!12946 0))(
  ( (BitStream!12947 (buf!7534 array!17255) (currentByte!13959 (_ BitVec 32)) (currentBit!13954 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20201 0))(
  ( (Unit!20202) )
))
(declare-datatypes ((tuple3!1680 0))(
  ( (tuple3!1681 (_1!12676 Unit!20201) (_2!12676 BitStream!12946) (_3!1260 array!17255)) )
))
(declare-fun lt!422396 () tuple3!1680)

(assert (=> b!290851 (= lt!422391 (bitAt!0 (_3!1260 lt!422396) from!505))))

(declare-fun lt!422394 () Unit!20201)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17255 array!17255 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20201)

(assert (=> b!290851 (= lt!422394 (arrayBitRangesEqImpliesEq!0 lt!422392 (_3!1260 lt!422396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17255)

(declare-fun arrayBitRangesEq!0 (array!17255 array!17255 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290851 (arrayBitRangesEq!0 arr!273 (_3!1260 lt!422396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422393 () Unit!20201)

(declare-fun arrayBitRangesEqTransitive!0 (array!17255 array!17255 array!17255 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20201)

(assert (=> b!290851 (= lt!422393 (arrayBitRangesEqTransitive!0 arr!273 lt!422392 (_3!1260 lt!422396) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290851 (arrayBitRangesEq!0 arr!273 lt!422392 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22832 0))(
  ( (tuple2!22833 (_1!12677 Bool) (_2!12677 BitStream!12946)) )
))
(declare-fun lt!422390 () tuple2!22832)

(declare-fun lt!422388 () Unit!20201)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17255 (_ BitVec 64) Bool) Unit!20201)

(assert (=> b!290851 (= lt!422388 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12677 lt!422390)))))

(declare-fun e!207189 () Bool)

(assert (=> b!290851 e!207189))

(declare-fun res!240277 () Bool)

(assert (=> b!290851 (=> (not res!240277) (not e!207189))))

(declare-fun thiss!1728 () BitStream!12946)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290851 (= res!240277 (= (bvsub (bvadd (bitIndex!0 (size!7468 (buf!7534 thiss!1728)) (currentByte!13959 thiss!1728) (currentBit!13954 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7468 (buf!7534 (_2!12676 lt!422396))) (currentByte!13959 (_2!12676 lt!422396)) (currentBit!13954 (_2!12676 lt!422396)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12946 (_ BitVec 64) array!17255 (_ BitVec 64) (_ BitVec 64)) tuple3!1680)

(assert (=> b!290851 (= lt!422396 (readBitsLoop!0 (_2!12677 lt!422390) nBits!523 lt!422392 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290851 (validate_offset_bits!1 ((_ sign_extend 32) (size!7468 (buf!7534 (_2!12677 lt!422390)))) ((_ sign_extend 32) (currentByte!13959 (_2!12677 lt!422390))) ((_ sign_extend 32) (currentBit!13954 (_2!12677 lt!422390))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422397 () Unit!20201)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12946 BitStream!12946 (_ BitVec 64) (_ BitVec 64)) Unit!20201)

(assert (=> b!290851 (= lt!422397 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12677 lt!422390) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422395 () (_ BitVec 32))

(declare-fun lt!422389 () (_ BitVec 32))

(assert (=> b!290851 (= lt!422392 (array!17256 (store (arr!8482 arr!273) lt!422389 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8482 arr!273) lt!422389)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422395)))) ((_ sign_extend 24) (ite (_1!12677 lt!422390) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422395) #b00000000))))) (size!7468 arr!273)))))

(assert (=> b!290851 (= lt!422395 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290851 (= lt!422389 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12946) tuple2!22832)

(assert (=> b!290851 (= lt!422390 (readBit!0 thiss!1728))))

(declare-fun b!290852 () Bool)

(assert (=> b!290852 (= e!207187 (= lt!422391 (_1!12677 lt!422390)))))

(declare-fun res!240278 () Bool)

(assert (=> start!64816 (=> (not res!240278) (not e!207190))))

(assert (=> start!64816 (= res!240278 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7468 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64816 e!207190))

(declare-fun e!207191 () Bool)

(declare-fun inv!12 (BitStream!12946) Bool)

(assert (=> start!64816 (and (inv!12 thiss!1728) e!207191)))

(assert (=> start!64816 true))

(declare-fun array_inv!7080 (array!17255) Bool)

(assert (=> start!64816 (array_inv!7080 arr!273)))

(declare-fun b!290853 () Bool)

(assert (=> b!290853 (= e!207191 (array_inv!7080 (buf!7534 thiss!1728)))))

(declare-fun b!290854 () Bool)

(declare-fun res!240276 () Bool)

(assert (=> b!290854 (=> (not res!240276) (not e!207190))))

(assert (=> b!290854 (= res!240276 (validate_offset_bits!1 ((_ sign_extend 32) (size!7468 (buf!7534 thiss!1728))) ((_ sign_extend 32) (currentByte!13959 thiss!1728)) ((_ sign_extend 32) (currentBit!13954 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290855 () Bool)

(declare-fun res!240275 () Bool)

(assert (=> b!290855 (=> (not res!240275) (not e!207190))))

(assert (=> b!290855 (= res!240275 (bvslt from!505 to!474))))

(declare-fun b!290856 () Bool)

(assert (=> b!290856 (= e!207189 (and (= (buf!7534 thiss!1728) (buf!7534 (_2!12676 lt!422396))) (= (size!7468 arr!273) (size!7468 (_3!1260 lt!422396)))))))

(assert (= (and start!64816 res!240278) b!290854))

(assert (= (and b!290854 res!240276) b!290855))

(assert (= (and b!290855 res!240275) b!290851))

(assert (= (and b!290851 res!240277) b!290856))

(assert (= (and b!290851 res!240274) b!290852))

(assert (= start!64816 b!290853))

(declare-fun m!425275 () Bool)

(assert (=> b!290851 m!425275))

(declare-fun m!425277 () Bool)

(assert (=> b!290851 m!425277))

(declare-fun m!425279 () Bool)

(assert (=> b!290851 m!425279))

(declare-fun m!425281 () Bool)

(assert (=> b!290851 m!425281))

(declare-fun m!425283 () Bool)

(assert (=> b!290851 m!425283))

(declare-fun m!425285 () Bool)

(assert (=> b!290851 m!425285))

(declare-fun m!425287 () Bool)

(assert (=> b!290851 m!425287))

(declare-fun m!425289 () Bool)

(assert (=> b!290851 m!425289))

(declare-fun m!425291 () Bool)

(assert (=> b!290851 m!425291))

(declare-fun m!425293 () Bool)

(assert (=> b!290851 m!425293))

(declare-fun m!425295 () Bool)

(assert (=> b!290851 m!425295))

(declare-fun m!425297 () Bool)

(assert (=> b!290851 m!425297))

(declare-fun m!425299 () Bool)

(assert (=> b!290851 m!425299))

(declare-fun m!425301 () Bool)

(assert (=> b!290851 m!425301))

(declare-fun m!425303 () Bool)

(assert (=> b!290851 m!425303))

(declare-fun m!425305 () Bool)

(assert (=> b!290851 m!425305))

(declare-fun m!425307 () Bool)

(assert (=> start!64816 m!425307))

(declare-fun m!425309 () Bool)

(assert (=> start!64816 m!425309))

(declare-fun m!425311 () Bool)

(assert (=> b!290853 m!425311))

(declare-fun m!425313 () Bool)

(assert (=> b!290854 m!425313))

(push 1)

(assert (not start!64816))

(assert (not b!290851))

(assert (not b!290853))

(assert (not b!290854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

