; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66482 () Bool)

(assert start!66482)

(declare-fun b!297877 () Bool)

(declare-fun res!245838 () Bool)

(declare-fun e!213311 () Bool)

(assert (=> b!297877 (=> res!245838 e!213311)))

(declare-datatypes ((array!17841 0))(
  ( (array!17842 (arr!8811 (Array (_ BitVec 32) (_ BitVec 8))) (size!7731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13466 0))(
  ( (BitStream!13467 (buf!7794 array!17841) (currentByte!14348 (_ BitVec 32)) (currentBit!14343 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13466)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297877 (= res!245838 (not (invariant!0 (currentBit!14343 thiss!1728) (currentByte!14348 thiss!1728) (size!7731 (buf!7794 thiss!1728)))))))

(declare-fun b!297878 () Bool)

(declare-fun res!245839 () Bool)

(declare-fun e!213310 () Bool)

(assert (=> b!297878 (=> (not res!245839) (not e!213310))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297878 (= res!245839 (validate_offset_bits!1 ((_ sign_extend 32) (size!7731 (buf!7794 thiss!1728))) ((_ sign_extend 32) (currentByte!14348 thiss!1728)) ((_ sign_extend 32) (currentBit!14343 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245836 () Bool)

(assert (=> start!66482 (=> (not res!245836) (not e!213310))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17841)

(assert (=> start!66482 (= res!245836 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7731 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66482 e!213310))

(declare-fun e!213312 () Bool)

(declare-fun inv!12 (BitStream!13466) Bool)

(assert (=> start!66482 (and (inv!12 thiss!1728) e!213312)))

(assert (=> start!66482 true))

(declare-fun array_inv!7343 (array!17841) Bool)

(assert (=> start!66482 (array_inv!7343 arr!273)))

(declare-fun b!297879 () Bool)

(assert (=> b!297879 (= e!213312 (array_inv!7343 (buf!7794 thiss!1728)))))

(declare-fun b!297880 () Bool)

(assert (=> b!297880 (= e!213310 (not e!213311))))

(declare-fun res!245837 () Bool)

(assert (=> b!297880 (=> res!245837 e!213311)))

(declare-fun lt!434101 () (_ BitVec 64))

(assert (=> b!297880 (= res!245837 (not (= (bvsub (bvadd lt!434101 to!474) from!505) lt!434101)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297880 (= lt!434101 (bitIndex!0 (size!7731 (buf!7794 thiss!1728)) (currentByte!14348 thiss!1728) (currentBit!14343 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17841 array!17841 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297880 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20783 0))(
  ( (Unit!20784) )
))
(declare-fun lt!434103 () Unit!20783)

(declare-fun lt!434102 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17841 array!17841 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20783)

(assert (=> b!297880 (= lt!434103 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434102 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297880 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434102)))

(assert (=> b!297880 (= lt!434102 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7731 arr!273))))))

(declare-fun lt!434100 () Unit!20783)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17841) Unit!20783)

(assert (=> b!297880 (= lt!434100 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297881 () Bool)

(assert (=> b!297881 (= e!213311 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!297882 () Bool)

(declare-fun res!245840 () Bool)

(assert (=> b!297882 (=> (not res!245840) (not e!213310))))

(assert (=> b!297882 (= res!245840 (bvsge from!505 to!474))))

(assert (= (and start!66482 res!245836) b!297878))

(assert (= (and b!297878 res!245839) b!297882))

(assert (= (and b!297882 res!245840) b!297880))

(assert (= (and b!297880 (not res!245837)) b!297877))

(assert (= (and b!297877 (not res!245838)) b!297881))

(assert (= start!66482 b!297879))

(declare-fun m!436721 () Bool)

(assert (=> start!66482 m!436721))

(declare-fun m!436723 () Bool)

(assert (=> start!66482 m!436723))

(declare-fun m!436725 () Bool)

(assert (=> b!297879 m!436725))

(declare-fun m!436727 () Bool)

(assert (=> b!297878 m!436727))

(declare-fun m!436729 () Bool)

(assert (=> b!297877 m!436729))

(declare-fun m!436731 () Bool)

(assert (=> b!297880 m!436731))

(declare-fun m!436733 () Bool)

(assert (=> b!297880 m!436733))

(declare-fun m!436735 () Bool)

(assert (=> b!297880 m!436735))

(declare-fun m!436737 () Bool)

(assert (=> b!297880 m!436737))

(declare-fun m!436739 () Bool)

(assert (=> b!297880 m!436739))

(push 1)

(assert (not b!297878))

(assert (not start!66482))

(assert (not b!297879))

(assert (not b!297877))

(assert (not b!297880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

