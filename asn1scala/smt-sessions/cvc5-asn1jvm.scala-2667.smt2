; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65368 () Bool)

(assert start!65368)

(declare-fun b!293311 () Bool)

(declare-fun res!242213 () Bool)

(declare-fun e!209447 () Bool)

(assert (=> b!293311 (=> (not res!242213) (not e!209447))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293311 (= res!242213 (bvslt from!505 to!474))))

(declare-fun b!293312 () Bool)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> b!293312 (= e!209447 (and (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!17516 0))(
  ( (array!17517 (arr!8617 (Array (_ BitVec 32) (_ BitVec 8))) (size!7591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13186 0))(
  ( (BitStream!13187 (buf!7654 array!17516) (currentByte!14118 (_ BitVec 32)) (currentBit!14113 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23012 0))(
  ( (tuple2!23013 (_1!12811 Bool) (_2!12811 BitStream!13186)) )
))
(declare-fun lt!425259 () tuple2!23012)

(declare-fun thiss!1728 () BitStream!13186)

(declare-fun readBit!0 (BitStream!13186) tuple2!23012)

(assert (=> b!293312 (= lt!425259 (readBit!0 thiss!1728))))

(declare-fun b!293313 () Bool)

(declare-fun e!209445 () Bool)

(declare-fun array_inv!7203 (array!17516) Bool)

(assert (=> b!293313 (= e!209445 (array_inv!7203 (buf!7654 thiss!1728)))))

(declare-fun b!293310 () Bool)

(declare-fun res!242211 () Bool)

(assert (=> b!293310 (=> (not res!242211) (not e!209447))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293310 (= res!242211 (validate_offset_bits!1 ((_ sign_extend 32) (size!7591 (buf!7654 thiss!1728))) ((_ sign_extend 32) (currentByte!14118 thiss!1728)) ((_ sign_extend 32) (currentBit!14113 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242212 () Bool)

(assert (=> start!65368 (=> (not res!242212) (not e!209447))))

(declare-fun arr!273 () array!17516)

(assert (=> start!65368 (= res!242212 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7591 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65368 e!209447))

(declare-fun inv!12 (BitStream!13186) Bool)

(assert (=> start!65368 (and (inv!12 thiss!1728) e!209445)))

(assert (=> start!65368 true))

(assert (=> start!65368 (array_inv!7203 arr!273)))

(assert (= (and start!65368 res!242212) b!293310))

(assert (= (and b!293310 res!242211) b!293311))

(assert (= (and b!293311 res!242213) b!293312))

(assert (= start!65368 b!293313))

(declare-fun m!428845 () Bool)

(assert (=> b!293312 m!428845))

(declare-fun m!428847 () Bool)

(assert (=> b!293313 m!428847))

(declare-fun m!428849 () Bool)

(assert (=> b!293310 m!428849))

(declare-fun m!428851 () Bool)

(assert (=> start!65368 m!428851))

(declare-fun m!428853 () Bool)

(assert (=> start!65368 m!428853))

(push 1)

(assert (not b!293310))

(assert (not start!65368))

(assert (not b!293313))

(assert (not b!293312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

