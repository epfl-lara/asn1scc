; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66506 () Bool)

(assert start!66506)

(declare-fun b!298023 () Bool)

(declare-fun res!245947 () Bool)

(declare-fun e!213453 () Bool)

(assert (=> b!298023 (=> (not res!245947) (not e!213453))))

(declare-datatypes ((array!17865 0))(
  ( (array!17866 (arr!8823 (Array (_ BitVec 32) (_ BitVec 8))) (size!7743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13490 0))(
  ( (BitStream!13491 (buf!7806 array!17865) (currentByte!14360 (_ BitVec 32)) (currentBit!14355 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13490)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298023 (= res!245947 (validate_offset_bits!1 ((_ sign_extend 32) (size!7743 (buf!7806 thiss!1728))) ((_ sign_extend 32) (currentByte!14360 thiss!1728)) ((_ sign_extend 32) (currentBit!14355 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245948 () Bool)

(assert (=> start!66506 (=> (not res!245948) (not e!213453))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17865)

(assert (=> start!66506 (= res!245948 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7743 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66506 e!213453))

(declare-fun e!213455 () Bool)

(declare-fun inv!12 (BitStream!13490) Bool)

(assert (=> start!66506 (and (inv!12 thiss!1728) e!213455)))

(assert (=> start!66506 true))

(declare-fun array_inv!7355 (array!17865) Bool)

(assert (=> start!66506 (array_inv!7355 arr!273)))

(declare-fun b!298024 () Bool)

(declare-fun res!245946 () Bool)

(assert (=> b!298024 (=> (not res!245946) (not e!213453))))

(assert (=> b!298024 (= res!245946 (bvsge from!505 to!474))))

(declare-fun b!298025 () Bool)

(assert (=> b!298025 (= e!213453 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17865 array!17865 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298025 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434218 () (_ BitVec 64))

(declare-datatypes ((Unit!20807 0))(
  ( (Unit!20808) )
))
(declare-fun lt!434219 () Unit!20807)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17865 array!17865 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20807)

(assert (=> b!298025 (= lt!434219 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434218 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298025 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434218)))

(assert (=> b!298025 (= lt!434218 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7743 arr!273))))))

(declare-fun lt!434220 () Unit!20807)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17865) Unit!20807)

(assert (=> b!298025 (= lt!434220 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298026 () Bool)

(assert (=> b!298026 (= e!213455 (array_inv!7355 (buf!7806 thiss!1728)))))

(assert (= (and start!66506 res!245948) b!298023))

(assert (= (and b!298023 res!245947) b!298024))

(assert (= (and b!298024 res!245946) b!298025))

(assert (= start!66506 b!298026))

(declare-fun m!436923 () Bool)

(assert (=> b!298023 m!436923))

(declare-fun m!436925 () Bool)

(assert (=> start!66506 m!436925))

(declare-fun m!436927 () Bool)

(assert (=> start!66506 m!436927))

(declare-fun m!436929 () Bool)

(assert (=> b!298025 m!436929))

(declare-fun m!436931 () Bool)

(assert (=> b!298025 m!436931))

(declare-fun m!436933 () Bool)

(assert (=> b!298025 m!436933))

(declare-fun m!436935 () Bool)

(assert (=> b!298025 m!436935))

(declare-fun m!436937 () Bool)

(assert (=> b!298026 m!436937))

(push 1)

(assert (not start!66506))

