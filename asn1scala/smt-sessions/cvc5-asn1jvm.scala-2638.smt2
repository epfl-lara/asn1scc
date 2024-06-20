; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65062 () Bool)

(assert start!65062)

(declare-fun b!292023 () Bool)

(declare-fun res!241230 () Bool)

(declare-fun e!208212 () Bool)

(assert (=> b!292023 (=> (not res!241230) (not e!208212))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17345 0))(
  ( (array!17346 (arr!8536 (Array (_ BitVec 32) (_ BitVec 8))) (size!7510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13030 0))(
  ( (BitStream!13031 (buf!7576 array!17345) (currentByte!14019 (_ BitVec 32)) (currentBit!14014 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13030)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292023 (= res!241230 (validate_offset_bits!1 ((_ sign_extend 32) (size!7510 (buf!7576 thiss!1728))) ((_ sign_extend 32) (currentByte!14019 thiss!1728)) ((_ sign_extend 32) (currentBit!14014 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292024 () Bool)

(declare-fun res!241232 () Bool)

(assert (=> b!292024 (=> (not res!241232) (not e!208212))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292024 (= res!241232 (bvsge from!505 to!474))))

(declare-fun b!292025 () Bool)

(assert (=> b!292025 (= e!208212 (not true))))

(declare-fun arr!273 () array!17345)

(declare-fun arrayBitRangesEq!0 (array!17345 array!17345 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292025 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7510 arr!273))))))

(declare-datatypes ((Unit!20309 0))(
  ( (Unit!20310) )
))
(declare-fun lt!424458 () Unit!20309)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17345) Unit!20309)

(assert (=> b!292025 (= lt!424458 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292026 () Bool)

(declare-fun e!208215 () Bool)

(declare-fun array_inv!7122 (array!17345) Bool)

(assert (=> b!292026 (= e!208215 (array_inv!7122 (buf!7576 thiss!1728)))))

(declare-fun res!241231 () Bool)

(assert (=> start!65062 (=> (not res!241231) (not e!208212))))

(assert (=> start!65062 (= res!241231 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7510 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65062 e!208212))

(declare-fun inv!12 (BitStream!13030) Bool)

(assert (=> start!65062 (and (inv!12 thiss!1728) e!208215)))

(assert (=> start!65062 true))

(assert (=> start!65062 (array_inv!7122 arr!273)))

(assert (= (and start!65062 res!241231) b!292023))

(assert (= (and b!292023 res!241230) b!292024))

(assert (= (and b!292024 res!241232) b!292025))

(assert (= start!65062 b!292026))

(declare-fun m!427453 () Bool)

(assert (=> b!292023 m!427453))

(declare-fun m!427455 () Bool)

(assert (=> b!292025 m!427455))

(declare-fun m!427457 () Bool)

(assert (=> b!292025 m!427457))

(declare-fun m!427459 () Bool)

(assert (=> b!292026 m!427459))

(declare-fun m!427461 () Bool)

(assert (=> start!65062 m!427461))

(declare-fun m!427463 () Bool)

(assert (=> start!65062 m!427463))

(push 1)

(assert (not b!292026))

(assert (not start!65062))

(assert (not b!292023))

(assert (not b!292025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

