; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65068 () Bool)

(assert start!65068)

(declare-fun b!292059 () Bool)

(declare-fun res!241258 () Bool)

(declare-fun e!208248 () Bool)

(assert (=> b!292059 (=> (not res!241258) (not e!208248))))

(declare-datatypes ((array!17351 0))(
  ( (array!17352 (arr!8539 (Array (_ BitVec 32) (_ BitVec 8))) (size!7513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13036 0))(
  ( (BitStream!13037 (buf!7579 array!17351) (currentByte!14022 (_ BitVec 32)) (currentBit!14017 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13036)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292059 (= res!241258 (validate_offset_bits!1 ((_ sign_extend 32) (size!7513 (buf!7579 thiss!1728))) ((_ sign_extend 32) (currentByte!14022 thiss!1728)) ((_ sign_extend 32) (currentBit!14017 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292062 () Bool)

(declare-fun e!208249 () Bool)

(declare-fun array_inv!7125 (array!17351) Bool)

(assert (=> b!292062 (= e!208249 (array_inv!7125 (buf!7579 thiss!1728)))))

(declare-fun b!292060 () Bool)

(declare-fun res!241257 () Bool)

(assert (=> b!292060 (=> (not res!241257) (not e!208248))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292060 (= res!241257 (bvsge from!505 to!474))))

(declare-fun b!292061 () Bool)

(assert (=> b!292061 (= e!208248 (not true))))

(declare-fun arr!273 () array!17351)

(declare-fun arrayBitRangesEq!0 (array!17351 array!17351 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292061 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7513 arr!273))))))

(declare-datatypes ((Unit!20315 0))(
  ( (Unit!20316) )
))
(declare-fun lt!424467 () Unit!20315)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17351) Unit!20315)

(assert (=> b!292061 (= lt!424467 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241259 () Bool)

(assert (=> start!65068 (=> (not res!241259) (not e!208248))))

(assert (=> start!65068 (= res!241259 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7513 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65068 e!208248))

(declare-fun inv!12 (BitStream!13036) Bool)

(assert (=> start!65068 (and (inv!12 thiss!1728) e!208249)))

(assert (=> start!65068 true))

(assert (=> start!65068 (array_inv!7125 arr!273)))

(assert (= (and start!65068 res!241259) b!292059))

(assert (= (and b!292059 res!241258) b!292060))

(assert (= (and b!292060 res!241257) b!292061))

(assert (= start!65068 b!292062))

(declare-fun m!427489 () Bool)

(assert (=> b!292059 m!427489))

(declare-fun m!427491 () Bool)

(assert (=> b!292062 m!427491))

(declare-fun m!427493 () Bool)

(assert (=> b!292061 m!427493))

(declare-fun m!427495 () Bool)

(assert (=> b!292061 m!427495))

(declare-fun m!427497 () Bool)

(assert (=> start!65068 m!427497))

(declare-fun m!427499 () Bool)

(assert (=> start!65068 m!427499))

(push 1)

(assert (not b!292062))

(assert (not start!65068))

(assert (not b!292059))

(assert (not b!292061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

