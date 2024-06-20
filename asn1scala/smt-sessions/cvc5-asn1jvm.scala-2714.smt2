; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66484 () Bool)

(assert start!66484)

(declare-fun res!245847 () Bool)

(declare-fun e!213324 () Bool)

(assert (=> start!66484 (=> (not res!245847) (not e!213324))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17843 0))(
  ( (array!17844 (arr!8812 (Array (_ BitVec 32) (_ BitVec 8))) (size!7732 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17843)

(assert (=> start!66484 (= res!245847 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7732 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66484 e!213324))

(declare-datatypes ((BitStream!13468 0))(
  ( (BitStream!13469 (buf!7795 array!17843) (currentByte!14349 (_ BitVec 32)) (currentBit!14344 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13468)

(declare-fun e!213322 () Bool)

(declare-fun inv!12 (BitStream!13468) Bool)

(assert (=> start!66484 (and (inv!12 thiss!1728) e!213322)))

(assert (=> start!66484 true))

(declare-fun array_inv!7344 (array!17843) Bool)

(assert (=> start!66484 (array_inv!7344 arr!273)))

(declare-fun lt!434115 () (_ BitVec 64))

(declare-fun b!297893 () Bool)

(assert (=> b!297893 (= e!213324 (not (= (bvsub (bvadd lt!434115 to!474) from!505) lt!434115)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297893 (= lt!434115 (bitIndex!0 (size!7732 (buf!7795 thiss!1728)) (currentByte!14349 thiss!1728) (currentBit!14344 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17843 array!17843 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297893 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434113 () (_ BitVec 64))

(declare-datatypes ((Unit!20785 0))(
  ( (Unit!20786) )
))
(declare-fun lt!434114 () Unit!20785)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17843 array!17843 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20785)

(assert (=> b!297893 (= lt!434114 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434113 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297893 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434113)))

(assert (=> b!297893 (= lt!434113 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7732 arr!273))))))

(declare-fun lt!434112 () Unit!20785)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17843) Unit!20785)

(assert (=> b!297893 (= lt!434112 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297892 () Bool)

(declare-fun res!245849 () Bool)

(assert (=> b!297892 (=> (not res!245849) (not e!213324))))

(assert (=> b!297892 (= res!245849 (bvsge from!505 to!474))))

(declare-fun b!297894 () Bool)

(assert (=> b!297894 (= e!213322 (array_inv!7344 (buf!7795 thiss!1728)))))

(declare-fun b!297891 () Bool)

(declare-fun res!245848 () Bool)

(assert (=> b!297891 (=> (not res!245848) (not e!213324))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297891 (= res!245848 (validate_offset_bits!1 ((_ sign_extend 32) (size!7732 (buf!7795 thiss!1728))) ((_ sign_extend 32) (currentByte!14349 thiss!1728)) ((_ sign_extend 32) (currentBit!14344 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66484 res!245847) b!297891))

(assert (= (and b!297891 res!245848) b!297892))

(assert (= (and b!297892 res!245849) b!297893))

(assert (= start!66484 b!297894))

(declare-fun m!436741 () Bool)

(assert (=> start!66484 m!436741))

(declare-fun m!436743 () Bool)

(assert (=> start!66484 m!436743))

(declare-fun m!436745 () Bool)

(assert (=> b!297893 m!436745))

(declare-fun m!436747 () Bool)

(assert (=> b!297893 m!436747))

(declare-fun m!436749 () Bool)

(assert (=> b!297893 m!436749))

(declare-fun m!436751 () Bool)

(assert (=> b!297893 m!436751))

(declare-fun m!436753 () Bool)

(assert (=> b!297893 m!436753))

(declare-fun m!436755 () Bool)

(assert (=> b!297894 m!436755))

(declare-fun m!436757 () Bool)

(assert (=> b!297891 m!436757))

(push 1)

(assert (not b!297891))

(assert (not b!297893))

(assert (not b!297894))

(assert (not start!66484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

