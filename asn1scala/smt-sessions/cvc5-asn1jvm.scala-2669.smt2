; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65380 () Bool)

(assert start!65380)

(declare-fun b!293385 () Bool)

(declare-fun e!209520 () Bool)

(declare-datatypes ((array!17528 0))(
  ( (array!17529 (arr!8623 (Array (_ BitVec 32) (_ BitVec 8))) (size!7597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13198 0))(
  ( (BitStream!13199 (buf!7660 array!17528) (currentByte!14124 (_ BitVec 32)) (currentBit!14119 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13198)

(declare-fun array_inv!7209 (array!17528) Bool)

(assert (=> b!293385 (= e!209520 (array_inv!7209 (buf!7660 thiss!1728)))))

(declare-fun b!293382 () Bool)

(declare-fun res!242267 () Bool)

(declare-fun e!209518 () Bool)

(assert (=> b!293382 (=> (not res!242267) (not e!209518))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293382 (= res!242267 (validate_offset_bits!1 ((_ sign_extend 32) (size!7597 (buf!7660 thiss!1728))) ((_ sign_extend 32) (currentByte!14124 thiss!1728)) ((_ sign_extend 32) (currentBit!14119 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242266 () Bool)

(assert (=> start!65380 (=> (not res!242266) (not e!209518))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17528)

(assert (=> start!65380 (= res!242266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7597 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65380 e!209518))

(declare-fun inv!12 (BitStream!13198) Bool)

(assert (=> start!65380 (and (inv!12 thiss!1728) e!209520)))

(assert (=> start!65380 true))

(assert (=> start!65380 (array_inv!7209 arr!273)))

(declare-fun b!293384 () Bool)

(declare-datatypes ((tuple2!23024 0))(
  ( (tuple2!23025 (_1!12817 Bool) (_2!12817 BitStream!13198)) )
))
(declare-fun lt!425277 () tuple2!23024)

(assert (=> b!293384 (= e!209518 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (not (= (size!7597 (buf!7660 thiss!1728)) (size!7597 (buf!7660 (_2!12817 lt!425277)))))))))

(declare-fun readBit!0 (BitStream!13198) tuple2!23024)

(assert (=> b!293384 (= lt!425277 (readBit!0 thiss!1728))))

(declare-fun b!293383 () Bool)

(declare-fun res!242265 () Bool)

(assert (=> b!293383 (=> (not res!242265) (not e!209518))))

(assert (=> b!293383 (= res!242265 (bvslt from!505 to!474))))

(assert (= (and start!65380 res!242266) b!293382))

(assert (= (and b!293382 res!242267) b!293383))

(assert (= (and b!293383 res!242265) b!293384))

(assert (= start!65380 b!293385))

(declare-fun m!428905 () Bool)

(assert (=> b!293385 m!428905))

(declare-fun m!428907 () Bool)

(assert (=> b!293382 m!428907))

(declare-fun m!428909 () Bool)

(assert (=> start!65380 m!428909))

(declare-fun m!428911 () Bool)

(assert (=> start!65380 m!428911))

(declare-fun m!428913 () Bool)

(assert (=> b!293384 m!428913))

(push 1)

(assert (not b!293382))

(assert (not start!65380))

(assert (not b!293384))

(assert (not b!293385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

