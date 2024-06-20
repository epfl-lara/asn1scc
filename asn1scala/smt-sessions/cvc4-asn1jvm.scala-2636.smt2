; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65054 () Bool)

(assert start!65054)

(declare-fun b!291978 () Bool)

(declare-fun e!208165 () Bool)

(declare-datatypes ((array!17337 0))(
  ( (array!17338 (arr!8532 (Array (_ BitVec 32) (_ BitVec 8))) (size!7506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13022 0))(
  ( (BitStream!13023 (buf!7572 array!17337) (currentByte!14015 (_ BitVec 32)) (currentBit!14010 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13022)

(declare-fun array_inv!7118 (array!17337) Bool)

(assert (=> b!291978 (= e!208165 (array_inv!7118 (buf!7572 thiss!1728)))))

(declare-fun b!291976 () Bool)

(declare-fun res!241195 () Bool)

(declare-fun e!208167 () Bool)

(assert (=> b!291976 (=> (not res!241195) (not e!208167))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291976 (= res!241195 (bvsge from!505 to!474))))

(declare-fun res!241196 () Bool)

(assert (=> start!65054 (=> (not res!241196) (not e!208167))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17337)

(assert (=> start!65054 (= res!241196 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7506 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65054 e!208167))

(declare-fun inv!12 (BitStream!13022) Bool)

(assert (=> start!65054 (and (inv!12 thiss!1728) e!208165)))

(assert (=> start!65054 true))

(assert (=> start!65054 (array_inv!7118 arr!273)))

(declare-fun b!291975 () Bool)

(declare-fun res!241194 () Bool)

(assert (=> b!291975 (=> (not res!241194) (not e!208167))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291975 (= res!241194 (validate_offset_bits!1 ((_ sign_extend 32) (size!7506 (buf!7572 thiss!1728))) ((_ sign_extend 32) (currentByte!14015 thiss!1728)) ((_ sign_extend 32) (currentBit!14010 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291977 () Bool)

(assert (=> b!291977 (= e!208167 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17337 array!17337 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291977 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7506 arr!273))))))

(declare-datatypes ((Unit!20301 0))(
  ( (Unit!20302) )
))
(declare-fun lt!424446 () Unit!20301)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17337) Unit!20301)

(assert (=> b!291977 (= lt!424446 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65054 res!241196) b!291975))

(assert (= (and b!291975 res!241194) b!291976))

(assert (= (and b!291976 res!241195) b!291977))

(assert (= start!65054 b!291978))

(declare-fun m!427405 () Bool)

(assert (=> b!291978 m!427405))

(declare-fun m!427407 () Bool)

(assert (=> start!65054 m!427407))

(declare-fun m!427409 () Bool)

(assert (=> start!65054 m!427409))

(declare-fun m!427411 () Bool)

(assert (=> b!291975 m!427411))

(declare-fun m!427413 () Bool)

(assert (=> b!291977 m!427413))

(declare-fun m!427415 () Bool)

(assert (=> b!291977 m!427415))

(push 1)

(assert (not b!291977))

(assert (not b!291978))

(assert (not start!65054))

(assert (not b!291975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

