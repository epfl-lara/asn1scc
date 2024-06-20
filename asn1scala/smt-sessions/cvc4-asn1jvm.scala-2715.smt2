; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66494 () Bool)

(assert start!66494)

(declare-fun b!297952 () Bool)

(declare-fun res!245893 () Bool)

(declare-fun e!213384 () Bool)

(assert (=> b!297952 (=> (not res!245893) (not e!213384))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297952 (= res!245893 (bvsge from!505 to!474))))

(declare-fun b!297951 () Bool)

(declare-fun res!245894 () Bool)

(assert (=> b!297951 (=> (not res!245894) (not e!213384))))

(declare-datatypes ((array!17853 0))(
  ( (array!17854 (arr!8817 (Array (_ BitVec 32) (_ BitVec 8))) (size!7737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13478 0))(
  ( (BitStream!13479 (buf!7800 array!17853) (currentByte!14354 (_ BitVec 32)) (currentBit!14349 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13478)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297951 (= res!245894 (validate_offset_bits!1 ((_ sign_extend 32) (size!7737 (buf!7800 thiss!1728))) ((_ sign_extend 32) (currentByte!14354 thiss!1728)) ((_ sign_extend 32) (currentBit!14349 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297953 () Bool)

(assert (=> b!297953 (= e!213384 (not true))))

(declare-fun arr!273 () array!17853)

(declare-fun arrayBitRangesEq!0 (array!17853 array!17853 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297953 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20795 0))(
  ( (Unit!20796) )
))
(declare-fun lt!434165 () Unit!20795)

(declare-fun lt!434164 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17853 array!17853 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20795)

(assert (=> b!297953 (= lt!434165 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434164 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297953 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434164)))

(assert (=> b!297953 (= lt!434164 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7737 arr!273))))))

(declare-fun lt!434166 () Unit!20795)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17853) Unit!20795)

(assert (=> b!297953 (= lt!434166 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245892 () Bool)

(assert (=> start!66494 (=> (not res!245892) (not e!213384))))

(assert (=> start!66494 (= res!245892 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7737 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66494 e!213384))

(declare-fun e!213382 () Bool)

(declare-fun inv!12 (BitStream!13478) Bool)

(assert (=> start!66494 (and (inv!12 thiss!1728) e!213382)))

(assert (=> start!66494 true))

(declare-fun array_inv!7349 (array!17853) Bool)

(assert (=> start!66494 (array_inv!7349 arr!273)))

(declare-fun b!297954 () Bool)

(assert (=> b!297954 (= e!213382 (array_inv!7349 (buf!7800 thiss!1728)))))

(assert (= (and start!66494 res!245892) b!297951))

(assert (= (and b!297951 res!245894) b!297952))

(assert (= (and b!297952 res!245893) b!297953))

(assert (= start!66494 b!297954))

(declare-fun m!436827 () Bool)

(assert (=> b!297951 m!436827))

(declare-fun m!436829 () Bool)

(assert (=> b!297953 m!436829))

(declare-fun m!436831 () Bool)

(assert (=> b!297953 m!436831))

(declare-fun m!436833 () Bool)

(assert (=> b!297953 m!436833))

(declare-fun m!436835 () Bool)

(assert (=> b!297953 m!436835))

(declare-fun m!436837 () Bool)

(assert (=> start!66494 m!436837))

(declare-fun m!436839 () Bool)

(assert (=> start!66494 m!436839))

(declare-fun m!436841 () Bool)

(assert (=> b!297954 m!436841))

(push 1)

(assert (not start!66494))

