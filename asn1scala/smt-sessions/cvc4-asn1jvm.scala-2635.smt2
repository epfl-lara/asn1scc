; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65048 () Bool)

(assert start!65048)

(declare-fun b!291940 () Bool)

(declare-fun res!241169 () Bool)

(declare-fun e!208130 () Bool)

(assert (=> b!291940 (=> (not res!241169) (not e!208130))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291940 (= res!241169 (bvsge from!505 to!474))))

(declare-fun b!291942 () Bool)

(declare-fun e!208131 () Bool)

(declare-datatypes ((array!17331 0))(
  ( (array!17332 (arr!8529 (Array (_ BitVec 32) (_ BitVec 8))) (size!7503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13016 0))(
  ( (BitStream!13017 (buf!7569 array!17331) (currentByte!14012 (_ BitVec 32)) (currentBit!14007 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13016)

(declare-fun array_inv!7115 (array!17331) Bool)

(assert (=> b!291942 (= e!208131 (array_inv!7115 (buf!7569 thiss!1728)))))

(declare-fun b!291941 () Bool)

(assert (=> b!291941 (= e!208130 (not true))))

(declare-fun arr!273 () array!17331)

(declare-fun arrayBitRangesEq!0 (array!17331 array!17331 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291941 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7503 arr!273))))))

(declare-datatypes ((Unit!20295 0))(
  ( (Unit!20296) )
))
(declare-fun lt!424437 () Unit!20295)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17331) Unit!20295)

(assert (=> b!291941 (= lt!424437 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291939 () Bool)

(declare-fun res!241167 () Bool)

(assert (=> b!291939 (=> (not res!241167) (not e!208130))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291939 (= res!241167 (validate_offset_bits!1 ((_ sign_extend 32) (size!7503 (buf!7569 thiss!1728))) ((_ sign_extend 32) (currentByte!14012 thiss!1728)) ((_ sign_extend 32) (currentBit!14007 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241168 () Bool)

(assert (=> start!65048 (=> (not res!241168) (not e!208130))))

(assert (=> start!65048 (= res!241168 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7503 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65048 e!208130))

(declare-fun inv!12 (BitStream!13016) Bool)

(assert (=> start!65048 (and (inv!12 thiss!1728) e!208131)))

(assert (=> start!65048 true))

(assert (=> start!65048 (array_inv!7115 arr!273)))

(assert (= (and start!65048 res!241168) b!291939))

(assert (= (and b!291939 res!241167) b!291940))

(assert (= (and b!291940 res!241169) b!291941))

(assert (= start!65048 b!291942))

(declare-fun m!427369 () Bool)

(assert (=> b!291942 m!427369))

(declare-fun m!427371 () Bool)

(assert (=> b!291941 m!427371))

(declare-fun m!427373 () Bool)

(assert (=> b!291941 m!427373))

(declare-fun m!427375 () Bool)

(assert (=> b!291939 m!427375))

(declare-fun m!427377 () Bool)

(assert (=> start!65048 m!427377))

(declare-fun m!427379 () Bool)

(assert (=> start!65048 m!427379))

(push 1)

(assert (not b!291941))

(assert (not b!291942))

(assert (not start!65048))

(assert (not b!291939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

