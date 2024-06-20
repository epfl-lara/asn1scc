; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66472 () Bool)

(assert start!66472)

(declare-fun b!297787 () Bool)

(declare-fun e!213237 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!297787 (= e!213237 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!245765 () Bool)

(declare-fun e!213236 () Bool)

(assert (=> start!66472 (=> (not res!245765) (not e!213236))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17831 0))(
  ( (array!17832 (arr!8806 (Array (_ BitVec 32) (_ BitVec 8))) (size!7726 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17831)

(assert (=> start!66472 (= res!245765 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7726 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66472 e!213236))

(declare-datatypes ((BitStream!13456 0))(
  ( (BitStream!13457 (buf!7789 array!17831) (currentByte!14343 (_ BitVec 32)) (currentBit!14338 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13456)

(declare-fun e!213233 () Bool)

(declare-fun inv!12 (BitStream!13456) Bool)

(assert (=> start!66472 (and (inv!12 thiss!1728) e!213233)))

(assert (=> start!66472 true))

(declare-fun array_inv!7338 (array!17831) Bool)

(assert (=> start!66472 (array_inv!7338 arr!273)))

(declare-fun b!297788 () Bool)

(declare-fun res!245761 () Bool)

(assert (=> b!297788 (=> (not res!245761) (not e!213236))))

(assert (=> b!297788 (= res!245761 (bvsge from!505 to!474))))

(declare-fun b!297789 () Bool)

(declare-fun res!245762 () Bool)

(assert (=> b!297789 (=> res!245762 e!213237)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297789 (= res!245762 (not (invariant!0 (currentBit!14338 thiss!1728) (currentByte!14343 thiss!1728) (size!7726 (buf!7789 thiss!1728)))))))

(declare-fun b!297790 () Bool)

(assert (=> b!297790 (= e!213233 (array_inv!7338 (buf!7789 thiss!1728)))))

(declare-fun b!297791 () Bool)

(declare-fun res!245764 () Bool)

(assert (=> b!297791 (=> (not res!245764) (not e!213236))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297791 (= res!245764 (validate_offset_bits!1 ((_ sign_extend 32) (size!7726 (buf!7789 thiss!1728))) ((_ sign_extend 32) (currentByte!14343 thiss!1728)) ((_ sign_extend 32) (currentBit!14338 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297792 () Bool)

(assert (=> b!297792 (= e!213236 (not e!213237))))

(declare-fun res!245763 () Bool)

(assert (=> b!297792 (=> res!245763 e!213237)))

(declare-fun lt!434043 () (_ BitVec 64))

(assert (=> b!297792 (= res!245763 (not (= (bvsub (bvadd lt!434043 to!474) from!505) lt!434043)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297792 (= lt!434043 (bitIndex!0 (size!7726 (buf!7789 thiss!1728)) (currentByte!14343 thiss!1728) (currentBit!14338 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17831 array!17831 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297792 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20773 0))(
  ( (Unit!20774) )
))
(declare-fun lt!434042 () Unit!20773)

(declare-fun lt!434041 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17831 array!17831 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20773)

(assert (=> b!297792 (= lt!434042 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434041 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297792 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434041)))

(assert (=> b!297792 (= lt!434041 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7726 arr!273))))))

(declare-fun lt!434040 () Unit!20773)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17831) Unit!20773)

(assert (=> b!297792 (= lt!434040 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66472 res!245765) b!297791))

(assert (= (and b!297791 res!245764) b!297788))

(assert (= (and b!297788 res!245761) b!297792))

(assert (= (and b!297792 (not res!245763)) b!297789))

(assert (= (and b!297789 (not res!245762)) b!297787))

(assert (= start!66472 b!297790))

(declare-fun m!436621 () Bool)

(assert (=> start!66472 m!436621))

(declare-fun m!436623 () Bool)

(assert (=> start!66472 m!436623))

(declare-fun m!436625 () Bool)

(assert (=> b!297792 m!436625))

(declare-fun m!436627 () Bool)

(assert (=> b!297792 m!436627))

(declare-fun m!436629 () Bool)

(assert (=> b!297792 m!436629))

(declare-fun m!436631 () Bool)

(assert (=> b!297792 m!436631))

(declare-fun m!436633 () Bool)

(assert (=> b!297792 m!436633))

(declare-fun m!436635 () Bool)

(assert (=> b!297789 m!436635))

(declare-fun m!436637 () Bool)

(assert (=> b!297790 m!436637))

(declare-fun m!436639 () Bool)

(assert (=> b!297791 m!436639))

(push 1)

(assert (not b!297791))

(assert (not b!297792))

(assert (not b!297789))

(assert (not start!66472))

(assert (not b!297790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

