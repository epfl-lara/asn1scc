; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66476 () Bool)

(assert start!66476)

(declare-fun b!297823 () Bool)

(declare-fun res!245793 () Bool)

(declare-fun e!213264 () Bool)

(assert (=> b!297823 (=> res!245793 e!213264)))

(declare-datatypes ((array!17835 0))(
  ( (array!17836 (arr!8808 (Array (_ BitVec 32) (_ BitVec 8))) (size!7728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13460 0))(
  ( (BitStream!13461 (buf!7791 array!17835) (currentByte!14345 (_ BitVec 32)) (currentBit!14340 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13460)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297823 (= res!245793 (not (invariant!0 (currentBit!14340 thiss!1728) (currentByte!14345 thiss!1728) (size!7728 (buf!7791 thiss!1728)))))))

(declare-fun b!297824 () Bool)

(declare-fun res!245792 () Bool)

(declare-fun e!213263 () Bool)

(assert (=> b!297824 (=> (not res!245792) (not e!213263))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297824 (= res!245792 (bvsge from!505 to!474))))

(declare-fun b!297825 () Bool)

(declare-fun res!245791 () Bool)

(assert (=> b!297825 (=> (not res!245791) (not e!213263))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297825 (= res!245791 (validate_offset_bits!1 ((_ sign_extend 32) (size!7728 (buf!7791 thiss!1728))) ((_ sign_extend 32) (currentByte!14345 thiss!1728)) ((_ sign_extend 32) (currentBit!14340 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245794 () Bool)

(assert (=> start!66476 (=> (not res!245794) (not e!213263))))

(declare-fun arr!273 () array!17835)

(assert (=> start!66476 (= res!245794 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7728 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66476 e!213263))

(declare-fun e!213267 () Bool)

(declare-fun inv!12 (BitStream!13460) Bool)

(assert (=> start!66476 (and (inv!12 thiss!1728) e!213267)))

(assert (=> start!66476 true))

(declare-fun array_inv!7340 (array!17835) Bool)

(assert (=> start!66476 (array_inv!7340 arr!273)))

(declare-fun b!297826 () Bool)

(assert (=> b!297826 (= e!213267 (array_inv!7340 (buf!7791 thiss!1728)))))

(declare-fun b!297827 () Bool)

(assert (=> b!297827 (= e!213264 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!297828 () Bool)

(assert (=> b!297828 (= e!213263 (not e!213264))))

(declare-fun res!245795 () Bool)

(assert (=> b!297828 (=> res!245795 e!213264)))

(declare-fun lt!434065 () (_ BitVec 64))

(assert (=> b!297828 (= res!245795 (not (= (bvsub (bvadd lt!434065 to!474) from!505) lt!434065)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297828 (= lt!434065 (bitIndex!0 (size!7728 (buf!7791 thiss!1728)) (currentByte!14345 thiss!1728) (currentBit!14340 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17835 array!17835 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297828 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434066 () (_ BitVec 64))

(declare-datatypes ((Unit!20777 0))(
  ( (Unit!20778) )
))
(declare-fun lt!434064 () Unit!20777)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17835 array!17835 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20777)

(assert (=> b!297828 (= lt!434064 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434066 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297828 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434066)))

(assert (=> b!297828 (= lt!434066 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7728 arr!273))))))

(declare-fun lt!434067 () Unit!20777)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17835) Unit!20777)

(assert (=> b!297828 (= lt!434067 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66476 res!245794) b!297825))

(assert (= (and b!297825 res!245791) b!297824))

(assert (= (and b!297824 res!245792) b!297828))

(assert (= (and b!297828 (not res!245795)) b!297823))

(assert (= (and b!297823 (not res!245793)) b!297827))

(assert (= start!66476 b!297826))

(declare-fun m!436661 () Bool)

(assert (=> b!297828 m!436661))

(declare-fun m!436663 () Bool)

(assert (=> b!297828 m!436663))

(declare-fun m!436665 () Bool)

(assert (=> b!297828 m!436665))

(declare-fun m!436667 () Bool)

(assert (=> b!297828 m!436667))

(declare-fun m!436669 () Bool)

(assert (=> b!297828 m!436669))

(declare-fun m!436671 () Bool)

(assert (=> b!297825 m!436671))

(declare-fun m!436673 () Bool)

(assert (=> b!297826 m!436673))

(declare-fun m!436675 () Bool)

(assert (=> start!66476 m!436675))

(declare-fun m!436677 () Bool)

(assert (=> start!66476 m!436677))

(declare-fun m!436679 () Bool)

(assert (=> b!297823 m!436679))

(push 1)

(assert (not b!297825))

(assert (not start!66476))

(assert (not b!297828))

(assert (not b!297826))

(assert (not b!297823))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

