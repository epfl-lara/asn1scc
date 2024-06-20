; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66374 () Bool)

(assert start!66374)

(declare-fun b!297480 () Bool)

(declare-fun e!212969 () Bool)

(declare-datatypes ((array!17811 0))(
  ( (array!17812 (arr!8799 (Array (_ BitVec 32) (_ BitVec 8))) (size!7719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13442 0))(
  ( (BitStream!13443 (buf!7782 array!17811) (currentByte!14324 (_ BitVec 32)) (currentBit!14319 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13442)

(declare-fun array_inv!7331 (array!17811) Bool)

(assert (=> b!297480 (= e!212969 (array_inv!7331 (buf!7782 thiss!1728)))))

(declare-fun b!297477 () Bool)

(declare-fun res!245521 () Bool)

(declare-fun e!212967 () Bool)

(assert (=> b!297477 (=> (not res!245521) (not e!212967))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297477 (= res!245521 (validate_offset_bits!1 ((_ sign_extend 32) (size!7719 (buf!7782 thiss!1728))) ((_ sign_extend 32) (currentByte!14324 thiss!1728)) ((_ sign_extend 32) (currentBit!14319 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245522 () Bool)

(assert (=> start!66374 (=> (not res!245522) (not e!212967))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17811)

(assert (=> start!66374 (= res!245522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7719 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66374 e!212967))

(declare-fun inv!12 (BitStream!13442) Bool)

(assert (=> start!66374 (and (inv!12 thiss!1728) e!212969)))

(assert (=> start!66374 true))

(assert (=> start!66374 (array_inv!7331 arr!273)))

(declare-fun b!297478 () Bool)

(declare-fun res!245520 () Bool)

(assert (=> b!297478 (=> (not res!245520) (not e!212967))))

(assert (=> b!297478 (= res!245520 (bvsge from!505 to!474))))

(declare-fun b!297479 () Bool)

(assert (=> b!297479 (= e!212967 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17811 array!17811 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297479 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7719 arr!273))))))

(declare-datatypes ((Unit!20759 0))(
  ( (Unit!20760) )
))
(declare-fun lt!433707 () Unit!20759)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17811) Unit!20759)

(assert (=> b!297479 (= lt!433707 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66374 res!245522) b!297477))

(assert (= (and b!297477 res!245521) b!297478))

(assert (= (and b!297478 res!245520) b!297479))

(assert (= start!66374 b!297480))

(declare-fun m!436297 () Bool)

(assert (=> b!297480 m!436297))

(declare-fun m!436299 () Bool)

(assert (=> b!297477 m!436299))

(declare-fun m!436301 () Bool)

(assert (=> start!66374 m!436301))

(declare-fun m!436303 () Bool)

(assert (=> start!66374 m!436303))

(declare-fun m!436305 () Bool)

(assert (=> b!297479 m!436305))

(declare-fun m!436307 () Bool)

(assert (=> b!297479 m!436307))

(push 1)

(assert (not b!297477))

(assert (not b!297480))

(assert (not start!66374))

(assert (not b!297479))

