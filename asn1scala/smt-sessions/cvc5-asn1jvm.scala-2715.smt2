; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66490 () Bool)

(assert start!66490)

(declare-fun res!245875 () Bool)

(declare-fun e!213358 () Bool)

(assert (=> start!66490 (=> (not res!245875) (not e!213358))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17849 0))(
  ( (array!17850 (arr!8815 (Array (_ BitVec 32) (_ BitVec 8))) (size!7735 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17849)

(assert (=> start!66490 (= res!245875 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7735 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66490 e!213358))

(declare-datatypes ((BitStream!13474 0))(
  ( (BitStream!13475 (buf!7798 array!17849) (currentByte!14352 (_ BitVec 32)) (currentBit!14347 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13474)

(declare-fun e!213359 () Bool)

(declare-fun inv!12 (BitStream!13474) Bool)

(assert (=> start!66490 (and (inv!12 thiss!1728) e!213359)))

(assert (=> start!66490 true))

(declare-fun array_inv!7347 (array!17849) Bool)

(assert (=> start!66490 (array_inv!7347 arr!273)))

(declare-fun b!297927 () Bool)

(declare-fun res!245874 () Bool)

(assert (=> b!297927 (=> (not res!245874) (not e!213358))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297927 (= res!245874 (validate_offset_bits!1 ((_ sign_extend 32) (size!7735 (buf!7798 thiss!1728))) ((_ sign_extend 32) (currentByte!14352 thiss!1728)) ((_ sign_extend 32) (currentBit!14347 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297930 () Bool)

(assert (=> b!297930 (= e!213359 (array_inv!7347 (buf!7798 thiss!1728)))))

(declare-fun b!297928 () Bool)

(declare-fun res!245876 () Bool)

(assert (=> b!297928 (=> (not res!245876) (not e!213358))))

(assert (=> b!297928 (= res!245876 (bvsge from!505 to!474))))

(declare-fun b!297929 () Bool)

(assert (=> b!297929 (= e!213358 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17849 array!17849 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297929 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20791 0))(
  ( (Unit!20792) )
))
(declare-fun lt!434148 () Unit!20791)

(declare-fun lt!434147 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17849 array!17849 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20791)

(assert (=> b!297929 (= lt!434148 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434147 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297929 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434147)))

(assert (=> b!297929 (= lt!434147 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7735 arr!273))))))

(declare-fun lt!434146 () Unit!20791)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17849) Unit!20791)

(assert (=> b!297929 (= lt!434146 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66490 res!245875) b!297927))

(assert (= (and b!297927 res!245874) b!297928))

(assert (= (and b!297928 res!245876) b!297929))

(assert (= start!66490 b!297930))

(declare-fun m!436795 () Bool)

(assert (=> start!66490 m!436795))

(declare-fun m!436797 () Bool)

(assert (=> start!66490 m!436797))

(declare-fun m!436799 () Bool)

(assert (=> b!297927 m!436799))

(declare-fun m!436801 () Bool)

(assert (=> b!297930 m!436801))

(declare-fun m!436803 () Bool)

(assert (=> b!297929 m!436803))

(declare-fun m!436805 () Bool)

(assert (=> b!297929 m!436805))

(declare-fun m!436807 () Bool)

(assert (=> b!297929 m!436807))

(declare-fun m!436809 () Bool)

(assert (=> b!297929 m!436809))

(push 1)

(assert (not start!66490))

(assert (not b!297930))

(assert (not b!297929))

(assert (not b!297927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

