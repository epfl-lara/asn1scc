; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65218 () Bool)

(assert start!65218)

(declare-fun b!292680 () Bool)

(declare-fun e!208827 () Bool)

(declare-datatypes ((array!17423 0))(
  ( (array!17424 (arr!8572 (Array (_ BitVec 32) (_ BitVec 8))) (size!7546 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13102 0))(
  ( (BitStream!13103 (buf!7612 array!17423) (currentByte!14067 (_ BitVec 32)) (currentBit!14062 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13102)

(declare-fun array_inv!7158 (array!17423) Bool)

(assert (=> b!292680 (= e!208827 (array_inv!7158 (buf!7612 thiss!1728)))))

(declare-fun b!292678 () Bool)

(declare-fun res!241730 () Bool)

(declare-fun e!208825 () Bool)

(assert (=> b!292678 (=> (not res!241730) (not e!208825))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292678 (= res!241730 (bvsge from!505 to!474))))

(declare-fun res!241728 () Bool)

(assert (=> start!65218 (=> (not res!241728) (not e!208825))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17423)

(assert (=> start!65218 (= res!241728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7546 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65218 e!208825))

(declare-fun inv!12 (BitStream!13102) Bool)

(assert (=> start!65218 (and (inv!12 thiss!1728) e!208827)))

(assert (=> start!65218 true))

(assert (=> start!65218 (array_inv!7158 arr!273)))

(declare-fun b!292679 () Bool)

(assert (=> b!292679 (= e!208825 (not true))))

(declare-fun lt!424950 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292679 (= lt!424950 (bitIndex!0 (size!7546 (buf!7612 thiss!1728)) (currentByte!14067 thiss!1728) (currentBit!14062 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17423 array!17423 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292679 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20381 0))(
  ( (Unit!20382) )
))
(declare-fun lt!424953 () Unit!20381)

(declare-fun lt!424951 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17423 array!17423 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20381)

(assert (=> b!292679 (= lt!424953 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424951 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292679 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424951)))

(assert (=> b!292679 (= lt!424951 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7546 arr!273))))))

(declare-fun lt!424952 () Unit!20381)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17423) Unit!20381)

(assert (=> b!292679 (= lt!424952 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292677 () Bool)

(declare-fun res!241729 () Bool)

(assert (=> b!292677 (=> (not res!241729) (not e!208825))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292677 (= res!241729 (validate_offset_bits!1 ((_ sign_extend 32) (size!7546 (buf!7612 thiss!1728))) ((_ sign_extend 32) (currentByte!14067 thiss!1728)) ((_ sign_extend 32) (currentBit!14062 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65218 res!241728) b!292677))

(assert (= (and b!292677 res!241729) b!292678))

(assert (= (and b!292678 res!241730) b!292679))

(assert (= start!65218 b!292680))

(declare-fun m!428269 () Bool)

(assert (=> b!292680 m!428269))

(declare-fun m!428271 () Bool)

(assert (=> start!65218 m!428271))

(declare-fun m!428273 () Bool)

(assert (=> start!65218 m!428273))

(declare-fun m!428275 () Bool)

(assert (=> b!292679 m!428275))

(declare-fun m!428277 () Bool)

(assert (=> b!292679 m!428277))

(declare-fun m!428279 () Bool)

(assert (=> b!292679 m!428279))

(declare-fun m!428281 () Bool)

(assert (=> b!292679 m!428281))

(declare-fun m!428283 () Bool)

(assert (=> b!292679 m!428283))

(declare-fun m!428285 () Bool)

(assert (=> b!292677 m!428285))

(push 1)

(assert (not start!65218))

(assert (not b!292677))

(assert (not b!292679))

(assert (not b!292680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

