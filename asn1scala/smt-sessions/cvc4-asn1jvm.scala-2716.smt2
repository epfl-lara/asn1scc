; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66500 () Bool)

(assert start!66500)

(declare-fun b!297990 () Bool)

(declare-fun e!213417 () Bool)

(declare-datatypes ((array!17859 0))(
  ( (array!17860 (arr!8820 (Array (_ BitVec 32) (_ BitVec 8))) (size!7740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13484 0))(
  ( (BitStream!13485 (buf!7803 array!17859) (currentByte!14357 (_ BitVec 32)) (currentBit!14352 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13484)

(declare-fun array_inv!7352 (array!17859) Bool)

(assert (=> b!297990 (= e!213417 (array_inv!7352 (buf!7803 thiss!1728)))))

(declare-fun b!297989 () Bool)

(declare-fun e!213420 () Bool)

(assert (=> b!297989 (= e!213420 (not true))))

(declare-fun arr!273 () array!17859)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17859 array!17859 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297989 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434191 () (_ BitVec 64))

(declare-datatypes ((Unit!20801 0))(
  ( (Unit!20802) )
))
(declare-fun lt!434192 () Unit!20801)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17859 array!17859 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20801)

(assert (=> b!297989 (= lt!434192 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434191 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297989 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434191)))

(assert (=> b!297989 (= lt!434191 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7740 arr!273))))))

(declare-fun lt!434193 () Unit!20801)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17859) Unit!20801)

(assert (=> b!297989 (= lt!434193 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297988 () Bool)

(declare-fun res!245919 () Bool)

(assert (=> b!297988 (=> (not res!245919) (not e!213420))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297988 (= res!245919 (bvsge from!505 to!474))))

(declare-fun b!297987 () Bool)

(declare-fun res!245921 () Bool)

(assert (=> b!297987 (=> (not res!245921) (not e!213420))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297987 (= res!245921 (validate_offset_bits!1 ((_ sign_extend 32) (size!7740 (buf!7803 thiss!1728))) ((_ sign_extend 32) (currentByte!14357 thiss!1728)) ((_ sign_extend 32) (currentBit!14352 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245920 () Bool)

(assert (=> start!66500 (=> (not res!245920) (not e!213420))))

(assert (=> start!66500 (= res!245920 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7740 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66500 e!213420))

(declare-fun inv!12 (BitStream!13484) Bool)

(assert (=> start!66500 (and (inv!12 thiss!1728) e!213417)))

(assert (=> start!66500 true))

(assert (=> start!66500 (array_inv!7352 arr!273)))

(assert (= (and start!66500 res!245920) b!297987))

(assert (= (and b!297987 res!245921) b!297988))

(assert (= (and b!297988 res!245919) b!297989))

(assert (= start!66500 b!297990))

(declare-fun m!436875 () Bool)

(assert (=> b!297990 m!436875))

(declare-fun m!436877 () Bool)

(assert (=> b!297989 m!436877))

(declare-fun m!436879 () Bool)

(assert (=> b!297989 m!436879))

(declare-fun m!436881 () Bool)

(assert (=> b!297989 m!436881))

(declare-fun m!436883 () Bool)

(assert (=> b!297989 m!436883))

(declare-fun m!436885 () Bool)

(assert (=> b!297987 m!436885))

(declare-fun m!436887 () Bool)

(assert (=> start!66500 m!436887))

(declare-fun m!436889 () Bool)

(assert (=> start!66500 m!436889))

(push 1)

(assert (not b!297990))

(assert (not start!66500))

(assert (not b!297989))

(assert (not b!297987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

