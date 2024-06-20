; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66502 () Bool)

(assert start!66502)

(declare-fun res!245930 () Bool)

(declare-fun e!213429 () Bool)

(assert (=> start!66502 (=> (not res!245930) (not e!213429))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17861 0))(
  ( (array!17862 (arr!8821 (Array (_ BitVec 32) (_ BitVec 8))) (size!7741 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17861)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66502 (= res!245930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7741 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66502 e!213429))

(declare-datatypes ((BitStream!13486 0))(
  ( (BitStream!13487 (buf!7804 array!17861) (currentByte!14358 (_ BitVec 32)) (currentBit!14353 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13486)

(declare-fun e!213432 () Bool)

(declare-fun inv!12 (BitStream!13486) Bool)

(assert (=> start!66502 (and (inv!12 thiss!1728) e!213432)))

(assert (=> start!66502 true))

(declare-fun array_inv!7353 (array!17861) Bool)

(assert (=> start!66502 (array_inv!7353 arr!273)))

(declare-fun b!298001 () Bool)

(assert (=> b!298001 (= e!213429 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17861 array!17861 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298001 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434200 () (_ BitVec 64))

(declare-datatypes ((Unit!20803 0))(
  ( (Unit!20804) )
))
(declare-fun lt!434201 () Unit!20803)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17861 array!17861 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20803)

(assert (=> b!298001 (= lt!434201 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434200 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298001 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434200)))

(assert (=> b!298001 (= lt!434200 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7741 arr!273))))))

(declare-fun lt!434202 () Unit!20803)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17861) Unit!20803)

(assert (=> b!298001 (= lt!434202 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297999 () Bool)

(declare-fun res!245929 () Bool)

(assert (=> b!297999 (=> (not res!245929) (not e!213429))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297999 (= res!245929 (validate_offset_bits!1 ((_ sign_extend 32) (size!7741 (buf!7804 thiss!1728))) ((_ sign_extend 32) (currentByte!14358 thiss!1728)) ((_ sign_extend 32) (currentBit!14353 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298002 () Bool)

(assert (=> b!298002 (= e!213432 (array_inv!7353 (buf!7804 thiss!1728)))))

(declare-fun b!298000 () Bool)

(declare-fun res!245928 () Bool)

(assert (=> b!298000 (=> (not res!245928) (not e!213429))))

(assert (=> b!298000 (= res!245928 (bvsge from!505 to!474))))

(assert (= (and start!66502 res!245930) b!297999))

(assert (= (and b!297999 res!245929) b!298000))

(assert (= (and b!298000 res!245928) b!298001))

(assert (= start!66502 b!298002))

(declare-fun m!436891 () Bool)

(assert (=> start!66502 m!436891))

(declare-fun m!436893 () Bool)

(assert (=> start!66502 m!436893))

(declare-fun m!436895 () Bool)

(assert (=> b!298001 m!436895))

(declare-fun m!436897 () Bool)

(assert (=> b!298001 m!436897))

(declare-fun m!436899 () Bool)

(assert (=> b!298001 m!436899))

(declare-fun m!436901 () Bool)

(assert (=> b!298001 m!436901))

(declare-fun m!436903 () Bool)

(assert (=> b!297999 m!436903))

(declare-fun m!436905 () Bool)

(assert (=> b!298002 m!436905))

(push 1)

(assert (not start!66502))

(assert (not b!298002))

(assert (not b!297999))

(assert (not b!298001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

