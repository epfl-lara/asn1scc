; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66334 () Bool)

(assert start!66334)

(declare-fun b!297240 () Bool)

(declare-fun e!212728 () Bool)

(declare-datatypes ((array!17771 0))(
  ( (array!17772 (arr!8779 (Array (_ BitVec 32) (_ BitVec 8))) (size!7699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13402 0))(
  ( (BitStream!13403 (buf!7762 array!17771) (currentByte!14304 (_ BitVec 32)) (currentBit!14299 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13402)

(declare-fun array_inv!7311 (array!17771) Bool)

(assert (=> b!297240 (= e!212728 (array_inv!7311 (buf!7762 thiss!1728)))))

(declare-fun res!245342 () Bool)

(declare-fun e!212729 () Bool)

(assert (=> start!66334 (=> (not res!245342) (not e!212729))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17771)

(assert (=> start!66334 (= res!245342 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7699 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66334 e!212729))

(declare-fun inv!12 (BitStream!13402) Bool)

(assert (=> start!66334 (and (inv!12 thiss!1728) e!212728)))

(assert (=> start!66334 true))

(assert (=> start!66334 (array_inv!7311 arr!273)))

(declare-fun b!297239 () Bool)

(declare-fun lt!433622 () (_ BitVec 64))

(assert (=> b!297239 (= e!212729 (not (or (= ((_ sign_extend 32) (size!7699 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!433622 ((_ sign_extend 32) (size!7699 arr!273)))))))))

(declare-fun arrayBitRangesEq!0 (array!17771 array!17771 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297239 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433622)))

(assert (=> b!297239 (= lt!433622 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7699 arr!273))))))

(declare-datatypes ((Unit!20719 0))(
  ( (Unit!20720) )
))
(declare-fun lt!433623 () Unit!20719)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17771) Unit!20719)

(assert (=> b!297239 (= lt!433623 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297237 () Bool)

(declare-fun res!245341 () Bool)

(assert (=> b!297237 (=> (not res!245341) (not e!212729))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297237 (= res!245341 (validate_offset_bits!1 ((_ sign_extend 32) (size!7699 (buf!7762 thiss!1728))) ((_ sign_extend 32) (currentByte!14304 thiss!1728)) ((_ sign_extend 32) (currentBit!14299 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297238 () Bool)

(declare-fun res!245340 () Bool)

(assert (=> b!297238 (=> (not res!245340) (not e!212729))))

(assert (=> b!297238 (= res!245340 (bvsge from!505 to!474))))

(assert (= (and start!66334 res!245342) b!297237))

(assert (= (and b!297237 res!245341) b!297238))

(assert (= (and b!297238 res!245340) b!297239))

(assert (= start!66334 b!297240))

(declare-fun m!436057 () Bool)

(assert (=> b!297240 m!436057))

(declare-fun m!436059 () Bool)

(assert (=> start!66334 m!436059))

(declare-fun m!436061 () Bool)

(assert (=> start!66334 m!436061))

(declare-fun m!436063 () Bool)

(assert (=> b!297239 m!436063))

(declare-fun m!436065 () Bool)

(assert (=> b!297239 m!436065))

(declare-fun m!436067 () Bool)

(assert (=> b!297237 m!436067))

(push 1)

(assert (not b!297237))

(assert (not start!66334))

(assert (not b!297239))

(assert (not b!297240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

