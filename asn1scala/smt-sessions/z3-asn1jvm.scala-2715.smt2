; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66492 () Bool)

(assert start!66492)

(declare-fun b!297939 () Bool)

(declare-fun res!245885 () Bool)

(declare-fun e!213369 () Bool)

(assert (=> b!297939 (=> (not res!245885) (not e!213369))))

(declare-datatypes ((array!17851 0))(
  ( (array!17852 (arr!8816 (Array (_ BitVec 32) (_ BitVec 8))) (size!7736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13476 0))(
  ( (BitStream!13477 (buf!7799 array!17851) (currentByte!14353 (_ BitVec 32)) (currentBit!14348 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13476)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297939 (= res!245885 (validate_offset_bits!1 ((_ sign_extend 32) (size!7736 (buf!7799 thiss!1728))) ((_ sign_extend 32) (currentByte!14353 thiss!1728)) ((_ sign_extend 32) (currentBit!14348 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297942 () Bool)

(declare-fun e!213371 () Bool)

(declare-fun array_inv!7348 (array!17851) Bool)

(assert (=> b!297942 (= e!213371 (array_inv!7348 (buf!7799 thiss!1728)))))

(declare-fun res!245883 () Bool)

(assert (=> start!66492 (=> (not res!245883) (not e!213369))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17851)

(assert (=> start!66492 (= res!245883 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7736 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66492 e!213369))

(declare-fun inv!12 (BitStream!13476) Bool)

(assert (=> start!66492 (and (inv!12 thiss!1728) e!213371)))

(assert (=> start!66492 true))

(assert (=> start!66492 (array_inv!7348 arr!273)))

(declare-fun b!297941 () Bool)

(assert (=> b!297941 (= e!213369 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17851 array!17851 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297941 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20793 0))(
  ( (Unit!20794) )
))
(declare-fun lt!434157 () Unit!20793)

(declare-fun lt!434156 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17851 array!17851 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20793)

(assert (=> b!297941 (= lt!434157 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434156 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297941 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434156)))

(assert (=> b!297941 (= lt!434156 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7736 arr!273))))))

(declare-fun lt!434155 () Unit!20793)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17851) Unit!20793)

(assert (=> b!297941 (= lt!434155 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297940 () Bool)

(declare-fun res!245884 () Bool)

(assert (=> b!297940 (=> (not res!245884) (not e!213369))))

(assert (=> b!297940 (= res!245884 (bvsge from!505 to!474))))

(assert (= (and start!66492 res!245883) b!297939))

(assert (= (and b!297939 res!245885) b!297940))

(assert (= (and b!297940 res!245884) b!297941))

(assert (= start!66492 b!297942))

(declare-fun m!436811 () Bool)

(assert (=> b!297939 m!436811))

(declare-fun m!436813 () Bool)

(assert (=> b!297942 m!436813))

(declare-fun m!436815 () Bool)

(assert (=> start!66492 m!436815))

(declare-fun m!436817 () Bool)

(assert (=> start!66492 m!436817))

(declare-fun m!436819 () Bool)

(assert (=> b!297941 m!436819))

(declare-fun m!436821 () Bool)

(assert (=> b!297941 m!436821))

(declare-fun m!436823 () Bool)

(assert (=> b!297941 m!436823))

(declare-fun m!436825 () Bool)

(assert (=> b!297941 m!436825))

(check-sat (not b!297941) (not b!297939) (not start!66492) (not b!297942))
