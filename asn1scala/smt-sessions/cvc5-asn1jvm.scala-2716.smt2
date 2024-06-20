; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66496 () Bool)

(assert start!66496)

(declare-fun res!245902 () Bool)

(declare-fun e!213395 () Bool)

(assert (=> start!66496 (=> (not res!245902) (not e!213395))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17855 0))(
  ( (array!17856 (arr!8818 (Array (_ BitVec 32) (_ BitVec 8))) (size!7738 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17855)

(assert (=> start!66496 (= res!245902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7738 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66496 e!213395))

(declare-datatypes ((BitStream!13480 0))(
  ( (BitStream!13481 (buf!7801 array!17855) (currentByte!14355 (_ BitVec 32)) (currentBit!14350 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13480)

(declare-fun e!213394 () Bool)

(declare-fun inv!12 (BitStream!13480) Bool)

(assert (=> start!66496 (and (inv!12 thiss!1728) e!213394)))

(assert (=> start!66496 true))

(declare-fun array_inv!7350 (array!17855) Bool)

(assert (=> start!66496 (array_inv!7350 arr!273)))

(declare-fun b!297963 () Bool)

(declare-fun res!245901 () Bool)

(assert (=> b!297963 (=> (not res!245901) (not e!213395))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297963 (= res!245901 (validate_offset_bits!1 ((_ sign_extend 32) (size!7738 (buf!7801 thiss!1728))) ((_ sign_extend 32) (currentByte!14355 thiss!1728)) ((_ sign_extend 32) (currentBit!14350 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297966 () Bool)

(assert (=> b!297966 (= e!213394 (array_inv!7350 (buf!7801 thiss!1728)))))

(declare-fun b!297965 () Bool)

(assert (=> b!297965 (= e!213395 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17855 array!17855 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297965 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434174 () (_ BitVec 64))

(declare-datatypes ((Unit!20797 0))(
  ( (Unit!20798) )
))
(declare-fun lt!434175 () Unit!20797)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17855 array!17855 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20797)

(assert (=> b!297965 (= lt!434175 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434174 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297965 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434174)))

(assert (=> b!297965 (= lt!434174 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7738 arr!273))))))

(declare-fun lt!434173 () Unit!20797)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17855) Unit!20797)

(assert (=> b!297965 (= lt!434173 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297964 () Bool)

(declare-fun res!245903 () Bool)

(assert (=> b!297964 (=> (not res!245903) (not e!213395))))

(assert (=> b!297964 (= res!245903 (bvsge from!505 to!474))))

(assert (= (and start!66496 res!245902) b!297963))

(assert (= (and b!297963 res!245901) b!297964))

(assert (= (and b!297964 res!245903) b!297965))

(assert (= start!66496 b!297966))

(declare-fun m!436843 () Bool)

(assert (=> start!66496 m!436843))

(declare-fun m!436845 () Bool)

(assert (=> start!66496 m!436845))

(declare-fun m!436847 () Bool)

(assert (=> b!297963 m!436847))

(declare-fun m!436849 () Bool)

(assert (=> b!297966 m!436849))

(declare-fun m!436851 () Bool)

(assert (=> b!297965 m!436851))

(declare-fun m!436853 () Bool)

(assert (=> b!297965 m!436853))

(declare-fun m!436855 () Bool)

(assert (=> b!297965 m!436855))

(declare-fun m!436857 () Bool)

(assert (=> b!297965 m!436857))

(push 1)

(assert (not b!297966))

(assert (not start!66496))

(assert (not b!297965))

(assert (not b!297963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

